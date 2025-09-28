
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%><!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<html>
<head>
	<base:surveyImport></base:surveyImport>
</head>   
    
<body ng-app="survey" ng-controller="surveyTestPageController">
	<input type="hidden" id="patientId" value="${patientId}">
	<div>
		<survey-page title="Medical History" answer="answer">
			<survey-group title="Medical History" >
	            <survey-yes-no answer="answer" label="HBV Vaccination" field="Medical_History.HBV_Vaccination.value" >
	            	<survey-date label="Date" field="Medical_History.Date" answer="answer" partial="true" ></survey-date>
	            </survey-yes-no>
	            <survey-yes-no answer="answer" label="History of any important disease" field="Medical_History.History_of_any_important_disease.value" >
	            	<survey-number label="Description" field="Medical_History.History_of_any_important_disease.Description" answer="answer" partial="true"></survey-number>
	            </survey-yes-no>
	            <survey-yes-no answer="answer" label="History of Surgery" field="Medical_History.History_of_Surgery.value" >
	            	<survey-number label="Description" field="Medical_History.History_of_Surgery.History_of_Surgery.Description" answer="answer" partial="true"></survey-number>
	            </survey-yes-no>
	            <survey-yes-no answer="answer" label="History of Hospitalization" field="Medical_History.History_of_Hospitalization.value" >
	            	<survey-number label="Description" field="Medical_History.History_of_Hospitalization.Description" answer="answer" partial="true"></survey-number>
	            </survey-yes-no>
			</survey-group>		
		</survey-page>
	</div>
</body>