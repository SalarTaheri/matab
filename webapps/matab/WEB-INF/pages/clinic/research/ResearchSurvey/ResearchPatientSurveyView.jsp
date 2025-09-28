
<%@page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%><!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<html>
<head>
	<link href="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/development-bundle/themes/base/jquery-ui.css'/>" rel="stylesheet" />
	<link href="<c:url value='/resources/questionnaire/css/survey.css'/>" rel="stylesheet" />
	<script src="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/development-bundle/jquery-1.10.2.js' />"></script>
	<script src="<c:url value='/resources/jquery-ui.js'/>"></script>

</head>   
    
<body>
	<base:a classNames="uk-button uk-button-danger" id="aTag-survey-back" key="global.crud.cancel" />
	<div class="uk-grid p-kanban p-kanban-static">
		<div class="uk-width-1-1 p-kanban-card" >
			<div class="uk-panel uk-panel-box">
				<table style="width: 100%" >
					<tr>
						<td class="survey-table-title-font" style="direction: ltr; width: 10%">
							 : <%=ResourceBoundleHolder.resourceBundle.getString("clinic.survey.registration.firstName") %>
						</td>
						<td style="width: 20%; padding-right: 5px; font-size: 100">
							${patientName}
						</td>
						<td class="survey-table-title-font" style="direction: ltr; width: 20%">
							: <%=ResourceBoundleHolder.resourceBundle.getString("clinic.survey.registration.birthYear") %>
						</td>
						<td style="width: 10%; padding-right: 5px">
							${patientBirthYear}
						</td>
						<td class="survey-table-title-font" style="direction: ltr; width: 20%">
							: <%=ResourceBoundleHolder.resourceBundle.getString("clinic.survey.registration.age") %>
						</td>
						<td style="width: 10%; padding-right: 5px">
							${patientAge}
						</td>
					</tr>
					<tr>
						<td  class="survey-table-title-font" style="direction: ltr;">
							: <%=ResourceBoundleHolder.resourceBundle.getString("clinic.survey.registration.lastName") %>
						</td>
						<td style="padding-right: 5px">
							${patientFam}
						</td>
						<td  class="survey-table-title-font" style="direction: ltr;">	
							: <%=ResourceBoundleHolder.resourceBundle.getString("clinic.survey.registration.patientBirthplaceCityName") %>
						</td>
						<td style="padding-right: 5px">
							${patientBirthplaceCityName}
						</td>
						<td  class="survey-table-title-font" style="direction: ltr;">
							: <%=ResourceBoundleHolder.resourceBundle.getString("clinic.survey.registration.patientCityName") %>
						</td>
						<td style="padding-right: 5px">
							${patientCityName }
						</td>
					</tr>
					<tr>
						<td  class="survey-table-title-font" style="direction: ltr;">
							: <%=ResourceBoundleHolder.resourceBundle.getString("clinic.survey.registration.fileNumber") %>
						</td>
						<td style="padding-right: 5px">
							${patientFileNumber}
						</td>
						<td>
						</td>
						<td>
						</td>
						<td>
						</td>
						<td>
						</td>
					</tr>										
				</table>
			</div>
			
		</div>
	</div>
	
<div id="accordion" align="left" dir="ltr">
  <h3 align="left" class="acordstyle" dir="ltr">General Info</h3>
  <div align="left" dir="ltr" >
    <div align="left" dir="ltr" class="uk-grid p-kanban p-kanban-static" >
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card" >
				<div id="demographicData" class="uk-panel uk-panel-box border-survey-card-color" >
					<a href="#" class="surveyHRefClick" onclick="cardClick('demographicData')">Demographic Data</a>
				</div>
			</div>
	</div>
  </div>
<%if(GlobalVariable.hasDepartment("Liver")){ %>
  <h3 align="left" class="acordstyle" dir="ltr">Liver Disease Data Sheet</h3>
  <div align="left" dir="ltr">
    <div align="left" dir="ltr" class="uk-grid p-kanban p-kanban-static" >
			<div class="uk-width-1-5 p-kanban-card "  style="margin-bottom: 5px;" >
				<div id="medicalHistory" class="uk-panel uk-panel-box border-survey-card-color" >
					<a href="#" onclick="cardClick('medicalHistory')">Medical History</a>
				</div>
			</div>
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="riskFactorBeforDx" class="uk-panel uk-panel-box border-survey-card-color" >
					<a href="#" class="surveyHRefClick" onclick="cardClick('riskFactorBeforDx')">Risk factor Befor DX</a>
				</div>
			</div>
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="familialHistory" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('familialHistory')">Familial History</a>
				</div>
			</div>
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="historyOfOtherAutoimmuneDiseases border-survey-card-color" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('historyOfOtherAutoimmuneDiseases')">History of other Autoimmune diseases</a>
				</div>
			</div>
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="pastDrugHistoryBeforDX" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('pastDrugHistoryBeforDX')">Past Drug History befor DX</a>
				</div>
			</div>
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="habitualHistory" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('habitualHistory')">Habitual History</a>
				</div>
			</div>
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="symptomsAndSignsAtOnset" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('symptomsAndSignsAtOnset')">Symptons & Signs at Onset</a>
					<div id="symptomsAndSignsAtOnsetCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
					
				</div>
			</div>
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="sonography" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('sonography')">Sonography</a>
					<div id="sonographyCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;"></div>					
				</div>
			</div>
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="uGIEndoscopy" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('uGIEndoscopy')">UGI ENDOSCOPY</a>
					<div id="uGIEndoscopyCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>					
				</div>
			</div>
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="colonoscopy" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('colonoscopy')">COLONOSCOPY</a>
					<div id="colonoscopyCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>					
				</div>
			</div>
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="eRCP" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('eRCP')">ERCP</a>
					<div id="eRCPCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>					
				</div>
			</div>			
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="cTScan" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('cTScan')">CT SCAN</a>
					<div id="cTScanCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>					
				</div>
			</div>			
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="mRI" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('mRI')">MRI</a>
					<div id="mRICount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>					
				</div>
			</div>			
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="mRCP" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('mRCP')">MRCP</a>
					<div id="mRCPCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>					
				</div>
			</div>			
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="drugHistoryAfterDx" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('drugHistoryAfterDx')">Drug History after Dx</a>
				</div>
			</div>			
			<div class="uk-width-1-5 p-kanban-card " style="margin-bottom: 5px;" >
				<div id="cBC" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('cBC')">CBC</a>
					<div id="cBCCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>					
				</div>
			</div>			
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="ascitis" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('ascitis')">Ascitis</a>
					<div id="ascitisCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>			
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="lFT" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('lFT')">LFT</a>
					<div id="lFTCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>			
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="biochemistry" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('biochemistry')">Biochemistry</a>
					<div id="biochemistryCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
					
				</div>
			</div>			
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="ironAndCopperIndices" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('ironAndCopperIndices')">Iron & Copper Indices</a>
					<div id="ironAndCopperIndicesCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>			
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="thyroidFunction" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('thyroidFunction')">Thyroid Function</a>
					<div id="thyroidFunctionCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>			
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="autoAntibody" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('autoAntibody')" >Auto Antibody</a>
					<div id="autoAntibodyCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="tumorMarkers" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('tumorMarkers')">Tumor Markers</a>
					<div id="tumorMarkersCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>	
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="electroPhoresis" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('electroPhoresis')">Electro Phoresis</a>
				</div>
			</div>	
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="uA" class="uk-panel uk-panel-box border-survey-card-color" >
					<a href="#" onclick="cardClick('uA')">U/A</a>
					<div id="uACount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="uC" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('uC')">U/C</a>
					<div id="uCCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="sE" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('sE')">S/E</a>
					<div id="sECount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="sC" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('sC')">S/C</a>
					<div id="sCCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="IBDClick()">Viral Marker</a>
				</div>
			</div>																													
			<div class="uk-width-1-5 p-kanban-card"  style="margin-bottom: 5px;" >
				<div id="pathology" class="uk-panel uk-panel-box border-survey-card-color">
					<a href="#" onclick="cardClick('pathology')">Pathology</a>
					<div id="pathologyCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>							
		</div>
  </div>
  <%} 
if(GlobalVariable.hasDepartment("IBD")){ %>
  <h3 class="acordstyle">IBD</h3>
  <div align="left" dir="ltr">
    <div align="left" dir="ltr" class="uk-grid p-kanban p-kanban-static" >
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_MedicalHistory" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_MedicalHistory')">Medical History</a>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_DiagnosisIdentification" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_DiagnosisIdentification')">Diagnosis Identification</a>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_SymptomsAndSignsAtOnset" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_SymptomsAndSignsAtOnset')">Symptoms And Signs at Onset</a>
					<div id="iBD_SymptomsAndSignsAtOnsetCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>

			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_PastDraugHistory" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_PastDraugHistory')">Past Draug History</a>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_DeathInformation" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_DeathInformation')">Death Information</a>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_Complications" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_Complications')">Complications</a>
					<div id="iBD_ComplicationsCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_DetermineAnyOtherChanges" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_DetermineAnyOtherChanges')">Determine Any Other Changes</a>
					<div id="iBD_DetermineAnyOtherChangesCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_DrugHistory" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_DrugHistory')">Drug History</a>
					<div id="iBD_DrugHistoryCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_HospitalAdmission" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_HospitalAdmission')">Hospital Admission</a>
					<div id="iBD_HospitalAdmissionCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_DoctorVisit" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_DoctorVisit')">Doctor Visit</a>
					<div id="iBD_DoctorVisitCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_CBC" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_CBC')">CBC</a>
					<div id="iBD_CBCCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_LFT" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_LFT')">LFT</a>
					<div id="iBD_LFTCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_Biochemistry" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_Biochemistry')">Biochemistry</a>
					<div id="iBD_BiochemistryCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_Iron_indices" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_Iron_indices')">Iron indices</a>
					<div id="iBD_Iron_indicesCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_Serology" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_Serology')">Serology</a>
					<div id="iBD_SerologyCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_UA" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_UA')">U\A</a>
					<div id="iBD_UACount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_UC" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_UC')">U\C</a>
					<div id="iBD_UCCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_SE" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_SE')">S\E</a>
					<div id="iBD_SECount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_SC" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_SC')">S\C</a>
					<div id="iBD_SCCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_X_Ray_Procedures" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_X_Ray_Procedures')">X-Ray Procedures</a>
					<div id="iBD_X_Ray_ProceduresCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
			<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
				<div id="iBD_EndoscopyAndPathology" class="uk-panel uk-panel-box border-survey-card-color"  >
					<a href="#" onclick="cardClick('iBD_EndoscopyAndPathology')">Endoscopy And Pathology</a>
					<div id="iBD_EndoscopyAndPathologyCount" class="uk-panel-badge uk-badge p-count"  align="right" dir="rtl" style="margin-left: 80%;">0</div>
				</div>
			</div>
		</div>
  </div>

 <%} 
if(GlobalVariable.hasDepartment("Celiac")){ %>
  <h3 class="acordstyle">Celiac Patients Data Collection Form</h3>
  <div align="left" dir="ltr">
 	<div align="left" dir="ltr" class="uk-grid p-kanban p-kanban-static" >
		<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
			<div id="celiac_MedicalHistory" class="uk-panel uk-panel-box border-survey-card-color"  >
				<a href="#" onclick="cardClick('celiac_MedicalHistory')">Medical History</a>
			</div>
		</div>

		<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
			<div id="celiac_FamilyHistory" class="uk-panel uk-panel-box border-survey-card-color"  >
				<a href="#" onclick="cardClick('celiac_FamilyHistory')">Family History</a>
			</div>
		</div>

		<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
			<div id="celiac_Symptoms" class="uk-panel uk-panel-box border-survey-card-color"  >
				<a href="#" onclick="cardClick('celiac_Symptoms')">Symptoms</a>
			</div>
		</div>

		<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
			<div id="celiac_HxOfExtraintestinalManifestations" class="uk-panel uk-panel-box border-survey-card-color"  >
				<a href="#" onclick="cardClick('celiac_HxOfExtraintestinalManifestations')">Hx of Extraintestinal Manifestations and Complications</a>
			</div>
		</div>

		<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
			<div id="celiac_PhysicalExamination" class="uk-panel uk-panel-box border-survey-card-color"  >
				<a href="#" onclick="cardClick('celiac_PhysicalExamination')">Physical Examination</a>
			</div>
		</div>

		<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
			<div id="celiac_DiagnosticProcedures" class="uk-panel uk-panel-box border-survey-card-color"  >
				<a href="#" onclick="cardClick('celiac_DiagnosticProcedures')">Diagnostic Procedures</a>
			</div>
		</div>

		<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
			<div id="celiac_CBC" class="uk-panel uk-panel-box border-survey-card-color"  >
				<a href="#" onclick="cardClick('celiac_CBC')">CBC</a>
			</div>
		</div>

		<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
			<div id="celiac_LFT" class="uk-panel uk-panel-box border-survey-card-color"  >
				<a href="#" onclick="cardClick('celiac_LFT')">LFT</a>
			</div>
		</div>

		<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
			<div id="celiac_Biochemistry" class="uk-panel uk-panel-box border-survey-card-color"  >
				<a href="#" onclick="cardClick('celiac_Biochemistry')">Biochemistry</a>
			</div>
		</div>

		<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
			<div id="celiac_SE" class="uk-panel uk-panel-box border-survey-card-color"  >
				<a href="#" onclick="cardClick('celiac_SE')">S/E</a>
			</div>
		</div>

		<div align="left" dir="ltr" class="uk-width-1-5 p-kanban-card"  >
			<div id="celiac_Others" class="uk-panel uk-panel-box border-survey-card-color"  >
				<a href="#" onclick="cardClick('celiac_Others')">Others if available</a>
			</div>
		</div>
	</div>
  </div>
<%} 
if(GlobalVariable.hasDepartment("Section 4")){ %>
  <h3 class="acordstyle">Section 4</h3>
  <div>
    <p>Cras dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia mauris vel est. </p><p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. </p>
  </div>
<%} %>
</div>
</body>
<script >
$(function() {
	$("#aTag-survey-back").attr("href","${pageContext.request.contextPath}"+ "/clinic/research/registration/");
    $( "#accordion" ).accordion({
      collapsible: true
      ,active: 10
      ,heightStyle: "content"
    });
    
    $("#accordion").css("background-color","dimgrey");
        
    
	$.ajax({
        url: "${pageContext.request.contextPath}"+"/clinic/research/survey/getCardCount/${patientId}",
        type:"GET",
        dataType:"json",
        contentType:"application/json; charset=utf-8",
        success: function (data) {
        	console.log(data);
        	$('#sonographyCount').html(data.SonographyCount);
        	$('#symptomsAndSignsAtOnsetCount').html(data.SymptomsAndSignsAtOnsetCount);
        	$('#uGIEndoscopyCount').html(data.UGIEndoscopyCount);
        	$('#colonoscopyCount').html(data.ColonoscopyCount);
        	$('#eRCPCount').html(data.ERCPCount);
        	$('#cTScanCount').html(data.CTScanCount);
        	$('#mRICount').html(data.MRICount);
        	$('#mRCPCount').html(data.MRCPCount);
        	$('#cBCCount').html(data.CBCCount);
        	$('#ascitisCount').html(data.AscitisCount);
        	$('#lFTCount').html(data.LFTCount);
        	$('#biochemistryCount').html(data.BiochemistryCount);
        	$('#ironAndCopperIndicesCount').html(data.IronAndCopperIndicesCount);
        	$('#thyroidFunctionCount').html(data.ThyroidFunctionCount);
        	$('#autoAntibodyCount').html(data.AutoAntibodyCount);
        	$('#tumorMarkersCount').html(data.TumorMarkersCount);
        	$('#uACount').html(data.UACount);
        	$('#uCCount').html(data.UCCount);
        	$('#sECount').html(data.SECount);
        	$('#sCCount').html(data.SCCount);
        	$('#pathologyCount').html(data.PathologyCount);
        	
        	
        	        	
        	if(data.DemographicDataCount>0){
        		$('#demographicData').css("background-color","aquamarine");
        	}
        	
			if(data.MedicalHistoryCount>0){
        		$('#medicalHistory').css("background-color","aquamarine");
        	}
			if(data.RiskFactorBeforDxCount>0){
        		$('#riskFactorBeforDx').css("background-color","aquamarine");
        	}
			if(data.FamilialHistoryCount>0){
        		$('#familialHistory').css("background-color","aquamarine");
        	}
			if(data.HistoryOfOtherAutoimmuneDiseasesCount>0){
        		$('#historyOfOtherAutoimmuneDiseases').css("background-color","aquamarine");
        	}
			if(data.PastDrugHistoryBeforDXCount>0){
        		$('#pastDrugHistoryBeforDX').css("background-color","aquamarine");
        	}
			if(data.HabitualHistoryCount>0){
        		$('#habitualHistory').css("background-color","aquamarine");
        	}

        	if(data.SymptomsAndSignsAtOnsetCount>0){
        		$('#symptomsAndSignsAtOnset').css("background-color","aquamarine");
        	}
			
        	if(data.SonographyCount>0){
        		$('#sonography').css("background-color","aquamarine");
        	}
			
			if(data.UGIEndoscopyCount>0){
        		$('#uGIEndoscopy').css("background-color","aquamarine");
        	}
			
			if(data.ColonoscopyCount>0){
        		$('#colonoscopy').css("background-color","aquamarine");
        	}
			
			if(data.ERCPCount>0){
        		$('#eRCP').css("background-color","aquamarine");
        	}
			
			if(data.CTScanCount>0){
        		$('#cTScan').css("background-color","aquamarine");
        	}
			
			if(data.MRICount>0){
        		$('#mRI').css("background-color","aquamarine");
        	}
			
			if(data.MRCPCount>0){
        		$('#mRCP').css("background-color","aquamarine");
        	}
			
			if(data.CBCCount>0){
        		$('#cBC').css("background-color","aquamarine");
        	}
			
			if(data.AscitisCount>0){
        		$('#ascitis').css("background-color","aquamarine");
        	}
        	
        	if(data.LFTCount>0){
        		$('#lFT').css("background-color","aquamarine");
        	}
        	
        	if(data.BiochemistryCount>0){
        		$('#biochemistry').css("background-color","aquamarine");
        	}

        	if(data.IronAndCopperIndicesCount>0){
        		$('#ironAndCopperIndices').css("background-color","aquamarine");
        	}

        	if(data.ThyroidFunctionCount>0){
        		$('#thyroidFunction').css("background-color","aquamarine");
        	}

        	if(data.AutoAntibodyCount>0){
        		$('#autoAntibody').css("background-color","aquamarine");
        	}

        	if(data.TumorMarkersCount>0){
        		$('#tumorMarkers').css("background-color","aquamarine");
        	}

        	if(data.UACount>0){
        		$('#uA').css("background-color","aquamarine");
        	}

        	if(data.UCCount>0){
        		$('#uC').css("background-color","aquamarine");
        	}
        	
        	if(data.SECount>0){
        		$('#sE').css("background-color","aquamarine");
        	}
        	
        	if(data.SCCount>0){
        		$('#sC').css("background-color","aquamarine");
        	}

        	if(data.PathologyCount>0){
        		$('#pathology').css("background-color","aquamarine");
        	}

        	
        	if(data.DrugHistoryAfterDxCount>0){
        		$('#drugHistoryAfterDx').css("background-color","aquamarine");
        	}

        	
        	
			//$('#doctorCombo').empty();            
        	//$("#doctorCombo").append(data.data);
        	//reLoadOnDoctorCombo();
        },error:function(result){
            if(result.status==401){
                top.location.href=top.location.href;
            }
        }
	});
    
  });


function cardClick(cardName) {
     window.location = cardName + "/${patientId}";
}

//$("#aTag-survey-back").click(function(){
	
	//window.location ="${pageContext.request.contextPath}"+ "/clinic/research/registration/";
	//window.location ="sdfsdf/sdfsdf";
//});

$(".border-survey-card-color").click(function(){
    console.log(this.id);
    cardClick(this.id);
});

</script>
