<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<form class="uk-form2-PaymentBillCofferItem" >
	<input type="hidden" id="id" name="id" >
	
	<base:accountAndFloatAccountPicker accountCodingFieldName="accountCoding_Id"
			floatAccount1FieldName="floataccountLevel1_Id" floatAccount2FieldName="floataccountLevel2_Id"
			floatAccount3FieldName="floataccountLevel3_Id" floatAccount4FieldName="floataccountLevel4_Id"
			accountCodingFieldKey="com.artonis.fnc.treasury.payment.paymentBillCoffer.accountCoding_id" 
			/>

	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="small" name="price" key="com.artonis.fnc.treasury.payment.paymentBillCoffer.price"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:textArea name="description" key="com.artonis.fnc.treasury.payment.paymentBillCoffer.description" height="25"> </base:textArea>
	</div>
</form>

<script type="text/javascript">
    function doAfterSave_PaymentBillCofferItem(){
        bindToEntityById($("#id").val());
    }
</script>