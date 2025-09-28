<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<div class="panel panel-info clerkPanel" style="margin-top: 10px;">

    <div class="panel-heading">
        <h3 class="panel-title">منشی</h3>
    </div>

    <div class="panel-body" style="margin-top: 15px;">

        <input type="hidden" id="clerkId">
        <div style="display: flex; ">
            <div class="form-group ">
                <input type="text" id="clerkFirstName" class="form-control" placeholder="نام"/>
            </div>
            <div class="form-group col-xs-3">
                <input type="text" id="clerkLastName" class="form-control" placeholder="نام خانوادگی"/>
            </div>
            <div class="form-group ">
                <input type="text" id="clerkUsername" class="form-control" placeholder="نام کاربری"/>
            </div>
            <div class="form-group ">
                <input type="password" id="clerkPassword" class="form-control" placeholder="رمز عبور"/>
            </div>
            <div class="form-group ">
                <input type="password" id="clerkRepeatPassword" class="form-control" placeholder="تکرار رمز عبور" data-toggle="tooltip" title="رمز عبور را برای پیشگیری از اشتباه مجددا وارد کنید"/>
            </div>
        </div>

        <div align="center">
            <ul class="list-inline">
                <li>
                    <button type="button" class="btn btn-success" onclick="saveClerk()">ذخیره</button>
                </li>
                <li>
                    <button type="button" class="btn btn-success" onclick="resetClerkFields()">جدید</button>
                </li>
            </ul>
        </div>

        <div style="margin-bottom: 5px;">
            <base:my-grid name="clerkGrid" transportReadUrl="${basePath}/clerkGridRead" showToolbar="false">
                <base:my-grid-column title='hrm.employee.firstName' field="firstName" width="50px"/>
                <base:my-grid-column title='hrm.employee.lastName' field="lastName" width="50px"/>
            </base:my-grid>
        </div>

    </div>

</div>

<script>
    function saveClerk() {
        if ($("#clerkPassword").val() != $("#clerkRepeatPassword").val()) {
            alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.clinicConfiguration.validate.repeatPassIncorrect")%>");
            return;
        }

        var tmp = {};
        tmp.id = $("#clerkId").val();
        tmp.clerkFirstName = $("#clerkFirstName").val();
        tmp.clerkLastName = $("#clerkLastName").val();
        tmp.clerkUsername = $("#clerkUsername").val();
        tmp.clerkPassword = $("#clerkPassword").val();
        tmp.clerkRepeatPassword = $("#clerkRepeatPassword").val();

        jQuery.ajax({
            url: getBaseUrl() + "saveClerk",
            type: "POST",
            data: JSON.stringify(tmp),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.state == "error") {
                    for (var i = 0; i < result.errors.length; i++) {
                        if (result.errors[i].Field == "") {
                            alertify.error(result.errors[i].Message);
                        }else {
                            alertify.error($("#" + result.errors[i].Field)[0].placeholder + ":  " + result.errors[i].Message);
                        }
                    }
                }
                if (result.state == "success") {
                    alertify.success(result.message);
                    $('#clerkGrid').data('kendoGrid').dataSource.read();
                    resetClerkFields();
                }
            },
            beforeSend: function(){
                $("#body-table").block({ message: '<div><img  style="padding: 5px;" src="<c:url value='/resources/images/loader.gif'/>" /> لطفا  تا تکمیل فرآیند ذخیره سازی صبر کنید ...</div>'});
            },
            complete: function(){
                $("#body-table").unblock();
            }
        });
    }

    function clerkGrid_grid_custom_onDelete(data) {
        var areUShure = "<%=ResourceBoundleHolder.resourceBundle.getString("action.alert.areYouSure.delete")%>";
        alertify.confirm(areUShure, function (e) {
            if (e) {
                jQuery.ajax({
                    url: basePath + "removeClerk",
                    type: "POST",
                    data: JSON.stringify({id: data.id}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        if (result.state == "success") {
                            $('#clerkGrid').data('kendoGrid').dataSource.read();
                            alertify.success(result.message);
                        } else {
                            alertify.error(result.errors[0].Message);
                        }
                    }
                });
            }
        });
    }

    function resetClerkFields() {
        $(".clerkPanel input").val('');
        $("#clerkId").val('');
    }

    function clerkGrid_grid_custom_onEdit(data) {
        $.get(basePath + "getClerk/" + data.id, function (result) {
            $("#clerkId").val(result.id);
            $("#clerkFirstName").val(result.clerkFirstName);
            $("#clerkLastName").val(result.clerkLastName);
            $("#clerkUsername").val(result.clerkUsername);
        });
    }

    function saveClerkViewNextPage(){
        if (eval($('#clerkGrid').data('kendoGrid')._data.length) > 0){
            customNextPage();
        } else {
            alertify.error("حداقل یک منشی باید تعریف شود");
        }
    }
</script>