
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
	    <survey-page title="MRI" answer="answer" patientId="${patientId}">
	        <survey-date answer="answer" label="Date" field="MRI.Date"></survey-date>
	        <survey-group title="NL" >
	        	<survey-yes-no label="NL" field="MRI.NL.value" answer="answer">	</survey-yes-no>
	        </survey-group>
	        <survey-group title="CBC" >
		        <survey-yes-no label="Dilation" field="MRI.CBC.Dilation.value" answer="answer"></survey-yes-no>
		        <survey-yes-no label="Beading" field="MRI.CBC.Beading.value" answer="answer"></survey-yes-no>
		        <survey-yes-no label="Stenosis" field="MRI.CBC.Stenosis.value" answer="answer"></survey-yes-no>
		        <survey-text answer="answer" label="Other" field="MRI.CBC.Other"></survey-text>
			</survey-group>
	        <survey-group title="Intra hepatic duct" >
		        <survey-yes-no label="Dilation" field="MRI.Intra_hepatic_duct.Dilation.value" answer="answer"></survey-yes-no>
		        <survey-yes-no label="Beading" field="MRI.Intra_hepatic_duct.Beading.value" answer="answer"></survey-yes-no>
		        <survey-yes-no label="Stenosis" field="MRI.Intra_hepatic_duct.Stenosis.value" answer="answer"></survey-yes-no>
		        <survey-text answer="answer" label="Other" field="MRI.Intra_hepatic_duct.Other"></survey-text>
			</survey-group>
	        <survey-group title="Pancreatic duct" >
		        <survey-yes-no label="Dilation" field="MRI.Pancreatic_duct.Dilation.value" answer="answer"></survey-yes-no>
		        <survey-yes-no label="Beading" field="MRI.Pancreatic_duct.Beading.value" answer="answer"></survey-yes-no>
		        <survey-yes-no label="Stenosis" field="MRI.Pancreatic_duct.Stenosis.value" answer="answer"></survey-yes-no>
		        <survey-text answer="answer" label="Other" field="MRI.Pancreatic_duct.Other"></survey-text>
			</survey-group>
			<survey-text answer="answer" label="Other" field="MRI.Other"></survey-text>
	    </survey-page>
	</div>
</body>