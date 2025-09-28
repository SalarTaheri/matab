<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="GroupState"/>

<base:my-grid-item name="GroupState" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="group_id">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceState'  field="stateName" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceState.priority'  field="priority" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceState.isFinal'  field="isFinal" width="50px" isCombo="true"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceState.isVisit'  field="isVisit" width="50px" isCombo="true"/>

    <base:my-grid-schema-field name="stateName" type="string"/>
    <base:my-grid-schema-field name="isFinal" type="boolean"/>
    <base:my-grid-schema-field name="isVisit" type="boolean"/>
</base:my-grid-item>

<base:footer/>