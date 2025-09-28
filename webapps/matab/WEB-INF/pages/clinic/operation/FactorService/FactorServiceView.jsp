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
            <%--<base:comboBox name="doctor_id"  key="his.patient.doctorName" comboLoaderUrl="combo/loadAllDoctor" styleClass="small"/>--%>
            <%--<base:comboBox name="service_id" key="com.artonis.clinic.basicInfo.service.name" comboLoaderUrl="combo/allService" styleClass="small"/>--%>

            <base:multiSelect serverFilter="true" name="service_ids" styleClass="small" multiSelectLoaderUrl="combo/allService" key="com.artonis.clinic.basicInfo.service.name" />
            <base:multiSelect serverFilter="true" name="doctor_ids" styleClass="small" multiSelectLoaderUrl="combo/loadAllDoctor" key="his.patient.doctorName" />
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>

        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
        </div>
        <base:my-grid-search  showMultipleDelete="false"  showOperation="false" scrollable="true">
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.date' field="date"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fileNumber'  field="patientFileNumber" width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fullName'  field="patientFullName" width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factor.serviceNameList'  field="serviceNameList" width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factor.doctorNameList'  field="doctorNameList" width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.serviceItemAmountSum' field="serviceItemAmountSum"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.discountAmountSum' field="discountAmountSum"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.insuranceAmountSum' field="insuranceAmountSum"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.totalReceiveCostSum' field="totalReceiveCostSum"  width="50px"/>
        </base:my-grid-search>
    </form>

    <div class="uk-grid uk-grid-preserve" style="border-style: double;margin-right: 0px;padding-top: 5px;padding-bottom: 5px;">
        <div class="uk-grid uk-grid-preserve">
            <base:testBoxNumericEx disabled="true" name="totalServiceItemAmountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.totalServiceItemAmountSum"/>
            <base:testBoxNumericEx disabled="true" name="totalDiscountAmountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.discountAmountSum"/>
            <base:testBoxNumericEx disabled="true" name="totalInsuranceAmountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.totalInsuranceAmountSum"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:testBoxNumericEx disabled="true" name="allTotalReceiveCostSum" styleClass="small" key="com.artonis.clinic.operation.factorView.allTotalReceiveCostSum"/>

        </div>

    </div>
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
        docVar.service_ids=$("#service_ids_multiSelect").val();

        var arrayDataItems=$("#service_ids_multiSelect").data("kendoMultiSelect")._dataItems;
        if(arrayDataItems!=undefined &&arrayDataItems.length>0){
            var service_item_valueText='';
            for(var i=0;i<arrayDataItems.length;i++){
                service_item_valueText+=arrayDataItems[i].ComboCaption+' , ';
            }
            docVar.service_id_text=service_item_valueText.substring(0,service_item_valueText.length-3);
        }

        docVar.doctor_ids=$("#doctor_ids_multiSelect").val();

        var arrayDoctorIdsDataItems=$("#doctor_ids_multiSelect").data("kendoMultiSelect")._dataItems;
        if(arrayDoctorIdsDataItems!=undefined &&arrayDoctorIdsDataItems.length>0){
            var doctor_item_valueText='';
            for(var i=0;i<arrayDoctorIdsDataItems.length;i++){
                doctor_item_valueText+=arrayDoctorIdsDataItems[i].ComboCaption+' , ';
            }
            docVar.doctor_id_text=doctor_item_valueText.substring(0,doctor_item_valueText.length-3);
        }

        return docVar;

    }

    function doAfterSearch(searchString){
        $.ajax({
            url:'${pageContext.request.contextPath}' + '/clinic/operation/factorService/sumTotalCost/' + searchString,
            contentType:"application/json",
            dataType:'json',
            type:'POST',
            success:function (result) {
                $("#totalServiceItemAmountSum").val(result.totalServiceItemAmountSum);
                $("#totalDiscountAmountSum").val(result.totalDiscountAmountSum);
                $("#totalInsuranceAmountSum").val(result.totalInsuranceAmountSum);
//                $("#insuranceAmountSum").val(result.insuranceAmountSum);
                $("#allTotalReceiveCostSum").val(result.allTotalReceiveCostSum);

                console.log(result);
                setNumericTextValue();
            }

        });

    }

</script>
