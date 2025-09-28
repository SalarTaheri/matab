<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-InsuranceParaclinicType">
	<input type="hidden" id="id" name="id"/>

	<div class="uk-grid uk-grid-preserve">

		<base:testBox styleClass="small" name="paraclinicTypeCode" key="com.artonis.clinic.basicInfo.insuranceOrganization.insuranceParaclinicType.code"/>
		<base:testBox styleClass="small" name="paraclinicTypeName" key="com.artonis.clinic.basicInfo.insuranceOrganization.insuranceParaclinicType.name"/>
	</div>
</form>
