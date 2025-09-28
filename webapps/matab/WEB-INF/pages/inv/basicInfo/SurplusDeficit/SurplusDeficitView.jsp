<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader />

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='com.artonis.inv.basicInfo.surplusDeficit.name' field="name" width="50px" />
	<base:my-grid-column title='com.artonis.inv.basicInfo.surplusDeficit.code' field="code" width="50px" />
	<base:my-grid-column title='com.artonis.inv.basicInfo.surplusDeficit.type' field="typeName" width="50px" />
	<base:my-grid-column title='com.artonis.inv.basicInfo.surplusDeficit.accountCoding' field="accountCodingName" width="50px" />
	<base:my-grid-column title='com.artonis.inv.basicInfo.surplusDeficit.descriptions' field="descriptions" width="50px" />

	<base:my-grid-schema-field name="name" type="string" />
	<base:my-grid-schema-field name="code" type="string" />
	<base:my-grid-schema-field name="typeName" type="string" />
	<base:my-grid-schema-field name="accountCodingName" type="string" />
	<base:my-grid-schema-field name="descriptions" type="string" />
</base:my-grid>
<base:footer />
