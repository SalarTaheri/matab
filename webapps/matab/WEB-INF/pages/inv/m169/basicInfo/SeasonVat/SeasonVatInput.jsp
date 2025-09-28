<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="active" name="active" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="verysmall" name="name" key="inventory.m169.basicInfo.seasonVat.name"/>
			<base:testBox styleClass="verysmall" name="length" key="inventory.m169.basicInfo.seasonVat.length"/>
	    	<base:mDatePicker styleClass="verysmall" name="startDate" key="inventory.m169.basicInfo.seasonVat.startDate"/>
			<base:mDatePicker styleClass="verysmall" name="finishDate" key="inventory.m169.basicInfo.seasonVat.finishDate"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="verysmall" name="complicationPercent" key="inventory.m169.basicInfo.seasonVat.complicationPercent"/>
			<base:testBoxNumericEx styleClass="verysmall" name="taxPercent" key="inventory.m169.basicInfo.seasonVat.taxPercent"/>
			<base:comboBox styleClass="verysmall" name="seasionNumber" comboLoaderUrl="combo/loadAllSeason" key="inventory.m169.basicInfo.seasonVat.season"/>
		</div>
	</form>
</div>
