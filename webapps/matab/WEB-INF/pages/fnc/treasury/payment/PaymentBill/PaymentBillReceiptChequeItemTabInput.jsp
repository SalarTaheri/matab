<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

  <form class="uk-form2-PaymentBillReceiptChequeItem" >
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
		    <div style="padding-right: 200px">
				<base:selectorPopup formPopup="PaymentBilReceiptChequeItem" disableBackground="true" itemTabName="PaymentBilReceiptChequeItem"
						popupUrl="/fnc/treasury/treasuryDocs/receiptChequePopup/"/>
	    	</div>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="receiptChequeSerial"  key="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeSerial"/>
			<base:testBox styleClass="small" name="bankName"  key="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeBankName"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="sarresidDate"  key="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeMaturityDate"/>
			<base:testBox styleClass="small" name="receiptChequePayer"  key="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequePayer"/>
		</div>
		<base:accountAndFloatAccountPicker accountCodingFieldName="receiptChequeAccountCoding_Id"
				floatAccount1FieldName="receiptChequeFloatAccountLevel1_Id" floatAccount2FieldName="receiptChequeFloatAccountLevel2_Id"
				floatAccount3FieldName="receiptChequeFloatAccountLevel3_Id" floatAccount4FieldName="receiptChequeFloatAccountLevel4_Id"
				accountCodingFieldKey="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeAccountCoding_Id"  />
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="receiptChequePrice" key="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequePrice"/>
	    </div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea  name="receiptChequeDescription"  key="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeDescription" height="25"/>
	    </div>
	</form>

