
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="ReceiptBillCashReceiptItem"/>


<base:my-grid-item name="ReceiptBillCashReceiptItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="receiptBill_Id">
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillCashReceipt.cashReceiptAccountCode_Id'  field="receiptCashAccountCodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillCashReceipt.cashReceiptFloatAccountLevel1_Id'  field="receiptCashFloatAccountLevel1CodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillCashReceipt.cashReceiptFloatAccountLevel2_Id'  field="receiptCashFloatAccountLevel2CodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillCashReceipt.cashReceiptFloatAccountLevel3_Id'  field="receiptCashFloatAccountLevel3CodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillCashReceipt.cashReceiptFloatAccountLevel4_Id'  field="receiptCashFloatAccountLevel4CodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillCashReceipt.cashReceiptPrice'  field="cashReceiptPrice" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillCashReceipt.cashReceiptDescription'  field="cashReceiptDescription" width="50px"/>


        <base:my-grid-schema-field name="receiptCashAccountCodeName" type="string"/>
        <base:my-grid-schema-field name="receiptCashFloatAccountLevel1CodeName" type="string"/>
        <base:my-grid-schema-field name="receiptCashFloatAccountLevel2CodeName" type="string"/>
        <base:my-grid-schema-field name="receiptCashFloatAccountLevel3CodeName" type="string"/>
        <base:my-grid-schema-field name="receiptCashFloatAccountLevel4CodeName" type="string"/>
        <base:my-grid-schema-field name="cashReceiptPrice" type="long"/>
        <base:my-grid-schema-field name="cashReceiptDescription" type="string"/>
</base:my-grid-item>
<base:footer/>
