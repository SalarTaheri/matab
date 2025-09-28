<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="id" key="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.id"/>
			<base:testBox styleClass="small" name="receiptChequeSerial" key="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeSerial"/>
			<base:testBox styleClass="small" name="receiptChequeBankName" key="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeBankName"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="receiptChequeMaturityDate" key="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeMaturityDate"/>
			<base:testBox styleClass="small" name="receiptChequePayer" key="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequePayer"/>
			<base:testBox styleClass="small" name="receiptChequeAccountCoding_Id" key="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeAccountCoding_Id"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="receiptChequeFloatAccountLevel1_Id" key="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeFloatAccountLevel1_Id"/>
			<base:testBox styleClass="small" name="receiptChequeFloatAccountLevel2_Id" key="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeFloatAccountLevel2_Id"/>
			<base:testBox styleClass="small" name="receiptChequePrice" key="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequePrice"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="receiptChequeDescription" key="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeDescription"/>
			<base:testBox styleClass="small" name="paymentBillId" key="com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.paymentBillId"/>
	
	</form>
</div>
