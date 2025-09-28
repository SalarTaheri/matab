<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
	 <form class="uk-form2-ReceiptBillBankingBillItem" >
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
		<base:comboBox  name="operationType" value="name" key="fnc.treasury.bankingBill.bankingBillBankAccountItem.operationType"
							comboLoaderUrl="combo/loadBankingBillBankAccountOperationType" styleClass="verysmall"/>
		</div>
			<base:accountAndFloatAccountPicker accountCodingFieldName="receiptBankingBillAccountCoding_Id"
				floatAccount1FieldName="receiptBankingBillFloatAccountLevel1_Id" floatAccount2FieldName="receiptBankingBillFloatAccountLevel2_Id"
				floatAccount3FieldName="receiptBankingBillFloatAccountLevel3_Id" floatAccount4FieldName="receiptBankingBillFloatAccountLevel4_Id"
				accountCodingFieldKey="fnc.treasury.bankingBill.bankingBilReceiverPayerItem.receiverAccountCoding" />
		
			<base:accountAndFloatAccountPicker accountCodingFieldName="receiptBankAccountAccountCoding_Id"
				floatAccount1FieldName="receiptBankAccounFloatAccountLevel1_Id" floatAccount2FieldName="receiptBankAccounFloatAccountLevel2_Id"
				floatAccount3FieldName="receiptBankAccounFloatAccountLevel3_Id" floatAccount4FieldName="receiptBankAccounFloatAccountLevel4_Id"
				accountCodingFieldKey="fnc.treasury.bankingBill.bankingBillBankAccountItem.bankaccountAccountCoding"
				/>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="small" name="receiptBankingBillPrice" key="fnc.treasury.bankingBill.bankingBillBankAccountItem.price"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea name="receiptBankingBillDescription" key="fnc.treasury.bankingBill.bankingBillBankAccountItem.description" height="25"/>
		</div>
	</form>
	<script type="text/javascript">
	  function doAfterSave_ReceiptBillBankingBillItem(){
        bindToEntityById($("#id").val());
    }
    </script>
