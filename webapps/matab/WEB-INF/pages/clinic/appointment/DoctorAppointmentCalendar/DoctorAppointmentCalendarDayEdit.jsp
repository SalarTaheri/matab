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
			<base:timePicker name="startTime" key="com.artonis.clinic.appointment.appointmentConfig.startTime" interval="5" styleClass="small"/>
			<base:timePicker name="endTime" key="com.artonis.clinic.appointment.appointmentConfig.endTime" interval="5" styleClass="small"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumeric name="reminder" key="com.artonis.clinic.appointment.timeInDay.reminder" styleClass="small" />
			<base:testBoxNumeric name="internetReminder" key="com.artonis.clinic.appointment.timeInDay.internetReminder" styleClass="small" />
		</div>
	</form>
</div>

<script type="application/javascript">

    function callback_reminder(){
    }

    function callback_internetReminder (){
    }

    function customFormSave() {
        var tmp = {};
        tmp.id = $("#id").val();
        tmp.startTime = $("#startTime").val();
        tmp.endTime = $("#endTime").val();
        tmp.reminder = $("#reminder").val();
        tmp.internetReminder = $("#internetReminder").val();
        //
        jQuery.ajax({
            url: "<c:url value='/clinic/appointment/doctorAppointmentCalendar/updateTimeInDay' />",
            type: "POST",
            data: JSON.stringify(tmp),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.state == "success") {
                    window.location.href = "<c:url value='/clinic/appointment/doctorAppointmentCalendar/' />";
                } else if (result.state == "error") {
					alertify.error(result.message);
				}
            },
            error: function (result) {
                if (result.status == 401) {
                    window.location.href = "";
                }
            }
        });
    }

</script>