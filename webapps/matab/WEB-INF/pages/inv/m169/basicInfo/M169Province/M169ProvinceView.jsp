
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='com.artonis.inv.m169.basicInfo.m169Province.code'  field="code" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.basicInfo.m169Province.name'  field="name" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.basicInfo.m169Province.country_id'  field="country_id" width="50px"/>


        <base:my-grid-schema-field name="code" type="string"/>
        <base:my-grid-schema-field name="name" type="string"/>
        <base:my-grid-schema-field name="country_id" type="string"/>
</base:my-grid>
<base:footer/>
