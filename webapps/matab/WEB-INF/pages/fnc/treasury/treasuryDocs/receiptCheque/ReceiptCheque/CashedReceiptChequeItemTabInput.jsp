<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
	<form class="uk-form2-CashedReceiptChequeItem">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="cheque_Id" name="cheque_Id" >
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="small" name="cashedDate" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.cashedReceiptCheque.cashedDate"/>
			<base:testBox styleClass="small" disabled="true"  dataIgnore="true" name="chequeSerial" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.passedPaymentCheque.chequeSerial"/>		
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="normal" disabled="true" dataIgnore="true" name="bankAccountName" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.passedPaymentCheque.bankAccount_Id"/>
		</div>
		<base:accountAndFloatAccountPicker accountCodingFieldName="cashedAccountCoding_Id"
				floatAccount1FieldName="cashedFloatAccountLevel1_Id" floatAccount2FieldName="cashedFloatAccountLevel2_Id"
				floatAccount3FieldName="cashedFloatAccountLevel3_Id" floatAccount4FieldName="cashedFloatAccountLevel4_Id"
				accountCodingFieldKey="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.passedPaymentCheque.accountCoding_Id"  />
		<div class="uk-grid uk-grid-preserve">	
				<base:testBoxNumericEx styleClass="small"  disabled="true" dataIgnore="true" name="price" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.cashedReceiptCheque.cashedPrice"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea  name="cashedDescription" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.cashedReceiptCheque.cashedDescription"/>
	   </div>
	</form>

