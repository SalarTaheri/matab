
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>
<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="fromChequeSerial" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.fromchequeSerial"/>
			<base:testBox styleClass="midsmall" name="toChequeSerial"  key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.tochequeSerial"/>
		    <base:testBox styleClass="midsmall" name="chequeBookletNumber" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.chequeBookletNum"/>
	    </div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBoxAutoComplete name="bank_Id" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.bankName" comboLoaderUrl="combo/loadAllBank" dataTextField="name" dataValueField="id" minLength="0"
                  styleClass="midsmall" iscomboLoaderUrlRelative="true" hasTemplate="true" headerTemplateComaSep="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.bankName" templateComaSep="name"/>       
		    <base:comboBox name="lastState"  value="name" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.state" comboLoaderUrl="combo/loadAllPaymentChequeStates" styleClass="midsmall" />    
		 	<base:testBoxNumericEx styleClass="midsmall" name="chequePrice" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.chequePrice"/>
	    </div>

		<base:accountAndFloatAccountPicker accountCodingFieldName="accountCodingId"
					floatAccount1FieldName="floatAccountLevel1Id" floatAccount2FieldName="floatAccountLevel2Id"
					floatAccount3FieldName="floatAccountLevel3Id" floatAccount4FieldName="floatAccountLevel4Id"
					accountCodingFieldKey="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.receiverCheuqueAccount"  />
	  
    	<base:my-grid-search isPopup="true"  showMultipleDelete="false" onSelectRow="selectRow">
			<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.type'  field="paymentTypeStr" width="50px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.chequeSerial'  field="chequeSerial" width="50px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.billSerial'  field="billSerial" width="50px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.chequeBookletNum'  field="chequeBookletNumber" width="50px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.maturityDate'  field="maturityDate" width="50px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.state'  field="chequeStateStr" width="50px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.bankName'  field="bankName" width="50px"/>
		  	<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.rialPrice' format="0:#,0" field="chequePrice" width="50px"/>
		    <base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.backOperaion' isFlag="true" flagIconUrl="/resources/images/blue/button-rotate-ccw.png" flagDestinationUrl="backStateOperation"  field="backState" width="25px"/>
		    <base:my-grid-function text="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.viewBill" functionClick="grid_onGoToPaymentBillInput"  name="visit"/>
       		<base:my-grid-function text="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.viewState" functionClick="grid_onGoToChequeStateHistory"  name="GoChequeStateHistory"/>

	        <base:my-grid-schema-field name="paymentTypeStr" type="string"/>
    	    <base:my-grid-schema-field name="chequeSerial" type="string"/>
        	<base:my-grid-schema-field name="billSerial" type="long"/>
        	<base:my-grid-schema-field name="chequeBookletNumber" type="string"/>
        	<base:my-grid-schema-field name="maturityDate" type="string"/>
        	<base:my-grid-schema-field name="chequeStateStr" type="string"/>
        	<base:my-grid-schema-field name="bankName" type="string"/>
        	<base:my-grid-schema-field name="chequePrice" type="long"/>
		</base:my-grid-search>
   </form>
   
   <div style="text-align: center">
    	<base:buttonPopup formPopup="PassedPaymentChequeItem" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.passedPaymentCheque" popUrl="/item/PassedPaymentChequeItemTabInput" saveUrl="/save/PassedPaymentChequeItem" isRelative="true" loadEntityUrl="/loadPaymentCheque/"/>
    	<base:buttonPopup smallShow="true" formPopup="VoidedPaymentChequeItem" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.VoidedPaymentCheque" popUrl="/item/VoidedPaymentChequeItemTabInput" saveUrl="/save/VoidedPaymentChequeItem" isRelative="true" loadEntityUrl="/loadPaymentCheque/"/>
    	<base:buttonPopup smallShow="true" formPopup="ReturnedPaymentChequeItem" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.returnedPaymentCheque" popUrl="/item/ReturnedPaymentChequeItemTabInput" saveUrl="/save/ReturnedPaymentChequeItem" isRelative="true" loadEntityUrl="/loadPaymentCheque/"/>
    </div>
</div>
   
<base:footer/>
<script >
function getSearchObject(){
		var paymentChequeVar = {};
		paymentChequeVar.fromChequeSerial=$("#fromChequeSerial").val();
		paymentChequeVar.toChequeSerial=$("#toChequeSerial").val();
		paymentChequeVar.chequeBookletNumber=$("#chequeBookletNumber").val();
		paymentChequeVar.toReference=$("#toReference").val();
		paymentChequeVar.bank_Id=$("#bank_Id").val();
		paymentChequeVar.branch_Id=$("#branch_Id").val();
		paymentChequeVar.bankAccount_Id=$("#bankAccount_Id").val();
	    paymentChequeVar.chequeState=$("#lastState").val();
	    paymentChequeVar.price=$("#chequePrice").val();
	    paymentChequeVar.accountCoding_Id=$("#accountCodingId").val();
		return paymentChequeVar;
}
       function grid_onGoToPaymentBillInput(e){
     	var data = this.dataItem($(e.target).closest("tr"));	  
	   	window.location = "${pageContext.request.contextPath}"+"/fnc/treasury/payment/paymentBill/edit/"+data.bill_Id;
	  }
	  function doAfterSave_PassedPaymentChequeItem(){
	 		$("#searchGrid").data("kendoGrid").dataSource.read();   
	  }
	   function doAfterSave_VoidedPaymentChequeItem(){
	 		$("#searchGrid").data("kendoGrid").dataSource.read();   
	  }
	   function doAfterSave_ReturnedPaymentChequeItem(){
	 		$("#searchGrid").data("kendoGrid").dataSource.read();   
	  }
	    function selectRow(e){
        var entityGrid = $("#searchGrid").data("kendoGrid");
        var rows = entityGrid.select();
        var rowEntity = [rows.length];
        var selectedItem = entityGrid.dataItem(rows);
        disableEnableButtons(selectedItem.chequeState);
         }
   
     function disableEnableButtons(state){
	 		if(state==1){
	 		  $('#PassedPaymentChequeItem_popup_button').attr("disabled", false);
	 		  $('#VoidedPaymentChequeItem_popup_button').attr("disabled", false);
	 		  $('#ReturnedPaymentChequeItem_popup_button').attr("disabled", false);
	 		}
	 		else if(state==2 || state==3 || state==4){
	 		  $('#PassedPaymentChequeItem_popup_button').attr("disabled", true);
	 		  $('#VoidedPaymentChequeItem_popup_button').attr("disabled", true);
	 		  $('#ReturnedPaymentChequeItem_popup_button').attr("disabled", true);
	 		}
	  }
    function grid_onGoToChequeStateHistory(e){
       	var data = this.dataItem($(e.target).closest("tr"));	  
         window.location.href="${pageContext.request.contextPath}"+"/fnc/treasury/treasuryDocs/chequeStateHistory/loadAndSave/"+'2@'+data.id;
   	}
</script>
