
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="PaymentBillTransferedCashItem"/>

<base:my-grid-item name="PaymentBillTransferedCashItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="paymentBillId">
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillTransferedCash.originAccountCoding_Id'  field="originAccountCodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillTransferedCash.originFloatAccountLevel1_Id'  field="originFloatAccountCodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillTransferedCash.destinationAccountCoding_Id'  field="destAccountCodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillTransferedCash.destinationFloatAccountLevel1_Id'  field="destFloatAccountCodename" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillTransferedCash.transferedPrice'  field="transferedPrice" width="50px"/>


        <base:my-grid-schema-field name="originAccountCodeName" type="string"/>
        <base:my-grid-schema-field name="originFloatAccountCodeName" type="string"/>
        <base:my-grid-schema-field name="destAccountCodeName" type="string"/>
        <base:my-grid-schema-field name="destFloatAccountCodeName" type="string"/>
        <base:my-grid-schema-field name="transferedPrice" type="long"/>
</base:my-grid-item>
<base:footer/>

<script type="text/javascript">
    function doAfterRemove_PaymentBillTransferedCashItem(){
        bindToEntityById($("#id").val());
    }
</script>
