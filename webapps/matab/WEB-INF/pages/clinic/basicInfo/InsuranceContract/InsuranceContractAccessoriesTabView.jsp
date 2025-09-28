<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="InsuranceContractAccessories"/>

<base:my-grid-item name="InsuranceContractAccessories" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="insuranceContractId">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractAccessories.accessoriesGroup'  field="accessoriesGroup" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractAccessories.accessoriesCode'  field="accessoriesCode" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractAccessories.name'  field="name" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractAccessories.organizationCode'  field="organizationCode" width="50px"/>
</base:my-grid-item>

<base:footer/>

