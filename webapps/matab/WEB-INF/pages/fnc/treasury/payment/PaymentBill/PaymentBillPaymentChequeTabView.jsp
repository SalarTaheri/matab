
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="PaymentBillPaymentChequeItem"/>


<base:my-grid-item name="PaymentBillPaymentChequeItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="paymentBillId">
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillCoffer.accountCoding_id'  field="accountCodeName" width="50px"/>
    <base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.bank_Id'  field="bankName" width="50px"/>
    <base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.chequeSerial'  field="chequeSerial" width="50px"/>
    <base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.price'  field="paymentChequePrice" width="50px"/>
        
    <base:my-grid-schema-field name="accountCodeName" type="string"/>
     <base:my-grid-schema-field name="bankName" type="string"/>
      <base:my-grid-schema-field name="chequeSerial" type="long"/>
       <base:my-grid-schema-field name="paymentChequePrice" type="long"/>
           
    
</base:my-grid-item>
<base:footer/>
