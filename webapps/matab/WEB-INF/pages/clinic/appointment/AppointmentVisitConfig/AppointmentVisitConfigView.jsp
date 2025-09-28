
<%@page import="java.util.ResourceBundle"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%><%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	request.setAttribute("basePath", basePath);
	String createUrl = basePath + "create";
 %>
 <input name="loadedId" type="hidden" id="loadedId" />
 
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=resource.getString("com.artonis.clinic.appointment.appointmentConfig")%></span>
		</li>
	</ul>
	<div id="header-toolbar">
		<div id="body-heade-save-div" style="display">
			<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="body-heade-save"></base:buttonPermission>
		</div>
	</div>
</div>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:timePicker name="startTime" key="com.artonis.clinic.appointment.appointmentConfig.startTime" styleClass="small"/>
			<base:timePicker name="endTime" key="com.artonis.clinic.appointment.appointmentConfig.endTime" styleClass="small"/>
			<base:testBoxNumeric name="distance" key="com.artonis.clinic.appointment.appointmentConfig.periodTime" styleClass="small" />
		</div>
	</form>
</div>
<script>
	if("${appointmentConfig.startTime}"!=""){
		$("#startTime").val("${appointmentConfig.startTime}");
		$("#endTime").val("${appointmentConfig.endTime}");
		$("#distance").val("${appointmentConfig.distance}"/(60*1000));
		
		$('#startTime').prop("disabled", true);
		$('#endTime').prop("disabled", true);
		$('#distance').prop("disabled", true);
		
	}
</script>