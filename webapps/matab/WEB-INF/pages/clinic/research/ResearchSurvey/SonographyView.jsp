
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
	    <survey-page title="Sonography" answer="answer" patientId="${patientId}">
	        <survey-date answer="answer" label="Date" field="Sonography.Date"></survey-date>
	        <survey-group title="Echo of Liver" >
				<survey-yes-no label="NL" field="Sonography.Echo_of_Liver.NL" answer="answer"></survey-yes-no>
				<survey-yes-no label="Increase" field="Sonography.Echo_of_Liver.Increase" answer="answer"></survey-yes-no>
				<survey-yes-no label="Decrease" field="Sonography.Echo_of_Liver.Decrease" answer="answer"></survey-yes-no>
				<survey-yes-no label="Heterogeny" field="Sonography.Echo_of_Liver.Heterogeny" answer="answer"></survey-yes-no>
				<survey-yes-no label="Homogen" field="Sonography.Echo_of_Liver.Homogen" answer="answer"></survey-yes-no>
				<survey-yes-no label="Fatty" field="Sonography.Echo_of_Liver.Fatty" answer="answer"></survey-yes-no>
				<survey-yes-no label="Coarse" field="Sonography.Echo_of_Liver.Coarse" answer="answer"></survey-yes-no>
     		</survey-group>
     		<survey-group title="Hepatic Lesion" >
			<survey-yes-no label="Hepatic Lesion" field="Sonography.Hepatic_Lesion.value" answer="answer">
				<survey-yes-no label="Haypo Echo" field="Sonography.Hepatic_Lesion.Haypo_Echo.value" answer="answer">
					<survey-text answer="answer" label="Single" field="Sonography.Hepatic_Lesion.Haypo_Echo.Single"></survey-text>	
				</survey-yes-no>
				<survey-yes-no label="Multiple" field="Sonography.Hepatic_Lesion.Haypo_Echo.Multiple.value" answer="answer">
					<survey-text answer="answer" label="Size" field="Sonography.Hepatic_Lesion.Haypo_Echo_Multiple.Size"></survey-text>	
				</survey-yes-no>

				<survey-yes-no label="Hayper Echo" field="Sonography.Hepatic_Lesion.Hayper_Echo.value" answer="answer">
					<survey-text answer="answer" label="Single" field="Sonography.Hepatic_Lesion.Hayper_Echo.Single"></survey-text>	
				</survey-yes-no>
				<survey-yes-no label="Multiple" field="Sonography.Hepatic_Lesion.Hayper_Echo.Multiple.value" answer="answer">
					<survey-text answer="answer" label="Size" field="Sonography.Hepatic_Lesion.Hayper_Echo_Multiple.Size"></survey-text>	
				</survey-yes-no>
				
				<survey-yes-no label="Mixed Echo" field="Sonography.Hepatic_Lesion.Mixed_Echo.value" answer="answer">
					<survey-text answer="answer" label="Single" field="Sonography.Hepatic_Lesion.Mixed_Echo.Single"></survey-text>	
				</survey-yes-no>
				<survey-yes-no label="Multiple" field="Sonography.Hepatic_Lesion.Mixed_Echo.Multiple.value" answer="answer">
					<survey-text answer="answer" label="Size" field="Sonography.Hepatic_Lesion.Mixed_Echo_Multiple.Size"></survey-text>	
				</survey-yes-no>
				
				<survey-yes-no label="Solid" field="Sonography.Hepatic_Lesion.Solid.value" answer="answer">
					<survey-text answer="answer" label="Single" field="Sonography.Hepatic_Lesion.Solid.Single"></survey-text>	
				</survey-yes-no>
				<survey-yes-no label="Multiple" field="Sonography.Hepatic_Lesion.Solid.Multiple.value" answer="answer">
					<survey-text answer="answer" label="Size" field="Sonography.Hepatic_Lesion.Solid_Multiple.Size"></survey-text>	
				</survey-yes-no>
				<survey-yes-no label="Cyst" field="Sonography.Hepatic_Lesion.Cyst.value" answer="answer">
					<survey-text answer="answer" label="Single" field="Sonography.Hepatic_Lesion.Cyst.Single"></survey-text>	
				</survey-yes-no>
				<survey-yes-no label="Multiple" field="Sonography.Hepatic_Lesion.Cyst.Multiple.value" answer="answer">
					<survey-text answer="answer" label="Size" field="Sonography.Hepatic_Lesion.Cyst_Multiple.Size"></survey-text>	
				</survey-yes-no>
			</survey-yes-no>
		</survey-group>
		
			<survey-group title="Liver Size" >
				<survey-yes-no label="NL" field="Sonography.Liver_Size.NL" answer="answer"></survey-yes-no>
				<survey-yes-no label="Increase" field="Sonography.Liver_Size.Increase" answer="answer"></survey-yes-no>
				<survey-yes-no label="Decrease" field="Sonography.Liver_Size.Decrease" answer="answer"></survey-yes-no>
				<survey-text answer="answer" label="Size" field="Sonography.Liver_Size.Size"></survey-text>
     		</survey-group>
			<survey-group title="Spleen Size" >
				<survey-yes-no label="NL" field="Sonography.Spleen_Size.NL" answer="answer"></survey-yes-no>
				<survey-yes-no label="Increase" field="Sonography.Spleen_Size.Increase" answer="answer"></survey-yes-no>
				<survey-yes-no label="Decrease" field="Sonography.Spleen_Size.Decrease" answer="answer"></survey-yes-no>
				<survey-text answer="answer" label="Size" field="Sonography.Spleen_Size.Size"></survey-text>
     		</survey-group>
		<survey-group title="Delitation Of Biliary Duct" >	
			<survey-yes-no label="Delitation Of Biliary Duct" field="Sonography.Delitation_Of_Biliary_Duct.value" answer="answer">
				<survey-text answer="answer" label="Location" field="Sonography.Delitation_Of_Biliary_Duct.Location"></survey-text>	
			</survey-yes-no>

			<survey-yes-no label="Ascites" field="Sonography.Ascites.value" answer="answer">
				<survey-single-choice answer="answer" field="Sonography.Ascites.yes">
	            	<survey-option label="Mild" ></survey-option>
	                <survey-option label="Moderate" ></survey-option>
	                <survey-option label="Severe" ></survey-option>
	                <survey-option label="UnKnown" ></survey-option>
	             </survey-single-choice>
	         </survey-yes-no>
		</survey-group>
			<survey-group title="Portal vein diameter" >
				<survey-yes-no label="NL" field="Sonography.Portal_vein_diameter.NL" answer="answer"></survey-yes-no>
				<survey-yes-no label="Increase" field="Sonography.Portal_vein_diameter.Increase" answer="answer"></survey-yes-no>
				<survey-yes-no label="Decrease" field="Sonography.Portal_vein_diameter.Decrease" answer="answer"></survey-yes-no>
				<survey-text answer="answer" label="Size" field="Sonography.Portal_vein_diameter.Size"></survey-text>
     		</survey-group>
     		<survey-text answer="answer" label="Other" field="Sonography.Other"></survey-text>
	    </survey-page>
	</div>
</body>