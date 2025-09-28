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
			<base:comboBoxAutoComplete dataTextField="userName" name="userId" minLength="0" dataValueField="id" iscomboLoaderUrlRelative="true" 
				comboLoaderUrl="/combo/loadAllUser"	key="com.artonis.clinic.appointment.appointmentPermission.user" hasTemplate="false"/>
		</div>				
	</form>
	
	<base:itemForm titleKeys="com.artonis.clinic.appointment.appointmentPermissionItem" insertWithoutPopup="true"  
			formItemTabViewJspFiles="AppointmentPermissionItemTabView.jsp" formItemTabInputs="AppointmentPermissionItemTabInput" masterIdStr="appointmentPermissionId"/>

</div>
