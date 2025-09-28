
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
		<li id="breadcrumb-main-section"><span><%=resource.getString("clinic.cash.financeRegistration")%></span>
		</li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
		<div id="body-heade-save-div" style="display:none;">
			<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="body-heade-save"/>
			<base:aPermission key="global.crud.cancel" classNames="uk-button uk-button-danger" id="breadcrumb-main-section-cashVisitInputCancel"/>
		</div>
	</div>
</div>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="patient_id" name="patient_id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="patientName" key="com.artonis.clinic.cash.cashVisit.patientName" disabled="true" />
		</div>

		<div class="uk-grid uk-grid-preserve">
            <base:comboBox comboLoaderUrl="combo/loadAllDoctor" styleClass="small" name="doctor_id" key="com.artonis.clinic.cash.cashVisit.doctorName"></base:comboBox>
            <base:cascadeComboBox selectIndex="0" styleClass="small" name="visitCost" key="com.artonis.clinic.cash.cashVisit.doctorCost" cascadeCombo="doctor_id" comboLoaderUrl="combo/loadDoctorCost"/>
            <base:comboBox selectIndex="0" comboLoaderUrl="combo/loadAllInsurance" styleClass="small" name="insurance_id" key="com.artonis.clinic.cash.cashVisit.insuranceKind"></base:comboBox>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea name="description" key="com.artonis.clinic.cash.cashVisit.description" height="50" />
		</div>
	</form>
</div>
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {

	var reqParam='<%= request.getAttribute("comeFromPage")%>';
	var backUrl ="";
	backUrl = "${pageContext.request.contextPath}"+"/clinic/patientr/patientr/"
   	$("#breadcrumb-main-section").html(
	  		"<a href='" + backUrl + "'>" +
	    		$("#breadcrumb-main-section").html() +
	    		"</a>"
	);
	$("#breadcrumb-main-section-cashVisitInputCancel").attr("href", backUrl);
 })
	 
</script>