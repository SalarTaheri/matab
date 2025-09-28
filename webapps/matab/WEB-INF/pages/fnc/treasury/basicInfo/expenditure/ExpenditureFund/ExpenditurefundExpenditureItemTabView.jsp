<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="ExpenditurefundExpenditureItem"/>

<base:my-grid-item name="ExpenditurefundExpenditureItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="expenditurefund_id">
	<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditurefundExpenditureItem.expenditureAccountCoding_id'  field="expenditureAccountCoding_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditurefundExpenditureItem.expenditureFloatAccountLevel1_id'  field="expenditureFloatAccountLevel1_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditurefundExpenditureItem.expenditureFloatAccountLevel2_id'  field="expenditureFloatAccountLevel2_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditurefundExpenditureItem.expenditureFloatAccountLevel3_id'  field="expenditureFloatAccountLevel3_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditurefundExpenditureItem.expenditureFloatAccountLevel4_id'  field="expenditureFloatAccountLevel4_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditurefundExpenditureItem.description'  field="description" width="50px"/>

    <base:my-grid-schema-field name="expenditureAccountCoding_name" type="string"/>
    <base:my-grid-schema-field name="expenditureFloatAccountLevel1_name" type="string"/>
    <base:my-grid-schema-field name="expenditureFloatAccountLevel2_name" type="string"/>
    <base:my-grid-schema-field name="expenditureFloatAccountLevel3_name" type="string"/>
    <base:my-grid-schema-field name="expenditureFloatAccountLevel4_name" type="string"/>
    <base:my-grid-schema-field name="description" type="string"/>
</base:my-grid-item>

<base:footer/>