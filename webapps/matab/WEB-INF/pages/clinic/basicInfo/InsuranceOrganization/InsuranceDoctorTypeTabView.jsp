<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="InsuranceDoctorType" />

<base:my-grid-item name="InsuranceDoctorType" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="insurance_id">

	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceOrganization.insuranceDoctorType.code' field="doctorTypeCode" width="50px" />
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceOrganization.insuranceDoctorType.name' field="doctorTypeName" width="50px" />

</base:my-grid-item>

<base:footer />