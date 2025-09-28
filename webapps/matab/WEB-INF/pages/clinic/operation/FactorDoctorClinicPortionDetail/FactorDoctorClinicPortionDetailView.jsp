<%@ page import="com.artonis.core.base.core.Date" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<%
    Date curDate = new Date(System.currentTimeMillis());
    String curStringDate = curDate.toString();
%>
<base:pageHeaderTitle/>
<div style="display:inline;" id="modal-detail"></div>
<div class="uk-container uk-container-center my-uk-container">
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <%--<base:comboBox name="doctor_id"  key="his.patient.doctorName" comboLoaderUrl="combo/loadAllDoctor" styleClass="small"/>--%>
            <base:multiSelect serverFilter="true" name="doctor_id_values" styleClass="small"
                              multiSelectLoaderUrl="combo/loadAllDoctor" key="his.patient.doctorName"/>
            <base:multiSelect serverFilter="true" name="service_item_values" styleClass="small"
                              multiSelectLoaderUrl="combo/allService" key="com.artonis.clinic.basicInfo.service.name"/>
            <base:testBox name="patientFirstName" key="com.artonis.clinic.operation.factorView.patientFirstName" styleClass="small"/>

        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:testBox name="patientLastName" key="com.artonis.clinic.operation.factorView.patientLastName" styleClass="small"/>
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>

        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:multiSelect serverFilter="true" name="insurance_id_values" styleClass="small" multiSelectLoaderUrl="combo/loadAllInsurance" key="com.artonis.clinic.core.insurancePerPatient.insurance" />
            <base:comboBox name="employeeContractPercentState" styleClass="small"
                           key="com.artonis.clinic.operation.factorView.emplyeeContractPercentState"
                           comboLoaderUrl="combo/allEmployeeContractState"/>
        </div>
    </form>
    <base:my-grid-search showOperation="false" scrollable="true">
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.patientFirstName' field="patientFirstName"
                             width="40px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.patientLastName' field="patientLastName"
                             width="40px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.service_item_name' field="service_item_name"
                             width="40px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.date' field="date" width="35px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.insuranceName' field="insuranceName"
                             width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.doctor_lastName' field="doctor_lastName"
                             width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.serviceItemAmountSum'
                             field="serviceItemAmountSumStr" width="35px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.totalReceiveCostSum'
                             field="totalReceiveCostSumStr" width="35px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.insuranceAmountSum'
                             field="insuranceAmountSumStr" width="35px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.clinicDiscount' field="clinicDiscountStr"
                             width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.doctorDiscount' field="doctorDiscountStr"
                             width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.bothDiscount' field="bothDiscountStr"
                             width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.doctorPortionReceiveCostSum'
                             field="doctorPortionReceiveCostSumStr" width="35px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.clinicPortionReceiveCostSum'
                             field="clinicPortionReceiveCostSumStr" width="35px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.doctorPortionInsurance'
                             field="doctorPortionInsuranceStr" width="25px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.clinicPortionInsurance'
                             field="clinicPortionInsuranceStr" width="25px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.emplyeeContractPercentState'
                             field="isVariablePercentStr" width="25px"/>


        <base:my-grid-schema-field name="service_item_name" type="string"/>
        <base:my-grid-schema-field name="date" type="string"/>
        <base:my-grid-schema-field name="doctor_lastName" type="string"/>
        <base:my-grid-schema-field name="serviceItemAmountSumStr" type="string"/>
        <base:my-grid-schema-field name="insuranceAmountSumStr" type="string"/>
        <base:my-grid-schema-field name="totalReceiveCostSumStr" type="string"/>
        <base:my-grid-schema-field name="clinicDiscountStr" type="string"/>
        <base:my-grid-schema-field name="doctorDiscountStr" type="string"/>
        <base:my-grid-schema-field name="bothDiscountStr" type="string"/>
        <base:my-grid-schema-field name="doctorPortionReceiveCostSumStr" type="string"/>
        <base:my-grid-schema-field name="clinicPortionReceiveCostSumStr" type="string"/>
        <base:my-grid-schema-field name="doctorPortionInsuranceStr" type="string"/>
        <base:my-grid-schema-field name="clinicPortionInsuranceStr" type="string"/>

        <base:my-grid-function text="com.artonis.clinic.operation.factorDoctorClinicPortion.popup.serviceDetail"
                               functionClick="grid_onDetail" name="detail"/>
    </base:my-grid-search>

    <div class="uk-grid uk-grid-preserve"
         style="border-style: double;margin-right: 0px;padding-top: 5px;padding-bottom: 5px;">
        <div class="uk-grid uk-grid-preserve">
            <base:testBoxNumericEx disabled="true" name="serviceItemAmountSum" styleClass="small"
                                   key="com.artonis.clinic.operation.factorView.serviceItemAmountSum"/>
            <base:testBoxNumericEx disabled="true" name="totalReceiveCostSum" styleClass="small"
                                   key="com.artonis.clinic.operation.factorView.totalReceiveCostSum"/>
            <base:testBoxNumericEx disabled="true" name="insuranceAmountSum" styleClass="small"
                                   key="com.artonis.clinic.operation.factorView.insuranceAmountSum"/>
        </div>
        <div class="uk-grid uk-grid-preserve">

            <base:testBoxNumericEx disabled="true" name="clinicDiscountSum" styleClass="small"
                                   key="com.artonis.clinic.operation.factorView.clinicDiscount"/>
            <base:testBoxNumericEx disabled="true" name="doctorDiscountSum" styleClass="small"
                                   key="com.artonis.clinic.operation.factorView.doctorDiscount"/>
            <base:testBoxNumericEx disabled="true" name="bothDiscountSum" styleClass="small"
                                   key="com.artonis.clinic.operation.factorView.bothDiscount"/>
        </div>
        <div class="uk-grid uk-grid-preserve">

            <base:testBoxNumericEx disabled="true" name="doctorPortionReceiveCostSum" styleClass="small"
                                   key="com.artonis.clinic.operation.factorView.doctorPortionReceiveCostSum"/>
            <base:testBoxNumericEx disabled="true" name="clinicPortionReceiveCostSum" styleClass="small"
                                   key="com.artonis.clinic.operation.factorView.clinicPortionReceiveCostSum"/>
            <base:testBoxNumericEx disabled="true" name="doctorPortionInsuranceSum" styleClass="small"
                                   key="com.artonis.clinic.operation.factorView.doctorPortionInsurance"/>
        </div>
        <div class="uk-grid uk-grid-preserve">

            <base:testBoxNumericEx disabled="true" name="clinicPortionInsuranceSum" styleClass="small"
                                   key="com.artonis.clinic.operation.factorView.clinicPortionInsurance"/>
        </div>
    </div>
    <base:footer/>



    <script type="text/javascript">
        $(document).ready(function () {
            resetForm();
            doAfterSearch(getSearchJsonString());

        });
        function resetForm() {
            $("#fromDate").val("<%=curStringDate%>");
            $("#toDate").val("<%=curStringDate%>");
        }
        function getSearchObject() {

            var docVar = {};
            docVar.fromDate = $("#fromDate").val();
            docVar.toDate = $("#toDate").val();

            if($("#patientFirstName").val().length>0){
                docVar.patientFirstName = $("#patientFirstName").val();
            }
            if($("#patientLastName").val().length>0){
                docVar.patientLastName = $("#patientLastName").val();
            }



            docVar.service_item_values = $("#service_item_values_multiSelect").val();

            var arrayDataItems = $("#service_item_values_multiSelect").data("kendoMultiSelect")._dataItems;
            if (arrayDataItems != undefined && arrayDataItems.length > 0) {
                var service_item_valueText = '';
                for (var i = 0; i < arrayDataItems.length; i++) {
                    service_item_valueText += arrayDataItems[i].ComboCaption + ' , ';
                }
                docVar.service_items_text = service_item_valueText.substring(0, service_item_valueText.length - 3);
            }

            docVar.doctor_id_values = $("#doctor_id_values_multiSelect").val();
            var doctorDataItems = $("#doctor_id_values_multiSelect").data("kendoMultiSelect")._dataItems;
            if (doctorDataItems != undefined && doctorDataItems.length > 0) {
                var doctor_id_valueText = '';
                for (var j = 0; j < doctorDataItems.length; j++) {
                    doctor_id_valueText += doctorDataItems[j].ComboCaption + ' , ';
                }
                docVar.doctor_id_text = doctor_id_valueText.substring(0, doctor_id_valueText.length - 3);
            }

            docVar.employeeContractPercentState = $("#employeeContractPercentState").val();
            docVar.employeeContractPercentStateStr = $("#employeeContractPercentState_Comb").data("kendoComboBox").text();

            docVar.insurance_id_values=$("#insurance_id_values_multiSelect").val();
            var doctorDataItems=$("#insurance_id_values_multiSelect").data("kendoMultiSelect")._dataItems;
            if(doctorDataItems!=undefined &&doctorDataItems.length>0){
                var doctor_id_valueText='';
                for(var j=0;j<doctorDataItems.length;j++){
                    doctor_id_valueText+=doctorDataItems[j].ComboCaption+' , ';
                }
                docVar.insurance_id_text=doctor_id_valueText.substring(0,doctor_id_valueText.length-3);
            }

            return docVar;

        }

        function doAfterClearAndSearch() {
            doAfterSearch(getSearchJsonString());
        }

        function doAfterSearch(searchString) {
            $.ajax({
                url: '${pageContext.request.contextPath}' + '/clinic/operation/factorDoctorClinicPortionDetail/sumTotalCost/' + searchString,
                contentType: "application/json",
                dataType: 'json',
                type: 'POST',
                success: function (result) {
                    $("#patientCountSum").val(result.patientCountSum);
                    $("#serviceItemAmountSum").val(result.serviceItemAmountSum);
                    $("#totalReceiveCostSum").val(result.totalReceiveCostSum);
                    $("#insuranceAmountSum").val(result.insuranceAmountSum);
                    $("#clinicDiscountSum").val(result.clinicDiscountSum);
                    $("#doctorDiscountSum").val(result.doctorDiscountSum);
                    $("#bothDiscountSum").val(result.bothDiscountSum);
                    $("#doctorPortionReceiveCostSum").val(result.doctorPortionReceiveCostSum);
                    $("#clinicPortionReceiveCostSum").val(result.clinicPortionReceiveCostSum);
                    $("#doctorPortionInsuranceSum").val(result.doctorPortionInsuranceSum);
                    $("#clinicPortionInsuranceSum").val(result.clinicPortionInsuranceSum);

//                console.log(result);
                    setNumericTextValue();
                }

            });

        }

        function grid_onDetail(e) {
            _searchGrid_popup(e);
        }

        function searchQueryValueCreator(row) {
            var search = [];
            search[0] = row.service_item_id;
            search[1] = row.doctor_id;
            search[2] = row.date;
            return search;
        }

        function searchGrid_onDataBound_callback(e){

            if($("#searchGrid").data("kendoGrid").dataSource._total!=undefined &&
                    $("#searchGrid").data("kendoGrid").dataSource.transport.options.read.url.indexOf("search/search/grid-read/"+$("#searchGrid").data("kendoGrid").dataSource._total+"/")==-1){
                        $("#searchGrid").data("kendoGrid").dataSource.transport.options.read.url=
                            $("#searchGrid").data("kendoGrid").dataSource.transport.options.read.url.replace("search/search/grid-read/","search/search/grid-read/"+$("#searchGrid").data("kendoGrid").dataSource._total+"/")
            }
        }


    </script>

    <style type="text/css">
        .uk-modal-dialog {
            right: 0px;
            margin-right: 0px;
            width: 100%;
            padding: 0px;
            top: 5%;
        }
    </style>