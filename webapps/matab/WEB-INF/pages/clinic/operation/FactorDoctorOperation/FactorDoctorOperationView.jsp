<%@ page import="com.artonis.core.base.core.Date" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
    Date curDate=new Date(System.currentTimeMillis());
    String curStringDate=curDate.toString();
%>
<base:pageHeaderTitle/>
<div style="display:inline;" id="modal-detail"></div>
<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
                <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
                <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
                <base:multiSelect serverFilter="true" name="doctor_id_values" styleClass="small" multiSelectLoaderUrl="combo/loadAllDoctor" key="his.patient.doctorName" />

        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:multiSelect serverFilter="true" name="service_values" styleClass="small" multiSelectLoaderUrl="combo/allService" key="com.artonis.clinic.basicInfo.service.name" />
        </div>
        <base:my-grid-search  showMultipleDelete="false"  scrollable="true" showOperation="false">
            <base:my-grid-column title='com.artonis.clinic.operation.factorDoctorOperation.doctorName' field="doctor_lastName"  width="40px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorDoctorOperation.service_name' field="service_name"  width="40px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorDoctorOperation.service_item_name' field="service_item_name"  width="40px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorDoctorOperation.patientCount' field="patientCount"  width="40px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorDoctorOperation.sumTotal' field="totalReceiveCostSum"  width="40px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorDoctorOperation.doctorPortionReceiveCostSum' field="doctorPortionReceiveCostSum"  width="40px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.clinicDiscount' field="clinicDiscount"   width="30px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.doctorDiscount' field="doctorDiscount"   width="30px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.bothDiscount' field="bothDiscount"    width="30px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.clinicPortionReceiveCostSum'  field="clinicPortionReceiveCostSum" width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.insuranceAmountSum' field="insuranceAmountSum" width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.doctorPortionInsurance' field="doctorPortionInsurance" width="25px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.clinicPortionInsurance' field="clinicPortionInsurance" width="25px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorDoctorOperation.cost' field="cost"  width="40px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorDoctorOperation.professionalComponent' field="professionalComponent"  width="10px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorDoctorOperation.prof' field="prof"  width="40px"/>
            <%--<base:my-grid-column title='com.artonis.clinic.operation.factorDoctorOperation.sumProf' field="sumProf"  width="40px"/>--%>

            <base:my-grid-schema-field name="professionalComponent" type="string" />
            <base:my-grid-schema-field name="prof" type="long" />
            <base:my-grid-schema-field name="sumProf" type="long" />
            <base:my-grid-schema-field name="doctorPortionReceiveCostSum" type="long" />

        </base:my-grid-search>
    </form>
<%--<div class="uk-grid uk-grid-preserve" style="border-style: double;margin-right: 0px;padding-top: 5px;padding-bottom: 5px;">
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="patientCountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.patientCount"/>
        <base:testBoxNumericEx disabled="true" name="serviceItemAmountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.serviceItemAmountSum"/>
        <base:testBoxNumericEx disabled="true" name="totalReceiveCostSum" styleClass="small" key="com.artonis.clinic.operation.factorView.totalReceiveCostSum"/>
    </div>
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="insuranceAmountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.insuranceAmountSum"/>
        <base:testBoxNumericEx disabled="true" name="clinicDiscountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.clinicDiscount"/>
        <base:testBoxNumericEx disabled="true" name="doctorDiscountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.doctorDiscount"/>

    </div>
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="bothDiscountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.bothDiscount"/>
        <base:testBoxNumericEx disabled="true" name="doctorPortionReceiveCostSum" styleClass="small" key="com.artonis.clinic.operation.factorView.doctorPortionReceiveCostSum"/>
        <base:testBoxNumericEx disabled="true" name="clinicPortionReceiveCostSum" styleClass="small" key="com.artonis.clinic.operation.factorView.clinicPortionReceiveCostSum"/>

    </div>
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="doctorPortionInsuranceSum" styleClass="small" key="com.artonis.clinic.operation.factorView.doctorPortionInsurance"/>
        <base:testBoxNumericEx disabled="true" name="clinicPortionInsuranceSum" styleClass="small" key="com.artonis.clinic.operation.factorView.clinicPortionInsurance"/>
    </div>
</div>--%>
<base:footer/>


<script type="text/javascript">
    $(document).ready(function() {
        resetForm();
        doAfterSearch(getSearchJsonString());

    });
    function resetForm(){
        $("#fromDate").val("<%=curStringDate%>");
        $("#toDate").val("<%=curStringDate%>");
    }
    function getSearchObject(){

        var docVar = {};
        docVar.fromDate=$("#fromDate").val();
        docVar.toDate=$("#toDate").val();
//        docVar.doctor_id=$("#doctor_id").val();
//        docVar.doctor_lastName=$("#doctor_id_Comb").data("kendoComboBox").text();

        docVar.service_values=$("#service_values_multiSelect").val();

        var arrayDataItems=$("#service_values_multiSelect").data("kendoMultiSelect")._dataItems;
        if(arrayDataItems!=undefined &&arrayDataItems.length>0){
            var service_item_valueText='';
            for(var i=0;i<arrayDataItems.length;i++){
                service_item_valueText+=arrayDataItems[i].ComboCaption+' , ';
            }
            docVar.service_text=service_item_valueText.substring(0,service_item_valueText.length-3);
        }

        docVar.doctor_id_values=$("#doctor_id_values_multiSelect").val();
        var doctorDataItems=$("#doctor_id_values_multiSelect").data("kendoMultiSelect")._dataItems;
        if(doctorDataItems!=undefined &&doctorDataItems.length>0){
            var doctor_id_valueText='';
            for(var j=0;j<doctorDataItems.length;j++){
                doctor_id_valueText+=doctorDataItems[j].ComboCaption+' , ';
            }
            docVar.doctor_id_text=doctor_id_valueText.substring(0,doctor_id_valueText.length-3);
        }



        return docVar;

    }

    function doAfterClearAndSearch(){
        doAfterSearch(getSearchJsonString());
    }

    function doAfterSearch(searchString){
    /*    $.ajax({
            url:'${pageContext.request.contextPath}' + '/clinic/operation/factorDoctorClinicPortion/sumTotalCost/' + searchString,
            contentType:"application/json",
            dataType:'json',
            type:'POST',
            success:function (result) {
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
*/
    }

    function grid_onDetail(e){
        _searchGrid_popup(e);
    }
    
    function searchQueryValueCreator(row){
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
    .uk-modal-dialog{
        right:0px;
        margin-right: 0px;
        width: 100%;
        padding:0px;
        top: 5%;
    }
</style>