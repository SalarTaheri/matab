<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="ExpenditureFundAppendixItem"/>

<base:my-grid-item name="ExpenditureFundAppendixItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="expenditurefund_id">
	<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditureFundAppendixItem.fileAddress'  field="fileAddress" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditureFundAppendixItem.description'  field="description" width="50px"/>

    <base:my-grid-schema-field name="fileAddress" type="string"/>
    <base:my-grid-schema-field name="description" type="string"/>
</base:my-grid-item>

<base:footer/>