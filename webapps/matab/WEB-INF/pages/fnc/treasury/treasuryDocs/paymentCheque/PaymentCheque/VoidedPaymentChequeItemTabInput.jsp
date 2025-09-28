<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
	<form class="uk-form-VoidedPaymentChequeItem">
	  <input type="hidden" id="cheque_Id" name="cheque_Id" >
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
		    <base:mDatePicker styleClass="normal" name="voidedDate" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.VoidedPaymentCheque.voidedDate"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea  name="voidedDescription" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.VoidedPaymentCheque.voidedDescription" height="25"/>
		</div>
		
	</form>

