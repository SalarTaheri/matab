<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

	<form class="uk-form2-BackReturnedReceiptChequeItem">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="cheque_Id" name="cheque_Id" >
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="normal" name="bakingDate" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.backReturnedReceiptCheque.bakingDate"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
	   			<base:textArea  name="bakingDescription" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.clearedReceiptCheque.clearedDescription" height="25" />
	    </div>
	</form>

