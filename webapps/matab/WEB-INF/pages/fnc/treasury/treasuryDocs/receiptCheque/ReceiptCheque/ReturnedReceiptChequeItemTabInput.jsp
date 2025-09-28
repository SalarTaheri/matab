<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


	<form class="uk-form2-ReturnedReceiptChequeItem">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="cheque_Id" name="cheque_Id" >
	
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="small" name="returnedDate" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.returnedReceiptCheque.returnedDate"/>
			<base:testBox styleClass="small" disabled="true"  dataIgnore="true" name="chequeSerial" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.passedPaymentCheque.chequeSerial"/>			
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="normal" disabled="true" dataIgnore="true" name="bankAccountName" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.passedPaymentCheque.bankAccount_Id"/>
		</div>
		<base:accountAndFloatAccountPicker accountCodingFieldName="returnedAccountCoding_Id"
				floatAccount1FieldName="returnedFloatAccountLevel1_Id" floatAccount2FieldName="returnedFloatAccountLevel2_Id"
				floatAccount3FieldName="returnedFloatAccountLevel3_Id" floatAccount4FieldName="returnedFloatAccountLevel4_Id"
				accountCodingFieldKey="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.passedPaymentCheque.accountCoding_Id"  />
	
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" dataIgnore="ture" disabled="true" name="price" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.clearedReceiptCheque.clearedPrice"/>
	   </div>
	   <div class="uk-grid uk-grid-preserve">
	   			<base:textArea  name="returnedDescription" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.clearedReceiptCheque.clearedDescription" height="25" />
	   </div>
	</form>

