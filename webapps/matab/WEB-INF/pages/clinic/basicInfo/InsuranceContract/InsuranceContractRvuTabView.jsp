<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="InsuranceContractRvu"/>

<base:my-grid-item name="InsuranceContractRvu" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="insuranceContractId">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractRvu.rvuCode' field="rvuCode" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractRvu.insuranceSharePercent' field="rvuInsuranceSharePercent" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractRvu.ka' field="kaName" width="50px"/>
</base:my-grid-item>

<base:footer/>
