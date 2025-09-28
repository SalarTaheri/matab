
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader />

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='com.artonis.hrm.enterprise.operatingUnit.name' field="name" width="50px" />
	<base:my-grid-column title='com.artonis.hrm.enterprise.operatingUnit.code' field="code" width="50px" />
	<base:my-grid-column title='com.artonis.hrm.enterprise.operatingUnit.company' field="companyName" width="50px" />
	<base:my-grid-column title='com.artonis.hrm.enterprise.operatingUnit.parent' field="parentOperatingUnitName" width="50px" />
		<base:my-grid-schema-field name="name" type="string" />
		<base:my-grid-schema-field name="code" type="string" />
		<base:my-grid-schema-field name="companyName" type="string" />
		<base:my-grid-schema-field name="parentOperatingUnitName" type="string" />
</base:my-grid>
<base:footer />
