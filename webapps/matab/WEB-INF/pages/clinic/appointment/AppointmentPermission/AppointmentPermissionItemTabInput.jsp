<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-AppointmentPermissionItem" >
	<input  type="hidden" id="id" name="id" >
	<div class="uk-grid uk-grid-preserve">
		<base:comboBox name="doctorId"  key="his.patient.doctorName" comboLoaderUrl="combo/loadAllDoctor" styleClass="small"/>
		<base:comboBox styleClass="small" name="allowType" key="com.artonis.clinic.appointment.appointmentPermissionItem.allowEdit"
			 comboLoaderUrl="combo/loadAppointmentPermissionAllowType"/>
	</div>
</form>
