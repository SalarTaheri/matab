
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="ReceiptBillReceiptChequeItem"/>


<base:my-grid-item name="ReceiptBillReceiptChequeItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="receiptBill_Id">
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillReceiptCheque.serial'  field="chequeSerial" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillReceiptCheque.bank_Id'  field="bankName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillReceiptCheque.maturityDate'  field="maturityDate" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillReceiptCheque.receiptChequeAccountCode_Id'  field="receiptChequeAccountCodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBillReceiptCheque.receiptChequePrice'  field="receiptChequePrice" width="50px"/>


        <base:my-grid-schema-field name="chequeSerial" type="string"/>
        <base:my-grid-schema-field name="bankName" type="string"/>
        <base:my-grid-schema-field name="maturityDate" type="string"/>
        <base:my-grid-schema-field name="receiptChequeAccountCodeName" type="string"/>
        <base:my-grid-schema-field name="receiptChequePrice" type="long"/>
</base:my-grid-item>
<base:footer/>
