<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-TestInsuranceOrganization">
	<input type="hidden" id="id" name="id"/>

	<div class="uk-grid uk-grid-preserve">
		<base:comboBoxAutoComplete iscomboLoaderUrlRelative="true" minLength="0" styleClass="small" name="insuranceOrganizationId" key="com.artonis.lab.basicInfo.insurance"
								   dataValueField="id" dataTextField="name" comboLoaderUrl="combo/loadAllInsuranceOrganizations"/>
		<base:testBoxNumericEx styleClass="small" name="price" key="com.artonis.lab.basicInfo.testInsuranceOrganization.price"/>
	</div>
</form>
