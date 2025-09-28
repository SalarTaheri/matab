
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeSerial'  field="receiptChequeSerial" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeBankName'  field="receiptChequeBankName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeMaturityDate'  field="receiptChequeMaturityDate" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequePayer'  field="receiptChequePayer" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeAccountCoding_Id'  field="receiptChequeAccountCoding_Id" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeFloatAccountLevel1_Id'  field="receiptChequeFloatAccountLevel1_Id" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeFloatAccountLevel2_Id'  field="receiptChequeFloatAccountLevel2_Id" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequePrice'  field="receiptChequePrice" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.receiptChequeDescription'  field="receiptChequeDescription" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiptCheque.paymentBillId'  field="paymentBillId" width="50px"/>


        <base:my-grid-schema-field name="receiptChequeSerial" type="string"/>
        <base:my-grid-schema-field name="receiptChequeBankName" type="string"/>
        <base:my-grid-schema-field name="receiptChequeMaturityDate" type="string"/>
        <base:my-grid-schema-field name="receiptChequePayer" type="string"/>
        <base:my-grid-schema-field name="receiptChequeAccountCoding_Id" type="string"/>
        <base:my-grid-schema-field name="receiptChequeFloatAccountLevel1_Id" type="string"/>
        <base:my-grid-schema-field name="receiptChequeFloatAccountLevel2_Id" type="string"/>
        <base:my-grid-schema-field name="receiptChequePrice" type="string"/>
        <base:my-grid-schema-field name="receiptChequeDescription" type="string"/>
        <base:my-grid-schema-field name="paymentBillId" type="string"/>
</base:my-grid>
<base:footer/>
