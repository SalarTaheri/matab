<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-InsuranceDoctorType">
	<input type="hidden" id="id" name="id"/>

	<div class="uk-grid uk-grid-preserve">

		<base:testBox styleClass="small" name="doctorTypeCode" key="com.artonis.clinic.basicInfo.insuranceOrganization.insuranceDoctorType.code"/>
		<base:testBox styleClass="small" name="doctorTypeName" key="com.artonis.clinic.basicInfo.insuranceOrganization.insuranceDoctorType.name"/>
	</div>
</form>
