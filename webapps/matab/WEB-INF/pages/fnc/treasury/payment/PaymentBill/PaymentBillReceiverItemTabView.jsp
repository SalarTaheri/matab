
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="PaymentBillReceiverItem"/>


<base:my-grid-item name="PaymentBillReceiverItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="paymentBillId">
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiver.receiverAccountCoding'  field="accountCodeName" width="50px"/>
    <base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiver.accountlevel1'  field="floatAccountLevel1CodeName" width="50px"/>
    <base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiver.accountlevel2'  field="floatAccountLevel2CodeName" width="50px"/>
    <base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiver.accountlevel3'  field="floatAccountLevel3CodeName" width="50px"/>
    <base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiver.accountlevel4'  field="floatAccountLevel4CodeName" width="50px"/>
    <base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiver.price'  field="receiverPrice" width="50px"/>
      
          <base:my-grid-schema-field name="accountCodeName" type="string"/>
          <base:my-grid-schema-field name="floatAccountLevel1CodeName" type="string"/>
          <base:my-grid-schema-field name="floatAccountLevel2CodeName" type="string"/>
          <base:my-grid-schema-field name="floatAccountLevel3CodeName" type="string"/>
          <base:my-grid-schema-field name="floatAccountLevel4CodeName" type="string"/>
          <base:my-grid-schema-field name="receiverPrice" type="long"/>
    
</base:my-grid-item>
<base:footer/>
