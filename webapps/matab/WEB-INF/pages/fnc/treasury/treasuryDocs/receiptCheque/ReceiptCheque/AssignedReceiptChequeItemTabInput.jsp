<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


	<form class="uk-form2-AssignedReceiptChequeItem">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="cheque_Id" name="cheque_Id" >
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="small" name="assignedDate" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.assignedReceiptCheque.assignedDate"/>
			<base:testBox styleClass="small" disabled="true"  dataIgnore="true" name="chequeSerial" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.passedPaymentCheque.chequeSerial"/>			
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="normal" disabled="true" dataIgnore="true" name="bankAccountName" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.passedPaymentCheque.bankAccount_Id"/>
		</div>
		<base:accountAndFloatAccountPicker accountCodingFieldName="assignedAccountCoding_id"
				floatAccount1FieldName="assignedFloatAccountLevel1_Id" floatAccount2FieldName="assignedFloatAccountLevel2_Id"
				floatAccount3FieldName="assignedFloatAccountLevel3_Id" floatAccount4FieldName="assignedFloatAccountLevel4_Id"
				accountCodingFieldKey="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.assignedReceiptCheque.accountcoding_id"  />
	
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" dataIgnore="ture" disabled="true" name="price" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.clearedReceiptCheque.clearedPrice"/>
	   </div>
	   <div class="uk-grid uk-grid-preserve">
	   			<base:textArea  name="assignedDescription" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.clearedReceiptCheque.clearedDescription" height="25" />
	   </div>
	</form>

