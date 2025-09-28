
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
	<form class="uk-form" id="mainForm">
	    <div class="uk-grid uk-grid-preserve">
	    		<base:testBox styleClass="small" name="chequeSerial" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.chequeSerial"/>
	   		    <base:testBox styleClass="small" name="bankName" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.bankName"/>
	    </div>
	    <div class="uk-grid uk-grid-preserve">
	       		<base:testBox styleClass="small" name="bankAccountName" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.bankAccountName"/>    
	    </div>
	    <div class="uk-grid uk-grid-preserve">
	     		<base:testBox styleClass="small" name="fromChequePrice" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.fromChequePrice"/>    
	     		<base:testBox styleClass="small" name="toChequePrice" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.toChequePrice"/>    
	            <base:testBox styleClass="verysmall" name="fromBillSerial" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.fromBillSerial"/>    
	     		<base:testBox styleClass="verysmall" name="toBillSerial" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.toBillSerial"/>    
	    </div>
    	<base:my-grid-search isPopup="true"   showMultipleDelete="false" >
		    <base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.chequeType'  field="chequeTypeStr" width="50px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.billSerial'  field="billserial" width="50px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.chequeSerial'  field="serial" width="50px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.billDate'  field="billDate" width="50px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.maturityDate'  field="sarresidDate" width="50px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.chequePrice'  field="receiptChequePrice" width="50px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.bankName'  field="bankName" width="50px"/>
		   	<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.state'  field="chequeStateStr" width="50px"/>
		
	        <base:my-grid-schema-field name="chequeTypeStr" type="string"/>
	        <base:my-grid-schema-field name="billserial" type="long"/>
	        <base:my-grid-schema-field name="serial" type="string"/>
	        <base:my-grid-schema-field name="billDate" type="string"/>
	        <base:my-grid-schema-field name="sarresidDate" type="string"/>
	        <base:my-grid-schema-field name="receiptChequePrice" type="long"/>
		    <base:my-grid-schema-field name="bankName" type="string"/>
		    <base:my-grid-schema-field name="chequeStateStr" type="string"/>
        
		</base:my-grid-search>
</form> 
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
</script>

