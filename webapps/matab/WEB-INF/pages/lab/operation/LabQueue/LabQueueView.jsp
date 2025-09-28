<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageHeader/>

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="fileNumber" key="com.artonis.lab.operation.labQueue.fileNumber"/>
			<base:testBox styleClass="midsmall" name="firstName" key="com.artonis.lab.operation.labQueue.firstName"/>
			<base:testBox styleClass="midsmall" name="lastName" key="com.artonis.lab.operation.labQueue.lastName"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="midsmall" name="fromDate" key="com.artonis.lab.operation.labQueue.fromDate"/>
			<base:mDatePicker styleClass="midsmall" name="toDate" key="com.artonis.lab.operation.labQueue.toDate"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="doctorName" key="com.artonis.lab.operation.labQueue.doctorName"/>
			<base:testBox styleClass="midsmall" name="receptionNumber" key="com.artonis.lab.operation.labQueue.receptionNumber"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
		</div>
	</form>
</div>

<base:my-grid-search>
	<base:my-grid-column title='com.artonis.lab.operation.labQueue.fileNumber' field="fileNumber" width="30px"/>
	<base:my-grid-column title='com.artonis.lab.operation.labQueue.firstName' field="firstName" width="40px"/>
	<base:my-grid-column title='com.artonis.lab.operation.labQueue.lastName' field="lastName" width="40px"/>
	<base:my-grid-column title='com.artonis.lab.operation.labQueue.doctorName' field="doctorName" width="40px"/>
	<base:my-grid-column title='com.artonis.lab.operation.labQueue.receptionNumber' field="receptionNumber" width="30px"/>
	<base:my-grid-column title='com.artonis.lab.operation.labQueue.date' field="date" width="30px"/>
	<base:my-grid-function text="com.artonis.lab.operation.labQueue.respond" functionClick="respond" name="respond"/>
	<base:my-grid-function text="com.artonis.lab.operation.labQueue.printBill" functionClick="printBill" name="printBill"/>

	<base:my-grid-schema-field name="fileNumber" type="string"/>
	<base:my-grid-schema-field name="firstName" type="string"/>
	<base:my-grid-schema-field name="lastName" type="string"/>
	<base:my-grid-schema-field name="doctorName" type="string"/>
	<base:my-grid-schema-field name="receptionNumber" type="string"/>
	<base:my-grid-schema-field name="date" type="string"/>
</base:my-grid-search>

<base:footer/>

<script type="text/javascript">
	function getSearchObject() {
		var searchForm = {};
		searchForm.fileNumber = $("#fileNumber").val();
		searchForm.firstName = $("#firstName").val();
		searchForm.lastName = $("#lastName").val();
		searchForm.fromDate = $("#fromDate").val();
		searchForm.toDate = $("#toDate").val();
		searchForm.doctorName = $("#doctorName").val();
		searchForm.receptionNumber = $("#receptionNumber").val();
		return searchForm;
	}

	function respond(e) {
		var data = this.dataItem($(e.target).closest("tr"));
		window.location = "${pageContext.request.contextPath}" + "/lab/operation/labQueue/edit/" + data.id;
	}
	
	function printBill(e) {
		var data = this.dataItem($(e.target).closest("tr"));
		console.log(data);
		window.open('${pageContext.request.contextPath}/lab/operation/labRegistration/printByFactorId/' + data.factorId).print();
		//window.location = "${pageContext.request.contextPath}" + "/lab/operation/labQueue/edit/" + data.id;
	}
</script>
