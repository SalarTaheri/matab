<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-InsurancePrescriptionType">
	<input type="hidden" id="id" name="id"/>

	<div class="uk-grid uk-grid-preserve">

		<base:testBox styleClass="small" name="prescriptionTypeCode" key="com.artonis.clinic.basicInfo.insuranceOrganization.insurancePrescriptionType.code"/>
		<base:testBox styleClass="small" name="prescriptionTypeName" key="com.artonis.clinic.basicInfo.insuranceOrganization.insurancePrescriptionType.name"/>
	</div>
</form>
