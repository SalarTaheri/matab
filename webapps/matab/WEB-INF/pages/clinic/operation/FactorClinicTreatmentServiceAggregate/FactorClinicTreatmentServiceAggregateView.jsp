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
            <base:multiSelect serverFilter="true" name="service_item_id" styleClass="small" multiSelectLoaderUrl="combo/loadHealthServiceItem" key="com.artonis.clinic.basicInfo.serviceItem.type.healthCenterService" />
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
        </div>


        <base:my-grid-search  showMultipleDelete="false"  showOperation="false" scrollable="true">
            <base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItem.type.healthCenterService' field="service_item_name"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.patientCount' field="patientCount"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.quantity' field="quantityStr"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.serviceItemBasicAmount' field="serviceItemBasicAmount"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.serviceItemAmountSum' field="serviceItemAmountSum"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.discountAmountSum' field="discountAmountSumStr"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.insuranceAmountSum' field="insuranceAmountSumStr"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.totalReceiveCostSum' field="totalReceiveCostSumStr"  width="50px"/>

            <base:my-grid-schema-field name="serviceItemAmountSum" type="long" />
            <%--<base:my-grid-schema-field name="quantityStr" type="string" />--%>
            <%--<base:my-grid-schema-field name="totalReceiveCostSum" type="string" />--%>
            <%--<base:my-grid-schema-field name="discountAmountSum" type="string" />--%>
        </base:my-grid-search>
    </form>
<div class="uk-grid uk-grid-preserve" style="border-style: double;margin-right: 0px;padding-top: 5px;padding-bottom: 5px;">
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="totalPatientCount" styleClass="small" key="com.artonis.clinic.operation.factorView.patientCountSum"/>
        <base:testBoxNumericEx disabled="true" name="totalQuantitySum" styleClass="small" key="com.artonis.clinic.operation.factorView.total"/>
        <base:testBoxNumericEx disabled="true" name="totalServiceItemBasicAmountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.totalServiceItemBasicAmountSum"/>


    </div>
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="totalServiceItemAmountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.totalServiceItemAmountSum"/>
        <base:testBoxNumericEx disabled="true" name="totalInsuranceAmountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.totalInsuranceAmountSum"/>
        <base:testBoxNumericEx disabled="true" name="totalDiscountAmountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.discountAmountSum"/>

    </div>
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="totalReceiveCostSum" styleClass="small" key="com.artonis.clinic.operation.factorView.totalReceiveCostSum"/>
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

        var arrayDataItems=$("#service_item_id_multiSelect").data("kendoMultiSelect")._dataItems;
        if(arrayDataItems!=undefined &&arrayDataItems.length>0){
            var service_item_valueText='';
            for(var i=0;i<arrayDataItems.length;i++){
                service_item_valueText+=arrayDataItems[i].ComboCaption+' , ';
            }
            docVar.service_items_text=service_item_valueText.substring(0,service_item_valueText.length-3);
        }

        return docVar;

    }

    function doAfterClearAndSearch(){
        doAfterSearch(getSearchJsonString());
    }

    function doAfterSearch(searchString){
        $.ajax({
            url:'${pageContext.request.contextPath}' + '/clinic/operation/factorClinicTreatmentService/sumTotalCost/' + searchString,
            contentType:"application/json",
            dataType:'json',
            type:'POST',
            success:function (result) {
                $("#totalPatientCount").val(result.totalPatientCount);
                $("#totalQuantitySum").val(result.totalQuantitySum);
                $("#totalServiceItemBasicAmountSum").val(result.totalServiceItemBasicAmountSum);
                $("#totalServiceItemAmountSum").val(result.totalServiceItemAmountSum);
                $("#totalInsuranceAmountSum").val(result.totalInsuranceAmountSum);
                $("#totalDiscountAmountSum").val(result.totalDiscountAmountSum);
                $("#totalReceiveCostSum").val(result.totalReceiveCostSum);

                console.log(result);
                setNumericTextValue();
            }

        });

    }

</script>
