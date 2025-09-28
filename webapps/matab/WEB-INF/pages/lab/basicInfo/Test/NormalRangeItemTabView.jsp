<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="NormalRangeItem"/>

<base:my-grid-item name="NormalRangeItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="testId">
	<base:my-grid-column title='com.artonis.lab.basicInfo.normalRange.type' field="normalRangeTypeName" width="50px"/>
	<base:my-grid-column title='com.artonis.lab.basicInfo.normalRange.descriptions' field="descriptions" width="50px"/>
	<base:my-grid-column title='com.artonis.lab.basicInfo.normalRange.measurementUnit' field="normalRangeMeasurementUnitName" width="50px"/>
	<base:my-grid-column title='com.artonis.lab.basicInfo.normalRange.warningRangeMin' field="warningRangeMin" width="50px"/>
	<base:my-grid-column title='com.artonis.lab.basicInfo.normalRange.warningRangeMax' field="warningRangeMax" width="50px"/>
	<base:my-grid-column title='com.artonis.lab.basicInfo.normalRange.normalRangeMin' field="normalRangeMin" width="50px"/>
	<base:my-grid-column title='com.artonis.lab.basicInfo.normalRange.normalRangeMax' field="normalRangeMax" width="50px"/>
	<base:my-grid-column title='com.artonis.lab.basicInfo.normalRange.possibleRangeMin' field="possibleRangeMin" width="50px"/>
	<base:my-grid-column title='com.artonis.lab.basicInfo.normalRange.possibleRangeMax' field="possibleRangeMax" width="50px"/>
	<base:my-grid-column title='com.artonis.lab.basicInfo.normalRange.fromAge' field="fromAgeName" width="50px"/>
	<base:my-grid-column title='com.artonis.lab.basicInfo.normalRange.toAge' field="toAgeName" width="50px"/>
	<base:my-grid-column title='com.artonis.lab.basicInfo.normalRange.name' field="name" width="50px"/>

	<base:my-grid-schema-field name="normalRangeTypeName" type="string"/>
	<base:my-grid-schema-field name="descriptions" type="string"/>
	<base:my-grid-schema-field name="normalRangeMeasurementUnitName" type="string"/>
	<base:my-grid-schema-field name="warningRangeMin" type="string"/>
	<base:my-grid-schema-field name="warningRangeMax" type="string"/>
	<base:my-grid-schema-field name="normalRangeMin" type="string"/>
	<base:my-grid-schema-field name="normalRangeMax" type="string"/>
	<base:my-grid-schema-field name="possibleRangeMin" type="string"/>
	<base:my-grid-schema-field name="possibleRangeMax" type="string"/>
	<base:my-grid-schema-field name="fromAgeName" type="string"/>
	<base:my-grid-schema-field name="toAgeName" type="string"/>
	<base:my-grid-schema-field name="name" type="string"/>
</base:my-grid-item>

<base:footer/>
