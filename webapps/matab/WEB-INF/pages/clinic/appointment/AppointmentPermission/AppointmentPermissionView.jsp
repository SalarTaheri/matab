<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader/>
 <base:button  key="com.appointmentNew.updatePatientAppointmentTurn" style="background-color:red;" id="updatePatientAppointment" styleClass="uk-button uk-button-danger"/>

<div class="uk-container uk-container-center my-uk-container" >

<form class="uk-form" id="mainForm">

	<div class="uk-grid uk-grid-preserve" style="padding-bottom: 10px;">
		<base:comboBoxAutoComplete dataTextField="userName" name="userId" minLength="0" dataValueField="id" iscomboLoaderUrlRelative="true" 
				comboLoaderUrl="/combo/loadAllUser"	key="com.artonis.clinic.appointment.appointmentPermission.user" hasTemplate="false"/>
	</div>
		
	<base:my-grid-search >
		<base:my-grid-column title='com.artonis.clinic.appointment.appointmentPermission.user' field="usernameText" width="50px"/>
	</base:my-grid-search>
	
</form>

</div>

<base:footer/>

<script type="text/javascript">
function getSearchObject(){
	var jsObj = {};
	jsObj.userId = $("#userId").val();
	return jsObj;
}

$(function () {
    $('#updatePatientAppointment').on("click", function (e) {
    	console.log('wait');
    	$.getJSON("<c:url value='/' />" + "clinic/appointment/appointmentPermission/updatePatientAppointment" , function(data) {
    		alert('finish');
    		console.log('finish');
         }).fail(function() {
     		alert('error');
    		console.log('error');
    	 });
    });
});

</script>
