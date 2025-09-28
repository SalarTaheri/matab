<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


 <form class="uk-form2-PaymentBillPaymentChequeItem" >
	<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			 <base:comboBoxAutoComplete name="bank_Id" styleClass="small" key="com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.bank_Id" comboLoaderUrl="combo/loadAllBank" dataTextField="name" dataValueField="id" minLength="0"
                   iscomboLoaderUrlRelative="true" hasTemplate="true" headerTemplateComaSep="com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.bank_Id" templateComaSep="name"/>       
		
		    <base:cascadeComboBox selectIndex="0" styleClass="small" name="branch_Id" key="com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.branch_Id" cascadeCombo="bank_Id" comboLoaderUrl="combo/loadAllBranch"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
		    <base:cascadeComboBox selectIndex="0" styleClass="small" name="bankAccount_Id" key="com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.bankAccount_Id" cascadeCombo="branch_Id" comboLoaderUrl="combo/loadAllBankAccount"/>
		    <base:cascadeComboBox selectIndex="0" styleClass="small" name="chequeBookletNum" key="com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.chequeBookletNum" cascadeCombo="bankAccount_Id" comboLoaderUrl="combo/loadAllChequeBookletNumbers"/>
		
		</div>
		   <div class="uk-grid uk-grid-preserve">
		   	<base:cascadeComboBox selectIndex="0" styleClass="small" name="chequeBookletItem_Id" key="com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.chequeSerial" cascadeCombo="chequeBookletNum" comboLoaderUrl="combo/loadAllChequeSerials"/>
			<base:mDatePicker styleClass="small" name="maturityDate" key="com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.maturityDate"/>			
			</div>
			<base:accountAndFloatAccountPicker accountCodingFieldName="paymentChequeAccountCoding_Id"
					floatAccount1FieldName="paymentChequeFloatAccountLevel1_Id" floatAccount2FieldName="paymentChequeFloatAccountLevel2_Id"
					floatAccount3FieldName="paymentChequeFloatAccountLevel3_Id" floatAccount4FieldName="paymentChequeFloatAccountLevel4_Id"
					accountCodingFieldKey="com.artonis.fnc.treasury.payment.paymentBillCoffer.accountCoding_id" 
					 />
	
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="small" name="paymentChequePrice" key="com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.price"/>
	    </div>
   		<div class="uk-grid uk-grid-preserve">  
   			<base:textArea  name="paymentChequeDescription" key="com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.description" height="25" />
	    </div>
	</form>
<script type="text/javascript">
    function doAfterSave_PaymentBillPaymentChequeItem(){
        bindToEntityById($("#id").val());
    }

</script>
