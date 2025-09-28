
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%><!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<html>
<head>
	<base:surveyImport></base:surveyImport>
</head>   
    
<body ng-app="survey" ng-controller="surveyTestPageController">
	<input type="hidden" id="patientId" value="${patientId}">
	<div class="" ng-init="answer = {}" >
	    <survey-page title="SE" answer="answer">
	        <survey-table answer="answer" title="SE">
	            <survey-date label="Date" field="SE[0].Date" answer="answer" partial="true"></survey-date>
	            <survey-text label="WBC" field="SE[0].WBC" answer="answer" partial="true"></survey-text>
	            <survey-text label="RBC" field="SE[0].RBC" answer="answer" partial="true"></survey-text>
	            <survey-text label="Occult Blood" field="SE[0].Occult_Blood" answer="answer" partial="true"></survey-text>
	            <survey-text label="Oval Parasite" field="SE[0].Oval_Parasite" answer="answer" partial="true"></survey-text>
	            <survey-text label="Other" field="SE[0].Other" answer="answer" partial="true"></survey-text>
	        </survey-table>
	    </survey-page>
	</div>
</body>