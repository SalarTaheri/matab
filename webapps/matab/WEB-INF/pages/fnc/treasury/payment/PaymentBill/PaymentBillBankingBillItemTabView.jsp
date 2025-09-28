
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="PaymentBillBankingBillItem"/>


<base:my-grid-item name="PaymentBillBankingBillItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="paymentBillId">
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBilReceiverPayerItem.payerAccountCoding'  field="bankingBillPayerAccountCodeName" width="50px"/>
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBillBankAccountItem.bankaccountAccountCoding'  field="bankingBillBankAccountCodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillCoffer.price'  field="paymentBankingBillPrice" width="50px"/>
	  
	   <base:my-grid-schema-field name="bankingBillPayerAccountCodeName" type="string"/>
	   <base:my-grid-schema-field name="bankingBillBankAccountCodeName" type="string"/>
	   <base:my-grid-schema-field name="paymentBankingBillPrice" type="long"/>

</base:my-grid-item>
<base:footer/>
