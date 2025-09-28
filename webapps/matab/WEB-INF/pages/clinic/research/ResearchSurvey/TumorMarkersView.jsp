
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
	    <survey-page title="Tumor Markers" answer="answer">
	        <survey-table answer="answer" title="Tumor Markers">
	            <survey-date label="Date" field="Tumor_Markers[0].Date" answer="answer" partial="true"></survey-date>
	            <survey-text label="AFP" field="Tumor_Markers[0].AFP" answer="answer" partial="true"></survey-text>
	            <survey-text label="CEA" field="Tumor_Markers[0].CEA" answer="answer" partial="true"></survey-text>
	            <survey-text label="CA19-9" field="Tumor_Markers[0].CA19_9" answer="answer" partial="true"></survey-text>
	            <survey-text label="CA125" field="Tumor_Markers[0].CA125" answer="answer" partial="true"></survey-text>
	            <survey-text label="Other" field="Tumor_Markers[0].Other" answer="answer" partial="true"></survey-text>
	        </survey-table>
	    </survey-page>
	</div>
</body>