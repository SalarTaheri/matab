<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="InsuranceContractVisit"/>

<base:my-grid-item name="InsuranceContractVisit" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="insuranceContractId">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractVisit.serviceItem' field="serviceItemName" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractVisit.insuranceSharePercent' field="visitInsuranceSharePercent" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractVisit.cost' field="cost" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractVisit.name' field="name" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractVisit.code' field="code" width="50px"/>
</base:my-grid-item>

<base:footer/>
