<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader />

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='system.name' field="name" width="50px" />
	<base:my-grid-column title='system.code' field="code" width="50px" />
	<base:my-grid-column title='system.city' field="cityName" width="50px" />
	<base:my-grid-column title='system.province' field="provinceName" width="50px" />
	<base:my-grid-column title='system.phoneNumber' field="phoneNumber" width="50px" />
	<base:my-grid-column title='hrm.enterprise.company.legalNumber' field="legalNumber" width="50px" />
</base:my-grid>

<base:footer />