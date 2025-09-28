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
			<base:testBox styleClass="small" name="id" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.id"/>
			<base:testBox styleClass="small" name="serial" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.serial"/>
			<base:testBox styleClass="small" name="bank_Id" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.bank_Id"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="branch_Id" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.branch_Id"/>
			<base:testBox styleClass="small" name="bankAccount_Id" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.bankAccount_Id"/>
			<base:testBox styleClass="small" name="maturityDate" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.maturityDate"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="receiptChequeAccountCode_Id" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.receiptChequeAccountCode_Id"/>
			<base:testBox styleClass="small" name="receiptChequeFloatAccountLevel1_Id" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.receiptChequeFloatAccountLevel1_Id"/>
			<base:testBox styleClass="small" name="receiptChequeFloatAccountLevel2_Id" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.receiptChequeFloatAccountLevel2_Id"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="receiptChequeFloatAccountLevel3_Id" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.receiptChequeFloatAccountLevel3_Id"/>
			<base:testBox styleClass="small" name="receiptChequeFloatAccountLevel4_Id" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.receiptChequeFloatAccountLevel4_Id"/>
			<base:testBox styleClass="small" name="receiptChequePrice" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.receiptChequePrice"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="receiptChequeDescription" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.receiptChequeDescription"/>
			<base:testBox styleClass="small" name="receiptBill_Id" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.receiptBill_Id"/>
	
	</form>
</div>
