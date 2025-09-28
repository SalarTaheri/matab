<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-InsuranceBookletType">
	<input type="hidden" id="id" name="id"/>
	<div class="uk-grid uk-grid-preserve">
		<base:testBox styleClass="small" name="bookletTypeName" key="com.artonis.clinic.basicInfo.insuranceOrganization.insuranceBookletType.bookletTypeName"/>
		<base:testBox styleClass="small" name="bookletTypeCode" key="com.artonis.clinic.basicInfo.insuranceOrganization.insuranceBookletType.code"/>
	</div>
</form>
