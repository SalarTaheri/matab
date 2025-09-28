<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="InsurancePrescriptionType" />

<base:my-grid-item name="InsurancePrescriptionType" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="insurance_id">

	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceOrganization.insurancePrescriptionType.code' field="prescriptionTypeCode" width="50px" />
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceOrganization.insurancePrescriptionType.name' field="prescriptionTypeName" width="50px" />

</base:my-grid-item>

<base:footer />