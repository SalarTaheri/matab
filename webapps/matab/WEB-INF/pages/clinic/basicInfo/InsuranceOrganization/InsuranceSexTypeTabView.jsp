<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="InsuranceSexType" />

<base:my-grid-item name="InsuranceSexType" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="insurance_id">

	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceOrganization.insuranceSexType.sexType' field="sexTypeStr" width="50px" />
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceOrganization.insuranceSexType.code' field="sexTypeCode" width="50px" />

</base:my-grid-item>

<base:footer />