
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>
<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="posName" key="com.artonis.clinic.basicInfo.pos.posName"/>
			<base:testBox styleClass="small" name="bankName" key="com.artonis.clinic.basicInfo.pos.bankName"/>
			<base:testBox styleClass="small" name="accountNumber" key="com.artonis.clinic.basicInfo.pos.accountNumber"/>
		</div>
	</form>
	<div class="uk-grid uk-grid-preserve"></div>
	<div class="uk-grid uk-grid-preserve"></div>
	<div align="center">
		<base:SubmitButton />
	</div>
</div>  
<base:Pattern3/>
<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.pos.posName'  field="posName" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.pos.bankName'  field="bankName" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.pos.accountNumber'  field="accountNumber" width="50px"/>


        <base:my-grid-schema-field name="posName" type="string"/>
        <base:my-grid-schema-field name="bankName" type="string"/>
        <base:my-grid-schema-field name="accountNumber" type="string"/>
</base:my-grid>
<base:footer/>
