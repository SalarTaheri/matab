<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="EmployeeContractItem"/>

<base:my-grid-item name="EmployeeContractItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="employeeContract_id">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeContract.service_id'  field="service_name" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeContract.percent'  field="percent" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeContractItem.type'  field="typeStr" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeContractItem.employeePrice'  field="price" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeContractItem.isVariablePercent'  field="isVariablePercent" width="50px" isCombo="true"/>

    <base:my-grid-schema-field name="service_name" type="string"/>
    <base:my-grid-schema-field name="percent" type="string"/>
    <base:my-grid-schema-field name="isVariablePercent" type="boolean"/>
</base:my-grid-item>

<base:footer></base:footer>
