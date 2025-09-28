
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%><!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<html>
<head>
</head>   
<base:surveyImport></base:surveyImport>    
<body ng-app="survey" ng-controller="surveyTestPageController">
	<input type="hidden" id="patientId" value="${patientId}">
	<div class="" ng-init="answer = {}" >
	    <survey-page title="Ascitis" answer="answer">
	        <survey-table answer="answer" title="Ascitis">
	            <survey-date label="Date" field="Ascitis[0].Date" answer="answer" partial="true"></survey-date>
	            <survey-text label="Pr" field="Ascitis[0].Pr" answer="answer" partial="true"></survey-text>
	            <survey-text label="GLU" field="Ascitis[0].GLU" answer="answer" partial="true"></survey-text>
	            <survey-text label="WBC" field="Ascitis[0].WBC" answer="answer" partial="true"></survey-text>
	            <survey-text label="PMC" field="Ascitis[0].PMC" answer="answer" partial="true"></survey-text>
	            <survey-text label="MN" field="Ascitis[0].MN" answer="answer" partial="true"></survey-text>
	            <survey-text label="RBC" field="Ascitis[0].RBC" answer="answer" partial="true"></survey-text>
	            <survey-text label="LDH" field="Ascitis[0].LDH" answer="answer" partial="true"></survey-text>
	            <survey-text label="SAAG" field="Ascitis[0].SAAG" answer="answer" partial="true"></survey-text>
	            <survey-text label="Other" field="Ascitis[0].Other" answer="answer" partial="true"></survey-text>
	        </survey-table>
	    </survey-page>
	</div>
</body>