<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-BankingBillBankAccountItem" >
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox  name="operationType" value="name" key="fnc.treasury.bankingBill.bankingBillBankAccountItem.operationType"
							comboLoaderUrl="combo/loadBankingBillBankAccountOperationType" styleClass="verysmall"/>
			<base:comboBox  name="bankAccount_id" value="name" key="fnc.treasury.bankingBill.bankingBillBankAccountItem.bankAccount"
							comboLoaderUrl="combo/loadAllBankAccount" styleClass="small" minLength="0"/>
		</div>
		<base:accountAndFloatAccountPicker accountCodingFieldName="bankaccountAccountCoding_id"
				floatAccount1FieldName="floatAccountLevel1_id" floatAccount2FieldName="floatAccountLevel2_id"
				floatAccount3FieldName="floatAccountLevel3_id" floatAccount4FieldName="floatAccountLevel4_id"
				accountCodingFieldKey="fnc.treasury.bankingBill.bankingBillBankAccountItem.bankaccountAccountCoding"
				accountCodingLoadUrl="combo/loadAccountCodingFromCustomizeAccountRel"/>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="small" name="price" key="fnc.treasury.bankingBill.bankingBillBankAccountItem.price"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea name="description" key="fnc.treasury.bankingBill.bankingBillBankAccountItem.description" height="25"/>
		</div>
</form>
<script type="text/javascript">
</script>