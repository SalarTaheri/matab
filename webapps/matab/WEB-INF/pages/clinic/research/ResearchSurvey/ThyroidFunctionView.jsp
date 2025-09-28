
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
	    <survey-page title="Thyroid Function" answer="answer">
	        <survey-table answer="answer" title="Thyroid Function">
	            <survey-date label="Date" field="Thyroid_Function[0].Date" answer="answer" partial="true"></survey-date>
	            <survey-text label="T3" field="Thyroid_Function[0].T3" answer="answer" partial="true"></survey-text>
	            <survey-text label="T4" field="Thyroid_Function[0].T4" answer="answer" partial="true"></survey-text>
	            <survey-text label="FT3" field="Thyroid_Function[0].FT3" answer="answer" partial="true"></survey-text>
	            <survey-text label="FT4" field="Thyroid_Function[0].FT4" answer="answer" partial="true"></survey-text>
	            <survey-text label="TSH" field="Thyroid_Function[0].TSH" answer="answer" partial="true"></survey-text>
	            <survey-text label="T3RU" field="Thyroid_Function[0].T3RU" answer="answer" partial="true"></survey-text>
	            <survey-text label="Other" field="Thyroid_Function[0].Other" answer="answer" partial="true"></survey-text>
	        </survey-table>
	    </survey-page>
	</div>
</body>