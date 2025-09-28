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
			<base:testBox styleClass="small" name="code" key="com.artonis.clinic.basicInfo.department.code"/>
			<base:testBox styleClass="small" name="name" key="com.artonis.clinic.basicInfo.department.name"/>
			<base:comboBoxAutoComplete name="inventoryId" styleClass="small" key="com.artonis.clinic.basicInfo.department.inventory"
				   	comboLoaderUrl="combo/loadAllInventory" dataTextField="name" dataValueField="id" minLength="0" iscomboLoaderUrlRelative="true"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox styleClass="verysmall" name="releasable" key="com.artonis.clinic.basicInfo.department.releasable" />
			<base:checkbox styleClass="verysmall" name="hasPacsConnect" key="com.artonis.clinic.basicInfo.department.hasPacsConnect" />
		</div>
	
	</form>
</div>
