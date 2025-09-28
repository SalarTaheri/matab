<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

		<form class="uk-form2-GroupClearedReceiptChequeItem">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="cheque_Ids" name="cheque_Ids" >
					<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="small" name="clearedDate" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.clearedReceiptCheque.clearedDate"/>		
		</div>
		<div class="uk-grid uk-grid-preserve">
					<base:comboBox  name="clearedBankAccount_Id" value="name" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.cashedReceiptCheque.cashedBankAccount_Id"
							comboLoaderUrl="combo/loadAllBankAccount" styleClass="normal"/>		
		</div>
		<base:accountAndFloatAccountPicker accountCodingFieldName="clearedAccountCoding_Id"
				floatAccount1FieldName="clearedFloatAccountLevel1_Id" floatAccount2FieldName="clearedFloatAccountLevel2_Id"
				floatAccount3FieldName="clearedFloatAccountLevel3_Id" floatAccount4FieldName="clearedFloatAccountLevel4_Id"
				accountCodingFieldKey="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.passedPaymentCheque.accountCoding_Id"  />
       <div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="small" dataIgnore="ture" disabled="true" name="price" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.clearedReceiptCheque.clearedPrice"/>
	   </div>
	 	<div class="uk-grid uk-grid-preserve">
			<base:textArea  name="clearedDescription" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.clearedReceiptCheque.clearedDescription" height="25"/>
	   </div>
	</form>
