<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-InsuranceContractDrug">
	<input type="hidden" id="id" name="id"/>
	<div class="uk-grid uk-grid-preserve">
		<base:testBox styleClass="small" name="genericCode" key="com.artonis.clinic.basicInfo.insuranceContractDrug.genericCode"/>
		<base:testBox styleClass="small" name="brandCode" key="com.artonis.clinic.basicInfo.insuranceContractDrug.brandCode"/>
		<base:testBox styleClass="small" name="companyCode" key="com.artonis.clinic.basicInfo.insuranceContractDrug.companyCode"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBox styleClass="small" name="name" key="com.artonis.clinic.basicInfo.insuranceContractDrug.name"/>
		<base:testBox styleClass="small" name="brandName" key="com.artonis.clinic.basicInfo.insuranceContractDrug.brandName"/>
		<base:testBox styleClass="small" name="figure" key="com.artonis.clinic.basicInfo.insuranceContractDrug.figure"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBox styleClass="small" name="dosage" key="com.artonis.clinic.basicInfo.insuranceContractDrug.dosage"/>
		<base:testBoxNumericEx styleClass="small" name="drugInsuranceSharePercent" key="com.artonis.clinic.basicInfo.insuranceContractDrug.insuranceSharePercent"/>
		<base:comboBoxAutoComplete iscomboLoaderUrlRelative="true" minLength="0" styleClass="small" name="drugServiceItemId" dataValueField="id" dataTextField="name" key="com.artonis.clinic.basicInfo.insuranceContractDrug.serviceItem" comboLoaderUrl="combo/loadAllServiceItem"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="small" name="drugInsuranceCost" key="com.artonis.clinic.basicInfo.insuranceContractDrug.insuranceCost"/>
	</div>
</form>