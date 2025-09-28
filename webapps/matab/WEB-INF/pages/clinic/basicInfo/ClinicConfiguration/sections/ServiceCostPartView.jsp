<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<div class="panel panel-info servicePanel" style="margin-top: 10px;">

    <div class="panel-heading">
        <h3 class="panel-title">تخصیص خدمت</h3>
    </div>

    <div class="panel-body" style="margin-top: 15px;">

        <div style="display: flex; ">
            <base:comboBox name="serviceDoctorId" value="name" key="com.artonis.clinic.basicInfo.clinicConfiguration.service.doctor"
                       comboLoaderUrl="combo/loadAllDoctor" styleClass="small" stylediv="height: 95% !important; margin-left: 15px; margin-right: 15px;" />
            <div class="form-group col-xs-3">
                <base:comboBoxAutoComplete-buttonNew name="serviceItemCostId" key="com.artonis.clinic.basicInfo.clinicConfiguration.service.service" minLength="0"
                         iscomboLoaderUrlRelative="true" styleClass="small" hasTemplate="flase" stylediv="margin-right: 20px; height: 95% !important;"
                         comboLoaderUrl="combo/loadCurrentServiceItemCost" dataTextField="service_name" dataValueField="id"
                         popupUrl="popup/serviceItemInput" relativeSaveUrl="XXX" />
            </div>
            <div class="form-group ">
                <input type="text" id="serviceCostView" class="form-control" placeholder="قیمت" disabled="disabled" />
            </div>
            <div class="form-group ">
                <input type="number" id="servicePercent" class="form-control" placeholder="درصد" data-toggle="tooltip" title="درصد سهم پزشک از مبلغ خدمت را وارد نمایید"/>
            </div>
        </div>

        <div align="center">
            <ul class="list-inline">
                <li>
                    <button type="button" class="btn btn-success" onclick="saveService()">ذخیره</button>
                </li>
                <li>
                    <button type="button" class="btn btn-success" onclick="resetServiceFields()">جدید</button>
                </li>
            </ul>
        </div>

        <div style="margin-bottom: 5px;">
            <base:my-grid name="serviceGrid" transportReadUrl="${basePath}/serviceGridRead" showToolbar="false" noEditButton="true">
                <base:my-grid-column title='com.artonis.clinic.basicInfo.clinicConfiguration.service.doctorFirstName' field="doctorFirstName" width="50px"/>
                <base:my-grid-column title='com.artonis.clinic.basicInfo.clinicConfiguration.service.doctorLastName' field="doctorLastName" width="50px"/>
                <base:my-grid-column title='com.artonis.clinic.basicInfo.clinicConfiguration.service.service' field="serviceItemName" width="50px"/>
                <base:my-grid-column title='com.artonis.clinic.basicInfo.clinicConfiguration.service.price' field="cost" width="50px"/>
                <base:my-grid-column title='com.artonis.clinic.basicInfo.clinicConfiguration.service.percent' field="percent" width="50px"/>
            </base:my-grid>
        </div>

    </div>

</div>

<script>
    $(document).ready(function () {
        $("label[for='serviceDoctorId']").parent().remove();
        $("input[name='serviceDoctorId_Comb_input']")[0].placeholder = "پزشک";
        $("input[name='serviceDoctorId_Comb_input']").css("padding", "7px").css("vertical-align", "super");
        //
        $("label[for='serviceItemCostId']").parent().remove();
        $("#serviceItemCostId").parent().css("width", "100%").css("margin-right", "0px");
        $("input[name='serviceItemCostId_Comb_input']")[0].placeholder = "خدمت";
        $("input[name='serviceItemCostId_Comb_input']").css("padding", "7px").css("vertical-align", "super");
        $("input[name='serviceItemCostId_Comb_input']").parent().parent().css("vertical-align", "super");
        $("#button-serviceItemCostId-new").css("vertical-align", "top").css("padding-top", "9px").css("padding-bottom", "4px").css("padding-right", "8px").css("padding-left", "8px");
    });

    function saveService() {
        var tmp = {};
        tmp.serviceDoctorId = $("#serviceDoctorId").val();
        tmp.serviceItemCostId = $("#serviceItemCostId").val();
        tmp.servicePercent = $("#servicePercent").val();

        jQuery.ajax({
            url: getBaseUrl() + "saveService",
            type: "POST",
            data: JSON.stringify(tmp),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.state == "error") {
                    for (var i = 0; i < result.errors.length; i++) {
                        if (result.errors[i].Field == "serviceDoctorId") {
                            alertify.error($("input[name='serviceDoctorId_Comb_input']")[0].placeholder + ":  " + result.errors[i].Message);
                        } else if (result.errors[i].Field == "") {
                            alertify.error(result.errors[i].Message);
                        } else if (result.errors[i].Field == "serviceItemCostId") {
                            alertify.error($("input[name='serviceItemCostId_Comb_input']")[0].placeholder + ":  " + result.errors[i].Message);
                        } else {
                            alertify.error($("#" + result.errors[i].Field)[0].placeholder + ":  " + result.errors[i].Message);
                        }
                    }
                }
                if (result.state == "success") {
                    alertify.success(result.message);
                    $('#serviceGrid').data('kendoGrid').dataSource.read();
                    resetServiceFields();
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

    function serviceGrid_grid_custom_onDelete(data) {
        var areUShure = "<%=ResourceBoundleHolder.resourceBundle.getString("action.alert.areYouSure.delete")%>";
        alertify.confirm(areUShure, function (e) {
            if (e) {
                jQuery.ajax({
                    url: basePath + "removeService",
                    type: "POST",
                    data: JSON.stringify({id: data.serviceItemCostId}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        if (result.state == "success") {
                            $('#serviceGrid').data('kendoGrid').dataSource.read();
                            alertify.success(result.message);
                        } else {
                            for (var i = 0; i < result.errors.length; i++) {
                                alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                            }
                        }
                    }
                });
            }
        });
    }

    function resetServiceFields() {
        $(".servicePanel input").val('');
        $("#serviceDoctorId").val('');
        $("#serviceItemCostId").val('');
    }

    function serviceCostViewNextPage(){
        if (eval($('#serviceGrid').data('kendoGrid')._data.length) > 0){
            customNextPage();
        } else {
            alertify.error("حداقل یک خدمت برای پزشکان باید تعریف شود");
        }
    }

    function setServiceItemCostByserviceItemCostId(id){
        var requestUrl = "${pageContext.request.contextPath}"+"/clinic/basicInfo/clinicConfiguration/loadServiceItemCost/" + id;
        $.getJSON(requestUrl, function (data) {
            $('#serviceCostView').val(addCustomComma(data.serviceItemCost));
        });
    }
    function callback_change_serviceItemCostId(e) {
        var id = e.sender._old;
        setServiceItemCostByserviceItemCostId(id);
    }

    function callback_select_element_serviceItemCostId(data){
        setServiceItemCostByserviceItemCostId(data);
    }

    function addCustomComma(nStr){
        nStr += '';
        x = nStr.split('.');
        x1 = x[0];
        x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        }
        return x1 + x2;
    }
</script>

<style>
    .k-grid tbody td>.k-grid-delete {
        margin-top: 0px !important;
        margin-bottom: 0px !important;
    }
</style>