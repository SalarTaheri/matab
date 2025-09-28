<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
		<div id="body-heade-save-div" style="display">
			<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="body-heade-save"></base:buttonPermission>
		</div>
	</div>
</div>
<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create" />
<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="small" name="fromDate" key="com.artonis.clinic.onlineAppointment.sendData.fromDate" />
			<base:mDatePicker styleClass="small" name="toDate" key="com.artonis.clinic.onlineAppointment.sendData.toDate" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="doctor_id" key="com.artonis.clinic.onlineAppointment.sendData.doctor" comboLoaderUrl="combo/loadAllDoctor" styleClass="small" />
			<base:comboBox styleClass="small" name="department_id" comboLoaderUrl="combo/loadDepartment" key="com.artonis.clinic.onlineAppointment.sendData.department"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
		</div>
		<div dir="ltr" align="center" style="background: rgb(216, 216, 216);">
			<base:buttonPermission key="com.artonis.clinic.onlineAppointment.sendData" id="sendOnlineAppointmentButton" classNames="uk-button uk-button-success" onClick="sendData()" />
		</div>
	</form>
</div>
<script>
	function sendData() {
		saveFormUrl('mainForm', '<c:url value='/' />' + 'system/onlineAppointment/sendData/', false);
	}
</script>