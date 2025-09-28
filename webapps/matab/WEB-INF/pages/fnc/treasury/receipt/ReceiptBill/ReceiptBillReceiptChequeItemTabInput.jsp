<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

   <form class="uk-form2-ReceiptBillReceiptChequeItem" >
				<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="chequeSerial" key="com.artonis.fnc.treasury.receipt.receiptBillReceiptCheque.serial"/>
			<base:testBox styleClass="small" name="bankName" key="com.artonis.fnc.treasury.receipt.receiptBillReceiptCheque.bank_Id"/>
			</div>
		<div class="uk-grid uk-grid-preserve">
		    <base:testBox styleClass="small" name="branchName" key="com.artonis.fnc.treasury.receipt.receiptBillReceiptCheque.branch_Id"/>
			<base:testBox styleClass="small" name="bankAccountName" key="com.artonis.fnc.treasury.receipt.receiptBillReceiptCheque.bankAccount_Id"/>	
		</div>
		<base:accountAndFloatAccountPicker accountCodingFieldName="receiptChequeAccountCode_Id"
				floatAccount1FieldName="receiptChequeFloatAccountLevel1_Id" floatAccount2FieldName="receiptChequeFloatAccountLevel2_Id"
				floatAccount3FieldName="receiptChequeFloatAccountLevel3_Id" floatAccount4FieldName="receiptChequeFloatAccountLevel4_Id"
				accountCodingFieldKey="com.artonis.fnc.treasury.receipt.receiptBillReceiptCheque.receiptChequeAccountCode_Id" 
				/>
	
		<div class="uk-grid uk-grid-preserve">		
			<base:testBoxNumericEx styleClass="small" name="receiptChequePrice" key="com.artonis.fnc.treasury.receipt.receiptBillReceiptCheque.receiptChequePrice"/>
			<base:mDatePicker styleClass="small" name="maturityDate" key="com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.maturityDate"/>			
		
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea  name="receiptChequeDescription" key="com.artonis.fnc.treasury.receipt.receiptBillReceiptCheque.receiptChequeDescription" height="25"/>
	   </div>
     </form>
     <script type="text/javascript">
    function doAfterSave_ReceiptBillReceiptChequeItem(){
        bindToEntityById($("#id").val());
    }

</script>
     