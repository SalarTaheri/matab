<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form" id="form-popup">
<div style="width: 95%">
	<input type="hidden" id="id" name="id">
	<div class="uk-grid uk-grid-preserve">
	    <base:comboBox styleClass="small" name="type" isListConstant="true" styledivLabel="width: 170px"
                         key="com.artonis.inv.m169.basicInfo.person.type" comboLoaderUrl="combo/loadAllPersonType" />
   		<base:comboBox styleClass="small" name="title" isListConstant="true" styledivLabel="width: 220px"
                         key="com.artonis.inv.m169.basicInfo.person.title" comboLoaderUrl="combo/loadAllPersonTitle" />
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBox styleClass="small" name="name" key="com.artonis.inv.m169.basicInfo.person.name" styledivLabel="width: 170px"/>
		<base:testBox styleClass="small" name="family" key="com.artonis.inv.m169.basicInfo.person.family" styledivLabel="width: 220px"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
         <base:comboBox styleClass="small" name="citizenship" isListConstant="true" styledivLabel="width: 170px"
                        key="com.artonis.inv.m169.basicInfo.person.citizenship" comboLoaderUrl="combo/loadAllPersonCitizenship" />
		<base:testBox styleClass="small" name="economicNo" key="com.artonis.inv.m169.basicInfo.person.economicNo" styledivLabel="width: 220px"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBox styleClass="small" name="nationalCode" key="com.artonis.inv.m169.basicInfo.person.nationalCode" styledivLabel="width: 170px"/>
		<base:testBox styleClass="small" name="foreignPersonNumber" key="com.artonis.inv.m169.basicInfo.person.foreignPersonNumber" styledivLabel="width: 220px"/>
	</div>
</div>
</form>
