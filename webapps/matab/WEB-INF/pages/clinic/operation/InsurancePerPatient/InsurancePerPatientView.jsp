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

<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:multiSelect serverFilter="true" name="insurance_id_values" styleClass="small" multiSelectLoaderUrl="combo/loadAllInsurance" key="com.artonis.clinic.core.insurancePerPatient.insurance" />
            <%--<base:comboBox name="insuranceId" key="com.artonis.clinic.operation.factorInsurance.insurance" comboLoaderUrl="combo/loadAllInsurance" styleClass="small" />--%>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small" />
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small" />
        </div>

        <base:my-grid-search  showMultipleDelete="false"  scrollable="true" showOperation="false">

            <base:my-grid-column title='com.artonis.clinic.core.insurancePerPatient.insuranceName' field="insuranceName"  width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.core.insurancePerPatient.insuranceNumber' field="insurance_type_1_num"  width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.core.insurancePerPatient.patientFullName' field="patientFullName"  width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.core.insurancePerPatient.prescriptionDate' field="date"  width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.core.insurancePerPatient.totalPerscription' field="totalPrescription"   width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.core.insurancePerPatient.patientPortion' field="patientPortion"  width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.core.insurancePerPatient.insurancePortion' field="insurancePortion"  width="35px"/>
            

        </base:my-grid-search>
    </form>
<%--<div class="uk-grid uk-grid-preserve" style="border-style: double;margin-right: 0px;padding-top: 5px;padding-bottom: 5px;">--%>
    <%--<div class="uk-grid uk-grid-preserve">--%>
        <%--<base:testBoxNumericEx disabled="true" name="patientCountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.patientCount"/>--%>
        <%--<base:testBoxNumericEx disabled="true" name="serviceItemAmountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.serviceItemAmountSum"/>--%>
        <%--<base:testBoxNumericEx disabled="true" name="totalReceiveCostSum" styleClass="small" key="com.artonis.clinic.operation.factorView.totalReceiveCostSum"/>--%>
    <%--</div>--%>
    <%--<div class="uk-grid uk-grid-preserve">--%>
        <%--<base:testBoxNumericEx disabled="true" name="insuranceAmountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.insuranceAmountSum"/>--%>
        <%--<base:testBoxNumericEx disabled="true" name="clinicDiscountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.clinicDiscount"/>--%>
        <%--<base:testBoxNumericEx disabled="true" name="doctorDiscountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.doctorDiscount"/>--%>

    <%--</div>--%>
    <%--<div class="uk-grid uk-grid-preserve">--%>
        <%--<base:testBoxNumericEx disabled="true" name="bothDiscountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.bothDiscount"/>--%>
        <%--<base:testBoxNumericEx disabled="true" name="doctorPortionReceiveCostSum" styleClass="small" key="com.artonis.clinic.operation.factorView.doctorPortionReceiveCostSum"/>--%>
        <%--<base:testBoxNumericEx disabled="true" name="clinicPortionReceiveCostSum" styleClass="small" key="com.artonis.clinic.operation.factorView.clinicPortionReceiveCostSum"/>--%>

    <%--</div>--%>
    <%--<div class="uk-grid uk-grid-preserve">--%>
        <%--<base:testBoxNumericEx disabled="true" name="doctorPortionInsuranceSum" styleClass="small" key="com.artonis.clinic.operation.factorView.doctorPortionInsurance"/>--%>
        <%--<base:testBoxNumericEx disabled="true" name="clinicPortionInsuranceSum" styleClass="small" key="com.artonis.clinic.operation.factorView.clinicPortionInsurance"/>--%>
    <%--</div>--%>
<%--</div>--%>
<base:footer/>

<script type="text/javascript">
    $(document).ready(function() {
        resetForm();
       // doAfterSearch(getSearchJsonString());

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

    function doAfterClearAndSearch(){
        doAfterSearch(getSearchJsonString());
    }

/*
    function doAfterSearch(searchString){
        $.ajax({
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

    }
*/

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