<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="personType" styledivLabel="width:20%" key="com.artonis.inv.m169.basicInfo.companyPerson.personType"/>
			<base:testBox styleClass="small" name="companyType" key="com.artonis.inv.m169.basicInfo.person.citizenship"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="personCompanyName" key="com.artonis.inv.m169.basicInfo.companyPerson.personCompanyName"/>
			<base:testBox styleClass="small" name="firstAndLastName" key="com.artonis.inv.m169.basicInfo.companyPerson.firstAndLastName"/>
			<base:testBox styleClass="small" name="registerNumber" key="com.artonis.inv.m169.basicInfo.companyPerson.registerNumber"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="nationalId" key="com.artonis.inv.m169.basicInfo.companyPerson.nationalId"/>
			<base:testBox styleClass="small" name="taxAffairs" key="com.artonis.inv.m169.basicInfo.companyPerson.taxAffairs"/>
			<base:testBox styleClass="small" name="province_Id" key="com.artonis.inv.m169.basicInfo.companyPerson.province_Id"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="city_Id" key="com.artonis.inv.m169.basicInfo.companyPerson.city_Id"/>
			<base:testBox styleClass="small" name="address" key="com.artonis.inv.m169.basicInfo.companyPerson.address"/>
			<base:testBox styleClass="small" name="postalCode" key="com.artonis.inv.m169.basicInfo.companyPerson.postalCode"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="phoneNo" key="com.artonis.inv.m169.basicInfo.companyPerson.phoneNo"/>
			<base:testBox styleClass="small" name="priorEconomicCode" key="com.artonis.inv.m169.basicInfo.companyPerson.priorEconomicCode"/>
			<base:testBox styleClass="small" name="newEconomicCode" key="com.artonis.inv.m169.basicInfo.companyPerson.newEconomicCode"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="registrationState" key="com.artonis.inv.m169.basicInfo.companyPerson.registrationState"/>
			<base:testBox styleClass="small" name="userName" key="com.artonis.inv.m169.basicInfo.companyPerson.userName"/>
	
	</form>
</div>
