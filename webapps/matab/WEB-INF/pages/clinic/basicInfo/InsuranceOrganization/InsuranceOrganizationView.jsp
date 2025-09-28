
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader title="com.artonis.clinic.basicInfo.insuranceOrganization.view"/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceOrganization.name'  field="name" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceOrganization.code'  field="code" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceOrganization.franshiz'  field="franshiz" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceOrganization.fileName'  field="fileName" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceOrganization.type'  field="typeText" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceOrganization.active'  field="active" width="50px" isCombo="true"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceOrganization.calcBaseOnList'  field="calaBaseOnList" width="50px" isCombo="true"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceOrganization.applyFromFreeIns'  field="applyFromFreeIns" width="50px" isCombo="true"/>


        <base:my-grid-schema-field name="name" type="string"/>
        <base:my-grid-schema-field name="code" type="string"/>
        <base:my-grid-schema-field name="franshiz" type="double"/>
        <base:my-grid-schema-field name="fileName" type="string"/>
        <base:my-grid-schema-field name="typeText" type="string"/>
        <base:my-grid-schema-field name="active" type="boolean"/>
        <base:my-grid-schema-field name="calaBaseOnList" type="boolean"/>
        <base:my-grid-schema-field name="applyFromFreeIns" type="boolean"/>
</base:my-grid>
<base:footer/>
