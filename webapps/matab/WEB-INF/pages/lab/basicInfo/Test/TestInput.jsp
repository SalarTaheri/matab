<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>
<%@page import="java.util.ResourceBundle"%>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
%>
<base:pageHeader/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="code" key="com.artonis.lab.basicInfo.test.code"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="internationalCode1" key="com.artonis.lab.basicInfo.test.internationalCode1"/>
			<base:testBox styleClass="small" name="internationalCode2" key="com.artonis.lab.basicInfo.test.internationalCode2"/>
			<base:testBox styleClass="small" name="nationalCode" key="com.artonis.lab.basicInfo.test.nationalCode"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="fullName" key="com.artonis.lab.basicInfo.test.fullName"/>
			<base:testBox styleClass="small" name="abbreviatedName" key="com.artonis.lab.basicInfo.test.abbreviatedName"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="small" name="printOrder" key="com.artonis.lab.basicInfo.test.printOrder"/>
			<base:testBoxNumericEx styleClass="small" name="virtualCode" key="com.artonis.lab.basicInfo.test.virtualCode"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="type" isListConstant="true" key="com.artonis.lab.basicInfo.test.type" comboLoaderUrl="combo/loadAllTypes"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="small" name="proportionalValue" key="com.artonis.lab.basicInfo.test.proportionalValue"/>
			<base:testBoxNumericEx styleClass="small" name="professionalPart" key="com.artonis.lab.basicInfo.test.professionalPart"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox styleClass="small" name="outpatientService" key="com.artonis.lab.basicInfo.test.outpatientService"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="small" name="responseTime" key="com.artonis.lab.basicInfo.test.responseTime"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox styleClass="small" style="width:inherit; text-align:right" name="doneInWeekDays" key="com.artonis.lab.basicInfo.test.doneInWeekDays" onChangeFunction="doneInWeekDaysChanged()"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox styleClass="small" style="width:inherit; text-align:right" name="doneSaturday" key="com.artonis.lab.basicInfo.test.saturday"/>
			<br/>
			<base:checkbox styleClass="small" style="width:inherit; text-align:right" name="doneSunday" key="com.artonis.lab.basicInfo.test.sunday"/>
			<br/>
			<base:checkbox styleClass="small" style="width:inherit; text-align:right" name="doneMonday" key="com.artonis.lab.basicInfo.test.monday"/>
			<br/>
			<base:checkbox styleClass="small" style="width:inherit; text-align:right" name="doneTuesday" key="com.artonis.lab.basicInfo.test.tuesday"/>
			<br/>
			<base:checkbox styleClass="small" style="width:inherit; text-align:right" name="doneWednesday" key="com.artonis.lab.basicInfo.test.wednesday"/>
			<br/>
			<base:checkbox styleClass="small" style="width:inherit; text-align:right" name="doneThursday" key="com.artonis.lab.basicInfo.test.thursday"/>
			<br/>
			<base:checkbox styleClass="small" style="width:inherit; text-align:right" name="doneFriday" key="com.artonis.lab.basicInfo.test.friday"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBoxAutoComplete iscomboLoaderUrlRelative="true" minLength="0" styleClass="small" name="parentTestId" dataValueField="id" dataTextField="fullName" key="com.artonis.lab.basicInfo.test.parentTest" comboLoaderUrl="combo/loadAllTestsExceptThis" />
			<base:checkbox styleClass="small" name="hasChildren" key="com.artonis.lab.basicInfo.test.hasChildren"/>
		</div>
		<div class="uk-grid uk-grid-preserve" >
			<base:comboBoxAutoComplete iscomboLoaderUrlRelative="true" minLength="0" styleClass="small" name="unitId" dataValueField="id" dataTextField="name" key="com.artonis.lab.basicInfo.test.unit" comboLoaderUrl="combo/loadAllUnits"/>
			<base:comboBoxAutoComplete iscomboLoaderUrlRelative="true" minLength="0" styleClass="small" name="measurementUnitId" dataValueField="id" dataTextField="name" key="com.artonis.lab.basicInfo.test.measurementUnit" comboLoaderUrl="combo/loadAllMeasurementUnits"/>
		</div>
	</form>

	<base:itemForm titleKeys="com.artonis.lab.basicInfo.insurance,com.artonis.lab.basicInfo.test.defineRanges,com.artonis.lab.basicInfo.test.otherProperties"
		formItemTabViewJspFiles="TestInsuranceOrganizationTabView.jsp,NormalRangeItemTabView.jsp,TestOtherPropertiesItemTabView.jsp" insertWithoutPopup="true" formItemTabInputs="TestInsuranceOrganizationTabInput,NormalRangeItemTabInput,TestOtherPropertiesItemTabInput" masterIdStr="testId"/>
</div>
<script>
	function doneInWeekDaysChanged() {
		if ($('#doneInWeekDays').prop('checked')) {
			$('#doneSaturday').prop('disabled', false);
			$('#doneSunday').prop('disabled', false);
			$('#doneMonday').prop('disabled', false);
			$('#doneTuesday').prop('disabled', false);
			$('#doneWednesday').prop('disabled', false);
			$('#doneThursday').prop('disabled', false);
			$('#doneFriday').prop('disabled', false);
		} else {
			$('#doneSaturday').prop('checked', false).prop('disabled', true);
			$('#doneSunday').prop('checked', false).prop('disabled', true);
			$('#doneMonday').prop('checked', false).prop('disabled', true);
			$('#doneTuesday').prop('checked', false).prop('disabled', true);
			$('#doneWednesday').prop('checked', false).prop('disabled', true);
			$('#doneThursday').prop('checked', false).prop('disabled', true);
			$('#doneFriday').prop('checked', false).prop('disabled', true);
		}
	}

	function callback_deserialize(data) {
		doneInWeekDaysChanged();
	}
</script>