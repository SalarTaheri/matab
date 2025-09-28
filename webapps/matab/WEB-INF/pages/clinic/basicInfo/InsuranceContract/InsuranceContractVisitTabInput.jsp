<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-InsuranceContractVisit">
	<input type="hidden" id="id" name="id"/>
	<div class="uk-grid uk-grid-preserve">
		<base:comboBoxAutoComplete iscomboLoaderUrlRelative="true" minLength="0" styleClass="small" name="visitServiceItemId" dataValueField="id" dataTextField="name" key="com.artonis.clinic.basicInfo.insuranceContractVisit.serviceItem" comboLoaderUrl="combo/loadAllServiceItem"/>
		<base:testBoxNumericEx styleClass="small" name="visitInsuranceSharePercent" key="com.artonis.clinic.basicInfo.insuranceContractVisit.insuranceSharePercent"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="small" name="cost" key="com.artonis.clinic.basicInfo.insuranceContractVisit.cost"/>
		<base:testBox styleClass="small" name="name" key="com.artonis.clinic.basicInfo.insuranceContractVisit.name"/>
		<base:testBox styleClass="small" name="code" key="com.artonis.clinic.basicInfo.insuranceContractVisit.code"/>
	</div>
</form>
