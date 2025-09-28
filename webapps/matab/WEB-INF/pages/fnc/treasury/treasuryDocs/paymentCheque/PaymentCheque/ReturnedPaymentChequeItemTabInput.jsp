<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

	<form class="uk-form2-ReturnedPaymentChequeItem" >
		<input type="hidden" id="id" name="id" >
		 <input type="hidden" id="cheque_Id" name="cheque_Id" >
		<div class="uk-grid uk-grid-preserve" >
			<base:mDatePicker styleClass="normal" styledivLabel="width:21%" name="returnedDate" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.returnedPaymentCheque.returnedDate"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea  name="returnedDescription" styledivLabel="width:21%" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.returnedPaymentCheque.returnedDescription" width="300" height="50"/>
        </div>	
	</form>

