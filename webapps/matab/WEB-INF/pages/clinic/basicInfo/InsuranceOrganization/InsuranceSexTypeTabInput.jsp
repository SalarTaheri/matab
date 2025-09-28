<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-InsuranceSexType">
	<input type="hidden" id="id" name="id"/>
	<div class="uk-grid uk-grid-preserve">
		<h4 style="margin-right: 6.5%; color: red;">توجه: متناسب با هر سازمان بیمه، کد نوع جنسیت می بایست در این برگه تعریف شود تا در هنگام صدور دیسکت بیمه از آن استفاده گردد</h4>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:comboBox styleClass="small" name="sexType" isListConstant="true" key="com.artonis.clinic.basicInfo.insuranceOrganization.insuranceSexType.sexType"
					comboLoaderUrl="combo/loadAllSex" />
		<base:testBox styleClass="small" name="sexTypeCode" key="com.artonis.clinic.basicInfo.insuranceOrganization.insuranceSexType.code"/>
	</div>
</form>
