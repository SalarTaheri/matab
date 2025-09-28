<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="floatAccount_id" name="floatAccount_id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="name" key="fnc.treasury.basicInfo.coffer.coffer.name"/>
			<base:testBox styleClass="small" name="code" key="fnc.treasury.basicInfo.coffer.coffer.code"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="type" value="name" key="fnc.treasury.basicInfo.coffer.coffer.type" comboLoaderUrl="combo/loadAllCurrencyType" styleClass="small" />
			<base:comboBox name="expenditureCoffer" value="name" key="fnc.treasury.basicInfo.coffer.coffer.expenditureCoffer" comboLoaderUrl="combo/loadAllEmployee" styleClass="small" minLength="0"/>
		</div>
	</form>
</div>
