<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
	 <form class="uk-form2-CashPermissionPayerItem" >
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="payFrom" comboLoaderUrl="combo/loadPaymentFund" key="com.artonis.fnc.treasury.payment.cashPermissionPayer.payFrom"/>
		</div>

		<div id="cashPermissionPayer-cash" style="display: none">
				<base:accountAndFloatAccountPicker accountCodingFieldName="cashAccountCoding_id" 
					floatAccount1FieldName="cashFloatAccountLevel1_id" floatAccount2FieldName="cashFloatAccountLevel2_id"
					floatAccount3FieldName="cashFloatAccountLevel3_id" floatAccount4FieldName="cashFloatAccountLevel4_id"
					accountCodingFieldKey="com.artonis.fnc.treasury.payment.cashPermissionPayer.cashOriginAccountCoding_id" 
					accountCodingLoadUrl="combo/loadAccountCodingFromCustomizeAccountRel3"/>

			<div class="uk-grid uk-grid-preserve">
				<base:testBoxNumericEx styleClass="small" name="cashPrice" key="com.artonis.fnc.treasury.payment.cashPermissionPayer.cashTransferedPrice"/>
				<base:textArea  name="cashDescription" key="com.artonis.fnc.treasury.payment.cashPermissionPayer.cashTransferedDescription" height="25" />
			</div>
		</div>
		<div id="cashPermissionPayer-bank" style="display: none">
			<div class="uk-grid uk-grid-preserve">
				 <base:comboBoxAutoComplete styleClass="small" name="bankBank_id" key="com.artonis.fnc.treasury.payment.cashPermissionPayer.bankBank_Id" comboLoaderUrl="combo/loadAllBank" dataTextField="name" dataValueField="id" minLength="0"
                   iscomboLoaderUrlRelative="true" hasTemplate="true" headerTemplateComaSep="com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.bank_Id" templateComaSep="name"/>       
		    	<base:cascadeComboBox styleClass="small" selectIndex="0" name="bankBranch_id" key="com.artonis.fnc.treasury.payment.cashPermissionPayer.bankBranch_Id" cascadeCombo="bankBank_id" comboLoaderUrl="combo/loadAllBranch"/>
				<base:cascadeComboBox selectIndex="0" styleClass="small" name="bankBankAccount_id" key="com.artonis.fnc.treasury.payment.cashPermissionPayer.bankBankAccount_Id" cascadeCombo="bankBranch_id" comboLoaderUrl="combo/loadAllBankAccount"/>
			</div>
			<div class="uk-grid uk-grid-preserve">
				<base:cascadeComboBox selectIndex="0" styleClass="small" name="bankChequeBookletNum" key="com.artonis.fnc.treasury.payment.cashPermissionPayer.bankChequeBookletNum" cascadeCombo="bankBankAccount_id" comboLoaderUrl="combo/loadAllChequeBookletNumbers"/>
				<base:cascadeComboBox selectIndex="0" styleClass="small" name="bankChequeBookletItem_id" key="com.artonis.fnc.treasury.payment.cashPermissionPayer.bankChequeBookletItem_Id" cascadeCombo="bankChequeBookletNum" comboLoaderUrl="combo/loadAllChequeSerials"/>
				<base:mDatePicker styleClass="small" name="bankMaturityDate" key="com.artonis.fnc.treasury.payment.cashPermissionPayer.bankMaturityDate"/>
			</div>
			<base:accountAndFloatAccountPicker accountCodingFieldName="bankAccountCoding_id"
					floatAccount1FieldName="bankFloatAccountLevel1_id" floatAccount2FieldName="bankFloatAccountLevel2_id"
					floatAccount3FieldName="bankFloatAccountLevel3_id" floatAccount4FieldName="bankFloatAccountLevel4_id"
					accountCodingFieldKey="com.artonis.fnc.treasury.payment.cashPermissionPayer.bankAccountCoding_Id" 
					accountCodingLoadUrl="combo/loadAccountCodingFromCustomizeAccountRel4" />
			
			<div class="uk-grid uk-grid-preserve">
				<base:testBoxNumericEx styleClass="small" name="bankPrice" key="com.artonis.fnc.treasury.payment.cashPermissionPayer.bankPrice"/>
				<base:textArea  name="bankDescription" key="com.artonis.fnc.treasury.payment.cashPermissionPayer.bankDescription" height="25" />
			</div>
		</div>
	</form>
<script>
	callback_change_payFrom(null);
	function callback_change_payFrom(e){
		if($("#payFrom").val()==1){
			$("#cashPermissionPayer-cash").show();
			$("#CashPermissionPayerItem_cash_div").show();
			$("#cashPermissionPayer-bank").hide();
			$("#CashPermissionPayerItem_bank_div").hide();
		}
		else if($("#payFrom").val()==2){
			$("#cashPermissionPayer-cash").hide();
			$("#CashPermissionPayerItem_cash_div").hide();
			$("#cashPermissionPayer-bank").show();
			$("#CashPermissionPayerItem_bank_div").show();
		}
    }
	function getActiveGridName(){
		if($("#payFrom").val()==1){
			return "CashPermissionPayerItem_cash";
		}
		else if($("#payFrom").val()==2){
			return "CashPermissionPayerItem_bank";
		}
	}
</script>