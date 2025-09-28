<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%><%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	request.setAttribute("basePath", basePath);
	String createUrl = basePath + "create";
 %>

 <input name="loadedId" type="hidden" id="loadedId" />
 
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=resource.getString("com.artonis.core.system.config.setting")%></span>
		</li>
	</ul>
	<div id="header-toolbar">
		<div id="body-heade-save-div" style="display">
			<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="body-heade-save"></base:buttonPermission>
		</div>
	</div>
</div>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="appointmentWebserviceAddress" key="com.artonis.system.config.setting.appointmentWebserviceAddress" styleClass="small" direction="ltr" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="clinicId" key="com.artonis.system.config.setting.clinicCode" styleClass="small" direction="ltr" />
		</div>

		<div class="p-q-radio uk-form-controls uk-grid uk-grid-preserve" >
			<input type="hidden" id="clinicType" name="clinicType" >
			<div class="uk-width-1-10 left-align">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.clinicType")%>
				</label>
			</div>
			<div class="uk-width-1-10" style="width: 10%;">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.clinicType.clinic")%>
					<input type="radio" class="p-q-radio" name="clinicTypeOption" value="1" onclick="handleClick(this)" />
				</label>
			</div>
			<div class="uk-width-1-10" style="">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.clinicType.doctorOffice")%>
					<input type="radio" class="p-q-radio" name="clinicTypeOption" value="2" onclick="handleClick(this)" />
				</label>
			</div>
		</div>

		<div class="p-q-radio uk-form-controls uk-grid uk-grid-preserve" >
			<input type="hidden" id="patientFileNumberType" name="patientFileNumberType" >
			<div class="uk-width-1-10 left-align">
				<label class="p-q-label uk-form-label">
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.patientFileNumberType")%>
				</label>
			</div>
			<div class="uk-width-1-10" style="width: 10%;">
				<label class="p-q-label uk-form-label">
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.patientFileNumberType.automatic")%>
					<input type="radio" class="p-q-radio" name="patientFileNumberTypeOption" value="1" onclick="handlePatientFileNumberTypeClick(this)" />
				</label>
			</div>
			<div class="uk-width-1-10" style="">
				<label class="p-q-label uk-form-label">
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.patientFileNumberType.manually")%>
					<input type="radio" class="p-q-radio" name="patientFileNumberTypeOption" value="2" onclick="handlePatientFileNumberTypeClick(this)" />
				</label>
			</div>
		</div>

		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="clinicTypeCode" key="com.artonis.system.config.setting.clinicTypeCode" styleClass="midsmall" />
		</div>

		<div class="uk-grid uk-grid-preserve">
			<base:checkbox name="showInsuranceFieldsInFinanceRegistrationPage" style="width: 50px !important;"
				key="com.artonis.system.config.setting.showInsuranceFieldsInFinanceRegistrationPage" styleClass="small" />
		</div>

		<div class="uk-grid uk-grid-preserve">
			<base:checkbox name="checkDuplicateInsertInPatientPage" style="width: 50px !important;"
				key="com.artonis.system.config.setting.checkDuplicateInsertInPatientPage" styleClass="small" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox name="checkPatientEnglishDataMandatory" style="width: 50px !important;"
				key="com.artonis.system.config.setting.checkPatientEnglishDataMandatory" styleClass="small" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox name="checkPatientDoctor" style="width: 50px !important;"
				key="com.artonis.system.config.setting.checkPatientDoctor" styleClass="small" />
		</div>

		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="penApplicationWebServiceAddress" key="com.artonis.system.config.setting.penApplicationWebServiceAddress"
				styleClass="small" direction="ltr" />
		</div>

		<div class="p-q-radio uk-form-controls uk-grid uk-grid-preserve" >
			<input type="hidden" id="handwritingType" name="handwritingType" >
			<div class="uk-width-1-10 left-align">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.handwritingType")%>
				</label>
			</div>
			<div class="uk-width-1-10" style="width: 15%;">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.handwritingType.webBaseApp")%>
					<input type="radio" class="p-q-radio" name="handwritingTypeOption" value="1" onclick="handleHandwritingTypeClick(this)" />
				</label>
			</div>
			<div class="uk-width-1-10" style="">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.handwritingType.windowsApp")%>
					<input type="radio" class="p-q-radio" name="handwritingTypeOption" value="2" onclick="handleHandwritingTypeClick(this)" />
				</label>
			</div>
		</div>

		<div class="uk-grid uk-grid-preserve">
			<input type="hidden" id="receiveSchedulerState" name="receiveSchedulerState">
			<table style="width: 100%;">
				<tr>
					<td style="font-weight: bold; padding-bottom: 10px;">
						<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.receiveDataScheduler")%>
					</td>
				</tr>
				<tr>
					<td>
						<span style="padding-right: 155px; padding-left: 10px;">
							<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.receiveDataScheduler.state")%>
						</span>
						<span>
							<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.receiveDataScheduler.state.active")%>
							<input type="radio" class="p-q-radio" name="receiveDataSchedulerStateOption" value="1" onclick="handleReceiveDataSchedulerStateOptionClick(this)" />
						</span>
						<span style="padding-right: 15px;">
							<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.receiveDataScheduler.state.deActive")%>
							<input type="radio" class="p-q-radio" name="receiveDataSchedulerStateOption" value="0" onclick="handleReceiveDataSchedulerStateOptionClick(this)" />
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<div style="display: flex;">
							<base:testBox name="receiveSchedulerCallPeriod" styledivLabel="width: 200px; padding-left: 10px;"
								  key="com.artonis.system.config.setting.receiveDataScheduler.period" styleClass="midsmall" />
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div style="display: flex;">
							<base:testBox name="receiveSchedulerDayLength" styledivLabel="width: 200px; padding-left: 10px;"
									  key="com.artonis.system.config.setting.receiveDataScheduler.dayLength" styleClass="midsmall" />
						</div>
					</td>
				</tr>
			</table>
		</div>

		<div class="uk-grid uk-grid-preserve">
			<table style="width: 100%;" id="patientRecordComponentTable">
				<tr>
					<td style="font-weight: bold; padding-bottom: 10px;" class="patientRecordComponentTableHeader" colspan="4">
						<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.patientRecordComponent")%>
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="prc_Handwriting"> Handwriting </input>
					</td>
					<td>
						<input type="checkbox" name="prc_ChiefCompliant"> Chief Compliant </input>
					</td>
					<td>
						<input type="checkbox" name="prc_PhysicalExamination"> Physical Examination </input>
					</td>
					<td>
						<input type="checkbox" name="prc_Diagnosis"> Diagnosis </input>
					</td>
					<td>
						<input type="checkbox" name="prc_LabTestAndResult"> LabTest & Result </input>
					</td>
					<td>
						<input type="checkbox" name="prc_ProcedureResult"> Procedure & Result </input>
					</td>
					<td>
						<input type="checkbox" name="prc_ResearchDepartment"> Research Department </input>
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="prc_History"> History </input>
					</td>
					<td>
						<input type="checkbox" name="prc_Order"> Order </input>
					</td>
					<td>
						<input type="checkbox" name="prc_FollowUp"> Follow Up </input>
					</td>
					<td>
						<input type="checkbox" name="prc_Recommendation"> Recommendation </input>
					</td>
					<td colspan="3">
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="prc_ScanFiles"> Scan Files </input>
					</td>
					<td>
						<input type="checkbox" name="prc_LabTestReport"> Lab Test Report </input>
					</td>
					<td>
						<input type="checkbox" name="prc_ProcedureReport"> Procedure Report </input>
					</td>
					<td>
						<input type="checkbox" name="prc_Sonography"> Sonography </input>
					</td><td>
						<input type="checkbox" name="prc_Sonography_pdf"> Sonography PDF </input>
					</td>
					<td>
						<input type="checkbox" name="prc_Pathology"> Pathology </input>
					</td>
					<td colspan="2">
					</td>
				</tr>
			</table>
		</div>


		<div class="p-q-radio uk-form-controls uk-grid uk-grid-preserve" >
			<input type="hidden" id="roundingType" name="roundingType" >
			<div class="uk-grid-preserve">
				<label style="font-weight: bold; padding-bottom: 10px;" class="p-q-label uk-form-label">
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.roundingType")%>
				</label>
			</div>
			<div class="uk-grid uk-grid-preserve">
				<div class="uk-width-1-10 left-align">
					<label class="p-q-label uk-form-label">
						<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.roundingTypeDeductPrice")%>
						<input type="radio" class="p-q-radio" name="roundingTypeOption" value="1" onclick="handleRoundingTypeClick(this)" />
					</label>
				</div>

				<base:testBox name="roundingBaseDeduct" styledivLabel="width: 200px; padding-left: 10px;"
							  key="com.artonis.system.config.setting.roundingTypeDeductPrice" styleClass="midsmall" />
			</div>
			<%--<div class="uk-width-1-10" style="">--%>
			<div class="uk-grid uk-grid-preserve">
				<div class="uk-width-1-10 left-align">
					<label class="p-q-label uk-form-label">
						<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.roundingTypeRoundPrice")%>
						<input type="radio" class="p-q-radio" name="roundingTypeOption" value="2" onclick="handleRoundingTypeClick(this)" />
					</label>
				</div>
				<base:testBox name="roundingBaseRound" styledivLabel="width: 200px; padding-left: 10px;"
						  key="com.artonis.system.config.setting.roundingTypeRoundPrice" styleClass="midsmall" />
			</div>
		</div>

		<div class="uk-grid uk-grid-preserve" id="countOfDoctorsPart">
			<input type="hidden" id="countOfDoctors" name="countOfDoctors">
			<table style="width: 100%;">
				<tr>
					<td colspan="3" style="font-weight: bold; padding-bottom: 10px;">
						<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.matab.doctorsCount")%>
					</td>
				</tr>
				<tr>
					<td style="width: 10%; cursor: pointer;" class="doctorCountTdNotLimited">
						<input type="radio" name="doctorCountsOpt" id="notLimited" style="top: 3px; margin-left: 3px; position: relative;">
						<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.matab.doctorsCount.notLimited")%>
					</td>
					<td style="width: 20%; cursor: pointer;" class="doctorCountTdLimited">
						<input type="radio" name="doctorCountsOpt" id="limited" style="top: 3px; margin-left: 3px; position: relative;">
						<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.matab.doctorsCount.limited")%>
						-
						<input type="number" placeholder="<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.matab.doctorsCount.count")%>"
							   style="width: 160px;" id="doctorsCountValue" onkeyup="setCountOfDoctorsVal()">
					</td>
					<td></td>
				</tr>
			</table>
		</div>

		<div class="p-q-radio uk-form-controls uk-grid uk-grid-preserve" >
			<input type="hidden" id="editAlreadyPenFiles" name="editAlreadyPenFiles" >
			<div class="uk-width-1-10 left-align">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.editAlreadyPenFiles")%>
				</label>
			</div>
			<div class="uk-width-1-10" style="width: 10%;">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.editAlreadyPenFiles.state.active")%>
					<input type="radio" class="p-q-radio" name="editAlreadyPenFilesOption" value="true" onclick="handleEditAlreadyPenFilesOptionClick(this)" />
				</label>
			</div>
			<div class="uk-width-1-10" style="">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.editAlreadyPenFiles.state.deActive")%>
					<input type="radio" class="p-q-radio" name="editAlreadyPenFilesOption" value="false" onclick="handleEditAlreadyPenFilesOptionClick(this)" />
				</label>
			</div>
		</div>

		<div class="p-q-radio uk-form-controls uk-grid uk-grid-preserve" >
			<input type="hidden" id="hisPartnerUpdateSchedulerState" name="hisPartnerUpdateSchedulerState" >
			<div class="uk-width-1-10 left-align">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.hisPartnerUpdateSchedulerState")%>
				</label>
			</div>
			<div class="uk-width-1-10" style="width: 10%;">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.hisPartnerUpdateSchedulerState.state.active")%>
					<input type="radio" class="p-q-radio" name="hisPartnerUpdateSchedulerStateOption" value="true" onclick="handleHisPartnerUpdateSchedulerStateOptionClick(this)" />
				</label>
			</div>
			<div class="uk-width-1-10" style="">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.hisPartnerUpdateSchedulerState.state.deActive")%>
					<input type="radio" class="p-q-radio" name="hisPartnerUpdateSchedulerStateOption" value="false" onclick="handleHisPartnerUpdateSchedulerStateOptionClick(this)" />
				</label>
			</div>
		</div>

		<div class="uk-form-controls uk-grid uk-grid-preserve dayEndTimeClass">
			<base:timePicker name="dayEndTimeWrapper" key="com.artonis.system.config.setting.dayEndTime" interval="15" styleClass="small"/>
		</div>

		<div class="p-q-radio uk-form-controls uk-grid uk-grid-preserve" >
			<input type="hidden" id="diagnosisViewMode" name="diagnosisViewMode" >
			<div class="uk-width-1-10 left-align" style="width: 15%;">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.diagnosisViewMode")%>
				</label>
			</div>
			<div class="uk-width-1-10" style="width: 10%;">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.diagnosisViewMode.tree")%>
					<input type="radio" class="p-q-radio" name="diagnosisViewModeOption" value="1" onclick="handleDiagnosisViewModeOptionClick(this)" />
				</label>
			</div>
			<div class="uk-width-1-10" style="">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.diagnosisViewMode.simple")%>
					<input type="radio" class="p-q-radio" name="diagnosisViewModeOption" value="2" onclick="handleDiagnosisViewModeOptionClick(this)" />
				</label>
			</div>
		</div>

		<div class="p-q-radio uk-form-controls uk-grid uk-grid-preserve" >
			<div class="uk-width-1-10 left-align" style="">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.pacsXmlElement")%>
				</label>
			</div>
			<div class="uk-width-1-10 xmlTextArea" style="width: 70%">
				<textarea id="pacsXmlElement" name="pacsXmlElement" dir="ltr">
					${setting.pacsXmlElement}
				</textarea>
			</div>
		</div>

		<div class="p-q-radio uk-form-controls uk-grid uk-grid-preserve" >
			<input type="hidden" id="pacsPatientFieldType" name="pacsPatientFieldType" >
			<div class="uk-width-1-10 left-align" style="width: 200px;">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.pacsPatientFieldType")%>
				</label>
			</div>
			<div class="uk-width-1-10" style="width: 10%;">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.pacsPatientFieldType.persian")%>
					<input type="radio" class="p-q-radio" name="pacsPatientFieldTypeOption" value="1" onclick="handlePacsPatientFieldTypeOptionClick(this)" />
				</label>
			</div>
			<div class="uk-width-1-10" style="">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.pacsPatientFieldType.english")%>
					<input type="radio" class="p-q-radio" name="pacsPatientFieldTypeOption" value="2" onclick="handlePacsPatientFieldTypeOptionClick(this)" />
				</label>
			</div>
		</div>

		<div class="p-q-radio uk-form-controls uk-grid uk-grid-preserve" >
			<input type="hidden" id="doctorDashboardTurnType" name="doctorDashboardTurnType" >
			<div class="uk-width-1-10 left-align" style="width: 200px;">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.doctorDashboardTurnType")%>
				</label>
			</div>
			<div class="uk-width-1-10" style="width: 300px;">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.doctorDashboardTurnType.perService")%>
					<input type="radio" class="p-q-radio" name="doctorDashboardTurnTypeOption" value="2" onclick="handleDoctorDashboardTurnTypeOptionClick(this)" />
				</label>
			</div>
			<div class="uk-width-1-10" style="">
				<label class="p-q-label uk-form-label" >
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.doctorDashboardTurnType.allEachOther")%>
					<input type="radio" class="p-q-radio" name="doctorDashboardTurnTypeOption" value="1" onclick="handleDoctorDashboardTurnTypeOptionClick(this)" />
				</label>
			</div>
		</div>

		<div class="uk-grid uk-grid-preserve">
			<base:checkbox name="doctorDashboardSortByService" style="width: 50px !important;"
						   key="com.artonis.system.config.setting.doctorDashboardSortByService" styleClass="small" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<label id="labelForDoctorDashboardDelayTime" for="doctorDashboardDelayTimeAppointmentNumber" style="padding-right: 40px; padding-left: 20px;">
				<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.doctorDashboardDelayTimeAppointmentNumber")%>
			</label>
			<input type="number" style="width: 100px" id="doctorDashboardDelayTimeAppointmentNumber" name="doctorDashboardDelayTimeAppointmentNumber" onkeyup="">
		</div>
		<div class="uk-grid uk-grid-preserve">
			<label id="labelForFinancialReportCountOfRow" for="financialReportCountOfRow" style="padding-right: 40px; padding-left: 20px;">
				<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.financialReportCountOfRow")%>
			</label>
			<input type="number" style="width: 100px" id="financialReportCountOfRow" name="financialReportCountOfRow" onkeyup="">
		</div>
		<div class="uk-form-controls uk-grid uk-grid-preserve" >

			<div class="uk-grid-preserve">
				<label style="font-weight: bold; padding-bottom: 10px;" class="p-q-label uk-form-label">
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.monitoring")%>
				</label>
			</div>
			<div class="uk-grid uk-grid-preserve">
				<label id="labelForMonitorPaging" for="monitorPagingMaxNumber" style="padding-right: 40px; padding-left: 20px;">
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.monitoring.pagingMaxNumber")%>
				</label>
				<input type="number" style="width: 100px" id="monitorPagingMaxNumber" name="monitorPagingMaxNumber" onkeyup="">
			</div>
			<div class="uk-grid uk-grid-preserve">

					<base:checkbox name="rowVisible"  style="width: 50px !important;"
								   key="com.artonis.system.config.setting.monitoring.row.visible" styleClass="small" />
					<base:testBox name="rowHeaderFontSize"
								  key="com.artonis.system.config.setting.monitoring.row.header.font.size" styleClass="small" />
					<base:testBox name="rowContentFontSize"
								  key="com.artonis.system.config.setting.monitoring.row.content.font.size" styleClass="small" />
					<base:testBox name="rowFooterSize"
								  key="com.artonis.system.config.setting.monitoring.row.footer.size" styleClass="small" />

			</div>

			<div class="uk-grid uk-grid-preserve">

					<base:testBox name="nameFamHeaderFontSize"
								  key="com.artonis.system.config.setting.monitoring.nameFam.header.font.size" styleClass="small" />
					<base:testBox name="nameFamContentFontSize"
								  key="com.artonis.system.config.setting.monitoring.nameFam.content.font.size" styleClass="small" />
					<base:testBox name="nameFamFooterSize"
								  key="com.artonis.system.config.setting.monitoring.nameFam.footer.size" styleClass="small" />
					<base:testBox name="nameFamContentLimitsize"
								  key="com.artonis.system.config.setting.monitoring.nameFam.content.limitsize" styleClass="small" />
					<base:testBox name="nameFamContentSmallSize"
								  key="com.artonis.system.config.setting.monitoring.nameFam.content.small.size" styleClass="small" />
					<base:testBox name="nameFamContentLongSize"
								  key="com.artonis.system.config.setting.monitoring.nameFam.content.long.size" styleClass="small" />

			</div>


		</div>

		<div class="uk-form-controls uk-grid uk-grid-preserve" >

			<div class="uk-grid-preserve">
				<label style="font-weight: bold; padding-bottom: 10px;" class="p-q-label uk-form-label">
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.webservice")%>
				</label>
			</div>
			<div class="uk-grid uk-grid-preserve">

				<base:checkbox name="webServiceActive"  style="width: 50px !important;"
							   key="com.artonis.system.config.setting.webservice.active" styleClass="small" />
				<base:testBox name="webServiceRequestTimeOut"
							  key="com.artonis.system.config.setting.webservice.requestTimeOut" styleClass="small" />
				<base:testBox name="webServiceConnectionTimeOut"
							  key="com.artonis.system.config.setting.webservice.connectionTimeOut" styleClass="small" />

			</div>

		</div>
		<div class="uk-form-controls uk-grid uk-grid-preserve" >

			<div class="uk-grid-preserve">
				<label style="font-weight: bold; padding-bottom: 10px;" class="p-q-label uk-form-label">
					<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.sms.perPatient")%>
				</label>
			</div>
			<div class="uk-grid uk-grid-preserve">

				<base:checkbox name="smsPerPatientActive"  style="width: 50px !important;"
							   key="com.artonis.system.config.setting.sms.perPatient.active" styleClass="small" />
				<div class="uk-width-1-10 left-align">
					<label id="labelForSmsMaxNumber" for="smsMaxNumber" style="">
						<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.sms.perPatient.maxNumber")%>
					</label>
				</div>
				<div class="uk-width-2-10">
					<input type="number" class="uk-width-1-1" id="smsMaxNumber" name="smsMaxNumber" onkeyup="">
				</div>
				<div class="uk-width-1-10 left-align">
					<label id="labelForSmsCurrentNumber" for="smsCurrentNumber" style="">
						<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.sms.perPatient.currentNumber")%>
					</label>
				</div>
				<div class="uk-width-2-10">
					<input type="number" class="uk-width-1-1" id="smsCurrentNumber" name="smsCurrentNumber" onkeyup="">
				</div>
			</div>
			<div class="uk-grid uk-grid-preserve">
				<div class="uk-width-1-10 left-align" style="">
					<label class="p-q-label uk-form-label">
						<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.sms.perPatient.text")%>
					</label>
				</div>
				<div class="uk-width-1-10 xmlTextArea" style="width: 70%">
				<textarea id="smsPerPatientText" name="smsPerPatientText" style="text-align: right;" dir="rtl">
					${setting.smsPerPatientText}
				</textarea>
				</div>
			</div>

			<div class="uk-grid uk-grid-preserve">
				<base:checkbox name="showDoctorColumnInPatientBill" style="width: 50px !important;"
							   key="com.artonis.system.config.setting.showDoctorColumnInPatientBill" styleClass="small" />
			</div>


		</div>

		<div class="uk-grid uk-grid-preserve">
			<base:checkbox name="notShowAnotherDoctorPatientFile" style="width: 50px !important;"
						   key="com.artonis.system.config.setting.notShowAnotherDoctorPatientFile" styleClass="small" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox name="showServiceNameOnPatientFile" style="width: 50px !important;"
						   key="com.artonis.system.config.setting.showServiceNameOnPatientFile" styleClass="small" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox name="writeNewPrescriptionInPreviousDate" style="width: 50px !important;"
						   key="com.artonis.system.config.setting.writeNewPrescriptionInPreviousDate" styleClass="small" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox name="deletePrescription" style="width: 50px !important;"
						   key="com.artonis.system.config.setting.deletePrescription" styleClass="small" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox name="controllingLabTestReport" style="width: 50px !important;"
						   key="com.artonis.system.config.setting.controllingLabTestReport" styleClass="small" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox name="deletePatientFile" style="width: 50px !important;"
						   key="com.artonis.system.config.setting.deletePatientFile" styleClass="small" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox name="addOrContainerResearchReportMakerInDefault" style="width: 50px !important;"
						   key="com.artonis.system.config.setting.addOrContainerResearchReportMakerInDefault" styleClass="small" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox name="researchReportMakerDiagnosisBasedOnValue" style="width: 50px !important;"
						   key="com.artonis.system.config.setting.researchReportMakerDiagnosisBasedOnValue" styleClass="small" />
		</div>
	</form>
</div>

<script>
	if(!isNaN("${setting.id}") && "${setting.id}" > 0){
		$("#id").val("${setting.id}");
	}
	//
	function callback_validation_before_save(data) {
        if (document.getElementsByName("doctorDashboardTurnTypeOption")[1].checked == true && document.getElementsByName("doctorDashboardSortByService")[0].checked == true) {
	        alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.doctorDashboardSortByService.error")%>');
	        return false;
		}
	}
	//
	$("#appointmentWebserviceAddress").val("${setting.appointmentWebserviceAddress}");
	//
	$("#clinicId").val("${setting.clinicId}");
	//
	if("${setting.clinicType}" == 1){
		document.getElementsByName("clinicTypeOption")[0].checked = true;
		$("#clinicType").val(1);
	}else if("${setting.clinicType}" == 2){
		document.getElementsByName("clinicTypeOption")[1].checked = true;
		$("#clinicType").val(2);
	}
	//
	$("#clinicTypeCode").val("${setting.clinicTypeCode}");
	//
	if("${setting.patientFileNumberType}" == 1){
		document.getElementsByName("patientFileNumberTypeOption")[0].checked = true;
		$("#patientFileNumberType").val(1);
	}else if("${setting.patientFileNumberType}" == 2){
		document.getElementsByName("patientFileNumberTypeOption")[1].checked = true;
		$("#patientFileNumberType").val(2);
	}
	$("#patientFileNumberTypeCode").val("${setting.clinicTypeCode}");

	//

	if("${setting.roundingType}" == 1){
		document.getElementsByName("roundingTypeOption")[0].checked = true;
		$("#roundingType").val(1);
		$("#roundingBaseRound").val('');
		$("#roundingBaseRound").attr("disabled", "disabled");
		$("#roundingBaseDeduct").val(${setting.roundingBaseDeduct});
		$("#roundingBaseDeduct").removeAttr("disabled");
	}else if("${setting.roundingType}" == 2){
		document.getElementsByName("roundingTypeOption")[1].checked = true;
		$("#roundingType").val(2);
		$("#roundingBaseDeduct").val('');
		$("#roundingBaseDeduct").attr("disabled", "disabled");
		$("#roundingBaseRound").val(${setting.roundingBaseRound});
		$("#roundingBaseRound").removeAttr("disabled");
	}

	//
	if('${setting.showInsuranceFieldsInFinanceRegistrationPage}' == 'true'){
		document.getElementsByName("showInsuranceFieldsInFinanceRegistrationPage")[0].checked = true;
	}else{
		document.getElementsByName("showInsuranceFieldsInFinanceRegistrationPage")[0].checked = false;
	}
	//
	if('${setting.checkDuplicateInsertInPatientPage}' == 'true'){
		document.getElementsByName("checkDuplicateInsertInPatientPage")[0].checked = true;
	}else{
		document.getElementsByName("checkDuplicateInsertInPatientPage")[0].checked = false;
	}
	//
	if('${setting.checkPatientDoctor}' == 'true'){
		document.getElementsByName("checkPatientDoctor")[0].checked = true;
	}else{
		document.getElementsByName("checkPatientDoctor")[0].checked = false;
	}
	//
	if('${setting.checkPatientEnglishDataMandatory}' == 'true'){
		document.getElementsByName("checkPatientEnglishDataMandatory")[0].checked = true;
	}else{
		document.getElementsByName("checkPatientEnglishDataMandatory")[0].checked = false;
	}
	//
	$("#penApplicationWebServiceAddress").val("${setting.penApplicationWebServiceAddress}");
	//
	if("${setting.handwritingType}" == 1){
		document.getElementsByName("handwritingTypeOption")[0].checked = true;
		$("#handwritingType").val(1);
	}else if("${setting.handwritingType}" == 2){
		document.getElementsByName("handwritingTypeOption")[1].checked = true;
		$("#handwritingType").val(2);
	}

	$("#roundBaseOn").val("${setting.roundBaseOn}");
	//
	function handleClick(myRadio) {
	    $("#clinicType").val(myRadio.value);
	}

	function handlePatientFileNumberTypeClick(myRadio) {
	    $("#patientFileNumberType").val(myRadio.value);
	}

	function handleRoundingTypeClick(myRadio) {
		console.log(myRadio.value);
		$("#roundingType").val(myRadio.value);
		if(myRadio.value==1){
			$("#roundingBaseRound").val('');
			$("#roundingBaseRound").attr("disabled", "disabled");
			$("#roundingBaseDeduct").removeAttr("disabled");
		}else{
			$("#roundingBaseDeduct").val('');
			$("#roundingBaseDeduct").attr("disabled", "disabled");
			$("#roundingBaseRound").removeAttr("disabled");
		}
	}

	function handleHandwritingTypeClick(myRadio) {
		$("#handwritingType").val(myRadio.value);
	}

	function handleReceiveDataSchedulerStateOptionClick(myRadio){
		if (myRadio.value == 1) {
			$("#receiveSchedulerState").val(true);
		}else{
			$("#receiveSchedulerState").val(false);
		}
	}
	//
	if('${setting.receiveSchedulerState}' == 'true'){
		document.getElementsByName("receiveDataSchedulerStateOption")[0].checked = true;
	}else{
		document.getElementsByName("receiveDataSchedulerStateOption")[1].checked = true;
	}
	$("#receiveSchedulerCallPeriod").val("${setting.receiveSchedulerCallPeriod}");
	$("#receiveSchedulerDayLength").val("${setting.receiveSchedulerDayLength}");
	//
	if ('${setting.prc_Handwriting}' == 'true') {
		document.getElementsByName("prc_Handwriting")[0].checked = true;
	} else {
		document.getElementsByName("prc_Handwriting")[0].checked = false;
	}
	if ('${setting.prc_ChiefCompliant}' == 'true') {
		document.getElementsByName("prc_ChiefCompliant")[0].checked = true;
	} else {
		document.getElementsByName("prc_ChiefCompliant")[0].checked = false;
	}
	if ('${setting.prc_PhysicalExamination}' == 'true') {
		document.getElementsByName("prc_PhysicalExamination")[0].checked = true;
	} else {
		document.getElementsByName("prc_PhysicalExamination")[0].checked = false;
	}
	if ('${setting.prc_Diagnosis}' == 'true') {
		document.getElementsByName("prc_Diagnosis")[0].checked = true;
	} else {
		document.getElementsByName("prc_Diagnosis")[0].checked = false;
	}
	if ('${setting.prc_LabTestAndResult}' == 'true') {
		document.getElementsByName("prc_LabTestAndResult")[0].checked = true;
	} else {
		document.getElementsByName("prc_LabTestAndResult")[0].checked = false;
	}
	if('${setting.prc_ProcedureResult}' == 'true'){
		document.getElementsByName("prc_ProcedureResult")[0].checked = true;
	}else{
		document.getElementsByName("prc_ProcedureResult")[0].checked = false;
	}
	if('${setting.prc_ResearchDepartment}' == 'true'){
		document.getElementsByName("prc_ResearchDepartment")[0].checked = true;
	}else{
		document.getElementsByName("prc_ResearchDepartment")[0].checked = false;
	}
	if('${setting.prc_ScanFiles}' == 'true'){
		document.getElementsByName("prc_ScanFiles")[0].checked = true;
	}else{
		document.getElementsByName("prc_ScanFiles")[0].checked = false;
	}
	if('${setting.prc_LabTestReport}' == 'true'){
		document.getElementsByName("prc_LabTestReport")[0].checked = true;
	}else{
		document.getElementsByName("prc_LabTestReport")[0].checked = false;
	}
	if('${setting.prc_ProcedureReport}' == 'true'){
		document.getElementsByName("prc_ProcedureReport")[0].checked = true;
	}else{
		document.getElementsByName("prc_ProcedureReport")[0].checked = false;
	}
	if('${setting.prc_Pathology}' == 'true'){
		document.getElementsByName("prc_Pathology")[0].checked = true;
	}else{
		document.getElementsByName("prc_Pathology")[0].checked = false;
	}
	if('${setting.prc_Sonography}' == 'true'){
		document.getElementsByName("prc_Sonography")[0].checked = true;
	}else{
		document.getElementsByName("prc_Sonography")[0].checked = false;
	}

	if('${setting.prc_Sonography_pdf}' == 'true'){
		document.getElementsByName("prc_Sonography_pdf")[0].checked = true;
	}else{
		document.getElementsByName("prc_Sonography_pdf")[0].checked = false;
	}
	if('${setting.prc_History}' == 'true'){
		document.getElementsByName("prc_History")[0].checked = true;
	}else{
		document.getElementsByName("prc_History")[0].checked = false;
	}
	if('${setting.prc_Order}' == 'true'){
		document.getElementsByName("prc_Order")[0].checked = true;
	}else{
		document.getElementsByName("prc_Order")[0].checked = false;
	}
	if('${setting.prc_FollowUp}' == 'true'){
		document.getElementsByName("prc_FollowUp")[0].checked = true;
	}else{
		document.getElementsByName("prc_FollowUp")[0].checked = false;
	}
	if('${setting.prc_Recommendation}' == 'true'){
		document.getElementsByName("prc_Recommendation")[0].checked = true;
	}else{
		document.getElementsByName("prc_Recommendation")[0].checked = false;
	}
	//
	if('${setting.countOfDoctors}' == 'null' || '${setting.countOfDoctors}' == '0' || '${setting.countOfDoctors}' == ''){
		$("#notLimited").prop("checked","checked");
		$("#countOfDoctors").val(0);
	}else{
		$("#limited").prop("checked","checked");
		$("#doctorsCountValue").val(eval(${setting.countOfDoctors}));
		$("#countOfDoctors").val(eval(${setting.countOfDoctors}));
	}
	function setCountOfDoctorsVal(){
		$("#countOfDoctors").val(eval($("#doctorsCountValue").val()));
	}
	//
	$(".doctorCountTdLimited").click(function(){
		$("#limited").prop("checked","checked");
		$("#doctorsCountValue").removeAttr('disabled');
	});

	$(".doctorCountTdNotLimited").click(function(){
		$("#notLimited").prop("checked","checked");
		$("#doctorsCountValue").val('');
		$("#doctorsCountValue").attr('disabled', 'disabled');
		$("#countOfDoctors").val(0);
	});
	//
    function handleEditAlreadyPenFilesOptionClick(myRadio) {
        $("#editAlreadyPenFiles").val(myRadio.value);
    }

    if("${setting.editAlreadyPenFiles}" == "true"){
        document.getElementsByName("editAlreadyPenFilesOption")[0].checked = true;
        $("#editAlreadyPenFiles").val(true);
    }else{
        document.getElementsByName("editAlreadyPenFilesOption")[1].checked = true;
        $("#editAlreadyPenFiles").val(false);
    }
    //
    function handleHisPartnerUpdateSchedulerStateOptionClick(myRadio) {
        $("#hisPartnerUpdateSchedulerState").val(myRadio.value);
    }

    if("${setting.hisPartnerUpdateSchedulerState}" == "true"){
        document.getElementsByName("hisPartnerUpdateSchedulerStateOption")[0].checked = true;
        $("#hisPartnerUpdateSchedulerState").val(true);
    }else{
        document.getElementsByName("hisPartnerUpdateSchedulerStateOption")[1].checked = true;
        $("#hisPartnerUpdateSchedulerState").val(false);
    }
    //
	$(document).ready(function(){
        if ("${setting.dayEndTime}" != "" && "${setting.dayEndTime}" != "null") {
            var timepicker = $("#dayEndTimeWrapper").data("kendoTimePicker");
            timepicker.value("${setting.dayEndTime}");
        }
	});

    //

	function handleDiagnosisViewModeOptionClick(myRadio) {
        $("#diagnosisViewMode").val(myRadio.value);
    }

    $("#diagnosisViewMode").val(${setting.diagnosisViewMode});

    if("${setting.diagnosisViewMode}" == document.getElementsByName("diagnosisViewModeOption")[0].value){
        document.getElementsByName("diagnosisViewModeOption")[0].checked = true;
    }else{
        document.getElementsByName("diagnosisViewModeOption")[1].checked = true;
    }

    //

    function handlePacsPatientFieldTypeOptionClick(myRadio) {
        $("#pacsPatientFieldType").val(myRadio.value);
    }

    $("#pacsPatientFieldType").val(${setting.pacsPatientFieldType});

    if("${setting.pacsPatientFieldType}" == document.getElementsByName("pacsPatientFieldTypeOption")[0].value){
        document.getElementsByName("pacsPatientFieldTypeOption")[0].checked = true;
    }else{
        document.getElementsByName("pacsPatientFieldTypeOption")[1].checked = true;
    }

    //

    function handleDoctorDashboardTurnTypeOptionClick(myRadio) {
        $("#doctorDashboardTurnType").val(myRadio.value);
    }

    $("#doctorDashboardTurnType").val(${setting.doctorDashboardTurnType});

    if("${setting.doctorDashboardTurnType}" == document.getElementsByName("doctorDashboardTurnTypeOption")[0].value){
        document.getElementsByName("doctorDashboardTurnTypeOption")[0].checked = true;
    }else{
        document.getElementsByName("doctorDashboardTurnTypeOption")[1].checked = true;
    }

    //

    if('${setting.doctorDashboardSortByService}' == 'true'){
        document.getElementsByName("doctorDashboardSortByService")[0].checked = true;
    }else{
        document.getElementsByName("doctorDashboardSortByService")[0].checked = false;
    }

	if('${setting.showDoctorColumnInPatientBill}' == 'true'){
        document.getElementsByName("showDoctorColumnInPatientBill")[0].checked = true;
    }else{
        document.getElementsByName("showDoctorColumnInPatientBill")[0].checked = false;
    }

    //

	$(document.getElementsByName("doctorDashboardSortByService")[0]).change(function () {
		checkDoctorDashboardTurnAndSortValidation();
    });

	$(document.getElementsByName("doctorDashboardTurnTypeOption")).change(function () {
		checkDoctorDashboardTurnAndSortValidation();
    });

    function checkDoctorDashboardTurnAndSortValidation() {
        if (document.getElementsByName("doctorDashboardTurnTypeOption")[1].checked == true && document.getElementsByName("doctorDashboardSortByService")[0].checked == true) {
            alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.system.config.setting.doctorDashboardSortByService.error")%>');
            document.getElementsByName("doctorDashboardSortByService")[0].checked = false;
        }
    }

    //

    $("#financialReportCountOfRow").val(${setting.financialReportCountOfRow});
    $("#doctorDashboardDelayTimeAppointmentNumber").val(${setting.doctorDashboardDelayTimeAppointmentNumber});
    $("#monitorPagingMaxNumber").val(${setting.monitorPagingMaxNumber});
    $("#smsCurrentNumber").val(${setting.smsCurrentNumber});
    $("#smsMaxNumber").val(${setting.smsMaxNumber});


	if('${setting.webServiceActive}' == 'true'){
		document.getElementsByName("webServiceActive")[0].checked = true;
	}else{
		document.getElementsByName("webServiceActive")[0].checked = false;
	}

	if('${setting.smsPerPatientActive}' == 'true'){
		document.getElementsByName("smsPerPatientActive")[0].checked = true;
	}else{
		document.getElementsByName("smsPerPatientActive")[0].checked = false;
	}

	$("#webServiceRequestTimeOut").val(${setting.webServiceRequestTimeOut});
	$("#webServiceConnectionTimeOut").val(${setting.webServiceConnectionTimeOut});

    if('${setting.notShowAnotherDoctorPatientFile}' == 'true'){
        document.getElementsByName("notShowAnotherDoctorPatientFile")[0].checked = true;
    }else{
        document.getElementsByName("notShowAnotherDoctorPatientFile")[0].checked = false;
    }
    if('${setting.showServiceNameOnPatientFile}' == 'true'){
        document.getElementsByName("showServiceNameOnPatientFile")[0].checked = true;
    }else{
        document.getElementsByName("showServiceNameOnPatientFile")[0].checked = false;
    }
    if('${setting.writeNewPrescriptionInPreviousDate}' == 'true'){
        document.getElementsByName("writeNewPrescriptionInPreviousDate")[0].checked = true;
    }else{
        document.getElementsByName("writeNewPrescriptionInPreviousDate")[0].checked = false;
    }
    if('${setting.deletePrescription}' == 'true'){
        document.getElementsByName("deletePrescription")[0].checked = true;
    }else{
        document.getElementsByName("deletePrescription")[0].checked = false;
    }

    if('${setting.deletePatientFile}' == 'true'){
        document.getElementsByName("deletePatientFile")[0].checked = true;
    }else{
        document.getElementsByName("deletePatientFile")[0].checked = false;
    }
    if('${setting.addOrContainerResearchReportMakerInDefault}' == 'true'){
        document.getElementsByName("addOrContainerResearchReportMakerInDefault")[0].checked = true;
    }else{
        document.getElementsByName("addOrContainerResearchReportMakerInDefault")[0].checked = false;
    }
    if('${setting.researchReportMakerDiagnosisBasedOnValue}' == 'true'){
        document.getElementsByName("researchReportMakerDiagnosisBasedOnValue")[0].checked = true;
    }else{
        document.getElementsByName("researchReportMakerDiagnosisBasedOnValue")[0].checked = false;
    }
</script>

<style>
.uk-width-1-10 {
    width: 25%;
}

.uk-grid {
    border: black turquoise;
    margin: 0 -25px 0 0;
    padding: 0;
    list-style: none;
    border-width: thin;
    border-style: groove;
    padding: 10px;
    margin-right: 5px;
}

.my-uk-container {
	background: inherit;
}

#patientRecordComponentTable td:not(.patientRecordComponentTableHeader){
	border-style: solid;
	border-width: thin;
	border-color: rgba(96, 125, 139, 0.2);
	text-align: center;
	width: 10%;
}

.dayEndTimeClass .uk-width-1-10{
	width: 150px;
	position: relative;
	top: 3px;
}

.xmlTextArea textarea{
	min-width: 600px;
	min-height: 100px;
	text-align: left;
}
</style>