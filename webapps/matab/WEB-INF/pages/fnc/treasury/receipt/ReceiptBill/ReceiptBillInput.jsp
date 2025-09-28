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
		<base:buttonPermission key="com.artonis.fnc.treasury.payment.paymentBill.new" classNames="uk-button uk-button-success" id="receiptBillInput-create-btn" onClick="javascript:reload()"/>
		<base:buttonPermission key="com.artonis.fnc.treasury.payment.paymentBill.register" classNames="uk-button uk-button-success" id="receiptBillInput-register-btn" onClick="javascript:changeBillState(2)"/>
		<base:buttonPermission key="com.artonis.fnc.treasury.payment.paymentBill.back" classNames="uk-button uk-button-success" id="receiptBillInput-back-btn" onClick="javascript:changeBillState(1)"/>
		<base:buttonPermission key="com.artonis.fnc.treasury.payment.paymentBill.view" classNames="uk-button uk-button-success" id="receiptBillInput-view-btn" onClick="javascript:goToView()"/>
		<base:buttonPermission key="com.artonis.fnc.treasury.payment.paymentBill.delete" classNames="uk-button uk-button-success" id="receiptBillInput-delete-btn" onClick="javascript:goToDocumentView()"/>
		<base:buttonPermission key="com.artonis.fnc.treasury.payment.paymentBill.print" classNames="uk-button uk-button-success" id="receiptBillInput-print-btn" onClick="javascript:printReceiptBill()" />
	</div>
<div class="uk-container uk-container-center my-uk-container" style=" margin-bottom: 1px; margin-top: 2px;">

	<form class="uk-form" id="mainForm">
	<input type="hidden" id="id" name="id" >
		<input name="financeYear_Id" type="hidden" id="financeyearId" />
		<input name="state" type="hidden" id="state" />
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="verysmall" name="serial" key="com.artonis.fnc.treasury.receipt.receiptBill.serial"/>
			<base:testBox styleClass="verysmall" name="reference" key="com.artonis.fnc.treasury.receipt.receiptBill.reference"/>
			<base:comboBox name="receiptType"   value="name" key="com.artonis.fnc.treasury.payment.paymentBill.receiptType" comboLoaderUrl="combo/loadAllReceiptTypes" styleClass="verysmall" />
				    <base:comboBoxAutoComplete name="coffer_Id" iscomboLoaderUrlRelative="true" key="com.artonis.fnc.treasury.payment.paymentBill.coffer" comboLoaderUrl="combo/loadAllOfCoffer" dataTextField="name" dataValueField="id" minLength="0"
                 hasTemplate="true" styleClass="small" headerTemplateComaSep="com.artonis.fnc.treasury.payment.paymentBill.coffer" templateComaSep="name"/>       
	
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="verysmall" name="date_" key="com.artonis.fnc.treasury.payment.paymentBill.date_"/>
			<base:testBox styleClass="verysmall" name="stateStr" key="com.artonis.fnc.treasury.payment.paymentBill.state" disabled="true"/>
			<base:testBoxNumericEx styleClass="verysmall" dataIgnore="true" name="sumPriceOfItems" key="com.artonis.fnc.treasury.payment.paymentBill.totalSum" disabled="true"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
	    	 <base:textArea  name="description" key="com.artonis.fnc.treasury.payment.paymentBillReceiver.description" height="25"/>
	    </div>	
	</form>
</div>
	<div align="center" style="background: rgb(216, 216, 216);">
	 	<base:buttonPermission key="com.artonis.fnc.treasury.payment.paymentBill.save" classNames="uk-button uk-button-success" onClick="javascript:saveReceiptBill();" style="background-color: rgb(175,214,101);width: 10%;" id="savepaymentBillBtn"/>
	</div>
	<base:itemForm titleKeys="com.artonis.fnc.treasury.receipt.receiptBillPayer,com.artonis.fnc.treasury.receipt.receiptBillReceiptCheque,com.artonis.fnc.treasury.receipt.receiptBillCashReceipt,com.artonis.fnc.treasury.receipt.receiptBillCashReceipt.receiptBankingBill"
		formItemTabViewJspFiles="ReceiptBillPayerItemTabView.jsp,ReceiptBillReceiptChequeItemTabView.jsp,ReceiptBillCashReceiptItemTabView.jsp,ReceiptBillBankingBillItemTabView.jsp" 
		formItemTabInputs="ReceiptBillPayerItemTabInput,ReceiptBillReceiptChequeItemTabInput,ReceiptBillCashReceiptItemTabInput,ReceiptBillBankingBillItemTabInput" 
		insertWithoutPopup="true" masterIdStr="receiptBill_Id"/>

<script type="text/javascript">
    $(document).ready(function(){ 	
   	 $("#floatAccountDiv").hide();
    });
	function saveReceiptBill(){
      save();
	}
	function changeBillState(newState){
	if ($("#id").val()!=null && $("#id").val()>0){
		var receiptBill = {};
		receiptBill.id=$("#id").val();
		receiptBill.state=newState;
		$.ajax({
			url: '${pageContext.request.contextPath}'+'/fnc/treasury/receipt/receiptBill/changeBillState',
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(receiptBill),
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
 function lockUnlockTabs(){
       if(document.getElementsByName('receiptType') !=null && document.getElementsByName('receiptType')[0].value ==1){
       unlockTab('ReceiptBillCashReceiptItem');     
       }
   	   else if(document.getElementsByName('receiptType') !=null && document.getElementsByName('receiptType')[0].value ==2){
   	   lockTab('ReceiptBillCashReceiptItem');    
   	   }
     }
      function callback_change_receiptType(e){
   	  lockUnlockTabs();
       }
       function callback_DataBound_receiptType(data){
      lockUnlockTabs();
      }
  function goToView(){
	window.location = "${pageContext.request.contextPath}"+"/fnc/treasury/receipt/receiptBill/";
    }
    function printReceiptBill(){
        var searchJsonString = {};
        searchJsonString.receiptBill_Id=$("#id").val();
        var baseUrl=getBaseUrl();
        searchJsonString = JSON.stringify(searchJsonString);
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
        //var urlGrid = getBaseUrl() + "print/" + searchJsonString;
        var urlGrid = baseUrl + "printReceiptBill/" + searchJsonString;
        window.location = urlGrid;
    }
</script>
