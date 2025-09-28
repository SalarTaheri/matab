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
<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 1px;" >
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">

            <base:comboBox name="doctor_id"  key="his.patient.doctorName" comboLoaderUrl="combo/loadAllDoctor" styleClass="small"/>

            <base:multiSelect serverFilter="true" name="service_item_values" styleClass="small" multiSelectLoaderUrl="combo/allService" key="com.artonis.clinic.basicInfo.service.name" />
            <%--<base:comboBox name="cancel" key="com.artonis.clinic.operation.factorView.cancel" comboLoaderUrl="combo/allCancelState" styleClass="small"/>--%>
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
        </div>


    </form>
</div>
<div class="uk-container uk-container-center my-uk-container" style="margin-top: 2px;padding-top: 5px;" >
    <base:my-grid-search  showMultipleDelete="false" >
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.patientCount' field="patientCount"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.doctor_lastName' field="doctor_lastName"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.service_name' field="service_name"  width="50px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.date' field="date"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.sumTotalCostStr' field="sumTotalCostStr"  width="50px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.sumInsuranceCostStr' field="sumInsuranceCostStr"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.sumTotalDiscountsStr' field="sumTotalDiscountsStr"  width="40px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.sumPaymentableCostStr' field="sumPaymentableCostStr"  width="40px"/>
        <%--<base:my-grid-column title='com.artonis.clinic.operation.factorView.cancel' field="cancelStr"  width="50px"/>--%>
        <%--<base:my-grid-column title='com.artonis.clinic.operation.factorView.countCancel' field="countCancel"  width="50px"/>--%>

        <base:my-grid-schema-field name="patientCount" type="string" />
        <base:my-grid-schema-field name="doctor_lastName" type="string" />
        <base:my-grid-schema-field name="service_name" type="string" />
        <base:my-grid-schema-field name="date" type="string" />
        <base:my-grid-schema-field name="sumTotalCostStr" type="string" />
        <base:my-grid-schema-field name="sumInsuranceCostStr" type="string" />
        <base:my-grid-schema-field name="sumTotalDiscountsStr" type="string" />
        <base:my-grid-schema-field name="sumPaymentableCostStr" type="string" />
        <%--<base:my-grid-schema-field name="countCancel" type="string" />--%>
        <base:my-grid-schema-field name="cancelStr" type="string" />

        <%--<base:my-grid-function text="com.artonis.clinic.operation.factorPayment.popup.serviceDetail" functionClick="grid_onDetail"  name="detail"/>--%>
    </base:my-grid-search>
  
    <div class="uk-grid uk-grid-preserve" style="background: linear-gradient(to bottom, rgba(160, 188, 197, 1) 0%,rgba(190, 201, 206, 1) 37%,rgba(121, 139, 142, 1) 100%);padding-top: 10px;margin-right: 0px;padding-bottom: 10px;">
        <base:testBoxNumericEx disabled="true" name="totalCostSum" styleClass="verysmall" key="com.artonis.clinic.operation.factorView.sumTotalCostStr"/>
        <base:testBoxNumericEx disabled="true" name="insuranceCostSum" styleClass="verysmall" key="com.artonis.clinic.operation.factorView.sumInsuranceCostStr"/>
        <base:testBoxNumericEx disabled="true" name="totalDiscountsSum" styleClass="verysmall" key="com.artonis.clinic.operation.factorView.sumTotalDiscountsStr"/>
        <base:testBoxNumericEx disabled="true" name="paymentableCostSum" styleClass="verysmall" styledivLabel="width: 15%;" key="com.artonis.clinic.operation.factorView.sumPaymentableCostStr"/>
    </div>
    <div class="uk-grid uk-grid-preserve" style="background: linear-gradient(to bottom, rgba(160, 188, 197, 1) 0%,rgba(190, 201, 206, 1) 37%,rgba(121, 139, 142, 1) 100%);padding-top: 10px;margin-right: 0px;padding-bottom: 10px;">
        <base:testBoxNumericEx disabled="true" name="patientCountSum" styleClass="verysmall" key="com.artonis.clinic.operation.factorView.sumPatientCount"/>
    </div>
</div>
<base:footer/>
<%--<base:popupGrid gridPopupName="gridPatient" selectGridName="searchGrid" relativePopupUrl="popup/detailPatient" fieldQueryPopup="cancel,date,doctor_id,service_id" functionValueQueryPopup="searchQueryValueCreator"/>--%>

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
        docVar.doctor_id=$("#doctor_id").val();
//        docVar.service_id=$("#service_id").val();
        docVar.cancel=$("#cancel").val();
        docVar.cancelStrOnForm=$("#cancel_Comb").data("kendoComboBox").text();

        docVar.doctor_lastName=$("#doctor_id_Comb").data("kendoComboBox").text();

        docVar.service_item_values=$("#service_item_values_multiSelect").val();
        var arrayDataItems=$("#service_item_values_multiSelect").data("kendoMultiSelect")._dataItems;
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
        doAfterSearch(getSearchJsonString(),true);

    }

    function doAfterSearch(searchString,isClear){
        $.ajax({
            url:'${pageContext.request.contextPath}' + '/clinic/operation/factorPatientCountPerDoctorService/sumTotalCost/' + searchString,
            contentType:"application/json",
            dataType:'json',
            type:'POST',
            success:function (result) {
                $("#totalCostSum").val(result.totalCostSum);
                $("#insuranceCostSum").val(result.insuranceCostSum);
                $("#totalDiscountsSum").val(result.totalDiscountsSum);
                $("#paymentableCostSum").val(result.paymentableCostSum);
                $("#patientCountSum").val(result.patientCountSum);
                setNumericTextValue();
                if(isClear){
                    $("#cancel_Comb").data("kendoComboBox").text('')
                }
            }

        });

    }

    function searchQueryValueCreator(row){
        var search=[];
        search[0]=row.cancel;
        search[1]=row.date;
        search[2]=row.doctor_id;
        search[3]=row.service_id;
        return search;
    }

    function grid_onDetail(e){
        _searchGrid_popup(e);
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
