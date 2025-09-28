
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.operation.name'  field="name" width="50px"/>
	<%--<base:my-grid-column title='com.artonis.clinic.basicInfo.operation.coding'  field="coding" width="50px"/>--%>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.operation.status'  field="statusStr" width="50px"/>


    <base:my-grid-schema-field name="name" type="string"/>
    <%--<base:my-grid-schema-field name="coding" type="string"/>--%>
    <base:my-grid-schema-field name="statusStr" type="string"/>
</base:my-grid>
<base:footer/>
