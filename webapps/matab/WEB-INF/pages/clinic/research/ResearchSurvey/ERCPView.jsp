
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
	    <survey-page title="ERCP" answer="answer" patientId="${patientId}">
	        <survey-date answer="answer" label="Date" field="ERCP.Date"></survey-date>
     		<survey-group title="" >
				<survey-yes-no label="Sphincterotomy" field="ERCP.Sphincterotomy.value" answer="answer"></survey-yes-no>
				<survey-text answer="answer" label="Sphincterotomy Other" field="ERCP.Sphincterotomy_Other"></survey-text>
				<survey-yes-no label="Stone removal" field="ERCP.Stone_removal.value" answer="answer"></survey-yes-no>
				<survey-text answer="answer" label="Stone removal Other" field="ERCP.Stone_removal_Other"></survey-text>
				<survey-yes-no label="Ballon dilation" field="ERCP.Ballon_dilation.value" answer="answer"></survey-yes-no>
				<survey-text answer="answer" label="Ballon dilation Other" field="ERCP.Ballon_dilation_Other"></survey-text>
			</survey-group>
     		<survey-group title="Common bile duct" >
				<survey-yes-no label="Nl" field="ERCP.Common_bile_duct.Nl.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Dilation" field="ERCP.Common_bile_duct.Dilation.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Stericture" field="ERCP.Common_bile_duct.Stericture.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Narrowing" field="ERCP.Common_bile_duct.Narrowing.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Irregularity" field="ERCP.Common_bile_duct.Irregularity.value" answer="answer"></survey-yes-no>
				<survey-text  label="Other" field="ERCP.Common_bile_duct.Other" answer="answer"></survey-text>
			</survey-group>
     		<survey-group title="Pancreatic duct" >
				<survey-yes-no label="Nl" field="ERCP.Pancreatic_duct.Nl.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Dilation" field="ERCP.Pancreatic_duct.Dilation.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Stericture" field="ERCP.Pancreatic_duct.Stericture.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Narrowing" field="ERCP.Pancreatic_duct.Narrowing.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Irregularity" field="ERCP.Pancreatic_duct.Irregularity.value" answer="answer"></survey-yes-no>
				<survey-text  label="Other" field="ERCP.Pancreatic_duct.Other" answer="answer"></survey-text>
			</survey-group>
     		<survey-group title="Cystic duct" >
				<survey-yes-no label="Nl" field="ERCP.Cystic_duct.Nl.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Dilation" field="ERCP.Cystic_duct.Dilation.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Stericture" field="ERCP.Cystic_duct.Stericture.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Narrowing" field="ERCP.Cystic_duct.Narrowing.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Irregularity" field="ERCP.Cystic_duct.Irregularity.value" answer="answer"></survey-yes-no>
				<survey-text  label="Other" field="ERCP.Cystic_duct.Other" answer="answer"></survey-text>
			</survey-group>

     		<survey-group title="Intra hepatic duct" >
     			<survey-group title="Common hepatic duct" >
					<survey-yes-no label="Nl" field="ERCP.Intra_hepatic_duct.Common_hepatic_duct.Nl.value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Dilation" field="ERCP.Intra_hepatic_duct.Common_hepatic_duct.Dilation.value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Stericture" field="ERCP.Intra_hepatic_duct.Common_hepatic_duct.Stericture.value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Narrowing" field="ERCP.Intra_hepatic_duct.Common_hepatic_duct.Narrowing.value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Irregularity" field="ERCP.Intra_hepatic_duct.Common_hepatic_duct.Irregularity.value" answer="answer"></survey-yes-no>
					<survey-text  label="Other" field="ERCP.Intra_hepatic_duct.Common_hepatic_duct.Other" answer="answer"></survey-text>
				</survey-group>
     			<survey-group title="Right hepatic duct" >
					<survey-yes-no label="Nl" field="ERCP.Intra_hepatic_duct.Right_hepatic_duct.Nl.value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Dilation" field="ERCP.Intra_hepatic_duct.Right_hepatic_duct.Dilation.value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Stericture" field="ERCP.Intra_hepatic_duct.Right_hepatic_duct.Stericture.value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Narrowing" field="ERCP.Intra_hepatic_duct.Right_hepatic_duct.Narrowing.value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Irregularity" field="ERCP.Intra_hepatic_duct.Right_hepatic_duct.Irregularity.value" answer="answer"></survey-yes-no>
					<survey-text  label="Other" field="ERCP.Intra_hepatic_duct.Right_hepatic_duct.Other" answer="answer"></survey-text>
				</survey-group>
     			<survey-group title="Left hepatic duct" >
					<survey-yes-no label="Nl" field="ERCP.Intra_hepatic_duct.Left_hepatic_duct.Nl.value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Dilation" field="ERCP.Intra_hepatic_duct.Left_hepatic_duct.Dilation.value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Stericture" field="ERCP.Intra_hepatic_duct.Left_hepatic_duct.Stericture.value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Narrowing" field="ERCP.Intra_hepatic_duct.Left_hepatic_duct.Narrowing.value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Irregularity" field="ERCP.Intra_hepatic_duct.Left_hepatic_duct.Irregularity.value" answer="answer"></survey-yes-no>
					<survey-text  label="Other" field="ERCP.Intra_hepatic_duct.Left_hepatic_duct.Other" answer="answer"></survey-text>
				</survey-group>
			</survey-group>
     		<survey-text answer="answer" label="Other" field="ERCP.Other"></survey-text>
	    </survey-page>
	</div>
</body>