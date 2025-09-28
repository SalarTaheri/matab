
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
	    <survey-page title="UA" answer="answer">
	        <survey-table answer="answer" title="UA">
	            <survey-date label="Date" field="UA[0].Date" answer="answer" partial="true"></survey-date>
	            <survey-text label="WBC" field="UA[0].WBC" answer="answer" partial="true"></survey-text>
	            <survey-text label="RBC" field="UA[0].RBC" answer="answer" partial="true"></survey-text>
	            <survey-text label="Bacteria" field="UA[0].Bacteria" answer="answer" partial="true"></survey-text>
	            <survey-text label="Crystals" field="UA[0].Crystals" answer="answer" partial="true"></survey-text>
	            <survey-text label="PR" field="UA[0].PR" answer="answer" partial="true"></survey-text>
	            <survey-text label="Bili" field="UA[0].Bili" answer="answer" partial="true"></survey-text>
	            <survey-text label="Urobili" field="UA[0].Urobili" answer="answer" partial="true"></survey-text>
	            <survey-text label="Other" field="UA[0].Other" answer="answer" partial="true"></survey-text>
	        </survey-table>
	    </survey-page>
	</div>
</body>