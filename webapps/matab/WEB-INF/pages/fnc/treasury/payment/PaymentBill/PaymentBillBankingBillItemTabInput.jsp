<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

	 <form class="uk-form2-PaymentBillBankingBillItem" >
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
		<base:comboBox  name="operationType" value="name" key="fnc.treasury.bankingBill.bankingBillBankAccountItem.operationType"
							comboLoaderUrl="combo/loadBankingBillBankAccountOperationType" styleClass="verysmall"/>
		</div>
			<base:accountAndFloatAccountPicker accountCodingFieldName="paymentBankingBillAccountCoding_Id"
				floatAccount1FieldName="paymentBankingBillFloatAccountLevel1_Id" floatAccount2FieldName="paymentBankingBillFloatAccountLevel2_Id"
				floatAccount3FieldName="paymentBankingBillFloatAccountLevel3_Id" floatAccount4FieldName="paymentBankingBillFloatAccountLevel4_Id"
				accountCodingFieldKey="fnc.treasury.bankingBill.bankingBilReceiverPayerItem.payerAccountCoding" />
		
			<base:accountAndFloatAccountPicker accountCodingFieldName="paymentBankAccountAccountCoding_Id"
				floatAccount1FieldName="paymentBankAccounFloatAccountLevel1_Id" floatAccount2FieldName="paymentBankAccounFloatAccountLevel2_Id"
				floatAccount3FieldName="paymentBankAccounFloatAccountLevel3_Id" floatAccount4FieldName="paymentBankAccounFloatAccountLevel4_Id"
				accountCodingFieldKey="fnc.treasury.bankingBill.bankingBillBankAccountItem.bankaccountAccountCoding"/>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="small" name="paymentBankingBillPrice" key="fnc.treasury.bankingBill.bankingBillBankAccountItem.price"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea name="paymentBankingBillDescription" key="fnc.treasury.bankingBill.bankingBillBankAccountItem.description" height="25"/>
		</div>
		
	
	
	</form>
	<script type="text/javascript">
    function doAfterSave_PaymentBillBankingBillItem(){
        bindToEntityById($("#id").val());
    }

</script>
