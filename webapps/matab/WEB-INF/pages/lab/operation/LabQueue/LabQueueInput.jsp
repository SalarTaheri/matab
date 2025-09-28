<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageHeader6button/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id">

		<div class="uk-grid uk-grid-preserve">
			<base:testBox readOnly="true" styleClass="small" name="fileNumber" key="com.artonis.lab.operation.labQueue.fileNumber"/>
			<base:testBox readOnly="true" styleClass="small" name="firstName" key="com.artonis.lab.operation.labQueue.firstName"/>
			<base:testBox readOnly="true" styleClass="small" name="lastName" key="com.artonis.lab.operation.labQueue.lastName"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox readOnly="true" styleClass="small" name="age" key="com.artonis.lab.operation.labQueue.age"/>
			<base:testBox readOnly="true" styleClass="small" name="birthYear" key="com.artonis.lab.operation.labQueue.birthYear"/>
			<base:testBox readOnly="true" styleClass="small" name="sexName" key="com.artonis.lab.operation.labQueue.sex"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox readOnly="true" styleClass="small" name="date" key="com.artonis.lab.operation.labQueue.date"/>
			<base:testBox readOnly="true" styleClass="small" name="receptionNumber" key="com.artonis.lab.operation.labQueue.receptionNumber"/>
			<base:testBox readOnly="true" styleClass="small" name="doctorName" key="com.artonis.lab.operation.labQueue.doctorName"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox readOnly="true" styleClass="small" name="insuranceOrganizationName" key="com.artonis.lab.operation.labQueue.insuranceOrganization"/>
			<base:testBox readOnly="true" styleClass="small" name="medicalHistory" key="com.artonis.lab.operation.labQueue.medicalHistory"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox readOnly="true" styleClass="small" name="printCount" key="com.artonis.lab.operation.labQueue.printCount"/>
			<base:testBox readOnly="true" styleClass="small" name="debt" key="com.artonis.lab.operation.labQueue.debt"/>
			<base:checkbox onChangeFunction="canChangeChanged()" styleClass="small" name="canChange" key="com.artonis.lab.operation.labQueue.canChange"/>
		</div>
	</form>
	<div id="tabs">
		<ul class="uk-tab" data-uk-tab data-uk-switcher="{connect:'#result-tabs'}">
			<% int i = 0; %>
			<c:forEach items="${units}" var="unit">
				<li data-tab-name="${unit.id}" class="<%= (i == 0 ? "uk-active" : "") %>"><a href="">${unit.name}</a></li>
				<% i++; %>
			</c:forEach>
		</ul>
		<ul id="result-tabs" class="uk-switcher" style="background-color: rgb(191,206,214); border: 1px; border-color: black; border-style: dotted; display: block">
			<% int j = 0; %>
			<c:forEach items="${testAndUnits}" var="testAndUnit">
				<% System.out.println(j++);%>
				<li data-tab-name="${testAndUnit.id}" data-tab-body-name="${testAndUnit.id}_body">
					<div class="uk-containerX">
						<table class="result-table">
							<tr>
								<th>
									pathology
								</th>
								<th>
									Descriptions
								</th>
								<th>
									Warning Range
								</th>
								<th>
									Possible Range
								</th>
								<th>
									Measurement Unit
								</th>
								<th>
									Normal Range
								</th>
								<th>
									Result
								</th>
								<th>
									Test Name
								</th>
								<th>
									Code
								</th>
							</tr>
							<c:forEach items="${testAndUnit.testResults}" var="testResult">
								<tr>
									<td>
											<button>aaa</button>
									</td>
									<td>
											${testResult.descriptions}
									</td>
									<td>
											${testResult.warningRangeMin} - ${testResult.warningRangeMax}
									</td>
									<td>
											${testResult.possibleRangeMin} - ${testResult.possibleRangeMax}
									</td>
									<td>
											${testResult.measurementUnitName}
									</td>
									<td>
											${testResult.normalRangeMin} - ${testResult.normalRangeMax}
									</td>
									<td>
										<input type="text" value="${testResult.result}" id="${testResult.id}" name="${testResult.id}" class="result-input"/>
									</td>
									<td>
											${testResult.testName}
									</td>
									<td>
											${testResult.testCode}
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>

<script>
	var data = {};

	function customFormSave() {
		$('.result-input').each(function () {
			data[this.id] = this.value;
		});

		data.id = $('#id').val();

		$.ajax({
			url: getBaseUrl() + 'save',
			type: 'POST',
			dataType: 'json',
			data: data,
			success: function (result) {
				if (result.state == 'error') {
					for (var i = 0; i < result.errors.length; i++) {
						alertify.error(result.errors[i].Field + ':  ' + result.errors[i].Message);
					}
				} else if (result.state == 'success') {
					alertify.success(result.message);
				}
			},
			error: function (result) {
				if (result.status == 401) {
					window.location.href = '';
				}
			}
		});
	}

	function canChangeChanged() {
		data.canChange = $('#canChange').prop('checked');
		if (data.canChange) {
			$('.result-input').prop('disabled', false);
		} else {
			$('.result-input').prop('disabled', true);
		}
	}

	function callback_deserialize() {
		canChangeChanged();
	}

	$('#body-heade-print-w6button').click(function() {
		window.open(getBaseUrl() + 'printResult/' + $('#id').val()).print();
	});
</script>
<style>
	#tabs {
		margin-top: 10px;
	}

	.uk-tab > li > a {
		text-shadow: none;
	}

	.result-table {
		width: 100%;
	}

	.result-table th, .result-table td {
		text-align: center;
		padding: 5px 0 5px 0;
	}

	.result-table tr:nth-child(even) {
		background-color: rgb(201, 218, 238);
	}
</style>