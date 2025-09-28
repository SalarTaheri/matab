<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
    <form class="uk-form2-PaymentBillReceiverItem" >
		<input type="hidden" id="id" name="id" >
			<base:accountAndFloatAccountPicker accountCodingFieldName="receiverAccountCodingId"
					floatAccount1FieldName="accountLevel1Id" floatAccount2FieldName="accountLevel2Id"
					floatAccount3FieldName="accountLevel3Id" floatAccount4FieldName="accountLevel4Id"
					accountCodingFieldKey="com.artonis.fnc.treasury.payment.paymentBillCoffer.accountCoding_id"  />
		<div class="uk-grid uk-grid-preserve">
			 <base:testBoxNumericEx styleClass="small" name="receiverPrice" key="com.artonis.fnc.treasury.payment.paymentBillReceiver.price"/>
	    </div>	
	    <div class="uk-grid uk-grid-preserve">
	    	 <base:textArea  name="receiverDescription" key="com.artonis.fnc.treasury.payment.paymentBillReceiver.description" height="25"/>
	    </div>			         
	</form>
