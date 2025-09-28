<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-PanelItem">
	<input type="hidden" id="id" name="id"/>

	<div class="uk-grid uk-grid-preserve">
		<base:comboBoxAutoComplete iscomboLoaderUrlRelative="true" minLength="0" styleClass="small" name="testId" key="com.artonis.lab.basicInfo.panelItem.testName"
								   dataValueField="id" dataTextField="abbreviatedName" comboLoaderUrl="combo/loadAllTests"/>
		<base:testBoxNumericEx styleClass="small" name="printOrder" key="com.artonis.lab.basicInfo.panelItem.printOrder"/>
	</div>
</form>
