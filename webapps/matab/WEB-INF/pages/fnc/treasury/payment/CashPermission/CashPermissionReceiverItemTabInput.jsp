<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
	 <form class="uk-form2-CashPermissionReceiverItem" >
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:suggest styleClass="small" suggestLoaderController="suggest/loadAllCashRequest" tagNames="cashPermissionReceiverSerial,date,description,price" fieldNames="id,registerDate,description,amount" name="cashPermissionReceiverSerial" key="com.artonis.fnc.treasury.payment.cashPermissionReceiver.serial"/>
			<base:mDatePicker styleClass="small" name="date" key="com.artonis.fnc.treasury.payment.cashPermissionReceiver.date" disabled="true"/>
		</div>
		<base:accountAndFloatAccountPicker accountCodingFieldName="receiverAccountCoding_id" 
					floatAccount1FieldName="receiverFloatAccountLevel1_id" floatAccount2FieldName="receiverFloatAccountLevel2_id"
					floatAccount3FieldName="receiverFloatAccountLevel3_id" floatAccount4FieldName="receiverFloatAccountLevel4_id"
					accountCodingFieldKey="com.artonis.fnc.treasury.payment.cashPermissionReceiver.receiverAccountCoding_id" 
					accountCodingLoadUrl="combo/loadAccountCodingFromCustomizeAccountRel3"/>

		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="price" key="com.artonis.fnc.treasury.payment.cashPermissionReceiver.price" disabled="true"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea name="description" key="com.artonis.fnc.treasury.payment.cashPermissionReceiver.description" height="25" disabled="true"/>
		</div>
	</form>
