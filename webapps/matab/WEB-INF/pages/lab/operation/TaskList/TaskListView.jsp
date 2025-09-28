<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm" action="search" method="GET" target="_blank">
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="verysmall" name="fromDate" key="com.artonis.lab.operation.taskList.fromDate" direction="ltr"/>
			<base:mDatePicker styleClass="verysmall" name="toDate" key="com.artonis.lab.operation.taskList.toDate" direction="ltr"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="type" isListConstant="true" key="com.artonis.lab.operation.taskList.type" comboLoaderUrl="combo/loadAllTypes" selectIndex="0"/>
			<base:comboBoxAutoComplete iscomboLoaderUrlRelative="true" minLength="0" styleClass="small" name="unitId" dataValueField="id" dataTextField="name" key="com.artonis.lab.operation.taskList.unit" comboLoaderUrl="combo/loadAllUnits"/>
		</div>
		<base:button key="com.artonis.lab.operation.taskList.search" id="searchButton" type="submit"/>
	</form>
</div>
