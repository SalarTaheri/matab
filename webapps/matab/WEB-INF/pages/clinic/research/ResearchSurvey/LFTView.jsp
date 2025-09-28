
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
	    <survey-page title="LFT" answer="answer">
	        <survey-table answer="answer" title="LFT">
	            <survey-date label="Date" field="LFT[0].Date" answer="answer" partial="true"></survey-date>
	            <survey-text label="Bil-T" field="LFT[0].Bil_T" answer="answer" partial="true"></survey-text>
	            <survey-text label="bil-D" field="LFT[0].bil_D" answer="answer" partial="true"></survey-text>
	            <survey-text label="AST" field="LFT[0].AST" answer="answer" partial="true"></survey-text>
	            <survey-text label="ALT" field="LFT[0].ALT" answer="answer" partial="true"></survey-text>
	            <survey-text label="ALK-pk" field="LFT[0].ALK_pk" answer="answer" partial="true"></survey-text>
	            <survey-text label="PT" field="LFT[0].PT" answer="answer" partial="true"></survey-text>
	            <survey-text label="PTT" field="LFT[0].PTT" answer="answer" partial="true"></survey-text>
	            <survey-text label="INR" field="LFT[0].INR" answer="answer" partial="true"></survey-text>
	            <survey-text label="Albumin (gr/dl)" field="LFT[0].Albumin" answer="answer" partial="true"></survey-text>
	            <survey-text label="Pr-Total" field="LFT[0].Pr_Total" answer="answer" partial="true"></survey-text>
	            <survey-text label="GGT" field="LFT[0].GGT" answer="answer" partial="true"></survey-text>
	            <survey-text label="Amylase" field="LFT[0].Amylase" answer="answer" partial="true"></survey-text>
	            <survey-text label="Other" field="LFT[0].Other" answer="answer" partial="true"></survey-text>
	        </survey-table>
	    </survey-page>
	</div>
</body>