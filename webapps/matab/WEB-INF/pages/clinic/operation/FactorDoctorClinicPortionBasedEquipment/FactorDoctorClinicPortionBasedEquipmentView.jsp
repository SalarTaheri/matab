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
                <base:multiSelect name="service_item_id" styleClass="small" multiSelectLoaderUrl="combo/allServiceItemGoods" key="com.artonis.clinic.basicInfo.serviceItemCost.equipment" />
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
        </div>

        <%--<div class="uk-grid uk-grid-preserve">--%>
        <%--</div>--%>
        <base:my-grid-search  showMultipleDelete="false"  showOperation="false" scrollable="true">
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.service_item_name' field="service_item_name"  width="50px"/>
            <%--<base:my-grid-column title='com.artonis.clinic.operation.factorView.date' field="date"  width="80px"/>--%>
            <%--<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCost.equipment' field="serviceItemNameOrGoodsName"  width="80px"/>--%>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.date' field="date"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.quantity' field="quantityStr"  width="30px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.serviceItemBasicAmount' field="serviceItemBasicAmount"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.serviceItemAmountSum' field="serviceItemAmountSum"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.insuranceAmountSum' field="insuranceAmountSumStr"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.discountAmountSum' field="discountAmountSumStr"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.totalReceiveCostSum' field="totalReceiveCostSumStr"  width="70px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.patientCount' field="patientCount"  width="50px"/>
            <base:my-grid-column title="com.artonis.inv.slip.consumptionSlip.reference" field="reference" width="50px" />
            <base:my-grid-column title="com.artonis.inv.slip.consumptionSlip.serial" field="serial" width="50px" />
            <base:my-grid-column title="com.artonis.clinic.operation.factorView.consumptionslip.date" field="consumptionSlipDate" width="50px" />





            <base:my-grid-schema-field name="date" type="string" />
            <base:my-grid-schema-field name="consumptionSlipDate" type="string" />
            <base:my-grid-schema-field name="serviceItemNameOrGoodsName" type="string" />

            <base:my-grid-schema-field name="patientCount" type="string" />
            <base:my-grid-schema-field name="quantityStr" type="string" />
            <base:my-grid-schema-field name="serviceItemAmountSum" type="long" />
            <base:my-grid-schema-field name="insuranceAmountSumStr" type="string" />
            <base:my-grid-schema-field name="totalReceiveCostSumStr" type="string" />
            <base:my-grid-schema-field name="serial" type="string" />
            <base:my-grid-schema-field name="reference" type="string" />


        </base:my-grid-search>
    </form>
    <div style="text-align: center">
        <base:buttonPopup formPopup="ConsumptionSlipItem" key="com.artonis.clinic.operation.factorView.consumptionslip"
                          popUrl="/item/ConsumptionSlipItemTabInput" saveUrl="/save/ConsumptionSlipItem" isRelative="true" loadEntityUrl="/loadConsumptionSlip/"
                          selectAllOnNotSelected="true" selectAllOnNotSelectedUrl="loadIds/"/>

    </div>
<div class="uk-grid uk-grid-preserve" style="border-style: double;margin-right: 0px;padding-top: 5px;padding-bottom: 5px;">
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="quantitySum" styleClass="small" key="com.artonis.clinic.operation.factorView.quantitySum"/>
        <base:testBoxNumericEx disabled="true" name="serviceItemAmountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.serviceItemAmountSum"/>
        <base:testBoxNumericEx disabled="true" name="totalReceiveCostSum" styleClass="small" key="com.artonis.clinic.operation.factorView.totalReceiveCostSum"/>
    </div>
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="insuranceAmountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.totalInsuranceAmountSum"/>
        <base:testBoxNumericEx disabled="true" name="discountAmountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.discountAmountSum"/>
        <base:testBoxNumericEx disabled="true" name="patientCountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.patientCount"/>
    </div>

  </div>
</div>
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
        docVar.service_item_ids=$("#service_item_id_multiSelect").val();
//        docVar.service_id=$("#service_id").val();
        return docVar;

    }

    function doAfterClearAndSearch(){
        doAfterSearch(getSearchJsonString());
    }

    function doAfterSearch(searchString){
        $.ajax({
            url:'${pageContext.request.contextPath}' + '/clinic/operation/factorDoctorClinicPortionBasedEquipment/sumTotalCost/' + searchString,
            contentType:"application/json",
            dataType:'json',
            type:'POST',
            success:function (result) {
                $("#patientCountSum").val(result.patientCountSum);
                $("#serviceItemAmountSum").val(result.serviceItemAmountSum);
                $("#totalReceiveCostSum").val(result.totalReceiveCostSum);
                $("#insuranceAmountSum").val(result.insuranceAmountSum);
                $("#discountAmountSum").val(result.discountAmountSum);

                $("#quantitySum").val(result.quantitySum);


                console.log(result);
                setNumericTextValue();
            }

        });

    }

    function doAfterSave_ConsumptionSlipItem(){
        $("#searchGrid").data("kendoGrid").dataSource.read();
    }

</script>
