<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-InsuranceContractRvu">
	<input type="hidden" id="id" name="id" />
	<div class="uk-grid uk-grid-preserve">
		<base:comboBoxAutoComplete iscomboLoaderUrlRelative="true" minLength="0" styleClass="small" name="rvuId" dataValueField="id" dataTextField="code" key="com.artonis.clinic.basicInfo.insuranceContractRvu.rvuCode" comboLoaderUrl="combo/loadAllRvu"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="small" name="rvuInsuranceSharePercent" key="com.artonis.clinic.basicInfo.insuranceContractRvu.insuranceSharePercent"/>
		<base:comboBoxAutoComplete iscomboLoaderUrlRelative="true" minLength="0" styleClass="small" name="kaId" dataValueField="id" dataTextField="name" key="com.artonis.clinic.basicInfo.insuranceContractRvu.ka" comboLoaderUrl="combo/loadAllKa"/>
	</div>
</form>
