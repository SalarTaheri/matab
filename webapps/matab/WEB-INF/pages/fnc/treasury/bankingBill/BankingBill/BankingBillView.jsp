<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=ResourceBoundleHolder.resourceBundle.getString("fnc.treasury.bankingBill.bankingBill.view")%></span></li>
	</ul>
</div>
<div class="uk-container uk-container-center my-uk-container">
    <form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox  name="type" value="name" key="fnc.treasury.bankingBill.bankingBill.type" comboLoaderUrl="combo/loadAllType" styleClass="verysmall"/>
			<base:mDatePicker styleClass="verysmall" name="date" key="fnc.treasury.bankingBill.bankingBill.date"/>
			<base:testBox styleClass="verysmall" name="serial" key="fnc.treasury.bankingBill.bankingBill.serial"/>
			<base:comboBox  name="state" value="name" key="fnc.treasury.bankingBill.bankingBill.state" comboLoaderUrl="combo/loadAllState" styleClass="verysmall"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="recepayerAccountCoding_id" value="name" key="fnc.treasury.bankingBill.bankingBilReceiverPayerItem.recepayerAccountCoding"
							comboLoaderUrl="combo/loadAllAccount" styleClass="verysmall" minLength="0"/>
			<base:comboBox  name="operationType" value="name" key="fnc.treasury.bankingBill.bankingBillBankAccountItem.operationType"
							comboLoaderUrl="combo/loadBankingBillBankAccountOperationType" styleClass="verysmall"/>
			<base:comboBox  name="bankAccount_id" value="name" key="fnc.treasury.bankingBill.bankingBillBankAccountItem.bankAccount"
							comboLoaderUrl="combo/loadAllBankAccount" styleClass="verysmall"/>
			<base:comboBox name="bankaccountAccountCoding_id" value="name" key="fnc.treasury.bankingBill.bankingBillBankAccountItem.bankaccountAccountCoding"
							comboLoaderUrl="combo/loadAllAccount" styleClass="verysmall" minLength="0"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="verysmall" name="fromPrice" key="fnc.treasury.bankingBill.bankingBillBankAccountItem.price.from"/>
			<base:testBox styleClass="verysmall" name="toPrice" key="fnc.treasury.bankingBill.bankingBillBankAccountItem.price.to"/>
		</div>
		<base:my-grid-search>
			<base:my-grid-column title='fnc.treasury.bankingBill.bankingBill.type'  field="typeText" width="50px"/>
			<base:my-grid-column title='fnc.treasury.bankingBill.bankingBill.date'  field="date" width="50px"/>
			<base:my-grid-column title='fnc.treasury.bankingBill.bankingBill.serial'  field="serial" width="50px"/>
			<base:my-grid-column title='fnc.treasury.bankingBill.bankingBill.state'  field="stateText" width="50px"/>
		
	        <base:my-grid-schema-field name="typeText" type="string"/>
	        <base:my-grid-schema-field name="date" type="string"/>
	        <base:my-grid-schema-field name="serial" type="string"/>
	        <base:my-grid-schema-field name="stateText" type="string"/>
		</base:my-grid-search>
	</form>
</div>
<base:footer/>
<script>
function getSearchObject(){
		var bbVar = {};
		bbVar.type = $("#type").val();
		bbVar.date = $("#date").val();
		bbVar.serial = $("#serial").val();
		bbVar.state = $("#state").val();
		bbVar.recepayerAccountCoding_id = $("#recepayerAccountCoding_id").val();
		bbVar.operationType = $("#operationType").val();
		bbVar.bankAccount_id = $("#bankAccount_id").val();
		bbVar.bankaccountAccountCoding_id = $("#bankaccountAccountCoding_id").val();
		bbVar.fromPrice = $("#fromPrice").val();
		bbVar.toPrice = $("#toPrice").val();
		return bbVar;
}
</script>