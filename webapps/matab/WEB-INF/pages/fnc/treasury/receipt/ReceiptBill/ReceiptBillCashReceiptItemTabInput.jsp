<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-ReceiptBillCashReceiptItem" >
	<input type="hidden" id="id" name="id" >
	<div class="uk-grid uk-grid-preserve">
		<base:comboBox name="cashReceiptType" value="name" key="com.artonis.fnc.treasury.receipt.receiptBillCashReceipt.cashReceiptType"
			comboLoaderUrl="combo/loadAllReceiptCashTypes" styleClass="small" />
	</div>
	<base:accountAndFloatAccountPicker accountCodingFieldName="cashReceiptAccountCode_Id"
			floatAccount1FieldName="cashReceiptFloatAccountLevel1_Id" floatAccount2FieldName="cashReceiptFloatAccountLevel2_Id"
			floatAccount3FieldName="cashReceiptFloatAccountLevel3_Id" floatAccount4FieldName="cashReceiptFloatAccountLevel4_Id"
			accountCodingFieldKey="com.artonis.fnc.treasury.receipt.receiptBillCashReceipt.cashReceiptAccountCode_Id"  />	

	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="small" name="cashReceiptPrice" key="com.artonis.fnc.treasury.receipt.receiptBillCashReceipt.cashReceiptPrice"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:textArea  name="cashReceiptDescription" key="com.artonis.fnc.treasury.receipt.receiptBillCashReceipt.cashReceiptDescription" height="25"/>
	</div>
</form>
<script type="text/javascript">
$(document).ready(function(){
	//checkCombo("0");
});
function checkCombo(cashType){
	if(cashType=="1"){
		var newUrl = getBaseUrl() + "combo/loadAccountCodingFromCustomizeAccountRel_BankDraft";
		$('#cashReceiptAccountCode_Id_Comb').data("kendoComboBox").dataSource.transport.options.read.url = newUrl;
	}else if(cashType=="2"){
		var newUrl = getBaseUrl() + "combo/loadAccountCodingFromCustomizeAccountRel_Coffer";
		$('#cashReceiptAccountCode_Id_Comb').data("kendoComboBox").dataSource.transport.options.read.url = newUrl;
	}else{
		var newUrl = getBaseUrl() + "combo/nullString";
		$('#cashReceiptAccountCode_Id_Comb').data("kendoComboBox").dataSource.transport.options.read.url = newUrl;
	}
	$('#cashReceiptAccountCode_Id_Comb').data("kendoComboBox").dataSource.read();
}
function callback_change_cashReceiptType(e){
	var cashType = e.sender._old;
	//checkCombo(cashType);
}
function bindToEntityById_after__cashReceiptType_Comb_doAfterBind(){
	//checkCombo($('#cashReceiptType').val());
}
  function doAfterSave_ReceiptBillCashReceiptItem(){
        bindToEntityById($("#id").val());
    }
</script>
	 