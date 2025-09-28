
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="ModifiedCodeItem"/>

<base:my-grid-item name="ModifiedCodeItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="rvuModifiedCode_id">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.modifiedCode.code'  field="code" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.modifiedCode.name'  field="name" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.modifiedCode.percent'  field="percent" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.modifiedCode.unit'  field="unit" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.modifiedCode.isChange'  field="isChange" isCombo="true" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.modifiedCode.rvu_components'  field="rvu_components_text"  width="50px"/>

	<base:my-grid-schema-field name="price" type="long"/>
</base:my-grid-item>

<base:footer></base:footer>

<%--<base:pageHeader/>--%>

<%--<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">--%>

<%--</base:my-grid>--%>
<%--<base:footer/>--%>
