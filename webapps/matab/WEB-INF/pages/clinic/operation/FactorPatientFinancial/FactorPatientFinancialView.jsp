<%@ page import="com.artonis.core.base.core.Date" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
    Date curDate=new Date(System.currentTimeMillis());
    String curStringDate=curDate.toString();
%>

<base:pageHeader/>

<div class="uk-container uk-container-center my-uk-container" style="" >
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker name="factorFromDate" key="com.artonis.clinic.operation.factorPatientFinancial.factorFromDate" styleClass="small" />
            <base:mDatePicker name="factorToDate" key="com.artonis.clinic.operation.factorPatientFinancial.factorToDate" styleClass="small" />
            <base:mDatePicker name="frFromDate" key="com.artonis.clinic.operation.factorPatientFinancial.frFromDate" styleClass="small" />
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker name="frToDate" key="com.artonis.clinic.operation.factorPatientFinancial.frToDate" styleClass="small" />
            <base:mDatePicker name="fpFromDate" key="com.artonis.clinic.operation.factorPatientFinancial.fpFromDate" styleClass="small" />
            <base:mDatePicker name="fpToDate" key="com.artonis.clinic.operation.factorPatientFinancial.fpToDate" styleClass="small" />
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:multiSelect serverFilter="true" name="patientId_values" styleClass="small" multiSelectLoaderUrl="combo/loadAllPatient"
                              key="com.artonis.clinic.operation.factorPatientFinancial.patient" />
            <base:multiSelect serverFilter="true" name="serviceId_values" styleClass="small" multiSelectLoaderUrl="combo/loadAllService"
                              key="com.artonis.clinic.operation.factorPatientFinancial.service" />
            <base:multiSelect serverFilter="true" name="doctorId_values" styleClass="small"  multiSelectLoaderUrl="combo/loadAllMainDoctor"
                              key="com.artonis.clinic.operation.factorPatientFinancial.doctor" />
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:comboBox name="finance_reg_state" key="com.artonis.clinic.operation.factorPatientFinancial.finance_reg_state" styleClass="small"
                           comboLoaderUrl="combo/allFinanceRegState"/>
            <base:comboBox name="frIsPrintFactor" key="com.artonis.clinic.operation.factorPatientFinancial.frIsPrintFactorList"  styleClass="small"
                           comboLoaderUrl="combo/allFinanceRegistrationIsFactorPrint"/>
            <base:comboBox name="fpisPrintFactor" key="com.artonis.clinic.operation.factorPatientFinancial.fpisPrintFactorList"  styleClass="small"
                           comboLoaderUrl="combo/allFinanceRegistrationIsFactorPrint"/>
         </div>
        <div class="uk-grid uk-grid-preserve">
            <base:comboBox name="isSettlement" key="com.artonis.clinic.operation.factorPatientFinancial.isSettlement"  styleClass="small"
                           comboLoaderUrl="combo/allfactorIsSettlement"/>
            <%--<base:checkbox name="prepayment" key="com.artonis.clinic.operation.factorPatientFinancial.prepayment" style="width:15px !important;"/>--%>
            <base:comboBox name="frExist" key="com.artonis.clinic.operation.factorPatientFinancial.frExist"  styleClass="small"
                           comboLoaderUrl="combo/allFinanceRegistrationExist"/>


        </div>
    </form>
</div>

<base:my-grid-search showOperation="false">
    <base:my-grid-column title='global.date' field="factorDate" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.firstNamePatient' field="firstname" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.lastNamePatient' field="lastname" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.filenumberPatient' field="filenumber" width="30"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.finance_reg_state' field="financeRegStateStr" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.serviceNameList' field="serviceNameList" width="30"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.doctorNameList' field="doctorNameList" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.frIsPrintFactorList' field="frIsPrintFactorList" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.frDateList' field="frDateListAsPersian" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.payable' field="payable" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.total' field="total" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.sumReceipt' field="sumReceipt" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.sumPayment' field="sumPayment" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.sumCashReceipt' field="sumCashReceipt" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.sumPosReceipt' field="sumPosReceipt" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.fpReceiptPaymentListNewLine' field="fpReceiptPaymentListNewLine" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.fpisPrintFactorList' field="fpisPrintFactorList" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.fpDateList' field="fpDateListAsPersian" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientFinancial.isSettlement' field="isSettlementStr" width="40"/>

</base:my-grid-search>

<div class="uk-grid uk-grid-preserve" style="border-style: double; margin: 10px; padding: 20px;">
    <div class="uk-grid uk-grid-preserve footerDiv">
        <base:testBoxNumericEx disabled="true" name="sum_payable" styleClass="verysmall" key="com.artonis.clinic.operation.factorPatientFinancial.sum_payable"/>
        <base:testBoxNumericEx disabled="true" name="sum_total" styleClass="verysmall" key="com.artonis.clinic.operation.factorPatientFinancial.sum_total"/>
        <base:testBoxNumericEx disabled="true" name="sum_sumReceipt" styleClass="verysmall" key="com.artonis.clinic.operation.factorPatientFinancial.sum_sumReceipt"/>
    </div>
    <div class="uk-grid uk-grid-preserve footerDiv">
        <base:testBoxNumericEx disabled="true" name="sum_sumPayment" styleClass="verysmall" key="com.artonis.clinic.operation.factorPatientFinancial.sum_sumPayment"/>
        <base:testBoxNumericEx disabled="true" name="sum_sumCashReceipt" styleClass="verysmall" key="com.artonis.clinic.operation.factorPatientFinancial.sum_sumCashReceipt"/>
        <base:testBoxNumericEx disabled="true" name="sum_sumPosReceipt" styleClass="verysmall" key="com.artonis.clinic.operation.factorPatientFinancial.sum_sumPosReceipt"/>
    </div>
</div>

<base:footer/>

<script type="text/javascript">
    $(document).ready(function() {
        resetForm();
        doAfterSearch(getSearchJsonString());
    });

    function getSearchObject(){
		var obj = {};
		obj.factorFromDate = $("#factorFromDate").val();
		obj.factorToDate = $("#factorToDate").val();
        obj.frFromDate = $("#frFromDate").val();
		obj.frToDate = $("#frToDate").val();
        obj.fpFromDate = $("#fpFromDate").val();
		obj.fpToDate = $("#fpToDate").val();
        obj.finance_reg_state=$("#finance_reg_state").val();
        obj.frIsPrintFactor=$("#frIsPrintFactor").val();
        obj.fpisPrintFactor=$("#fpisPrintFactor").val();
        obj.isSettlement=$("#isSettlement").val();
        obj.frExist=$("#frExist").val();
        obj.prepayment = $("#prepayment").prop("checked");

        ////---- This part is for get values from multiSelects -----------
        var getOptionArray = function(options){
        	var arr = [];
        	for(var i=0;i<options.length;i++){
            	arr[i]=options[i].value;
            }
        	return arr;
        };
        $("*[data-role='multiselect']").each(function(){
        	obj[this.id.replace("_multiSelect","")] = getOptionArray(this.selectedOptions);
        })
		////---------- END -------------
		return obj;
	}

    function resetForm(){
        $("#factorFromDate").val("<%=curStringDate%>");
        $("#factorToDate").val("<%=curStringDate%>");
    }


    function doAfterClearAndSearch(){
        doAfterSearch(getSearchJsonString(),true);

    }

    function doAfterSearch(searchString,isClear){
        $.ajax({
            url:'${pageContext.request.contextPath}' + '/clinic/operation/factorPatientFinancial/getSumValues/' + searchString,
            contentType:"application/json",
            dataType:'json',
            type:'GET',
            success:function (result) {
                if (result.state == "success") {
                    $("#sum_payable").val(result.sumPayable);
                    $("#sum_total").val(result.sumTotal);
                    $("#sum_sumReceipt").val(result.sumSumReceipt);
                    $("#sum_sumPayment").val(result.sumSumPayment);
                    $("#sum_sumCashReceipt").val(result.sumSumCashReceipt);
                    $("#sum_sumPosReceipt").val(result.sumSumPosReceipt);
                }
                //
                setNumericTextValue();

                if(isClear){
                    $("#finance_reg_state_Comb").data("kendoComboBox").text('')
                    $("#frIsPrintFactor_Comb").data("kendoComboBox").text('')
                    $("#fpisPrintFactor_Comb").data("kendoComboBox").text('')
                    $("#isSettlement_Comb").data("kendoComboBox").text('')
                    $("#frExist_Comb").data("kendoComboBox").text('')
                }
            }
        });
    }
</script>

<style>
    .footerDiv .uk-width-1-10{
        width: 15% !important;
    }
</style>