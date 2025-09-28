
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
	    <survey-page title="SC" answer="answer">
	        <survey-table answer="answer" title="SC">
	            <survey-date label="Date" field="SC[0].Date" answer="answer" partial="true"></survey-date>
	            <survey-text label="Type" field="SC[0].Type" answer="answer" partial="true"></survey-text>
	            <survey-text label="Other" field="SC[0].Other" answer="answer" partial="true"></survey-text>
	        </survey-table>
	    </survey-page>
	</div>
</body>