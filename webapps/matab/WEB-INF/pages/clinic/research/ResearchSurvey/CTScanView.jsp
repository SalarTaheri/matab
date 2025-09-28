
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
	    <survey-page title="CT Scan" answer="answer" patientId="${patientId}">
	        <survey-date answer="answer" label="Date" field="CT_Scan.Date"></survey-date>
	        <survey-group title="Hepatic Lesion" >
		        <survey-yes-no label="Hepatic Lesion" field="CT_Scan.Hepatic_Lesion.value" answer="answer">
		        	<survey-yes-no label="Solid" field="CT_Scan.Hepatic_Lesion.Solid.value" answer="answer">
						<survey-text answer="answer" label="Single" field="CT_Scan.Hepatic_Lesion.Solid.Single"></survey-text>	
					</survey-yes-no>
					<survey-yes-no label="Multiple" field="CT_Scan.Hepatic_Lesion.Solid_Multiple.value" answer="answer">
						<survey-text answer="answer" label="Size" field="CT_Scan.Hepatic_Lesion.Solid_Multiple.Size"></survey-text>	
					</survey-yes-no>
					<survey-yes-no label="Cyst" field="CT_Scan.Hepatic_Lesion.Cyst.value" answer="answer">
						<survey-text answer="answer" label="Single" field="CT_Scan.Hepatic_Lesion.Cyst.Single"></survey-text>	
					</survey-yes-no>
					<survey-yes-no label="Multiple" field="CT_Scan.Hepatic_Lesion.Cyst_Multiple.value" answer="answer">
						<survey-text answer="answer" label="Size" field="CT_Scan.Hepatic_Lesion.Cyst_Multiple.Size"></survey-text>	
					</survey-yes-no>
				</survey-yes-no>
			</survey-group>
			
			<survey-group title="Liver Size" >
				<survey-yes-no label="NL" field="CT_Scan.Liver_Size.NL" answer="answer"></survey-yes-no>
				<survey-yes-no label="Increase" field="CT_Scan.Liver_Size.Increase" answer="answer"></survey-yes-no>
				<survey-yes-no label="Decrease" field="CT_Scan.Liver_Size.Decrease" answer="answer"></survey-yes-no>
				<survey-text answer="answer" label="Size" field="CT_Scan.Liver_Size.Size"></survey-text>
     		</survey-group>
			<survey-group title="Spleen Size" >
				<survey-yes-no label="NL" field="CT_Scan.Spleen_Size.NL" answer="answer"></survey-yes-no>
				<survey-yes-no label="Increase" field="CT_Scan.Spleen_Size.Increase" answer="answer"></survey-yes-no>
				<survey-yes-no label="Decrease" field="CT_Scan.Spleen_Size.Decrease" answer="answer"></survey-yes-no>
				<survey-text answer="answer" label="Size" field="CT_Scan.Spleen_Size.Size"></survey-text>
     		</survey-group>
			<survey-text answer="answer" label="Other" field="CT_Scan.Other"></survey-text>
	    </survey-page>
	</div>
</body>