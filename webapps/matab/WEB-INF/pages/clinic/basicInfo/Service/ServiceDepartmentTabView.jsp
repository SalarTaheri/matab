<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="ServiceDepartment"/>

<base:my-grid-item name="ServiceDepartment" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="service_id">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceDepartment.department'  field="departmentName" width="50px"/>

    <base:my-grid-schema-field name="departmentName" type="string"/>
</base:my-grid-item>

<base:footer/>