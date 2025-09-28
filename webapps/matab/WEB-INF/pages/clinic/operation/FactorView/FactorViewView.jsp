<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>
<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm" style="padding-bottom: 10px;">
		<base:hasPermission id="factorAdmin-user-permission"/>
		<input type="hidden" name="currentUserId" id="currentUserId" />
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="currentUserFullName" key="com.artonis.clinic.operation.factorView.fullName" disabled="true"/>
			<base:testBox styleClass="small" name="currentUserPersonelCode" key="com.artonis.clinic.operation.factorView.code" disabled="true"/>			
		</div>
	</form>
	<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single" sortable="false" filterable="false" groupable="true" showOperation="false">
		<base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fileNumber'  field="patientFileNumber" width="30px"/>
		<base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fullName'  field="patientFullName" width="40px"/>
		<base:my-grid-column title='com.artonis.clinic.operation.factor.totalCost'  field="totalCost" width="40px"/>
		<base:my-grid-column title='com.artonis.clinic.operation.factor.date'  field="date" width="30px"/>
		
	    <base:my-grid-schema-field name="patient_id" type="string"/>
	    <base:my-grid-schema-field name="date" type="string"/>
	    
	</base:my-grid>
	<div class="uk-grid uk-grid-preserve" align="center" style="padding-top: 5px">
		<base:buttonPermission key="fnc.btn.print" classNames="uk-button" id="clinicFactor-print-btn" onClick="javascript:myPrint()"
			style="width: 100px; color: black"/>
	</div>
</div>
<base:footer/>
<script type="text/javascript">
$(document).ready(function(){
	$("#currentUserId").val("${currentUserId}");
 	$("#currentUserFullName").val("${currentUserFullName}");
	$("#currentUserPersonelCode").val("${currentUserPersonelCode}"); 
});

function myPrint(){
	window.location = "${pageContext.request.contextPath}"+"/clinic/operation/factorView/print";
}
</script>