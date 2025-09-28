
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
	    <survey-page title="Symptoms and Signs at Onset" answer="answer">
	        <survey-group title="Vital Sign" >
	            <survey-number label="Weight" field="Vital_Sign.Weight" answer="answer"></survey-number>
	            <survey-text label="Blood Pressure" field="Vital_Sign.Blood_Pressure" answer="answer"></survey-text>
	            <survey-number label="Waist" field="Vital_Sign.Waist" answer="answer"></survey-number>
	        </survey-group>
	        <survey-group title="General Symptom">
	            <survey-yes-no answer="answer" label="Nausea" field="General_Symptom.Nausea.value" >
	                <survey-single-choice answer="answer" field="General_Symptom.Nausea.yes"  >
	                    <survey-option label="Before meal" ></survey-option>
	                    <survey-option label="After meal" ></survey-option>
	                    <survey-option label="Both" ></survey-option>
	                </survey-single-choice>
	            </survey-yes-no>
	
	            <survey-yes-no answer="answer" label="Vomiting" field="General_Symptom.Vomiting.value" >
	                <survey-single-choice answer="answer" field="General_Symptom.Vomiting.yes">
	                    <survey-option label="With bile" ></survey-option>
	                    <survey-option label="Without bile" ></survey-option>
	                </survey-single-choice>
	            </survey-yes-no>
	
	            <survey-yes-no answer="answer" label="Anorexia" field="General_Symptom.Anorexia.value" >
	            </survey-yes-no>
	
	            <survey-single-choice answer="answer" label="Appetite" field="General_Symptom.Appetite" >
	                <survey-option label="NL" ></survey-option>
	                <survey-option label="Increase" ></survey-option>
	                <survey-option label="Decrease" ></survey-option>
	                <survey-option label="Unknown" ></survey-option>
	            </survey-single-choice>
	
	            <survey-yes-no answer="answer" label="Weight loss" field="General_Symptom.Weight_loss.extra" >
	                <survey-text answer="answer" field="General_Symptom.Weight_loss.kg_m" label="kg/m"  partial="true"></survey-text>
	            </survey-yes-no>
	
	            <survey-yes-no answer="answer" label="Weakness/Fatgue" field="General_Symptom.Weakness_Fatgue"></survey-yes-no>
	        </survey-group>
	        <survey-group title="Skin" answer="answer">
	            <survey-yes-no answer="answer" label="lcter" field="Skin.lcter"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Pruritus" field="Skin.Pruritus"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Skin Pigmentation" field="Skin.Skin_Pigmentation"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Palmar Erythema" field="Skin.Palmar_Erythema"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Spider angioma" field="Skin.Spider_angioma"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Sparse body hair" field="Skin.Sparse_body_hair"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Exanthema" field="Skin.Exanthema"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Petechia/Purpura" field="Skin.Petechia_Purpura"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Skin rash" field="Skin.Skin_rash"></survey-yes-no>
	        </survey-group>
	        <survey-group title="Head and Neck">
	            <survey-yes-no answer="answer" label="Kayser fleisher ring(KF ring)" field="Head_and_Neck.Kayser_fleisher_ring_KF_ring_"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Sub flower cataract" field="Head_and_Neck.Sub_flower_cataract"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Dysarthria" field="Head_and_Neck.Dysarthria"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Dysphagia" field="Head_and_Neck.Dysphagia.value">
	                <survey-single-choice answer="answer" field="Head_and_Neck.Dysphagia.yes">
	                    <survey-option label="To solids" ></survey-option>
	                    <survey-option label="To liquid" ></survey-option>
	                    <survey-option label="Both" ></survey-option>
	                </survey-single-choice>
	            </survey-yes-no>
	        </survey-group>
	        <survey-group title="Chest">
	            <survey-yes-no answer="answer" label="Gynecomastia" field="Chest.Gynecomastia"></survey-yes-no>
	        </survey-group>
	        <survey-group title="Abdomen">
	            <survey-yes-no answer="answer" label="Acitis" field="Abdomen.Acitis.value">
	                <survey-single-choice answer="answer" field="Abdomen.Acitis.yes">
	                    <survey-option label="Mild" ></survey-option>
	                    <survey-option label="Moderate" ></survey-option>
	                    <survey-option label="Sever" ></survey-option>
	                </survey-single-choice>
	            </survey-yes-no>
	            <survey-yes-no answer="answer" label="White stool" field="Abdomen.White_stool"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Dark urine" field="Abdomen.Dark_urine"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Hematemesis" field="Abdomen.Hematemesis"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Melena" field="Abdomen.Melena"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Rectorrhagia" field="Abdomen.Rectorrhagia"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Spelenomegaly" field="Abdomen.Spelenomegaly"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Abdominal pain/tenderness" field="Abdomen.Abdominal_pain_tenderness.value">
	                <survey-single-choice answer="answer" field="Abdomen.Abdominal_pain_tenderness.yes">
	                    <survey-option label="Epigastric" ></survey-option>
	                    <survey-option label="Mid Abdomen" ></survey-option>
	                    <survey-option label="Hypogaster" ></survey-option>
	                    <survey-option label="LUQ" ></survey-option>
	                    <survey-option label="RLQ" ></survey-option>
	                    <survey-option label="LLQ" ></survey-option>
	                    <survey-option label="Rt flank" ></survey-option>
	                    <survey-option label="Generalized" ></survey-option>
	                    <survey-option label="Lf flank" ></survey-option>
	                </survey-single-choice>
	            </survey-yes-no>
	            <survey-yes-no answer="answer" label="Hepatomegaly" field="Abdomen.Hepatomegaly"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Caput medusa" field="Abdomen.Caput_medusa"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Umbilical hernia" field="Abdomen.Umbilical_hernia"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Abdominal mass" field="Abdomen.Abdominal_mass.value">
	                <survey-text answer="answer" label="" field="Abdomen.Abdominal_mass.yes" partial="true"></survey-text>
	            </survey-yes-no>
	        </survey-group>
	        <survey-group title="Genitourinay System">
	            <survey-yes-no answer="answer" label="Testicular atrophy" field="Genitourinay_System.Testicular_atrophy"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Amenorrhea" field="Genitourinay_System.Amenorrhea"></survey-yes-no>
	        </survey-group>
	        <survey-group title="Limbs">
	            <survey-yes-no answer="answer" label="Edema" field="Limbs.Edema"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Arthralgia/Artheritis" field="Limbs.Arthralgia_Artheritis.value">
	                <survey-single-choice answer="answer" field="Limbs.Arthralgia_Artheritis.yes">
	                    <survey-option label="Small joint" ></survey-option>
	                    <survey-option label="Large joint" ></survey-option>
	                    <survey-option label="Both" ></survey-option>
	                </survey-single-choice>
	            </survey-yes-no>
	            <survey-yes-no answer="answer" label="Musle cramp" field="Limbs.Musle_cramp"></survey-yes-no>
	        </survey-group>
	        <survey-group title="Neurologic Sign and Symptoms">
	            <survey-yes-no answer="answer" label="Tremor" field="Neurologic_Sign_and_Symptoms.Tremor"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Loss of fine motor control" field="Neurologic_Sign_and_Symptoms.Loss"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Chorea" field="Neurologic_Sign_and_Symptoms.Chorea"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Encephalopathy" field="Neurologic_Sign_and_Symptoms.Encephalopathy.value">
	                <survey-text answer="answer" label="Grade" field="Neurologic_Sign_and_Symptoms.Encephalopathy.yes" partial="true"></survey-text>
	            </survey-yes-no>
	            <survey-yes-no answer="answer" label="Rigidity" field="Neurologic_Sign_and_Symptoms.Rigidity"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Gait disturbance" field="Neurologic_Sign_and_Symptoms.Gait_disturbance"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Alternation in handwirting" field="Neurologic_Sign_and_Symptoms.Alternation_in_handwirting"></survey-yes-no>
	        </survey-group>
	        <survey-group title="Psychiatric Sign and Symptom">
	            <survey-yes-no answer="answer" label="Depression" field="Psychiatric_Sign_and_Symptom.Depression"></survey-yes-no>
	            <survey-yes-no answer="answer" label="Personality disorder" field="Psychiatric_Sign_and_Symptom.Personality_disorder"></survey-yes-no>
	        </survey-group>
	        <survey-text answer="answer" label="Other" field="Other"></survey-text>
	    </survey-page>
	</div>
</body>