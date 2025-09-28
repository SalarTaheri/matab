
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
	    <survey-page title="Iron And Copper Indices" answer="answer">
	        <survey-table answer="answer" title="Iron And Copper Indices">
	            <survey-date label="Date" field="Iron_And_Copper_Indices[0].Date" answer="answer" partial="true"></survey-date>
	            <survey-text label="Serum Iron" field="Iron_And_Copper_Indices[0].Serum_Iron" answer="answer" partial="true"></survey-text>
	            <survey-text label="TIBC" field="Iron_And_Copper_Indices[0].TIBC" answer="answer" partial="true"></survey-text>
	            <survey-text label="Ferritin" field="Iron_And_Copper_Indices[0].Ferritin" answer="answer" partial="true"></survey-text>
				<survey-text label="Serum CU" field="Iron_And_Copper_Indices[0].Serum_CU" answer="answer" partial="true"></survey-text>
	            <survey-text label="Ceruloplasmin" field="Iron_And_Copper_Indices[0].Ceruloplasmin" answer="answer" partial="true"></survey-text>
	            <survey-text label="24 Urine CU" field="Iron_And_Copper_Indices[0]._24_Urine_CU" answer="answer" partial="true"></survey-text>
	            <survey-text label="Other" field="Iron_And_Copper_Indices[0].Other" answer="answer" partial="true"></survey-text>
	        </survey-table>
	    </survey-page>
	</div>
</body>