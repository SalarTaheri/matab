<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="BankingBilReceiverPayerItem"/>

<base:my-grid-item name="BankingBilReceiverPayerItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="bankingbill_id">
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBilReceiverPayerItem.recepayerAccountCoding'  field="recepayerAccountCoding_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBilReceiverPayerItem.floataccountLevel1'  field="floataccountLevel1_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBilReceiverPayerItem.floataccountLevel2'  field="floataccountLevel2_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBilReceiverPayerItem.floataccountLevel3'  field="floataccountLevel3_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBilReceiverPayerItem.floataccountLevel4'  field="floataccountLevel4_name" width="50px"/>


        <base:my-grid-schema-field name="recepayerAccountCoding_name" type="string"/>
        <base:my-grid-schema-field name="floataccountLevel1_name" type="string"/>
        <base:my-grid-schema-field name="floataccountLevel2_name" type="string"/>
        <base:my-grid-schema-field name="floataccountLevel3_name" type="string"/>
        <base:my-grid-schema-field name="floataccountLevel4_name" type="string"/>
</base:my-grid-item>

<base:footer/>