<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader />

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="name" key="system.name" />
			<base:testBox name="code" key="system.code" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="province_id" key="system.province" comboLoaderUrl="combo/loadAllProvince" />
			<base:cascadeComboBox name="city_id" key="system.city" cascadeCombo="province_id" comboLoaderUrl="combo/loadAllCity" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="phoneNumber" key="com.artonis.hrm.enterprise.company.phoneNumber" />
			<base:testBox name="legalNumber" key="com.artonis.hrm.enterprise.company.legalNumber" />
		</div>
	</form>
</div>