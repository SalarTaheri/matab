<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-InsuranceProficiency">
	<input type="hidden" id="id" name="id"/>

	<div class="uk-grid uk-grid-preserve">

		<base:testBox styleClass="small" name="proficiencyCode" key="com.artonis.clinic.basicInfo.insuranceOrganization.insuranceProficiency.code"/>
		<base:testBox styleClass="small" name="proficiencyName" key="com.artonis.clinic.basicInfo.insuranceOrganization.insuranceProficiency.name"/>
	</div>
</form>
