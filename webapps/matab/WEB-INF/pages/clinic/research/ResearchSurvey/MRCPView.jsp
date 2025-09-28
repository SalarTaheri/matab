
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
	    <survey-page title="MRCP" answer="answer" patientId="${patientId}">
	        <survey-date answer="answer" label="Date" field="MRCP.Date"></survey-date>
	        <survey-group title="NL" >
	        	<survey-yes-no label="NL" field="MRCP.NL.value" answer="answer">	</survey-yes-no>
	        </survey-group>
	        <survey-group title="CBC" >
		        <survey-yes-no label="Dilation" field="MRCP.CBC.Dilation.value" answer="answer"></survey-yes-no>
		        <survey-yes-no label="Beading" field="MRCP.CBC.Beading.value" answer="answer"></survey-yes-no>
		        <survey-yes-no label="Stenosis" field="MRCP.CBC.Stenosis.value" answer="answer"></survey-yes-no>
		        <survey-text answer="answer" label="Other" field="MRCP.CBC.Other"></survey-text>
			</survey-group>
	        <survey-group title="Intra hepatic duct" >
		        <survey-yes-no label="Dilation" field="MRCP.Intra_hepatic_duct.Dilation.value" answer="answer"></survey-yes-no>
		        <survey-yes-no label="Beading" field="MRCP.Intra_hepatic_duct.Beading.value" answer="answer"></survey-yes-no>
		        <survey-yes-no label="Stenosis" field="MRCP.Intra_hepatic_duct.Stenosis.value" answer="answer"></survey-yes-no>
		        <survey-text answer="answer" label="Other" field="MRCP.Intra_hepatic_duct.Other"></survey-text>
			</survey-group>
	        <survey-group title="Pancreatic duct" >
		        <survey-yes-no label="Dilation" field="MRCP.Pancreatic_duct.Dilation.value" answer="answer"></survey-yes-no>
		        <survey-yes-no label="Beading" field="MRCP.Pancreatic_duct.Beading.value" answer="answer"></survey-yes-no>
		        <survey-yes-no label="Stenosis" field="MRCP.Pancreatic_duct.Stenosis.value" answer="answer"></survey-yes-no>
		        <survey-text answer="answer" label="Other" field="MRCP.Pancreatic_duct.Other"></survey-text>
			</survey-group>
			<survey-text answer="answer" label="Other" field="MRCP.Other"></survey-text>
	    </survey-page>
	</div>
</body>