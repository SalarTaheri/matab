
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
	    <survey-page title="Biochemistry" answer="answer">
	        <survey-table answer="answer" title="Biochemistry">
	            <survey-date label="Date" field="Biochemistry[0].Date" answer="answer" partial="true"></survey-date>
	            <survey-text label="Na" field="Biochemistry[0].Na" answer="answer" partial="true"></survey-text>
	            <survey-text label="K" field="Biochemistry[0].K" answer="answer" partial="true"></survey-text>
	            <survey-text label="Ca" field="Biochemistry[0].Ca" answer="answer" partial="true"></survey-text>
	            <survey-text label="P" field="Biochemistry[0].P" answer="answer" partial="true"></survey-text>
	            <survey-text label="BUN" field="Biochemistry[0].BUN" answer="answer" partial="true"></survey-text>
	            <survey-text label="Cr" field="Biochemistry[0].Cr" answer="answer" partial="true"></survey-text>
	            <survey-text label="TG" field="Biochemistry[0].TG" answer="answer" partial="true"></survey-text>
	            <survey-text label="Chol" field="Biochemistry[0].Chol" answer="answer" partial="true"></survey-text>
	            <survey-text label="HDL" field="Biochemistry[0].HDL" answer="answer" partial="true"></survey-text>
	            <survey-text label="LDL" field="Biochemistry[0].LDL" answer="answer" partial="true"></survey-text>
	            <survey-text label="VLDL" field="Biochemistry[0].VLDL" answer="answer" partial="true"></survey-text>
	            <survey-text label="Uric Acid" field="Biochemistry[0].Uric_Acid" answer="answer" partial="true"></survey-text>
	            <survey-text label="FBS" field="Biochemistry[0].FBS" answer="answer" partial="true"></survey-text>
	            <survey-text label="HbA1C" field="Biochemistry[0].HbA1C" answer="answer" partial="true"></survey-text>
	            <survey-text label="CPK" field="Biochemistry[0].CPK" answer="answer" partial="true"></survey-text>
	            <survey-text label="LDH" field="Biochemistry[0].LDH" answer="answer" partial="true"></survey-text>
	            <survey-text label="Other" field="Biochemistry[0].Other" answer="answer" partial="true"></survey-text>
	        </survey-table>
	    </survey-page>
	</div>
</body>