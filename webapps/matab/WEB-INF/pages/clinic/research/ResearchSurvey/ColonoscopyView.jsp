
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%><!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<html>
<head>
	<base:surveyImport></base:surveyImport>
</head>   
    
<body ng-app="survey" ng-controller="surveyTestPageController">
	<input type="hidden" id="patientId" value="${patientId}">
	<div class="" >
	    <survey-page title="Colonoscopy" answer="answer" patientId="${patientId}">
	        <survey-date answer="answer" label="Date" field="Colonoscopy.Date"></survey-date>
     		<survey-group title="Mucosal Appearance" >
				<survey-yes-no label="Normal" field="Colonoscopy.Mucosal_Appearance.Normal.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Loss of Vascularity" field="Colonoscopy.Mucosal_Appearance.Loss_of_Vascularity.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Fragility" field="Colonoscopy.Mucosal_Appearance.Fragility.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Ulser" field="Colonoscopy.Mucosal_Appearance.Ulser.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Polyp" field="Colonoscopy.Mucosal_Appearance.Polyp.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Cancer" field="Colonoscopy.Mucosal_Appearance.Cancer.value" answer="answer"></survey-yes-no>
			</survey-group>
     		<survey-text answer="answer" label="Dx" field="Colonoscopy.Dx"></survey-text>	
     		<survey-text answer="answer" label="Other" field="Colonoscopy.Other"></survey-text>
	    </survey-page>
	</div>
</body>