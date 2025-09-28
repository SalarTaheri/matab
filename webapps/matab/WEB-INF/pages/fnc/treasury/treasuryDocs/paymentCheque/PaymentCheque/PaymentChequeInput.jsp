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
			<base:testBox styleClass="small" name="id" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.id"/>
			<base:testBox styleClass="small" name="bank_Id" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.bank_Id"/>
			<base:testBox styleClass="small" name="branch_Id" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.branch_Id"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="bankAccount_Id" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.bankAccount_Id"/>
			<base:testBox styleClass="small" name="chequeBookletNum" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.chequeBookletNum"/>
			<base:testBox styleClass="small" name="maturityDate" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.maturityDate"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="accountCoding_Id" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.accountCoding_Id"/>
			<base:testBox styleClass="small" name="floatAccountLevel1_Id" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.floatAccountLevel1_Id"/>
			<base:testBox styleClass="small" name="floatAccountLevel2_Id" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.floatAccountLevel2_Id"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="floatAccountLevel3_Id" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.floatAccountLevel3_Id"/>
			<base:testBox styleClass="small" name="floatAccountLevel4_Id" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.floatAccountLevel4_Id"/>
			<base:testBox styleClass="small" name="price" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.price"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="description" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.description"/>
			<base:testBox styleClass="small" name="paymentBillId" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.paymentBillId"/>
			<base:testBox styleClass="small" name="chequeBookletItem_Id" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.chequeBookletItem_Id"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="type" key="com.artonis.fnc.treasury.treasuryDocs.paymentCheque.paymentCheque.type"/>
	
	</form>
</div>
