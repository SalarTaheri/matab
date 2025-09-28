
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
	    <survey-page title="Familial History" answer="answer">
	        <survey-table answer="answer" title="Familial History">
	            <survey-text label="Relationship" field="Familial_History[0].Relationship" answer="answer" partial="true"></survey-text>
	            <survey-combo label="Acute Hepatits" field="Familial_History[0].Acute_Hepatits" answer="answer" partial="true"></survey-combo>
	            <survey-combo label="Chronic Hepatits" field="Familial_History[0].Chronic_Hepatits" answer="answer" partial="true"></survey-combo>
	            <survey-combo label="Wilson" field="Familial_History[0].Wilson" answer="answer" partial="true"></survey-combo>
	            <survey-combo label="Hemochromatosis" field="Familial_History[0].Hemochromatosis" answer="answer" partial="true"></survey-combo>
	            <survey-combo label="NAFLD" field="Familial_History[0].NAFLD" answer="answer" partial="true"></survey-combo>
	            <survey-combo label="H.Cancer" field="Familial_History[0].H_Cancer" answer="answer" partial="true"></survey-combo>
	            <survey-combo label="Autoimmune disease" field="Familial_History[0].Autoimmune_isease" answer="answer" partial="true"></survey-combo>
	            <survey-text label="Other" field="Familial_History[0].Other" answer="answer" partial="true"></survey-text>
	        </survey-table>
	    </survey-page>
	</div>
</body>