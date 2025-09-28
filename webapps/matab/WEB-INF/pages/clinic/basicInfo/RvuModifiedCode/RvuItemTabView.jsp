
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="RvuItem"/>

<base:my-grid-item name="RvuItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="rvuModifiedCode_id">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.code'  field="code" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.value'  field="value" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.comment'  field="comment" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.anesthesiaBaseValue'  field="anesthesiaBaseValue" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.anesthesiaComment'  field="anesthesiaComment" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.creationDate'  field="creationDate" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.modificationDate'  field="modificationDate" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.version'  field="version" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.deleted'  field="deleted" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.sourceGroup'  field="sourceGroup" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.terminologyId'  field="terminologyId" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.isAddon'  field="isAddon" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.isAdjustment'  field="isAdjustment" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.hasInsurance'  field="hasInsurance" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.technicalComponent'  field="technicalComponent" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.professionalComponent'  field="professionalComponent" width="50px"/>



	<%--<base:my-grid-schema-field name="code" type="string"/>--%>
	<%--<base:my-grid-schema-field name="value" type="string"/>--%>
	<%--<base:my-grid-schema-field name="comment" type="string"/>--%>
	<%--<base:my-grid-schema-field name="relativeValue" type="string"/>--%>
	<%--<base:my-grid-schema-field name="anesthesiaBaseValue" type="string"/>--%>
	<%--<base:my-grid-schema-field name="creationDate" type="string"/>--%>
	<%--<base:my-grid-schema-field name="modificationDate" type="string"/>--%>
	<%--<base:my-grid-schema-field name="version" type="string"/>--%>
	<%--<base:my-grid-schema-field name="deleted" type="string"/>--%>
	<%--<base:my-grid-schema-field name="sourceGroup" type="string"/>--%>
	<%--<base:my-grid-schema-field name="TerminologyId" type="string"/>--%>
	<base:my-grid-schema-field name="technicalComponent" type="string"/>
	<base:my-grid-schema-field name="professionalComponent" type="string"/>

	<%--<base:my-grid-schema-field name="price" type="long"/>--%>
</base:my-grid-item>

<base:footer></base:footer>

<%--<base:pageHeader/>--%>

<%--<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">--%>

<%--</base:my-grid>--%>
<%--<base:footer/>--%>
