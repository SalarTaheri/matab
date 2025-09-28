<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-InsuranceContractAccessories">
	<input type="hidden" id="id" name="id"/>
	<div class="uk-grid uk-grid-preserve">
		<base:testBox styleClass="small" name="accessoriesGroup" key="com.artonis.clinic.basicInfo.insuranceContractAccessories.accessoriesGroup"/>
		<base:testBox styleClass="small" name="accessoriesCode" key="com.artonis.clinic.basicInfo.insuranceContractAccessories.accessoriesCode"/>
		<base:testBox styleClass="small" name="name" key="com.artonis.clinic.basicInfo.insuranceContractAccessories.name"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBox styleClass="small" name="organizationCode" key="com.artonis.clinic.basicInfo.insuranceContractAccessories.organizationCode"/>
		<base:testBoxNumericEx styleClass="small" name="accessoriesInsuranceSharePercent" key="com.artonis.clinic.basicInfo.insuranceContractAccessories.insuranceSharePercent"/>
		<base:comboBoxAutoComplete iscomboLoaderUrlRelative="true" minLength="0" styleClass="small" name="accessoriesServiceItemId" dataValueField="id" dataTextField="name" key="com.artonis.clinic.basicInfo.insuranceContractAccessories.serviceItem" comboLoaderUrl="combo/loadAllServiceItem"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="small" name="accessoriesInsuranceCost" key="com.artonis.clinic.basicInfo.insuranceContractAccessories.insuranceCost"/>
	</div>
</form>

