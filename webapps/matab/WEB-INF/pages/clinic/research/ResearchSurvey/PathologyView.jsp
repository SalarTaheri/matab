
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
	    <survey-page title="Pathology" answer="answer" patientId="${patientId}">
	        <survey-date answer="answer" label="Date" field="Pathology.Date"></survey-date>
	        <survey-group title="Biliary Disease" >
				<survey-yes-no label="Large Bile Duct Obstructuins Pattern" field="Pathology.Biliary_Disease.Large_Bile_Duct_Obstructuins_Pattern.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Bile Duct Damage with or without Granoloma (Compatible with Pragressive PBC)" field="Pathology.Biliary_Disease.Bile_Duct_Damage_with_or_without_Granoloma.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Bile Duct Loss/ Ductular Proliferation /Cholestasis (Compatible with Pragressive PBC)" field="Pathology.Biliary_Disease.Bile_Duct_Loss_Ductular_Proliferation_Cholestasis.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Above Feature Coexisting with prominent interface Hepatitis (Compatible woth overlap syndrome)" field="Pathology.Biliary_Disease.Above_Feature_Coexisting_with_prominent_interface_Hepatitis.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Bile Duct Loss/ Peri Ductal Concentric Fibrosis(PSC be considered)" field="Pathology.Biliary_Disease.Bile_Duct_Loss_Peri_Ductal_Concentric_Fibrosis.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Compatible with Infectious Chlangitis" field="Pathology.Biliary_Disease.Compatible_with_Infectious_Chlangitis.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Ductopenia, Clinical Correlation Needed" field="Pathology.Biliary_Disease.Ductopenia_Clinical_Correlation_Needed.value" answer="answer"></survey-yes-no>
     		</survey-group>
     		<survey-group title="Acute Hepatitis Pattern" >
				<survey-yes-no label="With Panacinar/ Multiacinar Necrosis" field="Pathology.Acute_Hepatitis_Pattern.With_Panacinar_Multiacinar_Necrosis.value" answer="answer"></survey-yes-no>
     		</survey-group>
     		
     		<survey-group title="Chronic Hepatitis" >
				<survey-text answer="answer" label="Grade" field="Pathology.Chronic_Hepatitis.Grade"></survey-text>
				<survey-text answer="answer" label="Inteface Heptitis" field="Pathology.Chronic_Hepatitis.Inteface_Heptitis"></survey-text>
				<survey-text answer="answer" label="Confluent Necrosis" field="Pathology.Chronic_Hepatitis.Confluent_Necrosis"></survey-text>
				<survey-text answer="answer" label="Spotty Lytic Necrosis" field="Pathology.Chronic_Hepatitis.Spotty_Lytic_Necrosis"></survey-text>
				<survey-text answer="answer" label="Portal Inflammation" field="Pathology.Chronic_Hepatitis.Portal_Inflammation"></survey-text>
				<survey-text answer="answer" label="Stage" field="Pathology.Chronic_Hepatitis.Stage"></survey-text>
     		</survey-group>

     		<survey-group title="Seatosis/ Steatohepatitis" >
				<survey-text answer="answer" label="Activity Score" field="Pathology.Seatosis_Steatohepatitis.Activity_Score"></survey-text>
				<survey-text answer="answer" label="Stage" field="Pathology.Seatosis_Steatohepatitis.Stage"></survey-text>
     		</survey-group>
     		<survey-group title="Siderosis" >
				<survey-text answer="answer" label="Grade" field="Pathology.Siderosis.Grade"></survey-text>
				<survey-text answer="answer" label="Stage" field="Pathology.Siderosis.Stage"></survey-text>
     		</survey-group>
     		<survey-text answer="answer" label="Cholestasis( Isolated)" field="Pathology.Cholestasis"></survey-text>
     		<survey-group title="Vascular Disorders" >
				<survey-yes-no answer="answer" label="Vasculitis" field="Pathology.Vascular_Disorders.Vasculitis.value"></survey-yes-no>
				<survey-yes-no answer="answer" label="Peliosis Hepatis" field="Pathology.Vascular_Disorders.Peliosis_Hepatis.value"></survey-yes-no>
				<survey-yes-no answer="answer" label="Compatible with Passive Congestion, Venous Obstruction" field="Pathology.Vascular_Disorders.Compatible_with_Passive_Congestion_Venous_Obstruction.value"></survey-yes-no>
     		</survey-group>     		
     		<survey-text answer="answer" label="Cirrhosis" field="Pathology.Cirrhosis"></survey-text>
     		<survey-group title="Mass Lesion Compatible With" >
				<survey-yes-no label="Necrotic/ Fibrous Nodule" field="Pathology.Mass_Lesion_Compatible_With.Necrotic_Fibrous_Nodule.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Heterotopia" field="Pathology.Mass_Lesion_Compatible_With.Heterotopia.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Endometrial Cyct (Endometrioma)" field="Pathology.Mass_Lesion_Compatible_With.Endometrial_Cyct.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Benign Nerve Sheath Tumors" field="Pathology.Mass_Lesion_Compatible_With.Benign_Nerve_Sheath_Tumors.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Sarcoid Pseudotumor" field="Pathology.Mass_Lesion_Compatible_With.Sarcoid_Pseudotumor.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Abscess" field="Pathology.Mass_Lesion_Compatible_With.Abscess.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Parasistic Cyst" field="Pathology.Mass_Lesion_Compatible_With.Parasistic_Cyst.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Hydatid Cyst" field="Pathology.Mass_Lesion_Compatible_With.Hydatid_Cyst.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Ciliated Foregut Cyst" field="Pathology.Mass_Lesion_Compatible_With.Ciliated_Foregut_Cyst.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Alimentary Duplication Cyst" field="Pathology.Mass_Lesion_Compatible_With.Alimentary_Duplication_Cyst.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Pseudocysts (Panreatic,Traumtiv)" field="Pathology.Mass_Lesion_Compatible_With.Pseudocysts.value" answer="answer"></survey-yes-no>
				<survey-yes-no label="Accessory Lobe" field="Pathology.Mass_Lesion_Compatible_With.Accessory_Lobe.value" answer="answer"></survey-yes-no>
     		</survey-group>     		
     		<survey-group title="Benign Neoplasm and Tumor-Like Masses" >
	     		<survey-group title="Epithelial" >
		     		<survey-group title="Hepato Cellulr" >
						<survey-yes-no label="Hepatocellular Adenoma" field="Pathology.Benign_Neoplasm_and_Tumor_Like_Masses.Accessory_Lobe.Epithelial.Hepato_Cellulr.Hepatocellular_Adenoma.value" answer="answer"></survey-yes-no>		     		
						<survey-yes-no label="Focal Nodular Hyperplasia" field="Pathology.Benign_Neoplasm_and_Tumor_Like_Masses.Accessory_Lobe.Epithelial.Hepato_Cellulr.Focal_Nodular_Hyperplasia.value" answer="answer"></survey-yes-no>		     		
						<survey-yes-no label="Nodular Regenerative Hyperplasia" field="Pathology.Benign_Neoplasm_and_Tumor_Like_Masses.Accessory_Lobe.Epithelial.Hepato_Cellulr.Nodular_Regenerative_Hyperplasia.value" answer="answer"></survey-yes-no>		     		
		     		</survey-group>    
		     		<survey-group title="Cholango-Cellular" >
		     			<survey-yes-no label="Bile Duct Hamartoma(Von Meyenburg Complex)" field="Pathology.Benign_Neoplasm_and_Tumor_Like_Masses.Accessory_Lobe.Epithelial.Cholango_Cellular.Bile_Duct_Hamartoma.value" answer="answer"></survey-yes-no>		     		
		     			<survey-yes-no label="Bile Duct Adenoma" field="Pathology.Benign_Neoplasm_and_Tumor_Like_Masses.Accessory_Lobe.Epithelial.Cholango_Cellular.Bile_Duct_Adenoma.value" answer="answer"></survey-yes-no>		     		
		     			<survey-yes-no label="Biliary Cysts" field="Pathology.Benign_Neoplasm_and_Tumor_Like_Masses.Accessory_Lobe.Epithelial.Cholango_Cellular.Biliary_Cysts.value" answer="answer"></survey-yes-no>		     		
		     			<survey-yes-no label="Bilary Cystadenoma" field="Pathology.Benign_Neoplasm_and_Tumor_Like_Masses.Accessory_Lobe.Epithelial.Cholango_Cellular.Bilary_Cystadenoma.value" answer="answer">
		     				<survey-yes-no label="Muscinous" field="Pathology.Benign_Neoplasm_and_Tumor_Like_Masses.Accessory_Lobe.Epithelial.Cholango_Cellular.Bilary_Cystadenoma.Muscinous.value" answer="answer"></survey-yes-no>
		     				<survey-yes-no label="Serous" field="Pathology.Benign_Neoplasm_and_Tumor_Like_Masses.Accessory_Lobe.Epithelial.Cholango_Cellular.Bilary_Cystadenoma.Serous.value" answer="answer"></survey-yes-no>
		     			</survey-yes-no>		     		
		     		</survey-group>    
	     		</survey-group>    
	     		<survey-group title="Mesechymal" >
		     		<survey-group title="Vascular" >
			     		<survey-yes-no label="Hemangioma" field="Pathology.Benign_Neoplasm_and_Tumor_Like_Masses.Accessory_Lobe.Mesechymal.Vascular.Hemangioma.value" answer="answer"></survey-yes-no>
			     		<survey-yes-no label="Infantile Hemangioenothelioma" field="Pathology.Benign_Neoplasm_and_Tumor_Like_Masses.Accessory_Lobe.Mesechymal.Vascular.Infantile_Hemangioenothelioma.value" answer="answer"></survey-yes-no>
			     		<survey-yes-no label="lymohangioma" field="Pathology.Benign_Neoplasm_and_Tumor_Like_Masses.Accessory_Lobe.Mesechymal.Vascular.lymohangioma.value" answer="answer"></survey-yes-no>
		     		</survey-group>    
		     		<survey-group title="Fatty Tumors" >
			     		<survey-yes-no label="Angiomyolipoma(and related tumors)" field="Pathology.Benign_Neoplasm_and_Tumor_Like_Masses.Accessory_Lobe.Mesechymal.Fatty_Tumors.Angiomyolipoma.value" answer="answer"></survey-yes-no>
			     		<survey-yes-no label="Focal(Hepatocellular) Fatty Change" field="Pathology.Benign_Neoplasm_and_Tumor_Like_Masses.Accessory_Lobe.Mesechymal.Fatty_Tumors.Focal_Fatty_Change.value" answer="answer"></survey-yes-no>
		     		</survey-group>    
	     		</survey-group>    
	     		<survey-group title="Other" >
	     			<survey-yes-no label="Solitary Fibrous Tumor" field="Pathology.Benign_Neoplasm_and_Tumor_Like_Masses.Other.Solitary_Fibrous_Tumor.value" answer="answer"></survey-yes-no>
	     			<survey-yes-no label="Inflammatory Myofibriblastic Tumor(Pseudotumor)" field="Pathology.Benign_Neoplasm_and_Tumor_Like_Masses.Other.Inflammatory_Myofibriblastic_Tumor.value" answer="answer"></survey-yes-no>
	     			<survey-yes-no label="Leiomyoma" field="Pathology.Benign_Neoplasm_and_Tumor_Like_Masses.Other.Leiomyoma.value" answer="answer"></survey-yes-no>
	     		</survey-group>    
     		</survey-group>
     		<survey-group title="Malignant Neoplasm" >
	     		<survey-group title="Primary" >
					<survey-yes-no label="Hepatocellulr Carcinoma" field="Pathology.Malignant_Neoplasm.Primary.Hepatocellulr_Carcinoma.value" answer="answer">
						<survey-yes-no label="Fibromellar Variant" field="Pathology.Malignant_Neoplasm.Primary.Hepatocellulr_Carcinoma.Fibromellar_Variant.value" answer="answer"></survey-yes-no>
					</survey-yes-no>
					<survey-yes-no label="Hepaoblastoma Epithlial Type" field="Pathology.Malignant_Neoplasm.Primary..value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Cholangiocarcinoma" field="Pathology.Malignant_Neoplasm.Primary..value" answer="answer">
						<survey-yes-no label="Intraductal Variant(Bilary Papillomatosis)" field="Pathology.Malignant_Neoplasm.Primary.Cholangiocarcinoma.Intraductal_Variant.value" answer="answer"></survey-yes-no>
						<survey-yes-no label="Cholangiocellular Variant" field="Pathology.Malignant_Neoplasm.Primary.Cholangiocarcinoma.Cholangiocellular_Variant.value" answer="answer"></survey-yes-no>
					</survey-yes-no>
					<survey-yes-no label="Angiosarcoma" field="Pathology.Malignant_Neoplasm.Primary..value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Epithelioid Hemangioendothelioma" field="Pathology.Malignant_Neoplasm.Primary..value" answer="answer"></survey-yes-no>
	     		</survey-group>     		    
	     		<survey-group title="Metastatic" >
					<survey-yes-no label="Adenocarcinoma" field="Pathology.Malignant_Neoplasm.Metastatic.Adenocarcinoma.value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Lymphoma" field="Pathology.Malignant_Neoplasm.Metastatic.Lymphoma.value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Leukemia" field="Pathology.Malignant_Neoplasm.Metastatic.Leukemia.value" answer="answer"></survey-yes-no>
					<survey-yes-no label="Other" field="Pathology.Malignant_Neoplasm.Metastatic.Other.value" answer="answer"></survey-yes-no>
	     		</survey-group>     		    
     		</survey-group>     		    
     		<survey-text answer="answer" label="Other" field="Pathology.Other"></survey-text>
	    </survey-page>
	</div>
</body>