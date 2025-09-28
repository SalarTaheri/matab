<%@ page import="com.artonis.core.base.core.Date" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
    Date curDate = new Date(System.currentTimeMillis());
    String curStringDate = curDate.toString();
%>

<base:pageHeaderTitle/>

<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 1px;" >
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker name="factorFromDate" key="clinic.operation.factorView.factorPatientFund.factorFromDate" styleClass="small"/>
            <base:mDatePicker name="factorToDate" key="clinic.operation.factorView.factorPatientFund.factorToDate" styleClass="small"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:multiSelect serverFilter="true" name="patientId_values" styleClass="small" multiSelectLoaderUrl="combo/loadAllPatient"
                                  key="clinic.operation.factorView.factorPatientFund.patient" />
            <base:comboBox styleClass="small" name="posCMB" key="clinic.operation.factorView.factorPatientFund.posName" comboLoaderUrl="combo/loadAllPos"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker name="factorPaymentFromDate" key="clinic.operation.factorView.factorPatientFund.factorPaymentFromDate" styleClass="small"/>
            <base:mDatePicker name="factorPaymentToDate" key="clinic.operation.factorView.factorPatientFund.factorPaymentToDate" styleClass="small"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:checkbox name="prepayment" key="clinic.operation.factorView.factorPatientFund.prepayment" style="width:15px !important;"/>
        </div>
    </form>
</div>

<div class="uk-container uk-container-center my-uk-container" style="margin-top: 2px; padding-top: 5px;" >
    <base:my-grid-search  showMultipleDelete="false" showOperation="false" >
        <base:my-grid-column title='clinic.operation.factorView.factorPatientFund.patientFileNumber' field="patientFileNumber" width="30px"/>
        <base:my-grid-column title='clinic.operation.factorView.factorPatientFund.patientFirstName' field="patientFirstName" width="30px"/>
        <base:my-grid-column title='clinic.operation.factorView.factorPatientFund.patientLastName' field="patientLastName" width="30px"/>
        <base:my-grid-column title='clinic.operation.factorView.factorPatientFund.factorId' field="factorId" width="30px"/>
        <base:my-grid-column title='clinic.operation.factorView.factorPatientFund.factorDate' field="factorDate" width="30px"/>
        <base:my-grid-column title='clinic.operation.factorView.factorPatientFund.totalCost' field="totalCost" width="30px"/>
        <base:my-grid-column title='clinic.operation.factorView.factorPatientFund.financeRegistrationState' field="financeRegistrationStateText" width="30px"/>
        <base:my-grid-column title='clinic.operation.factorView.factorPatientFund.factorPaymentDate' field="factorPaymentDate" width="30px"/>
        <base:my-grid-column title='clinic.operation.factorView.factorPatientFund.receipt' field="receipt" width="30px"/>
        <base:my-grid-column title='clinic.operation.factorView.factorPatientFund.payment' field="payment" width="30px"/>
        <base:my-grid-column title='clinic.operation.factorView.factorPatientFund.posName' field="posName" width="30px"/>
    </base:my-grid-search>

    <div class="uk-grid uk-grid-preserve" style="border-style: double; margin: 10px; padding: 20px;">
        <div class="uk-grid uk-grid-preserve footerDiv">
            <base:testBoxNumericEx disabled="true" name="sumTotalCost" styleClass="verysmall" key="clinic.operation.factorView.factorPatientFund.totalCost"/>
            <base:testBoxNumericEx disabled="true" name="sumReceipt" styleClass="verysmall" key="clinic.operation.factorView.factorPatientFund.receipt"/>
            <base:testBoxNumericEx disabled="true" name="sumPayment" styleClass="verysmall" key="clinic.operation.factorView.factorPatientFund.payment"/>
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
        $("#factorFromDate").val("<%=curStringDate%>");
        $("#factorToDate").val("<%=curStringDate%>");
        $("#factorPaymentFromDate").val("<%=curStringDate%>");
        $("#factorPaymentToDate").val("<%=curStringDate%>");
    }

    function getSearchObject(){
        var searchObj = {};
        searchObj.factorFromDate = $("#factorFromDate").val();
        searchObj.factorToDate = $("#factorToDate").val();
        searchObj.patientIdValues = $("#patientId_values_multiSelect").val();
        searchObj.posCMB = $("#posCMB").val();
        searchObj.factorPaymentFromDate = $("#factorPaymentFromDate").val();
        searchObj.factorPaymentToDate = $("#factorPaymentToDate").val();
        searchObj.prepayment = $("#prepayment").prop("checked");
        return searchObj;
    }


    function doAfterSearch(searchString){
        $.ajax({
            url:'${pageContext.request.contextPath}' + '/clinic/operation/factorPatientFund/getSumValues/' + searchString,
            contentType:"application/json",
            dataType:'json',
            type:'GET',
            success:function (result) {
                if (result.state == "success") {
                    $("#sumTotalCost").val(result.sumTotalCost);
                    $("#sumReceipt").val(result.sumReceipt);
                    $("#sumPayment").val(result.sumPayment);
                }
                //
                setNumericTextValue();
            }
        });
    }

    $("#prepayment").change(function () {
        /*if ($("#prepayment").prop("checked")) {
            $("#factorFromDate").val('');
            $("#factorToDate").val('');
            //
            $("#factorFromDate").prop('disabled','true');
            $("#factorToDate").prop('disabled','true');
            //
            $("#factorFromDate").css('background-color','#cbc5c2');
            $("#factorToDate").css('background-color','#cbc5c2');
        } else {
            $("#factorFromDate").prop('disabled','');
            $("#factorToDate").prop('disabled','');
            //
            $("#factorFromDate").css('background-color','');
            $("#factorToDate").css('background-color','');
        }*/
    });
</script>

<style>
    .uk-width-1-10 {
        width: 1% !important;
        min-width: 150px !important;
    }

    .footerDiv .uk-width-1-10{
        width: 15% !important;
    }

    .footerDiv input{
        border-style: solid;
        border-width: thin;
        text-align: center;
    }
</style>