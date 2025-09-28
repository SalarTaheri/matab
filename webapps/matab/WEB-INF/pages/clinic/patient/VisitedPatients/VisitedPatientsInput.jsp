
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
		<button class="uk-button uk-button-success" id="body-heade-create"
			type="button">
			<%=resource.getString("global.crud.new")%>
		</button>
		<div id="body-heade-save-div" style="display:none;">
			<button class="uk-button uk-button-success" id="body-heade-save"
				type="button">
				<%=resource.getString("global.crud.save")%>
			</button>
			
			/ <a href="" id="breadcrumb-main-section-visitedPatientInputCancel"><%=resource.getString("global.crud.cancel")%></a>
		</div>
	</div>
</div>

<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="patient_id" name="patient_id" >
		<input type="hidden" id="doctor_id" name="doctor_id" >
		
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="patientName" key="com.artonis.clinic.cash.cashVisit.patientName" disabled="true" />
			<base:testBox styleClass="small" name="patientFileNumber" key="com.artonis.clinic.cash.cashVisit.fileNumber" disabled="true" />
			<base:testBox name="doctorName" key="com.artonis.clinic.cash.cashVisit.doctorName" styleClass="small" disabled="true"/>
		</div>

		<div class="uk-grid uk-grid-preserve">
            <base:testBoxNumeric name="visitCost" key="com.artonis.clinic.cash.cashVisit.doctorCost" styleClass="small" disabled="true" format="#,"/>
            <base:testBox name="insurance" key="com.artonis.clinic.cash.cashVisit.insuranceKind" styleClass="small" disabled="true"/>
            <base:testBoxNumeric name="discount" key="com.artonis.clinic.cash.cashVisit.discount" styleClass="small" format="#,"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
<%--			<base:testBoxNumeric name="returnCost" key="com.artonis.clinic.cash.cashVisit.returnCost" styleClass="small" format="#,"/>--%>
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
	backUrl = "${pageContext.request.contextPath}"+"/clinic/cash/visitedPatients/"
   	$("#breadcrumb-main-section").html(
	  		"<a href='" + backUrl + "'>" +
	    		$("#breadcrumb-main-section").html() +
	    		"</a>"
	);
	$("#breadcrumb-main-section-visitedPatientInputCancel").attr("href", backUrl);
 })
	 
</script>