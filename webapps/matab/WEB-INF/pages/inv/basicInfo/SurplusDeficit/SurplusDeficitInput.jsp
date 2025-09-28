<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader />
<base:pageInputHeader />

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="name" key="com.artonis.inv.basicInfo.surplusDeficit.name" />
			<base:testBox styleClass="small" name="code" key="com.artonis.inv.basicInfo.surplusDeficit.code" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="type" key="com.artonis.inv.basicInfo.surplusDeficit.type" comboLoaderUrl="combo/loadAllSurplusDeficitTypes" />
			<base:comboBoxAutoComplete-buttonAddToCombo name="accountCodingId" key="com.artonis.inv.basicInfo.surplusDeficit.accountCoding" popupUrlIsRelative="true"
				iscomboLoaderUrlRelative="true" comboLoaderUrl="/combo/loadAllAccountCoding" dataTextField="nameCode" dataValueField="id" minLength="0" hasTemplate="true"
				headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code" templateComaSep="name,code" popupUrl="popup/treeAccountCoding" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="descriptions" key="com.artonis.inv.basicInfo.surplusDeficit.descriptions" />
		</div>
	</form>
</div>
