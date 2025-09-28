
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
	    <survey-page title="Past Drug History Befor DX" answer="answer">
	        <survey-group title="Past Drug History Befor DX" >
                <survey-single-choice label="Methyldopa" field="Past_Drug_History_Befor_DX.Methyldopa" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Nitrofurantoine" field="Past_Drug_History_Befor_DX.Nitrofurantoine" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Diclophenac" field="Past_Drug_History_Befor_DX.Diclophenac" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Oxyphenistatin" field="Past_Drug_History_Befor_DX.Oxyphenistatin" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Statin" field="Past_Drug_History_Befor_DX.Statin" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Minoxidine" field="Past_Drug_History_Befor_DX.Minoxidine" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Astaminophen" field="Past_Drug_History_Befor_DX.Astaminophen" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Halothane" field="Past_Drug_History_Befor_DX.Halothane" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Isoniazide" field="Past_Drug_History_Befor_DX.Isoniazide" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Sodiom Valproate" field="Past_Drug_History_Befor_DX.Sodiom_Valproate" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Phenytoin" field="Past_Drug_History_Befor_DX.Phenytoin" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Chlorpromazine" field="Past_Drug_History_Befor_DX.Chlorpromazine" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Amiodarone" field="Past_Drug_History_Befor_DX.Amiodarone" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Erythromycin" field="Past_Drug_History_Befor_DX.Erythromycin" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="OCP" field="Past_Drug_History_Befor_DX.OCP" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Co-Trimoxazole" field="Past_Drug_History_Befor_DX.Co_Trimoxazole" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Statins (HMG COA Redoctaseinhibitors)" field="Past_Drug_History_Befor_DX.Statins" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Steroid Anabolics" field="Past_Drug_History_Befor_DX.Steroid_Anabolics" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="TPN" field="Past_Drug_History_Befor_DX.TPN" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Herbal/Alternative Medicine Medication" field="Past_Drug_History_Befor_DX.Herbal_Alternative_Medicine_Medication" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>

				<survey-text answer="answer" label="Other" field="Past_Drug_History_Befor_DX.Other"></survey-text>
	        </survey-group>
	    </survey-page>
	</div>
</body>