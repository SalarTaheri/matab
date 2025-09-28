
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="ReceiptBillPayerItem"/>


<base:my-grid-item name="ReceiptBillPayerItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="receiptBill_Id">

	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillPayer.payerAccountCoding_Id'  field="payerAccountCodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillPayer.payerFloatAccountLevel1_Id'  field="payerAccountLevel1CodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillPayer.payerFloatAccountLevel2_Id'  field="payerAccountLevel2CodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillPayer.payerFloatAccountLevel3_Id'  field="payerAccountLevel3CodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillPayer.payerFloatAccountLevel4_Id'  field="payerAccountLevel4CodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillPayer.payerPrice'  field="payerPrice" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillPayer.payerDescription'  field="payerDescription" width="50px"/>


        <base:my-grid-schema-field name="payerAccountCodeName" type="string"/>
        <base:my-grid-schema-field name="payerAccountLevel1CodeName" type="string"/>
        <base:my-grid-schema-field name="payerAccountLevel2CodeName" type="string"/>
        <base:my-grid-schema-field name="payerAccountLevel3CodeName" type="string"/>
        <base:my-grid-schema-field name="payerAccountLevel4CodeName" type="string"/>
        <base:my-grid-schema-field name="payerPrice" type="long"/>
        <base:my-grid-schema-field name="payerDescription" type="string"/>
</base:my-grid-item>
<base:footer/>
