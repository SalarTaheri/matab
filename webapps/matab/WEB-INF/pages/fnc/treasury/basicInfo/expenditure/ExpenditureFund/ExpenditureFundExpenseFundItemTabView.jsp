<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="ExpenditureFundExpenseFundItem"/>

<base:my-grid-item name="ExpenditureFundExpenseFundItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="expenditurefund_id">
	<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditureFundExpenseFundItem.expensefundAccountCoding_id'  field="expensefundAccountCoding_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditureFundExpenseFundItem.expenseFundFloatAccountLevel1_id'  field="expenseFundFloatAccountLevel1_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditureFundExpenseFundItem.expenseFundFloatAccountLevel2_id'  field="expenseFundFloatAccountLevel2_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditureFundExpenseFundItem.expenseFundFloatAccountLevel3_id'  field="expenseFundFloatAccountLevel3_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditureFundExpenseFundItem.expenseFundFloatAccountLevel4_id'  field="expenseFundFloatAccountLevel4_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditureFundExpenseFundItem.price'  field="price" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditureFundExpenseFundItem.description'  field="description" width="50px"/>

    <base:my-grid-schema-field name="expensefundAccountCoding_name" type="string"/>
    <base:my-grid-schema-field name="expenseFundFloatAccountLevel1_name" type="string"/>
    <base:my-grid-schema-field name="expenseFundFloatAccountLevel2_name" type="string"/>
    <base:my-grid-schema-field name="expenseFundFloatAccountLevel3_name" type="string"/>
    <base:my-grid-schema-field name="expenseFundFloatAccountLevel4_name" type="string"/>
    <base:my-grid-schema-field name="price" type="long"/>
    <base:my-grid-schema-field name="description" type="string"/>
</base:my-grid-item>

<base:footer/>