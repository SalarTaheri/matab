<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-BankingBilReceiverPayerItem">
		<input  type="hidden" id="id" name="id" >
		<base:accountAndFloatAccountPicker accountCodingFieldName="recepayerAccountCoding_id"
				floatAccount1FieldName="floataccountLevel1_id" floatAccount2FieldName="floataccountLevel2_id"
				floatAccount3FieldName="floataccountLevel3_id" floatAccount4FieldName="floataccountLevel4_id"
				accountCodingFieldKey="fnc.treasury.bankingBill.bankingBilReceiverPayerItem.recepayerAccountCoding" />
</form>

<script type="text/javascript">
</script>

