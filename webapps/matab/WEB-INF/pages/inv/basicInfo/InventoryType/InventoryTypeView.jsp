<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title="com.artonis.inv.basicInfo.inventoryType.name" field="name" width="7%"/>
	<base:my-grid-column title="com.artonis.inv.basicInfo.inventoryType.code" field="code" width="7%"/>
	<base:my-grid-column title="com.artonis.inv.basicInfo.inventoryType.description" field="description" width="7%"/>

    <base:my-grid-schema-field name="name" type="string"/>
    <base:my-grid-schema-field name="code" type="string"/>
    <base:my-grid-schema-field name="description" type="string"/>
</base:my-grid>

<base:footer/>
