<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='com.artonis.lab.basicInfo.test.code' field="code" width="150px"/>
	<base:my-grid-column title='com.artonis.lab.basicInfo.test.fullName' field="fullName" width="150px"/>
	<base:my-grid-column title='com.artonis.lab.basicInfo.test.abbreviatedName' field="abbreviatedName" width="150px"/>
	<base:my-grid-schema-field name="code" type="string"/>
	<base:my-grid-schema-field name="fullName" type="string"/>
	<base:my-grid-schema-field name="abbreviatedName" type="string"/>
</base:my-grid>

<base:footer/>
