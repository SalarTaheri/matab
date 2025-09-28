
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="PaymentBillCofferItem"/>

<base:my-grid-item name="PaymentBillCofferItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="paymentBillId">
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillCoffer.accountCoding_id'  field="accountCodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillCoffer.floataccountlevel1_id'  field="floatAccountLevel1CodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillCoffer.floataccountlevel2_id'  field="floatAccountLevel2CodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillCoffer.floataccountlevel3_id'  field="floatAccountLevel3CodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillCoffer.floataccountlevel4_id'  field="floatAccountLevel4CodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillCoffer.price'  field="price" width="50px"/>
	
        <base:my-grid-schema-field name="accountCoding_id" type="string"/>
        <base:my-grid-schema-field name="floatAccountLevel1CodeName" type="string"/>
        <base:my-grid-schema-field name="floatAccountLevel2CodeName" type="string"/>
        <base:my-grid-schema-field name="floatAccountLevel3CodeName" type="string"/>
        <base:my-grid-schema-field name="floatAccountLevel4CodeName" type="string"/>
        <base:my-grid-schema-field name="price" type="long"/>
        
     
</base:my-grid-item>
<base:footer/>
