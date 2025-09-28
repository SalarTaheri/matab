<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-NormalRangeItem">
	<input type="hidden" id="id" name="id"/>
	<div class="uk-grid uk-grid-preserve">
		<base:comboBoxAutoComplete iscomboLoaderUrlRelative="true" minLength="0" styleClass="small" name="normalRangeId" key="com.artonis.lab.basicInfo.normalRange.name"
								   dataValueField="id" dataTextField="name" comboLoaderUrl="combo/loadAllNormalRanges" isListConstant="true"/>
		<base:testBox styleClass="small" name="name" key="com.artonis.lab.basicInfo.normalRange.editName"/>
		<base:checkbox styleClass="small" name="active" key="com.artonis.lab.basicInfo.normalRange.active"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:mDatePicker styleClass="small" name="date" key="com.artonis.lab.basicInfo.normalRange.date" direction="ltr"/>
		<base:mDatePicker styleClass="small" name="expireDate" key="com.artonis.lab.basicInfo.normalRange.expireDate" direction="ltr"/>
		<base:comboBox styleClass="small" name="dateBase" isListConstant="true" key="com.artonis.lab.basicInfo.normalRange.dateBase" comboLoaderUrl="combo/loadAllDateBase" />
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:comboBox styleClass="small" name="testResponse" isListConstant="true" key="com.artonis.lab.basicInfo.normalRange.testResponse" comboLoaderUrl="combo/loadAllTestResponse" />
		<base:testBox styleClass="small" name="method" key="com.artonis.lab.basicInfo.normalRange.method"/>
		<base:testBox styleClass="small" name="lotNumber" key="com.artonis.lab.basicInfo.normalRange.lotNumber"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		&nbsp;
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:comboBox styleClass="small" name="normalRangeType" isListConstant="true" key="com.artonis.lab.basicInfo.normalRange.type" comboLoaderUrl="combo/loadAllNormalRangeTypes" />
		<base:comboBoxAutoComplete iscomboLoaderUrlRelative="true" minLength="0" styleClass="small" name="normalRangeMeasurementUnitId" dataValueField="id" dataTextField="name" key="com.artonis.lab.basicInfo.normalRange.measurementUnit" comboLoaderUrl="combo/loadAllMeasurementUnits"/>
		<base:testBox styleClass="small" name="descriptions" key="com.artonis.lab.basicInfo.normalRange.descriptions"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="small" name="fromAge" key="com.artonis.lab.basicInfo.normalRange.fromAge"/>
		<base:comboBox styleClass="small" name="fromAgeUnit" isListConstant="true" key="com.artonis.lab.basicInfo.normalRange.fromAgeUnit" comboLoaderUrl="combo/loadAllAgeUnits" />
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="small" name="toAge" key="com.artonis.lab.basicInfo.normalRange.toAge"/>
		<base:comboBox styleClass="small" name="toAgeUnit" isListConstant="true" key="com.artonis.lab.basicInfo.normalRange.toAgeUnit" comboLoaderUrl="combo/loadAllAgeUnits" />
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="small" name="warningRangeMin" key="com.artonis.lab.basicInfo.normalRange.warningRangeMin"/>
		<base:testBoxNumericEx styleClass="small" name="warningRangeMax" key="com.artonis.lab.basicInfo.normalRange.warningRangeMax"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="small" name="normalRangeMin" key="com.artonis.lab.basicInfo.normalRange.normalRangeMin"/>
		<base:testBoxNumericEx styleClass="small" name="normalRangeMax" key="com.artonis.lab.basicInfo.normalRange.normalRangeMax"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="small" name="possibleRangeMin" key="com.artonis.lab.basicInfo.normalRange.possibleRangeMin"/>
		<base:testBoxNumericEx styleClass="small" name="possibleRangeMax" key="com.artonis.lab.basicInfo.normalRange.possibleRangeMax"/>
	</div>
</form>

<script>
	function callback_parameter_map_normalRangeId (options) {
		options.testId = $('#mainForm #id').val();
		return options;
	}

	function callback_select_element_normalRangeId (e) {
		var item = e.item;
		var dataItem = this.dataItem(e.item.index());
		$("#name").val(dataItem.name);
		$("#active").prop('checked', dataItem.active);
		$("#date").val(dataItem.date);
		$("#dateBase_Comb").data("kendoComboBox").value(dataItem.dateBase);
		$("#dateBase").val(dataItem.dateBase);
		$("#testResponse_Comb").data("kendoComboBox").value(dataItem.testResponse);
		$("#testResponse").val(dataItem.testResponse);
		$("#method").val(dataItem.method);
		$("#lotNumber").val(dataItem.lotNumber);
	}
/*
	function callback_dataBound_normalRangeId (e) {
		if (this.dataSource.view().length == 0) {
			var dateConverter = new jDateFunctions();
			$('#name').val(dateConverter.getPCalendarDate(dateConverter.getJulianDay(new Date())).year);
		}
	}
*/
</script>