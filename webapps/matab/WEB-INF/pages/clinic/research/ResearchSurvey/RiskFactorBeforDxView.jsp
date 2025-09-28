
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
	    <survey-page title="Risk factor before DX" answer="answer">
	        <survey-group title="Risk factor before DX" >
                <survey-single-choice label="Hemodialysis" field="Risk_factor_before_DX.Hemodialysis" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Transfusion" field="Risk_factor_before_DX.Transfusion" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Cupping" field="Risk_factor_before_DX.Cupping" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Tattooing" field="Risk_factor_before_DX.Tattooing" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Needle Stick" field="Risk_factor_before_DX.Needle_Stick" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Blood Slashing" field="Risk_factor_before_DX.Blood_Slashing" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Periodontal Procedures" field="Risk_factor_before_DX.Periodontal_Procedures" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="High Risk Sexuality" field="Risk_factor_before_DX.High_Risk_Sexuality" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Shared Shaving Razors" field="Risk_factor_before_DX.Shared_Shaving_Razors" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Travel in the past 6 month" field="Risk_factor_before_DX.Travel_in_the_past_6_month" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Recent Exposure to Icterus Hepatitis" field="Risk_factor_before_DX.Recent_Exposure_to_Icterus_Hepatitis" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="UGI Endoscopy" field="Risk_factor_before_DX.UGI_Endoscopy" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="LGI Endoscopy" field="Risk_factor_before_DX.LGI_Endoscopy" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Exposure to Chemical Weapone" field="Risk_factor_before_DX.Exposure_to_Chemical_Weapone" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="History of prison" field="Risk_factor_before_DX.History_of_prison" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="IV Drug abuse" field="Risk_factor_before_DX.IV_Drug_abuse" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
				<survey-text answer="answer" label="Other" field="Risk_factor_before_DX.Other"></survey-text>
	        </survey-group>
	    </survey-page>
	</div>
</body>