<%@page import="com.artonis.hrm.core.service.util.HrmCoreServiceUtil"%>
<%@ page import="com.artonis.core.base.core.Date"%>
<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	Date curDate = new Date(System.currentTimeMillis());
	String curStringDate = curDate.toString();
	boolean isEmployeeDoctor = HrmCoreServiceUtil.isEmployeeWorkingGroupDoctor(GlobalVariable.getEmployee().getWorkingGroup());
	Long employeeId = GlobalVariable.getEmployee().getId();
%>
<base:pageHeaderTitle />

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="doctorId" key="his.patient.doctorName" comboLoaderUrl="combo/loadAllDoctor" styleClass="small" />
			<base:comboBox name="insuranceId" key="com.artonis.clinic.operation.factorInsurance.insurance" comboLoaderUrl="combo/loadAllInsurance" styleClass="small" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small" />
			<base:mDatePicker name="toDate" key="global.toDate" styleClass="small" />
		</div>

		<base:my-grid-search showMultipleDelete="false" showOperation="false" scrollable="true">
			<base:my-grid-column title="com.artonis.clinic.operation.factorInsurance.doctor" field="doctorName" width="50px" />
			<base:my-grid-column title="com.artonis.clinic.operation.factorInsurance.insurance" field="insuranceName" width="80px" />
			<base:my-grid-column title="com.artonis.clinic.operation.factorInsurance.doctorPortionInsurance" field="doctorPortionInsuranceString" width="80px" />
			<base:my-grid-column title="com.artonis.clinic.operation.factorInsurance.clinicPortionInsurance" field="clinicPortionInsuranceString" width="50px" />

			<base:my-grid-schema-field name="doctorName" type="string" />
			<base:my-grid-schema-field name="insuranceName" type="string" />
			<base:my-grid-schema-field name="doctorPortionInsuranceString" type="string" />
			<base:my-grid-schema-field name="clinicPortionInsuranceString" type="string" />
		</base:my-grid-search>
	</form>
</div>

<base:footer />

<script type="text/javascript">
    $(document).ready(function() {
    	$("#fromDate").val("<%=curStringDate%>");
        $("#toDate").val("<%=curStringDate%>");
		var isEmployeeDoctor=<%=isEmployeeDoctor%>;
		var employeeId=<%=employeeId%>;
		if(isEmployeeDoctor==true){
			$("#doctorId").val(employeeId);
			$("#doctorId_Comb").data("kendoComboBox").value(employeeId);
			$("#doctorId_Comb").data("kendoComboBox").enable(false);;
		}

	});

	function resetForm(){
		$("#fromDate").val("<%=curStringDate%>");
		$("#toDate").val("<%=curStringDate%>");
	}

	function getSearchObject() {
		var object = {};
		object.fromDate = $("#fromDate").val();
		object.toDate = $("#toDate").val();
		object.doctorId = $("#doctorId").val();
		object.insuranceId = $("#insuranceId").val();
		return object;
	}
</script>
