<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<base:pageHeader />

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:multiSelect serverFilter="true" name="employeeIds" styleClass="small" multiSelectLoaderUrl="combo/loadAllDoctor" key="com.artonis.clinic.report.fullName" />
			<base:mDatePicker name="fromDate" key="com.artonis.clinic.report.fromDate" styleClass="small" />
			<base:mDatePicker name="toDate" key="com.artonis.clinic.report.toDate" styleClass="small" />
		</div>
		<div class="uk-grid uk-grid-preserve" style="margin-bottom: 10px;">
			<base:multiSelect name="groupIds" styleClass="small" multiSelectLoaderUrl="combo/loadGroup" serverFilter="true" key="com.artonis.clinic.report.groupName" />
			<base:multiSelect name="serviceIds" styleClass="small" multiSelectLoaderUrl="combo/loadAllService" serverFilter="true" key="com.artonis.clinic.report.serviceName" />
			<base:multiSelect name="serviceItemIds" styleClass="small" multiSelectLoaderUrl="/combo/loadAllServiceItem" key="com.artonis.clinic.report.serviceItemName" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox name="showCurrentContract" key="com.artonis.clinic.report.showCurrentContract" />
		</div>
		<base:my-grid-search showOperation="false">
			<base:my-grid-column title='com.artonis.clinic.report.fullName' field="fullName" width="50px" />
			<base:my-grid-column title='com.artonis.clinic.report.fromDate' field="fromDate" width="30px" />
			<base:my-grid-column title='com.artonis.clinic.report.toDate' field="toDate" width="30px" />
			<base:my-grid-column title='com.artonis.clinic.report.groupName' field="groupName" width="40px" />
			<base:my-grid-column title='com.artonis.clinic.report.serviceName' field="serviceName" width="50px" />
			<base:my-grid-column title='com.artonis.clinic.report.serviceItemName' field="serviceItemName" width="50px" />
			<base:my-grid-column title='com.artonis.clinic.report.percent' field="percent" width="30px" />
			<base:my-grid-column title='com.artonis.clinic.report.type' field="typeStr" width="30px" />
			<base:my-grid-column title='com.artonis.clinic.report.price' field="price" width="30px" />
		</base:my-grid-search>
	</form>
</div>

<base:footer />

<script type="text/javascript">
	$(document).ready(function () {
		$("#showCurrentContract").prop('checked', 'checked');
	});
	function getSearchObject() {
		var searchObject = {};
		searchObject.employeeIds = $("#employeeIds_multiSelect").val();
		searchObject.fromDate = $("#fromDate").val();
		searchObject.toDate = $("#toDate").val();
		searchObject.groupIds = $("#groupIds_multiSelect").val();
		searchObject.serviceIds = $("#serviceIds_multiSelect").val();
		searchObject.serviceItemIds = $("#serviceItemIds_multiSelect").val();
		searchObject.showCurrentContract = $("#showCurrentContract").prop('checked');
		return searchObject;
	}
</script>

