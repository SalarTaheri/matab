<%@ page import="java.util.ResourceBundle" %>
<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String areUShure = resource.getString("action.alert.areYouSure.delete");
	String menuSysCode = String.valueOf(request.getAttribute("menuSystemCode"));
%>

<base:pageHeader></base:pageHeader>

<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 4px; ">
    <form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="doctorId" key="com.artonis.clinic.appointment.doctroAppointmentCalendar.doctor_id" comboLoaderUrl="combo/loadAllDoctor" styleClass="small" />
			<base:comboBox name="departmentId" key="com.artonis.clinic.appointment.doctroAppointmentCalendar.departmentId" comboLoaderUrl="combo/loadAllDepartment" styleClass="small" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker name="startDate" key="com.artonis.clinic.appointment.doctroAppointmentCalendar.fromDate" styleClass="small"/>
			<base:mDatePicker name="endDate" key="com.artonis.clinic.appointment.doctroAppointmentCalendar.toDate" styleClass="small"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:timePicker name="fromTime" key="calendar.fromTime" interval="5" styleClass="small"/>
			<base:timePicker name="toTime" key="calendar.toTime" interval="5" styleClass="small"/>
		</div>
	</form>
</div>

<% if (GlobalVariable.getButtonContainer(menuSysCode, "deletingTimeInDay")) { %>

<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 4px; ">
	<div class="uk-grid uk-grid-preserve">
		<base:mDatePicker name="startDateTimeInDay" key="com.artonis.clinic.appointment.doctroAppointmentCalendar.fromDate" styleClass="small"/>
		<base:mDatePicker name="endDateTimeInDay" key="com.artonis.clinic.appointment.doctroAppointmentCalendar.toDate" styleClass="small"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:button id="deleteTimeInDay" key="com.artonis.clinic.appointment.doctroAppointmentCalendar.timeInDate" />
	</div>
</div>
<%}%>

<base:my-grid-search>
    <base:my-grid-column title='clinic.appointment.doctorAppointmentCalendar.doctorNameAndFam'  field="doctorNameAndFam" width="50px"/>
    <base:my-grid-column title='com.artonis.clinic.appointment.doctroAppointmentCalendar.departmentId'  field="department.name" width="50px"/>
    <base:my-grid-column title='clinic.appointment.doctorAppointmentCalendar.appPersionDate'  field="appPersionDate" width="50px"/>
    <base:my-grid-column title='clinic.appointment.doctorAppointmentCalendar.fromTime'  field="timeInDayObj.startTime" width="50px"/>
    <base:my-grid-column title='clinic.appointment.doctorAppointmentCalendar.toTime'  field="timeInDayObj.endTime" width="50px"/>
</base:my-grid-search>

<base:footer/>

<script type="text/javascript">
	function getSearchObject() {
		var doctorAppointmentForm = {};
		doctorAppointmentForm.doctorId = $("#doctorId").val();
		doctorAppointmentForm.departmentId = $("#departmentId").val();
		doctorAppointmentForm.startDate = $("#startDate").val();
		doctorAppointmentForm.endDate = $("#endDate").val();
		doctorAppointmentForm.fromTime = $("#fromTime").val();
		doctorAppointmentForm.toTime = $("#toTime").val();
		return doctorAppointmentForm;
	}

	function searchGrid_before_edit_callback(data){
		window.location = basePath + "edit/" + data.timeInDayObj.id;
		return "false";
	}

	function searchGrid_before_delete_callback(data) {
		var areUShure = "<%=areUShure%>";
		alertify.confirm(areUShure, function (e) {
			if (e) {
				jQuery.ajax({
					url: basePath + "removeTimeInDay",
					type: "POST",
					data: JSON.stringify({id: data.timeInDayObj.id}),
					dataType: "json",
					contentType: "application/json; charset=utf-8",
					success: function (result) {
						if (result.state == "success") {
							$("#searchGrid").data("kendoGrid").dataSource.read();
							alertify.success(result.message);
						} else if (result.state == "error") {
							alertify.error(result.message);
						} else {
							alertify.error("Something is not good! O_o");
						}
					},
					error: function (result) {
						if (result.status == 401) {
							window.location.href = "";
						}
					}
				});
			}
		});
		return "false";
	}

    $('#deleteTimeInDay').on("click", function (e) {
        var timeInDayWithDate = {};
        timeInDayWithDate.startDate = $("#startDateTimeInDay").val();
        timeInDayWithDate.endDate = $("#endDateTimeInDay").val();
        jQuery.ajax({
            url: basePath + "removeTimeInDayWithDate",
            type: "POST",
            data: JSON.stringify(timeInDayWithDate),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.state == "success") {
                    alertify.success(result.message);
                } else if (result.state == "error") {
                    for(var i=0; i<result.errors.length; i++){
                        alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                    }
                } else {
                    lertify.error("Something is not good! O_o");
                }
            },
            error: function (result) {
                if (result.status == 401) {
                    window.location.href = "";
                }
            }
        });

    });
</script>