<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<div class="input-group col-lg-4">
    <input type="text" id="matabName" class="form-control" placeholder="نام مطب"/>
</div>

<div class="panel panel-info doctorPanel" style="margin-top: 10px;">
    <div class="panel-heading">
        <h3 class="panel-title">پزشک</h3>
    </div>
    <div class="panel-body" style="margin-top: 15px;">
        <input type="hidden" id="doctorId">
        <div style="display: flex; ">
            <div class="form-group ">
                <input type="text" id="doctorFirstName" class="form-control" placeholder="نام"/>
            </div>
            <div class="form-group col-xs-3">
                <input type="text" id="doctorLastName" class="form-control" placeholder="نام خانوادگی"/>
            </div>
            <div class="form-group ">
                <input type="text" id="doctorNationalCode" class="form-control" placeholder="کد ملی"/>
            </div>
            <div class="form-group ">
                <input type="text" id="doctorMedicalCouncilCode" class="form-control" placeholder="کد نظام پزشکی"/>
            </div>
            <base:comboBoxAutoComplete-buttonNew name="doctorProficiencyId" key="com.artonis.clinic.basicInfo.proficiency.name" minLength="0"
                         iscomboLoaderUrlRelative="true" styleClass="small" hasTemplate="flase" stylediv="margin-right: 20px; height: 95% !important;"
                         comboLoaderUrl="combo/loadAllDoctorProficiency" dataTextField="name" dataValueField="id"
                         popupUrl="popup/doctorProficiencyInput" relativeSaveUrl="/popupDoctorProficiency/save"/>
        </div>

        <div style="display: flex; ">
            <div class="form-group ">
                <input type="text" id="doctorUsername" class="form-control" placeholder="نام کاربری"/>
            </div>
            <div class="form-group ">
                <input type="password" id="doctorPassword" class="form-control" placeholder="رمز عبور" />
            </div>
            <div class="form-group ">
                <input type="password" id="doctorRepeatPassword" class="form-control" placeholder="تکرار رمز عبور" data-toggle="tooltip" title="رمز عبور را برای پیشگیری از اشتباه مجددا وارد کنید"/>
            </div>
        </div>

        <div align="center">
            <ul class="list-inline">
                <li>
                    <button type="button" class="btn btn-success" onclick="saveMatabAndDoctor()">ذخیره</button>
                </li>
                <li>
                    <button type="button" class="btn btn-success" onclick="resetDoctorFields()">جدید</button>
                </li>
            </ul>
        </div>

        <div style="margin-bottom: 5px;">
            <base:my-grid name="doctorGrid" transportReadUrl="${basePath}/doctorGridRead" showToolbar="false">
                <base:my-grid-column title='hrm.employee.firstName' field="firstName" width="50px"/>
                <base:my-grid-column title='hrm.employee.lastName' field="lastName" width="50px"/>
                <base:my-grid-column title='hrm.employee.nationalCode' field="nationalCode" width="50px"/>
                <base:my-grid-column title='hrm.employee.medicalCouncilCode' field="medicalCouncilCode" width="50px"/>
            </base:my-grid>
        </div>

    </div>

</div>

<script>
    $(document).ready(function () {
        $("label[for='doctorProficiencyId']").parent().remove();
        $("input[name='doctorProficiencyId_Comb_input']")[0].placeholder = "تخصص";
        $("input[name='doctorProficiencyId_Comb_input']").css("padding", "7px").css("vertical-align", "super");
        $("input[name='doctorProficiencyId_Comb_input']").parent().parent().css("vertical-align", "super");
        $("#button-doctorProficiencyId-new").css("vertical-align", "top").css("padding-top", "9px").css("padding-bottom", "4px").css("padding-right", "8px").css("padding-left", "8px");
        //
        $("#matabName").val('${company}');
    });

    function saveMatabAndDoctor() {
        if ($("#doctorPassword").val() != $("#doctorRepeatPassword").val()) {
            alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.clinicConfiguration.validate.repeatPassIncorrect")%>");
            return;
        }

        var tmp = {};
        tmp.id = $("#doctorId").val();
        tmp.matabName = $("#matabName").val();
        tmp.doctorFirstName = $("#doctorFirstName").val();
        tmp.doctorLastName = $("#doctorLastName").val();
        tmp.doctorNationalCode = $("#doctorNationalCode").val();
        tmp.doctorMedicalCouncilCode = $("#doctorMedicalCouncilCode").val();
        tmp.doctorProficiencyId = $("#doctorProficiencyId").val();
        tmp.doctorUsername = $("#doctorUsername").val();
        tmp.doctorPassword = $("#doctorPassword").val();
        tmp.doctorRepeatPassword = $("#doctorRepeatPassword").val();

        jQuery.ajax({
            url: getBaseUrl() + "saveMatabAndDoctor",
            type: "POST",
            data: JSON.stringify(tmp),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.state == "error") {
                    for (var i = 0; i < result.errors.length; i++) {
                        if (result.errors[i].Field == "doctorProficiencyId") {
                            alertify.error($("input[name='doctorProficiencyId_Comb_input']")[0].placeholder + ":  " + result.errors[i].Message);
                        }else if (result.errors[i].Field == "") {
                                alertify.error(result.errors[i].Message);
                        } else {
                            alertify.error($("#" + result.errors[i].Field)[0].placeholder + ":  " + result.errors[i].Message);
                        }
                    }
                }
                if (result.state == "success") {
                    alertify.success(result.message);
                    $('#doctorGrid').data('kendoGrid').dataSource.read();
                    resetDoctorFields();
                    //
                    $("#serviceDoctorId_Comb").data("kendoComboBox").dataSource.read(); // for refresh doctor comboBox in ServiceCostPartView tab
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

    function doctorGrid_grid_custom_onDelete(data) {
        var areUShure = "<%=ResourceBoundleHolder.resourceBundle.getString("action.alert.areYouSure.delete")%>";
        alertify.confirm(areUShure, function (e) {
            if (e) {
                jQuery.ajax({
                    url: basePath + "removeDoctor",
                    type: "POST",
                    data: JSON.stringify({id: data.id}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        if (result.state == "success") {
                            $('#doctorGrid').data('kendoGrid').dataSource.read();
                            alertify.success(result.message);
                        } else {
                            alertify.error(result.errors[0].Message);
                        }
                    }
                });
            }
        });
    }

    function resetDoctorFields() {
        $(".doctorPanel input").val('');
        $("#doctorId").val('');
    }

    function doctorGrid_grid_custom_onEdit(data) {
        $.get(basePath + "getDoctor/" + data.id, function (result) {
            $("#doctorId").val(result.id);
            $("#doctorFirstName").val(result.doctorFirstName);
            $("#doctorLastName").val(result.doctorLastName);
            $("#doctorNationalCode").val(result.doctorNationalCode);
            $("#doctorMedicalCouncilCode").val(result.doctorMedicalCouncilCode);
            $("#doctorProficiencyId_Comb").data("kendoComboBox").value(result.doctorProficiencyId);
            $("#doctorProficiencyId").val(result.doctorProficiencyId);
            $("#doctorUsername").val(result.doctorUsername);
        });
    }

    function matabAndDoctorViewNextPage() {
        if (eval($('#doctorGrid').data('kendoGrid')._data.length) > 0){
            customNextPage();
        } else {
            alertify.error("حداقل یک پزشک باید تعریف شود");
        }
    }
</script>

<style>
    .ui-dialog{
        border-style: outset;
        border-width: thin;
    }

    .ui-dialog-titlebar-close{
        display: none;
    }

    .ui-dialog-title{
        float: none !important;
    }
</style>