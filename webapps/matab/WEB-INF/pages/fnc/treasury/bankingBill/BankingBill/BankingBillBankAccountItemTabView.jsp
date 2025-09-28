<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="BankingBillBankAccountItem"/>

<base:my-grid-item name="BankingBillBankAccountItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="bankingbill_id">
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBillBankAccountItem.operationType'  field="operationTypeText" width="50px"/>
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBillBankAccountItem.bankAccount'  field="bankAccount_number" width="50px"/>
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBillBankAccountItem.bankaccountAccountCoding'  field="bankaccountAccountCoding_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBillBankAccountItem.floatAccountLevel1'  field="floatAccountLevel1_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBillBankAccountItem.floatAccountLevel2'  field="floatAccountLevel2_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBillBankAccountItem.floatAccountLevel3'  field="floatAccountLevel3_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBillBankAccountItem.floatAccountLevel4'  field="floatAccountLevel4_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBillBankAccountItem.price'  field="price" width="50px"/>
	<base:my-grid-column title='fnc.treasury.bankingBill.bankingBillBankAccountItem.description'  field="description" width="50px"/>

    <base:my-grid-schema-field name="operationTypeText" type="string"/>
    <base:my-grid-schema-field name="bankAccount_number" type="string"/>
    <base:my-grid-schema-field name="bankaccountAccountCoding_name" type="string"/>
    <base:my-grid-schema-field name="floatAccountLevel1_name" type="string"/>
    <base:my-grid-schema-field name="floatAccountLevel2_name" type="string"/>
    <base:my-grid-schema-field name="floatAccountLevel3_name" type="string"/>
    <base:my-grid-schema-field name="floatAccountLevel4_name" type="string"/>
    <base:my-grid-schema-field name="price" type="long"/>
    <base:my-grid-schema-field name="description" type="string"/>
</base:my-grid-item>

<base:footer/>
