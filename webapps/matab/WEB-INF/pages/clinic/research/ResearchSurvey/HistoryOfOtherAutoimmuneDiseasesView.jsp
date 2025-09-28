
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
	    <survey-page title="History Of Other Autoimmune Diseases" answer="answer">
	        <survey-group title="History Of Other Autoimmune Diseases" >
                <survey-single-choice label="Autoimmune Hemolytic Anemia" field="HistoryOfOther_Autoimmune_Diseases.Autoimmune_Hemolytic_Anemia" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="DM 1" field="HistoryOfOther_Autoimmune_Diseases.DM_1" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Autoimmune Thyroiditis" field="HistoryOfOther_Autoimmune_Diseases.Autoimmune_Thyroiditis" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Graves'Disease" field="HistoryOfOther_Autoimmune_Diseases.Graves_Disease" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Wegner's Granulomatosis" field="HistoryOfOther_Autoimmune_Diseases.Wegners_Granulomatosis" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Autoimmune Polyglandular Syndrome" field="HistoryOfOther_Autoimmune_Diseases.Autoimmune_Polyglandular_Syndrome" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Celiac_Disease" field="HistoryOfOther_Autoimmune_Diseases.Celiac_Disease" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Ulcerative Colitis" field="HistoryOfOther_Autoimmune_Diseases.Ulcerative_Colitis" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Sjogren's Syndrome" field="HistoryOfOther_Autoimmune_Diseases.Sjogrens_Syndrome" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Systemic Lupus Erythematouse" field="HistoryOfOther_Autoimmune_Diseases.Systemic_Lupus_Erythematouse" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="ITP" field="HistoryOfOther_Autoimmune_Diseases.ITP" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Alopecic" field="HistoryOfOther_Autoimmune_Diseases.Alopecic" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Vitiligo" field="HistoryOfOther_Autoimmune_Diseases.Vitiligo" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Persistent Anemia" field="HistoryOfOther_Autoimmune_Diseases.Persistent_Anemia" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Pemphigus Vulgaris" field="HistoryOfOther_Autoimmune_Diseases.Pemphigus_Vulgaris" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Mixed Connective Tissue Disease" field="HistoryOfOther_Autoimmune_Diseases.Mixed_Connective_Tissue_Disease" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="RA (Rheumatoid Arthritis)" field="HistoryOfOther_Autoimmune_Diseases.RA" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Sickle Cell Anemia" field="HistoryOfOther_Autoimmune_Diseases.Sickle_Cell_Anemia" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Lymphoproliferative Syndrome" field="HistoryOfOther_Autoimmune_Diseases.Lymphoproliferative_Syndrome" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Nail Dystrophy" field="HistoryOfOther_Autoimmune_Diseases.Nail_Dystrophy" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Membranoproliferative Glomerulonephritis" field="HistoryOfOther_Autoimmune_Diseases.Membranoproliferative_Glomerulonephritis" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
                <survey-single-choice label="Immune Complex-Mediated Glomerulonephritis" field="HistoryOfOther_Autoimmune_Diseases.Immune_Complex_Mediated_Glomerulonephritis" answer="answer" >
                    <survey-option label="Yes" ></survey-option>
                    <survey-option label="No" ></survey-option>
                    <survey-option label="Unkown" ></survey-option>
                </survey-single-choice>
				<survey-text answer="answer" label="Other" field="HistoryOfOther_Autoimmune_Diseases.Other"></survey-text>
	        </survey-group>
	    </survey-page>
	</div>
</body>