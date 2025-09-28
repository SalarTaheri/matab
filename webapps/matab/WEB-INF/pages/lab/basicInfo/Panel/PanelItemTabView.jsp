<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="PanelItem"/>

<base:my-grid-item name="PanelItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="panelId">
	<base:my-grid-column title='com.artonis.lab.basicInfo.panelItem.testName' field="testName" width="50px"/>
	<base:my-grid-column title='com.artonis.lab.basicInfo.panelItem.printOrder' field="printOrder" width="50px"/>
	<base:my-grid-schema-field name="testName" type="string"/>
	<base:my-grid-schema-field name="printOrder" type="string"/>
</base:my-grid-item>

<base:footer/>
