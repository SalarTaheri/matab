
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="ReceiptBillBankingBillItem"/>


<base:my-grid-item name="ReceiptBillBankingBillItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="receiptBill_Id">
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBilReceiverPayerItem.receiverAccountCoding'  field="bankingBillReceiverAccountCodeName" width="50px"/>
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBillBankAccountItem.bankaccountAccountCoding'  field="bankingBillBankAccountCodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillCoffer.price'  field="receiptBankingBillPrice" width="50px"/>
	   <base:my-grid-schema-field name="bankingBillPayerAccountCodeName" type="string"/>
	   <base:my-grid-schema-field name="bankingBillBankAccountCodeName" type="string"/>
	   <base:my-grid-schema-field name="receiptBankingBillPrice" type="long"/>

</base:my-grid-item>
<base:footer/>
