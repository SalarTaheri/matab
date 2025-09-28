
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
	    <survey-page title="Habitual History" answer="answer">
	        <survey-multi-choice answer="answer" label="Habits" options='["Cigarette", "Hookah", "Pipe", "Alcohol Use", "Drug Abuse"]' field="Habits" >
	            <survey-option label="Cigarette" ></survey-option>
	            <survey-option label="Hookah" ></survey-option>
	            <survey-option label="Pipe" ></survey-option>
	            <survey-option label="Alcohol Use" ></survey-option>
	            <survey-option label="Drug Abuse" ></survey-option>
	        </survey-multi-choice>
	        <survey-table answer="answer" title="Cigarette">
	            <survey-text label="Averege Cigarette Per Day" field="Cigarette[0].Averege_Cigarette_Per_Day" answer="answer" partial="true"></survey-text>
	            <survey-text label="Approximate Age Started" field="Cigarette[0].Approximate_Age_Started" answer="answer" partial="true"></survey-text>
	            <survey-text label="Approximate Age Stopped" field="Cigarette[0].Approximate_Age_Stopped" answer="answer" partial="true"></survey-text>
	            <survey-text label="Pack/Year" field="Cigarette[0].Pack_Year" answer="answer" partial="true"></survey-text>
	        </survey-table>
	        <survey-table answer="answer" title="Drug Abuse">
	            <survey-text label="Averege Cigarette Per Day" field="Drug_Abuse[0].Averege_Cigarette_Per_Day" answer="answer" partial="true"></survey-text>
	            <survey-text label="Approximate Age Started" field="Drug_Abuse[0].Approximate_Age_Started" answer="answer" partial="true"></survey-text>
	            <survey-text label="Approximate Age Stopped" field="Drug_Abuse[0].Approximate_Age_Stopped" answer="answer" partial="true"></survey-text>
	            <survey-text label="Pack/Year" field="Cigarette[0].Drug_Abuse" answer="answer" partial="true"></survey-text>
	        </survey-table>
	    </survey-page>
	</div>
</body>