<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>
<input name="loadedId" type="hidden" id="loadedId" />
<div id="header-toolbar" align="right" style=" margin-bottom: 2px; margin-top: 2px; margin-right: 15px;">
		<base:buttonPermission key="com.artonis.fnc.treasury.payment.paymentBill.new" classNames="uk-button uk-button-success" id="paymentBillInput-create-btn" onClick="javascript:reload()"/>
		<base:buttonPermission key="com.artonis.fnc.treasury.payment.paymentBill.register" classNames="uk-button uk-button-success" id="paymentBillInput-register-btn" onClick="javascript:changeBillState(2)"/>
		<base:buttonPermission key="com.artonis.fnc.treasury.payment.paymentBill.back" classNames="uk-button uk-button-success" id="paymentBillInput-back-btn" onClick="javascript:changeBillState(1)"/>
		<base:buttonPermission key="com.artonis.fnc.treasury.payment.paymentBill.view" classNames="uk-button uk-button-success" id="paymentBillInput-view-btn" onClick="javascript:goToView()"/>
		<base:buttonPermission key="com.artonis.fnc.treasury.payment.paymentBill.delete" classNames="uk-button uk-button-success" id="paymentBillInput-delete-btn" onClick="javascript:goToDocumentView()"/>
		<base:buttonPermission key="com.artonis.fnc.treasury.payment.paymentBill.print" classNames="uk-button uk-button-success" id="paymentBillInput-print-btn" onClick="javascript:printPaymentBill()" />
</div>
<div class="uk-container uk-container-center my-uk-container"  style=" margin-bottom: 1px; margin-top: 2px;">
	<form class="uk-form" id="mainForm">
	
		<input type="hidden" id="id" name="id" >
		<input name="financeyearId" type="hidden" id="financeyearId" />
		<input name="state" type="hidden" id="state" />
	 
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="verysmall" name="serial" key="com.artonis.fnc.treasury.payment.paymentBill.serial"/>
			<base:testBox styleClass="verysmall" name="reference"  key="com.artonis.fnc.treasury.payment.paymentBill.reference"/>
			<base:comboBox name="paymentType"  value="name" key="com.artonis.fnc.treasury.payment.paymentBill.paymentType" comboLoaderUrl="combo/loadAllPaymentTypes" styleClass="verysmall" />
		    <base:comboBoxAutoComplete name="cofferId"  styleClass="small" iscomboLoaderUrlRelative="true" key="com.artonis.fnc.treasury.payment.paymentBill.coffer" comboLoaderUrl="combo/loadAllOfCoffer" dataTextField="name" dataValueField="id" minLength="0"
                hasTemplate="true" headerTemplateComaSep="com.artonis.fnc.treasury.payment.paymentBill.coffer" templateComaSep="name"/>       
		
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="verysmall" name="date_" key="com.artonis.fnc.treasury.payment.paymentBill.date_"/>
		    <base:testBox styleClass="verysmall" name="stateStr" key="com.artonis.fnc.treasury.payment.paymentBill.state" disabled="true"/>
			<base:testBoxNumericEx styleClass="verysmall" name="sumPriceOfItems" key="com.artonis.fnc.treasury.payment.paymentBill.totalSum"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
	    	 <base:textArea  name="description" key="com.artonis.fnc.treasury.payment.paymentBillReceiver.description" height="25"/>
	    </div>	
	</form>
</div>	
	    <div dir="ltr" align="center" style="background: rgb(216, 216, 216);">
		    <base:buttonPermission key="com.artonis.fnc.treasury.payment.paymentBill.save" classNames="uk-button uk-button-success" id="savepaymentBillBtn" onClick="javascript:savePaymentBill()" style="background-color: rgb(175,214,101);width: 10%;"/>
		</div>
		<base:itemForm titleKeys="com.artonis.fnc.treasury.payment.paymentBillReceiver.receiver,com.artonis.fnc.treasury.payment.paymentBillTransferedCash,com.artonis.fnc.treasury.payment.paymentBillCoffer,com.artonis.fnc.treasury.payment.paymentBillPaymentcheque,com.artonis.fnc.treasury.payment.paymentBillReceiptCheque,com.artonis.fnc.treasury.payment.paymentBillReceiver.paymentBankingBill" 
		formItemTabViewJspFiles="PaymentBillReceiverItemTabView.jsp,PaymentBillTransferedCashItemTabView.jsp,PaymentBillCofferItemTabView.jsp,PaymentBillPaymentChequeTabView.jsp,PaymentBillReceiptChequeItemTabView.jsp,PaymentBillBankingBillItemTabView.jsp" formItemTabInputs="PaymentBillReceiverItemTabInput,PaymentBillTransferedCashItemTabInput,PaymentBillCofferItemTabInput,PaymentBillPaymentChequeItemTabInput,PaymentBillReceiptChequeItemTabInput,PaymentBillBankingBillItemTabInput" insertWithoutPopup="true" masterIdStr="paymentBillId"/>
	
	       
<script type="text/javascript">
	function savePaymentBill(){
      save();
	}
	function changeBillState(newState){
	if ($("#id").val()!=null && $("#id").val()>0){
		var paymentBill = {};
		paymentBill.id=$("#id").val();
		paymentBill.state=newState;
		$.ajax({
			url: '${pageContext.request.contextPath}'+'/fnc/treasury/payment/paymentBill/changeBillState',
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(paymentBill),
			dataType: 'json',
			type: 'POST',
			success: function (data, success, xhr) {
	            if (data.state == "error") {
	                for (var i = 0; i < data.errors.length; i++) {
	                    if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
	                        alertify.error($("label[for='" + data.errors[i].Field + "']").text() + "  " + data.errors[i].Message);
	                    } else {
	                        alertify.error(data.errors[i].Field + "  " + data.errors[i].Message);
	                    }
	                }
	            }else{
					$('#state').val(data.newStateValue);
					$('#stateStr').val(data.newStateText);
				}
			},
			error: function (e) {
				alert('Error: ' + e.responseText);
			}
		});
	}else{
		alert(":\ ابتدا قبض را ذخیره کنید");
	}
}
function getSumOfItems(){
	if ($("#id").val()!=null && $("#id").val()>0){
		var paymentBill = {};
		paymentBill.id=$("#id").val();
		paymentBill.state=newState;
		$.ajax({
			url: '${pageContext.request.contextPath}'+'/fnc/treasury/payment/paymentBill/changeBillState',
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(paymentBill),
			dataType: 'json',
			type: 'POST',
			success: function (data, success, xhr) {
	            if (data.state == "error") {
	                for (var i = 0; i < data.errors.length; i++) {
	                    if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
	                        alertify.error($("label[for='" + data.errors[i].Field + "']").text() + "  " + data.errors[i].Message);
	                    } else {
	                        alertify.error(data.errors[i].Field + "  " + data.errors[i].Message);
	                    }
	                }
	            }else{
					$('#state').val(data.newStateValue);
					$('#stateStr').val(data.newStateText);
				}
			},
			error: function (e) {
				alert('Error: ' + e.responseText);
			}
		});
	}else{
		alert(":\ ابتدا قبض را ذخیره کنید");
	}
}
	
	function goToView(){
		window.location = "${pageContext.request.contextPath}"+"/fnc/treasury/payment/paymentBill/";
    }
    function callback_change_paymentType(e){
   		lockUnlockTabs();
    }
    function lockUnlockTabs(){
       if(document.getElementsByName('paymentType') !=null && document.getElementsByName('paymentType')[0].value ==1){
    	   unlockTab('PaymentBillCofferItem');     
       }
   	   else if(document.getElementsByName('paymentType') !=null  && document.getElementsByName('paymentType')[0].value ==2){
   		   lockTab('PaymentBillCofferItem');    
   	   }
    }
    function callback_DataBound_paymentType(data){
    	lockUnlockTabs();
    }
    function callback_validation_before_save_PaymentBillPaymentChequeItem(tmp){
    	return validationSavePicker_paymentChequeAccountCoding_Id();
    }
    function printPaymentBill(){
        var searchJsonString = {};
        searchJsonString.paymentBillId=$("#id").val();
        var baseUrl=getBaseUrl();
        searchJsonString = JSON.stringify(searchJsonString);
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
        var urlGrid = baseUrl + "printPaymentBill/" + searchJsonString;
        window.location = urlGrid;
    }
	</script>

