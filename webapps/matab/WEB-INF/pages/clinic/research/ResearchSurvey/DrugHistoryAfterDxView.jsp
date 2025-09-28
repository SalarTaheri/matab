
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
	    <survey-page title="Drug History after Dx" answer="answer">
	        <survey-table answer="answer" title="DrugHistory">
	            <survey-text label="Drug Name" field="DrugHistory[0].Drug_Name" answer="answer" partial="true"></survey-text>
	            <survey-text label="Dose(mg/Day)" field="DrugHistory[0].Dose" answer="answer" partial="true"></survey-text>
	            <survey-date label="Start Date yy/mm/dd" field="DrugHistory[0].Start_Date" answer="answer" partial="true"></survey-date>
	            <survey-date label="End Date yy/mm/dd" field="DrugHistory[0].End_Date" answer="answer" partial="true"></survey-date>
	            <survey-text label="Duration of Use" field="DrugHistory[0].Duration_of_Use" answer="answer" partial="true"></survey-text>
	            <survey-text label="Intolerance Y/N/U" field="DrugHistory[0].Intolerance" answer="answer" partial="true"></survey-text>
	            <survey-text label="Intolerance Cause" field="DrugHistory[0].Intolerance_Cause" answer="answer" partial="true"></survey-text>
	        </survey-table>
	    </survey-page>
	</div>
</body>