<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="PaymentBillReceiptChequeItem"/>

<base:my-grid-item name="PaymentBillReceiptChequeItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="paymentBillId">
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeSerial'  field="receiptChequeSerial" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeBankName'  field="bankName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeMaturityDate'  field="sarresidDate" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequePayer'  field="receiptChequePayer" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeAccountCoding_Id'  field="accountCode" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeDescription'  field="receiptChequeDescription" width="50px"/>


        <base:my-grid-schema-field name="receiptChequeSerial" type="string"/>
        <base:my-grid-schema-field name="bankName" type="string"/>
        <base:my-grid-schema-field name="sarresidDate" type="string"/>
        <base:my-grid-schema-field name="receiptChequePayer" type="string"/>
        <base:my-grid-schema-field name="accountCode" type="string"/>
        <base:my-grid-schema-field name="receiptChequeDescription" type="string"/>

</base:my-grid-item>
<base:footer/>