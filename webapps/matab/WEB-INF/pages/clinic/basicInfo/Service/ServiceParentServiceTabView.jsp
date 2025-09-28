<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="ServiceParentService"/>

<base:my-grid-item name="ServiceParentService" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="service_id">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.service.serviceParentService'  field="parentServiceName" width="50px"/>
</base:my-grid-item>

<base:footer/>