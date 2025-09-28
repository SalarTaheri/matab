<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>
<input name="loadedId" type="hidden" id="loadedId" />

<div id="header-toolbar" align="right">
		<base:buttonPermission key="fnc.treasury.bankingBill.bankingBill.btn.new" classNames="uk-button" id="bankingBillInput-new-btn" onClick="javascript:reload()"/>
		<base:buttonPermission key="fnc.treasury.bankingBill.bankingBill.btn.memo" classNames="uk-button" id="bankingBillInput-memo-btn" onClick="javascript:saveBankingBill()"/>
		<base:buttonPermission key="fnc.treasury.bankingBill.bankingBill.btn.register" classNames="uk-button" id="bankingBillInput-register-btn" />
		<base:buttonPermission key="fnc.treasury.bankingBill.bankingBill.btn.view" classNames="uk-button" id="bankingBillInput-view-btn" onClick="javascript:goToView()"/>
		<base:buttonPermission key="fnc.treasury.bankingBill.bankingBill.btn.back" classNames="uk-button" id="bankingBillInput-back-btn" onClick="javascript:unlockTab('BankingBillBankAccountItem')"/>
		<base:buttonPermission key="fnc.treasury.bankingBill.bankingBill.btn.print" classNames="uk-button" id="bankingBillInput-print-btn" onClick="javascript:lockTab('BankingBillBankAccountItem')"/>
</div>

<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="state" name="state" >
		
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox  name="type" value="name" key="fnc.treasury.bankingBill.bankingBill.type" comboLoaderUrl="combo/loadAllType" styleClass="verysmall"/>
			<base:mDatePicker styleClass="verysmall" name="date" key="fnc.treasury.bankingBill.bankingBill.date"/>
			<base:testBox styleClass="verysmall" name="serial" key="fnc.treasury.bankingBill.bankingBill.serial"/>
			<base:testBox styleClass="verysmall" name="stateText" key="fnc.treasury.bankingBill.bankingBill.state" disabled="true"/>
		</div>
	</form>
	<base:itemForm titleKeys="fnc.treasury.bankingBill.bankingBill.ReceiverPayer,fnc.treasury.bankingBill.bankingBill.BankAccount"  masterIdStr="bankingbill_id" insertWithoutPopup="true"
					formItemTabViewJspFiles="BankingBilReceiverPayerItemTabView.jsp,BankingBillBankAccountItemTabView.jsp"
					formItemTabInputs="BankingBilReceiverPayerItemTabInput,BankingBillBankAccountItemTabInput"/> 
</div>
<script type="text/javascript">
$(document).ready(function(){
});
function saveBankingBill(){
	save();
}
function goToView(){
	window.location = "${pageContext.request.contextPath}"+"/fnc/treasury/bankingBill/bankingBill/";
}
function doAfterSave_BankingBilReceiverPayerItem(){
	reloadMaster();
}
</script>