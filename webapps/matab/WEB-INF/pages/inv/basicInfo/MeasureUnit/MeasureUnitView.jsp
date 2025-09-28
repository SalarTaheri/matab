<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader6button/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='com.artonis.inv.basicInfo.measureUnit.measureUnit'  field="measureUnit" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.basicInfo.measureUnit.scale'  field="scaleTxt" width="50px"/>

    <base:my-grid-schema-field name="measureUnit" type="string"/>
    <base:my-grid-schema-field name="scaleTxt" type="string"/>
</base:my-grid>
<base:footer/>
