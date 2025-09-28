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
			<base:timePicker name="fromTime" key="com.artonis.clinic.appointment.appointmentConfig.startTime" styleClass="small"/>
			<base:timePicker name="toTime" key="com.artonis.clinic.appointment.appointmentConfig.endTime" styleClass="small"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumeric name="timeDistance" key="com.artonis.clinic.appointment.appointmentConfig.periodTime" styleClass="small" />
			<base:testBoxNumeric name="capacity" key="com.artonis.clinic.appointment.weekTemplate.capacity" styleClass="small" />
		</div>
	</form>
</div>
