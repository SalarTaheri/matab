
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="CashPermissionReceiverItem"/>
<base:my-grid-item name="CashPermissionReceiverItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="cashPermission_id">
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionReceiver.serial'  field="cashPermissionReceiverSerial" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionReceiver.date'  field="date" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionReceiver.receiverAccountCoding_id'  field="accountCodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionReceiver.receiverFloatAccountLevel1_id'  field="floatAccount1CodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionReceiver.receiverFloatAccountLevel2_id'  field="floatAccount2CodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionReceiver.receiverFloatAccountLevel3_id'  field="floatAccount3CodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionReceiver.receiverFloatAccountLevel4_id'  field="floatAccount4CodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionReceiver.price'  field="price" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionReceiver.description'  field="description" width="50px"/>

    <base:my-grid-schema-field name="cashPermissionReceiverSerial" type="string"/>
    <base:my-grid-schema-field name="date" type="string"/>
    <base:my-grid-schema-field name="accountCodeName" type="string"/>
    <base:my-grid-schema-field name="floatAccount1CodeName" type="string"/>
    <base:my-grid-schema-field name="floatAccount2CodeName" type="string"/>
    <base:my-grid-schema-field name="floatAccount3CodeName" type="string"/>
    <base:my-grid-schema-field name="floatAccount4CodeName" type="string"/>
    <base:my-grid-schema-field name="price" type="string"/>
    <base:my-grid-schema-field name="description" type="string"/>
</base:my-grid-item>
<base:footer/>
