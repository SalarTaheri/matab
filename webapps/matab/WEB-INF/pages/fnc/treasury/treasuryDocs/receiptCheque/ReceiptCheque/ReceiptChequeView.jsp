
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
		    		<base:testBox styleClass="midsmall" name="chequeSerial" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.chequeSerial"/>
		   		    <base:testBox styleClass="midsmall" name="bankName" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.bankName"/>
		 		   <base:testBox styleClass="midsmall" name="bankAccountName" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.bankAccountName"/>    
		 
		    </div>
		      <div class="uk-grid uk-grid-preserve">
		    			<base:comboBox name="chequeType"  value="name" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.chequeType" comboLoaderUrl="combo/loadAllReceiptTypes" styleClass="midsmall" />
		      		    <base:comboBox name="lastState"  value="name" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.state" comboLoaderUrl="combo/loadAllReceiptChequeStates" styleClass="midsmall" />         
		            	<base:testBox styleClass="midsmall" name="fromChequePrice" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.fromChequePrice"/>    
		     		   	<base:testBox styleClass="midsmall" name="toChequePrice" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.toChequePrice"/>    
		      
		       </div>
		      
		         <div class="uk-grid uk-grid-preserve">
		     		   	<base:testBox  styleClass="midsmall" name="fromBillSerial" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.fromBillSerial"/>    
		     		   	<base:testBox  styleClass="midsmall" name="toBillSerial" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.toBillSerial"/>    
		        	    <base:mDatePicker styleClass="midsmall" name="fromBillDate" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.fromBillDate"/>    
		     		   	<base:mDatePicker styleClass="midsmall" name="toBillDate" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.toBillDate"/>    
		     
		       </div>
		         <div class="uk-grid uk-grid-preserve">
		     		  </div>
		                 <base:accountAndFloatAccountPicker accountCodingFieldName="accountCodingId"
					floatAccount1FieldName="floatAccountLevel1Id" floatAccount2FieldName="floatAccountLevel2Id"
					floatAccount3FieldName="floatAccountLevel3Id" floatAccount4FieldName="floatAccountLevel4Id"
					accountCodingFieldKey="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.payerAccountCode"  />
	  
    <base:my-grid-search isPopup="true"   showMultipleDelete="false" onSelectRow="selectRow">
    	<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.chequeType'  field="chequeTypeStr" width="50px"/>
		<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.billSerial'  field="billserial" width="50px"/>
		<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.chequeSerial'  field="serial" width="50px"/>
		<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.billDate'  field="billDate" width="50px"/>
		<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.maturityDate'  field="maturityDate" width="50px"/>
		<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.bankName'  field="bankName" width="50px"/>
   		<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.state'  field="chequeStateStr" width="50px"/>
    	<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.chequePrice' format="0:#,0"  field="receiptChequePrice" width="50px"/>
    	<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.backOperaion' isFlag="true" flagIconUrl="/resources/images/blue/button-rotate-ccw.png" flagDestinationUrl="backStateOperation"  field="backState" width="25px"/>
    	<base:my-grid-function text="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.viewBill" functionClick="grid_onGoToReceiptBillInput"  name="visit"/>
        <base:my-grid-function text="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.viewState" functionClick="grid_onGoToChequeStateHistory"  name="GoChequeStateHistory"/>
       
        <base:my-grid-schema-field name="chequeTypeStr" type="string"/>
        <base:my-grid-schema-field name="billserial" type="long"/>
        <base:my-grid-schema-field name="serial" type="string"/>
        <base:my-grid-schema-field name="billDate" type="string"/>
        <base:my-grid-schema-field name="maturityDate" type="string"/>
        <base:my-grid-schema-field name="bankName" type="string"/>
        <base:my-grid-schema-field name="chequeStateStr" type="string"/>
        <base:my-grid-schema-field name="receiptChequePrice" type="long"/>
        
        
</base:my-grid-search>
</form>
 <div style="text-align: center">
  <base:buttonPopup formPopup="InClearingReceiptChequeItem" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.inClearingReceiptCheque" popUrl="item/InClearingReceiptChequeItemTabInput" saveUrl="/save/InClearingReceiptChequeItem" isRelative="true" loadEntityUrl="/loadReceiptCheque/"/>
  <base:buttonPopup formPopup="ClearedReceiptChequeItem" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.clearedReceiptCheque" popUrl="item/ClearedReceiptChequeItemTabInput" saveUrl="/save/ClearedReceiptChequeItem" isRelative="true" loadEntityUrl="/loadReceiptCheque/"/>
  <base:buttonPopup formPopup="CashedReceiptChequeItem" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.cashedReceiptCheque" popUrl="item/CashedReceiptChequeItemTabInput" saveUrl="/save/CashedReceiptChequeItem" isRelative="true" loadEntityUrl="/loadReceiptCheque/"/>
  <base:buttonPopup formPopup="ReturnedReceiptChequeItem" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.returnedReceiptCheque" popUrl="item/ReturnedReceiptChequeItemTabInput" saveUrl="/save/ReturnedReceiptChequeItem" isRelative="true" loadEntityUrl="/loadReceiptCheque/"/>
  <base:buttonPopup formPopup="AssignedReceiptChequeItem" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.assignedReceiptCheque" popUrl="item/AssignedReceiptChequeItemTabInput" saveUrl="/save/AssignedReceiptChequeItem" isRelative="true" loadEntityUrl="/loadReceiptCheque/"/>
  <base:buttonPopup smallShow="true" formPopup="BackReturnedReceiptChequeItem" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.backReturnedReceiptCheque" popUrl="item/BackReturnedReceiptChequeItemTabInput" saveUrl="/save/BackReturnedReceiptChequeItem" isRelative="true" loadEntityUrl="/loadReceiptCheque/"/>
  <base:buttonPopup formPopup="GroupClearedReceiptChequeItem" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.groupClearedCheque" popUrl="item/GroupClearedReceiptChequeItemTabInput" saveUrl="/save/GroupClearedReceiptChequeItem" isRelative="true" loadEntityUrl="/loadGroupReceiptCheque/"/>
 
 </div>
</div>
  
<base:footer/>
<script type="text/javascript">
   function getSearchObject(){
		var receiptChequeVar = {};
		receiptChequeVar.serial=$("#chequeSerial").val();
		receiptChequeVar.bankName=$("#bankName").val();
		receiptChequeVar.chequeType=$("#chequeType").val();
		receiptChequeVar.bankAccountName=$("#bankAccountName").val();
		receiptChequeVar.fromChequePrice=$("#fromChequePrice").val();
	    receiptChequeVar.chequeState=$("#toChequePrice").val();
		receiptChequeVar.fromBillSerial=$("#fromBillSerial").val();
		receiptChequeVar.toBillSerial=$("#toBillSerial").val();
		receiptChequeVar.chequeState=$("#lastState").val();
		receiptChequeVar.receiptChequeAccountCode_Id=$("#accountCodingId").val();
		receiptChequeVar.floatAccountLevel1Id=$("#receiptChequeFloatAccountLevel1_Id").val();
		receiptChequeVar.floatAccountLevel2Id=$("#receiptChequeFloatAccountLevel2_Id").val();
		receiptChequeVar.floatAccountLevel3Id=$("#receiptChequeFloatAccountLevel3_Id").val();
		receiptChequeVar.floatAccountLevel4Id=$("#receiptChequeFloatAccountLevel4_Id").val();
	   	return receiptChequeVar;
      }
    function grid_onGoToReceiptBillInput(e){
     	var data = this.dataItem($(e.target).closest("tr"));	  
	   	window.location = "${pageContext.request.contextPath}"+"/fnc/treasury/receipt/receiptBill/edit/"+data.receiptBill_Id;
	}
	function doAfterSave_InClearingReceiptChequeItem(){
	 		$("#searchGrid").data("kendoGrid").dataSource.read();   
	  }
	      function doAfterSave_CashedReceiptChequeItem(){
	 		$("#searchGrid").data("kendoGrid").dataSource.read();   
	  }
	      function doAfterSave_ClearedReceiptChequeItem(){
	 		$("#searchGrid").data("kendoGrid").dataSource.read();   
	  }
	     function doAfterSave_ReturnedReceiptChequeItem(){
	 		$("#searchGrid").data("kendoGrid").dataSource.read();   
	  }
	       function doAfterSave_AssignedReceiptChequeItem(){
	 		$("#searchGrid").data("kendoGrid").dataSource.read();   
	  }
	      function doAfterSave_BackReturnedReceiptChequeItem(){
	 		$("#searchGrid").data("kendoGrid").dataSource.read();   
	  }
	       function doAfterSave_GroupClearedReceiptChequeItem(){
	 		$("#searchGrid").data("kendoGrid").dataSource.read();   
	  }
	  function selectRow(e){
        var entityGrid = $("#searchGrid").data("kendoGrid");
        var rows = entityGrid.select();
        var rowEntity = [rows.length];
        var selectedItem = entityGrid.dataItem(rows);
        if(rowEntity>1){
        $('#GroupClearedReceiptChequeItem_popup_button').attr("disabled", false);
        disableEnableButtons(7);
         }
         else{
       $('#GroupClearedReceiptChequeItem_popup_button').attr("disabled", true);
       disableEnableButtons(selectedItem.chequeState);
         }
    }
         function disableEnableButtons(state){
	 		if(state==5){
	 		  $('#InClearingReceiptChequeItem_popup_button').attr("disabled", false);
	 		  $('#ClearedReceiptChequeItem_popup_button').attr("disabled", false);
	 		  $('#ReturnedReceiptChequeItem_popup_button').attr("disabled", false);
	 		  $('#CashedReceiptChequeItem_popup_button').attr("disabled", false);
	 		  $('#AssignedReceiptChequeItem_popup_button').attr("disabled", false);
	 		  $('#BackReturnedReceiptChequeItem_popup_button').attr("disabled", false);
	 		}
	 		else if(state==6){
	 		  $('#InClearingReceiptChequeItem_popup_button').attr("disabled", true);
	 		  $('#ClearedReceiptChequeItem_popup_button').attr("disabled", false);
	 		  $('#ReturnedReceiptChequeItem_popup_button').attr("disabled", false);
	 		  $('#CashedReceiptChequeItem_popup_button').attr("disabled", true);
	 		  $('#AssignedReceiptChequeItem_popup_button').attr("disabled", true);
	 		  $('#BackReturnedReceiptChequeItem_popup_button').attr("disabled", true);
	 		}
	 		else if(state==7 || state==8 || state==10){
	 		  $('#InClearingReceiptChequeItem_popup_button').attr("disabled", true);
	 		  $('#ClearedReceiptChequeItem_popup_button').attr("disabled", true);
	 		  $('#ReturnedReceiptChequeItem_popup_button').attr("disabled", true);
	 		  $('#CashedReceiptChequeItem_popup_button').attr("disabled", true);
	 		  $('#AssignedReceiptChequeItem_popup_button').attr("disabled", true);
	 		  $('#BackReturnedReceiptChequeItem_popup_button').attr("disabled", true);
	 		}
	 		else if(state==9){
	 		  $('#InClearingReceiptChequeItem_popup_button').attr("disabled", false);
	 		  $('#ClearedReceiptChequeItem_popup_button').attr("disabled", true);
	 		  $('#ReturnedReceiptChequeItem_popup_button').attr("disabled", true);
	 		  $('#CashedReceiptChequeItem_popup_button').attr("disabled", true);
	 		  $('#AssignedReceiptChequeItem_popup_button').attr("disabled", true);
	 		  $('#BackReturnedReceiptChequeItem_popup_button').attr("disabled", false);
	 		}
	  }
      function grid_onGoToChequeStateHistory(e){
          	var data = this.dataItem($(e.target).closest("tr"));	  
            window.location.href="${pageContext.request.contextPath}"+"/fnc/treasury/treasuryDocs/chequeStateHistory/loadAndSave/"+'1@'+data.id;
      }
   
</script>

