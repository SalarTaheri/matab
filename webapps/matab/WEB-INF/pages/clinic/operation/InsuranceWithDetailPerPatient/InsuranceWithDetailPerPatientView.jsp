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
    </form>
</div>
<div class="uk-container uk-container-center my-uk-container" >
        <base:my-grid-search  showMultipleDelete="false"  scrollable="true" showOperation="false">

            <%--<base:my-grid-column title='com.artonis.clinic.core.InsuranceWithDetailPerPatient.insuranceName' field="insuranceName"  width="35px"/>--%>
            <%--<base:my-grid-column title='com.artonis.clinic.core.insurancePerPatient.insuranceNumber' field="insurance_type_1_num"  width="35px"/>--%>
            <base:my-grid-column title='com.artonis.clinic.core.InsuranceWithDetailPerPatient.fileNumber' field="fileNumber"  width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.core.InsuranceWithDetailPerPatient.firstname' field="firstname"  width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.core.InsuranceWithDetailPerPatient.lastname' field="lastname"  width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.core.InsuranceWithDetailPerPatient.insuranceName' field="insuranceName"  width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.core.InsuranceWithDetailPerPatient.serviceName' field="serviceName"  width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.core.InsuranceWithDetailPerPatient.doctor' field="doctor"  width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.core.InsuranceWithDetailPerPatient.prescriptionDate' field="date"  width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.core.InsuranceWithDetailPerPatient.servicePrice' field="servicePrice"  width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.core.InsuranceWithDetailPerPatient.drugsPrice' field="drugsPrice"  width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.core.InsuranceWithDetailPerPatient.accessoriesPrice' field="accessoriesPrice"  width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.core.InsuranceWithDetailPerPatient.anesthesiologistPrice' field="anesthesiologistPrice"  width="35px"/>
            <base:my-grid-column title='com.artonis.clinic.core.InsuranceWithDetailPerPatient.totalPrice' field="totalPrice"  width="35px"/>

        </base:my-grid-search>


</div>
<base:footer/>

<script type="text/javascript">
    $(document).ready(function() {
        resetForm();
//        doAfterSearch(getSearchJsonString());

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

