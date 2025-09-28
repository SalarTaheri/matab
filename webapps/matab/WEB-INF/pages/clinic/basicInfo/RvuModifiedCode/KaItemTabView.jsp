
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="KaItem"/>

<%--<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">--%>
<base:my-grid-item name="KaItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="rvuModifiedCode_id">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.ka.code'  field="code" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.ka.name'  field="nameWithK" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.ka.price'  field="price" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.ka.type'  field="kaTypeStr" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.ka.description'  field="description" width="50px"/>

    <base:my-grid-schema-field name="code" type="string"/>
    <base:my-grid-schema-field name="nameWithK" type="string"/>
    <base:my-grid-schema-field name="price" type="long"/>
    <base:my-grid-schema-field name="description" type="string"/>
</base:my-grid-item>
<base:footer/>
