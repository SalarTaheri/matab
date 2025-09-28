<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


    <form class="uk-form2-PaymentBillTransferedCashItem" >		
   <input type="hidden" id="id" name="id" >
   
	    <base:accountAndFloatAccountPicker accountCodingFieldName="originAccountCoding_Id"
					floatAccount1FieldName="originFloatAccountLevel1_Id" floatAccount2FieldName="originFloatAccountLevel2_Id"
					floatAccount3FieldName="originFloatAccountLevel3_Id" floatAccount4FieldName="originFloatAccountLevel4_Id"
					accountCodingFieldKey="com.artonis.fnc.treasury.payment.paymentBillTransferedCash.originAccountCoding_Id" 
					/>
	
		<base:accountAndFloatAccountPicker accountCodingFieldName="destinationAccountCoding_Id"
					floatAccount1FieldName="destinationFloatAccountLevel1_Id" floatAccount2FieldName="destinationFloatAccountLevel2_Id"
					floatAccount3FieldName="destinationFloatAccountLevel3_Id" floatAccount4FieldName="destinationFloatAccountLevel4_Id"
					accountCodingFieldKey="com.artonis.fnc.treasury.payment.paymentBillTransferedCash.destinationAccountCoding_Id" 
					 />
	
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="small" name="transferedPrice" key="com.artonis.fnc.treasury.payment.paymentBillTransferedCash.transferedPrice"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea name="transferedDescription" key="com.artonis.fnc.treasury.payment.paymentBillTransferedCash.transferedDescription" height="25"> </base:textArea>
	</div>
	</form>

<script type="text/javascript">
    function doAfterSave_PaymentBillTransferedCashItem(){
        bindToEntityById($("#id").val());
    }

</script>
