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
			<base:comboBox name="type" styleClass="midsmall" comboLoaderUrl="combo/loadAllType" key="inventory.m169.basicInfo.contract.type" />
			<base:comboBox name="person" styleClass="midsmall" comboLoaderUrl="combo/loadAllPerson" key="inventory.m169.basicInfo.contract.person" />
			<base:mDatePicker styleClass="midsmall" name="startDate" key="inventory.m169.basicInfo.contract.startDate" />
			<base:mDatePicker styleClass="midsmall" name="finishDate" key="inventory.m169.basicInfo.contract.finishDate"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="midsmall" name="price" key="inventory.m169.basicInfo.contract.price"/>
		   	<base:testBox styleClass="midsmall" name="contractNumber" key="inventory.m169.basicInfo.contract.contractNumber"/>
		    <base:textArea name="description" divWidthVal="40"  key="inventory.m169.basicInfo.contract.description"/>
		</div>
		</form>
</div>
