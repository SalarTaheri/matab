
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
	    <survey-page title="UGI Endoscopy" answer="answer" patientId="${patientId}">
	        <survey-date answer="answer" label="Date" field="UGI_Endoscopy.Date"></survey-date>
     		<survey-group title="Varice" >
				<survey-yes-no label="Varice" field="UGI_Endoscopy.Varice.value" answer="answer">
					<survey-yes-no label="Esophagus" field="UGI_Endoscopy.Varice.Esophagus.value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Gastric" field="UGI_Endoscopy.Varice.Gastric.value" answer="answer"></survey-yes-no>
				</survey-yes-no>
			</survey-group>
			<survey-group title="Postal Hypertension Gastropathy" >
				<survey-yes-no label="Postal Hypertension Gastropathy" field="UGI_Endoscopy.Postal_Hypertension_Gastropathy.value" answer="answer"></survey-yes-no>
			</survey-group>
     		<survey-text answer="answer" label="Other" field="UGI_Endoscopy.Other"></survey-text>
	    </survey-page>
	</div>
</body>