
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
	    <survey-page title="Auto Antibody" answer="answer">
	        <survey-table answer="answer" title="Auto Antibody">
	            <survey-date label="Date" field="Auto_Antibody[0].Date" answer="answer" partial="true"></survey-date>
	            <survey-text label="ANA" field="Auto_Antibody[0].ANA" answer="answer" partial="true"></survey-text>
	            <survey-text label="ASMA" field="Auto_Antibody[0].ASMA" answer="answer" partial="true"></survey-text>
	            <survey-text label="AMA" field="Auto_Antibody[0].AMA" answer="answer" partial="true"></survey-text>
	            <survey-text label="ASCA" field="Auto_Antibody[0].ASCA" answer="answer" partial="true"></survey-text>
	            <survey-text label="ANCA" field="Auto_Antibody[0].ANCA" answer="answer" partial="true"></survey-text>
	            <survey-text label="P-ANCA" field="Auto_Antibody[0].P_ANCA" answer="answer" partial="true"></survey-text>
	            <survey-text label="Anti-dsDNA" field="Auto_Antibody[0].Anti_dsDNA"" answer="answer" partial="true"></survey-text>
	            <survey-text label="Anti-ssDNA" field="Auto_Antibody[0].Anti_ssDNA" answer="answer" partial="true"></survey-text>
	            <survey-text label="Anti LKM1" field="Auto_Antibody[0].Anti_LKM1" answer="answer" partial="true"></survey-text>
	            <survey-text label="Anti-LC1" field="Auto_Antibody[0].Anti_LC1" answer="answer" partial="true"></survey-text>
	            <survey-text label="Antiaction Ab(AAA)" field="Auto_Antibody[0].Antiaction_Ab" answer="answer" partial="true"></survey-text>
	            <survey-text label="Anti-SLA/LP" field="Auto_Antibody[0].Anti_SLA_LP" answer="answer" partial="true"></survey-text>
	            <survey-text label="Other" field="Auto_Antibody[0].Other" answer="answer" partial="true"></survey-text>
	        </survey-table>
	    </survey-page>
	</div>
</body>