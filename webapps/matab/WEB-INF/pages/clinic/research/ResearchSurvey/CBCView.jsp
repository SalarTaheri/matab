
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
	    <survey-page title="CBC" answer="answer">
	        <survey-table answer="answer" title="CBC">
	            <survey-date label="Date" field="CBC[0].Date" answer="answer" partial="true"></survey-date>
	            <survey-text label="WBC" field="CBC[0].WBC" answer="answer" partial="true"></survey-text>
	            <survey-text label="Hgb" field="CBC[0].Hgb" answer="answer" partial="true"></survey-text>
	            <survey-text label="Hct" field="CBC[0].Hct" answer="answer" partial="true"></survey-text>
	            <survey-text label="MCV" field="CBC[0].MCV" answer="answer" partial="true"></survey-text>
	            <survey-text label="MCH" field="CBC[0].MCH" answer="answer" partial="true"></survey-text>
	            <survey-text label="PLT" field="CBC[0].PLT" answer="answer" partial="true"></survey-text>
	            <survey-text label="CRP qualitative" field="CBC[0].CRP_qualitative" answer="answer" partial="true"></survey-text>
	            <survey-text label="CRP quantitative" field="CBC[0].CRP_quantitative" answer="answer" partial="true"></survey-text>
	            <survey-text label="ESR" field="CBC[0].ESR" answer="answer" partial="true"></survey-text>
	            <survey-text label="Other" field="CBC[0].Other" answer="answer" partial="true"></survey-text>
	        </survey-table>
	    </survey-page>
	</div>
</body>