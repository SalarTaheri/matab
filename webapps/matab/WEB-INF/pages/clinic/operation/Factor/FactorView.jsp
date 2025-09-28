<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@page import="com.artonis.core.base.core.DateUtil" %>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@page import="com.artonis.core.base.core.Date" %>
<%@page import="java.util.ResourceBundle" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String areUShure=resource.getString("action.alert.areYouSure.delete");
	String menuSysCode =String.valueOf(request.getAttribute("menuSystemCode"));

    String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	String gridUrl=null;
    if(basePath.indexOf("/returnFromPatient")>-1){
        basePath=basePath.substring(0,basePath.indexOf("/returnFromPatient"));
    }else if(basePath.indexOf("/create")>-1){
        basePath=basePath.substring(0,basePath.indexOf("/create"));
    }else if(basePath.indexOf("/edit")>-1){
        basePath=basePath.substring(0,basePath.indexOf("/edit"));
    }
	boolean isCashier=GlobalVariable.getButtonContainer(menuSysCode,"cash-user-permission");
	boolean isRegistration=GlobalVariable.getButtonContainer(menuSysCode,"registration-user-permission");
    if(GlobalVariable.getButtonContainer(menuSysCode,"registration-user-permission")&&GlobalVariable.getButtonContainer(menuSysCode,"cash-user-permission")){
		gridUrl = basePath + "/grid-read/1/1";    
    }else if(GlobalVariable.getButtonContainer(menuSysCode,"registration-user-permission")){
    	gridUrl = basePath + "/grid-read/1/0";
    }else if(GlobalVariable.getButtonContainer(menuSysCode,"cash-user-permission")){
    	gridUrl = basePath + "/grid-read/0/1";
    }
    
    int currentYear = new DateUtil().getIranianYear();
    Date curDate=new Date(System.currentTimeMillis());
    String curStringDate=curDate.toString();
%>
<div class="body-header" style="padding: 0px 15px 0px 0px !important">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb" style="margin: 0px;">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
		<%--<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="newPatientWithReturn"/>--%>
	</div>
</div>
<base:dialogConfirm name="dialogconfirmFactorClose" key="com.artonis.clinic.operation.factor.close.alert"
                    yesFunction="confirmFactorClose"/>
<base:dialogConfirm name="dialogconfirmFactorCloseSelectRow" key="com.artonis.clinic.operation.factor.close.alert"
                    yesFunction="confirmFactorCloseSelectRow"/>
<div class="uk-container uk-container-center my-uk-container" style="margin: 0px; padding: 5px;">
<%if(GlobalVariable.getButtonContainer(menuSysCode,"registration-user-permission")){ %>	
	<div id="dialog-form"   style="padding-right: 15px">
	    <form class="toPopup" id="formDialog">
	     	<input name="loadedId" type="hidden" id="loadedId" />
			<input name="h_appointmentId" type="hidden" id="h_appointmentId" />
			<input name="h_appointmentTdTime" type="hidden" id="h_appointmentTdTime" />
			<input name="h_appointmentNameAndFam" type="hidden" id="h_appointmentNameAndFam" />
			<input name="h_appointmentPatientId" type="hidden" id="h_appointmentPatientId" />
			<input name="h_appointmentDepartmentId" type="hidden" id="h_appointmentDepartmentId" />
			<input name="h_appointmentDoctorName" type="hidden" id="h_appointmentDoctorName" />
			<input name="h_appointmentActionListNames" type="hidden" id="h_appointmentActionListNames" />
	     	
	    	<base:hasPermission id="registration-user-permission"/>
	    	<base:hasPermission id="cash-user-permission"/>
            <div class="uk-grid uk-grid-preserve" align="center" >
            	<label id="appName" ></label>
            </div>
            <div class="uk-grid uk-grid-preserve" id="nameAndFamDiv">
            	<base:comboBoxAutoComplete name="nameAndFam" styleClass="nameAndFamClass" key="com.appointment.nameAndFamily" comboLoaderUrl="/combo/loadPatinent"
                    dataTextField="searchField" dataValueField="id" minLength="3" hasTemplate="true" iscomboLoaderUrlRelative="true"
                    templateComaSep="fullName,fathername,cellphon,birthYearText,filenumber"
                    headerTemplateComaSep="com.appointment.nameAndFamily,clinic.patient.fatherName,clinic.patient.cellPhone,clinic.patient.birthYear,clinic.patient.fileNumber" />
                    <%--headerTemplateComaSep="com.appointment.nameAndFamily,clinic.patient.fatherName,clinic.patient.cellPhone,clinic.patient.birthYear,clinic.patient.fileNumber,com.artonis.clinic.operation.factor.oldFileNumber" />--%>
                <%--templateComaSep="fullName,fathername,cellphon,birthYearText,filenumber,oldFileNumber"--%>
            </div>
            <div class="uk-grid uk-grid-preserve" style="padding-right: 23%">
            	<%if(GlobalVariable.getButtonContainer(menuSysCode,"factor-patientrPopupComplex")){ %>
                	<base:buttonPopupForSelectingGrid formPopup="patientrComplexPopup" key="com.artonis.clinic.operation.factor.patientSearch" popUrl="popup/patientrComplexView"
                		 isRelative="true" gridName="searchGrid"  onSelectRowEvent="selectRowEventCallBack"  style=" width: 150px"/>
            	<%} %>
                <%if(GlobalVariable.getButtonContainer(menuSysCode,"factor-patientrPopupComplex2")){ %>
                    <base:buttonPopupForSelectingGrid formPopup="patientrPopup" key="com.artonis.clinic.operation.factor.patientSearch2" popUrl="popup/patientrView"
                         isRelative="true" gridName="grid"  onSelectRowEvent="selectRowEventCallBack"  style=" width: 160px"/>
                <%} %>
                <base:buttonPermission key="com.artonis.clinic.operation.factor.patientAdd" classNames="uk-button uk-button-success" id="newPatientWithReturn" style=" width: 150px"/>
                <base:buttonPermission key="com.artonis.clinic.operation.factor.patientEdit" classNames="uk-button uk-button-success" id="editPatientWithReturn" style=" width: 150px"/>

                <base:buttonPopupForSelectingGrid formPopup="appointmentReportNew" key="com.artonis.clinic.operation.factor.appointmentReport" popUrl="popup/appointmentReportNew" 
						gridName="grid_popup" onSelectRowEvent="appointmentReportSelectRowEventCallBack" isRelative="true" style=" width: 150px"/>

            </div>
            <div class="uk-grid uk-grid-preserve">
                <base:comboBox styleClass="small" name="department_id" comboLoaderUrl="combo/loadDepartment" key="com.artonis.clinic.operation.department"/>
            </div>
            <input type="hidden" id="patientId">
            <div class="uk-grid uk-grid-preserve patientInfo" style="margin-top: 15px;width: 90%;margin-right: 12px;;margin-bottom: 10px;">
                <div class="uk-width-1-10 left-align">
                    <base:simpleLabel name="fileNumber" key="com.appointment.fileNumber"/>
                </div>
                <div class="uk-width-1-10">
                    <input disabled="disabled" type="text" name="fileNumber" id="fileNumber"
                           class="text ui-widget-content ui-corner-all textBoxBackground"
                           style=" width: 100%; height: 25px">
                </div>
				<%--<div class="uk-width-1-10 left-align">
                    <base:simpleLabel name="oldFileNumber" key="com.artonis.clinic.operation.factor.oldFileNumber"/>
                </div>
                <div class="uk-width-1-10">
                    <input disabled="disabled" type="text" name="oldFileNumber" id="oldFileNumber"
                           class="text ui-widget-content ui-corner-all textBoxBackground"
                           style=" width: 100%; height: 25px">
                </div>--%>
                <div class="uk-width-1-10 left-align">
                    <base:simpleLabel name="phone" key="com.appointment.phone"/>
                </div>
                <div class="uk-width-1-10">
                    <input type="text" disabled="disabled" name="phone" id="phone" value=""
                           class="text ui-widget-content ui-corner-all textBoxBackground"
                           style=" width: 100%; height: 25px">
                </div>
                <div class="uk-width-1-10 left-align">
                    <base:simpleLabel name="cellPhone" key="com.appointment.cellPhone"/>
                </div>
                <div class="uk-width-1-10">
                    <input type="text" name="cellPhone" id="cellPhone" value=""
                           class="text ui-widget-content ui-corner-all textBoxBackground" style=" width: 100%; height: 25px"
                           disabled="disabled">
                </div>
                <div class="uk-width-1-10 left-align">
                    <base:simpleLabel name="age" key="clinic.patient.age"/>
                </div>
                <div class="uk-width-1-10">
                    <input type="text" name="age" id="age" value=""
                           class="text ui-widget-content ui-corner-all textBoxBackground" style=" width: 100%; height: 25px"
                           disabled="disabled">
                </div>
        	</div>
            <div align="center" style="padding-top: 15px; padding-bottom: 15px;">
                <base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-primary" id="saveFactorBtn" style="width:15%;"/>
                <base:buttonPermission key="com.artonis.clinic.operation.factor.saveAndMakeFactor" classNames="uk-button uk-button-primary" id="saveAndMakeFactorBtn" style="width:15%;"/>
                <base:buttonPermission key="com.artonis.clinic.basicInfo.financeRegistration.history" classNames="uk-button uk-button-primary" id="showHistoryBtn" style="width:15%;"/>
            </div>
	        
	    </form>
	</div>

<div id="formAccordion" style="border: 1">
    <h3 id="searchTab" style="	margin-bottom: 5px;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(29%,rgba(212,225,241,1)), color-stop(33%,rgba(201,218,238,1)), color-stop(100%,rgba(228,240,253,1)));
	/* color: #ffffff; */
	/* text-shadow: none; */
	border-width: thin;
	border-color: cornflowerblue;
	text-align: -webkit-center;
	font-weight: bold;">جستجوی پیشرفته</h3>
    <div id="search_back">
    <div style="margin-top: 5px;margin-bottom: 5px;padding-top: 5px;padding-bottom: 5px;">
        <form class="uk-form" id="mainForm">
            <div class="uk-grid uk-grid-preserve">
                <base:testBox name="searchPatientFullName" key="clinic.patient.name" styleClass="small"/>
                <base:testBox name="patientFileNumber" key="clinic.patient.fileNumber" styleClass="small"/>
                <base:testBox name="patientNationalCode" key="clinic.patient.nationalCode" styleClass="small"/>
            </div>
            <%--<div class="uk-grid uk-grid-preserve">--%>

                <%--<base:testBox name="patientOldFileNumber" key="com.artonis.clinic.operation.factor.oldFileNumber" styleClass="small"/>--%>
                <%--<base:comboBox name="sendToCash"  key="com.artonis.clinic.operation.factor.sendToCash" comboLoaderUrl="combo/allSendToCashState" styleClass="small"/>--%>
            <%--</div>--%>
            <div class="uk-grid uk-grid-preserve">
                <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
                <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
                <base:comboBox name="financeReg"  key="com.artonis.clinic.operation.factor.financeReg" comboLoaderUrl="combo/allFinanceRegState" styleClass="small"/>
            </div>
            <div class="uk-grid uk-grid-preserve">
                <base:comboBox styleClass="small" name="type" key="com.artonis.clinic.operation.factor.type" comboLoaderUrl="combo/allType"/>
                <base:comboBox name="department_id_forsearch" styleClass="small" comboLoaderUrl="combo/loadDepartment" key="com.artonis.clinic.operation.department"/>
                <base:comboBox styleClass="small" name="departmentReleaseState" key="com.artonis.clinic.operation.factor.releaseState" comboLoaderUrl="combo/AllReleaseState"/>
			</div>
            <div class="uk-grid uk-grid-preserve">
				<base:comboBox styleClass="small" name="posCMB" key="com.artonis.clinic.basicInfo.financeRegistration.paymentType" comboLoaderUrl="combo/loadAllPos"/>
				<base:comboBox name="doctor_id" key="com.artonis.clinic.basicInfo.employeeContract.doctor_id" comboLoaderUrl="combo/loadAllDoctor" styleClass="small" />
				<base:comboBox name="factorPaymentPrint" key="com.artonis.clinic.basicInfo.financeRegistration.factorPrint" comboLoaderUrl="combo/AllFactorPaymentPrintState" styleClass="small" />
            </div>
            <div class="uk-grid uk-grid-preserve">
				<base:comboBox styleClass="small" name="financeRegistrationPrint" key="com.artonis.clinic.basicInfo.financeRegistration.financeRegistrationPrint" comboLoaderUrl="combo/AllFactorPaymentPrintState"/>
				<base:comboBox styleClass="small" name="surgerySaveState" key="com.artonis.clinic.operation.factor.surgerySaveState" comboLoaderUrl="combo/AllSurgerySaveState"/>
				<base:comboBox styleClass="small" name="visitState" comboLoaderUrl="combo/allVisitState" key="com.artonis.clinic.basicInfo.financeRegistration.visitState"/>
            </div>
            <div class="uk-grid uk-grid-preserve">
                <base:comboBox name="sendToCash"  key="com.artonis.clinic.operation.factor.sendToCash" comboLoaderUrl="combo/allSendToCashState" styleClass="small"/>
                <base:comboBox name="closed"  key="com.artonis.clinic.operation.factor.factorClosedStateCombo" comboLoaderUrl="combo/allFactorClosedState" styleClass="small"/>
            </div>
        </form>
    </div>
	
<%}%>	
<% if(GlobalVariable.getButtonContainer(menuSysCode,"registration-user-permission")&&
		GlobalVariable.getButtonContainer(menuSysCode,"cash-user-permission")){ %>
<%--<base:my-grid name="grid" transportReadUrl="<%=gridUrl%>" selectable="single" sortable="false" filterable="false" groupable="true">--%>
    <base:searchButton defaultReadUrl="<%=gridUrl%>" defaultReadUrlIsRelative="false"/>
    </div>
</div>
<base:my-grid-search defaultReadUrl="<%=gridUrl%>" defaultReadUrlIsRelative="false" isAccordionable="true" refreshButton="true">
    <base:my-grid-column title='com.artonis.clinic.operation.factor.id'  field="id" width="15px"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fullName'  field="patientFullName" width="19px"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fileNumber'  field="patientFileNumber" width="15px"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factor.patientNationalCode'  field="patientNationalCode" width="20px"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factor.sendToCash'  field="sendToCashText" width="16px"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factor.financeReg'  field="financeRegText" width="16px"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factor.type'  field="factorType" width="14px"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factor.date'  field="date" width="13px"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factor.releaseState'  field="releaseStateText" width="13px"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factor.serviceNameList'  field="serviceNameList" width="20px"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factor.doctorNameList'  field="doctorNameList" width="20px"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factor.factorClosedState'  field="closedText" width="15px"/>

    <base:my-grid-schema-field name="id" type="string"/>
    <base:my-grid-schema-field name="financeRegText" type="string"/>
    <base:my-grid-schema-field name="date" type="string"/>
    
	<base:my-grid-function text="clinic.patient.financeRegistration" functionClick="grid_onFinanceRegistration" name="financeRegistration" />
	<base:my-grid-function text="clinic.patient.factorItemRegistration" functionClick="grid_onFactorItemRegistration" name="factorItemRegistration" />
    <base:my-grid-function text="clinic.patient.sendForVisit" functionClick="grid_sendToVisit" name="sendVisit" />
	<base:my-grid-function text="clinic.patient.release" functionClick="grid_release" name="releaseFactor" />
	<base:my-grid-function text="clinic.patient.undoRelease" functionClick="grid_undoRelease" name="undoReleaseFactor" />
    <base:my-grid-function text="com.artonis.clinic.operation.factor.undoClosedFactor" functionClick="grid_undoClosedFactor" name="undoClosedFactor" />
	<base:my-grid-function text="clinic.patient.print" functionClick="grid_filePrint" name="filePrint" />
	<base:my-grid-function text="com.artonis.clinic.operation.factor.surgeryPrint" functionClick="grid_surgeryPrint" name="surgeryPrint" />
	<base:my-grid-function text="com.artonis.clinic.operation.factor.nursingData" functionClick="grid_nursingDataPopup" name="nursingDataPopup" />
	<base:my-grid-function text="action.delete" functionClick="grid_deleteFactor" name="deleteFactor"  styleClass="uk-button-danger"/>
</base:my-grid-search>
<% }else if(GlobalVariable.getButtonContainer(menuSysCode,"registration-user-permission")){ %>
    <base:searchButton defaultReadUrl="<%=gridUrl%>" defaultReadUrlIsRelative="false"/>
    </div>
</div>
<base:my-grid-search defaultReadUrl="<%=gridUrl%>" defaultReadUrlIsRelative="false" isAccordionable="true" refreshButton="true">
    <base:my-grid-column title='com.artonis.clinic.operation.factor.id'  field="id" width="15px"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fullName'  field="patientFullName" width="19px"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fileNumber'  field="patientFileNumber" width="15px"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factor.patientNationalCode'  field="patientNationalCode" width="20px"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factor.sendToCash'  field="sendToCashText" width="16px"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factor.financeReg'  field="financeRegText" width="16px"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factor.type'  field="factorType" width="14px"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factor.date'  field="date" width="13px"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factor.serviceNameList'  field="serviceNameList" width="13px"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factor.doctorNameList'  field="doctorNameList" width="13px"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factor.factorClosedState'  field="closedText" width="15px"/>

    <base:my-grid-schema-field name="id" type="string"/>
    <base:my-grid-schema-field name="doOperationText" type="string"/>
    <base:my-grid-schema-field name="financeRegText" type="string"/>
    <base:my-grid-schema-field name="date" type="string"/>
    
	<base:my-grid-function text="clinic.patient.financeRegistration" functionClick="grid_onFinanceRegistration" name="financeRegistration" />
	<base:my-grid-function text="clinic.patient.factorItemRegistration" functionClick="grid_onFactorItemRegistration" name="factorItemRegistration" />
    <base:my-grid-function text="clinic.patient.sendForVisit" functionClick="grid_sendToVisit" name="sendVisit" />
	<base:my-grid-function text="clinic.patient.release" functionClick="grid_release" name="releaseFactor" />
	<base:my-grid-function text="clinic.patient.undoRelease" functionClick="grid_undoRelease" name="undoReleaseFactor" />
    <base:my-grid-function text="com.artonis.clinic.operation.factor.undoClosedFactor" functionClick="grid_undoClosedFactor" name="undoClosedFactor" />
	<base:my-grid-function text="clinic.patient.print" functionClick="grid_filePrint" name="filePrint" />
    <base:my-grid-function text="com.artonis.clinic.operation.factor.surgeryPrint" functionClick="grid_surgeryPrint" name="surgeryPrint" />
	<base:my-grid-function text="com.artonis.clinic.operation.factor.nursingData" functionClick="grid_nursingDataPopup" name="nursingDataPopup" />
    <base:my-grid-function text="action.delete" functionClick="grid_deleteFactor" name="deleteFactor" styleClass="uk-button-danger"/>
</base:my-grid-search>
<% }else if(GlobalVariable.getButtonContainer(menuSysCode,"cash-user-permission")){ %>
	<div id="formAccordion" style="border: 1">
	    <h3 id="searchTab" style="	margin-bottom: 5px;
		background: -webkit-gradient(linear, left top, left bottom, color-stop(29%,rgba(212,225,241,1)), color-stop(33%,rgba(201,218,238,1)), color-stop(100%,rgba(228,240,253,1)));
		/* color: #ffffff; */
		/* text-shadow: none; */
		border-width: thin;
		border-color: cornflowerblue;
		text-align: -webkit-center;
		font-weight: bold;">جستجوی پیشرفته</h3>
	    <div id="search_back">
	        <div  class="uk-container uk-container-center my-uk-container" style="margin-top: 5px;margin-bottom: 5px;padding-top: 5px;padding-bottom: 5px;">
	            <form class="uk-form" id="mainForm">
	                <div class="uk-grid uk-grid-preserve">
	                    <base:testBox name="searchPatientFullName" key="clinic.patient.name" styleClass="small"/>
	                    <base:testBox name="patientNationalCode" key="clinic.patient.nationalCode" styleClass="small"/>
                    </div>
                    <div class="uk-grid uk-grid-preserve">
	                    <base:testBox name="patientFileNumber" key="clinic.patient.fileNumber" styleClass="small"/>
	                    <%--<base:testBox name="patientOldFileNumber" key="com.artonis.clinic.operation.factor.oldFileNumber" styleClass="small"/>--%>
	                    <base:comboBox name="sendToCash"  key="com.artonis.clinic.operation.factor.sendToCash" comboLoaderUrl="combo/allSendToCashState" styleClass="small"/>
	                </div>
	                <div class="uk-grid uk-grid-preserve">
	                    <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
	                    <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
	                    <base:comboBox name="financeReg"  key="com.artonis.clinic.operation.factor.financeReg" comboLoaderUrl="combo/allFinanceRegState" styleClass="small"/>
	                </div>
	                <div class="uk-grid uk-grid-preserve">
	                    <base:comboBox styleClass="small" name="type" key="com.artonis.clinic.operation.factor.type" comboLoaderUrl="combo/allType"/>
	                    <base:comboBox name="department_id_forsearch" styleClass="small" comboLoaderUrl="combo/loadDepartment" key="com.artonis.clinic.operation.department"/>
	                    <base:comboBox name="visitState" styleClass="small" comboLoaderUrl="combo/allVisitState" key="com.artonis.clinic.basicInfo.financeRegistration.visitState"/>
	                </div>
	            </form>
	        </div>
	    <base:searchButton defaultReadUrl="<%=gridUrl%>" defaultReadUrlIsRelative="false"/>
	    </div>
	</div>
    <base:my-grid-search defaultReadUrl="<%=gridUrl%>" defaultReadUrlIsRelative="false" isAccordionable="true" refreshButton="true">
        <base:my-grid-column title='com.artonis.clinic.operation.factor.id'  field="id" width="15px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fullName'  field="patientFullName" width="19px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fileNumber'  field="patientFileNumber" width="15px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factor.patientNationalCode'  field="patientNationalCode" width="20px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factor.sendToCash'  field="sendToCashText" width="16px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factor.financeReg'  field="financeRegText" width="16px"/>
	    <base:my-grid-column title='com.artonis.clinic.operation.factor.type'  field="factorType" width="14px"/>
	    <base:my-grid-column title='com.artonis.clinic.operation.factor.date'  field="date" width="13px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factor.serviceNameList'  field="serviceNameList" width="13px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factor.doctorNameList'  field="doctorNameList" width="13px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factor.factorClosedState'  field="closedText" width="15px"/>

        <base:my-grid-schema-field name="id" type="string"/>
        <base:my-grid-schema-field name="doOperationText" type="string"/>
        <base:my-grid-schema-field name="financeRegText" type="string"/>
        <base:my-grid-schema-field name="date" type="string"/>
    
	    <base:my-grid-function text="clinic.patient.financeRegistration" functionClick="grid_onFinanceRegistration" name="financeRegistration" />
	    <base:my-grid-function text="clinic.patient.factorItemRegistration" functionClick="grid_onFactorItemRegistration" name="factorItemRegistration" />
	    <base:my-grid-function text="clinic.patient.release" functionClick="grid_release" name="releaseFactor" />
	    <base:my-grid-function text="clinic.patient.undoRelease" functionClick="grid_undoRelease" name="undoReleaseFactor" />
	    <base:my-grid-function text="com.artonis.clinic.operation.factor.undoClosedFactor" functionClick="grid_undoClosedFactor" name="undoClosedFactor" />
	    <base:my-grid-function text="clinic.patient.print" functionClick="grid_filePrint" name="filePrint" />
        <base:my-grid-function text="com.artonis.clinic.operation.factor.surgeryPrint" functionClick="grid_surgeryPrint" name="surgeryPrint" />
	    <base:my-grid-function text="com.artonis.clinic.operation.factor.nursingData" functionClick="grid_nursingDataPopup" name="nursingDataPopup" />
        <base:my-grid-function text="action.delete" functionClick="grid_deleteFactor" name="deleteFactor"  styleClass="uk-button-danger"/>

</base:my-grid-search>
<% }
 %>

</div>
<base:dialogAlert name="dialogNotRegistration" key="com.artonis.clinic.operation.factor.notregister.alert"/>
<base:dialogAlert name="dialogRepeatSendVisit" key="com.artonis.clinic.operation.factor.sent.visit.alert"/>
<base:footer/>
<div id="dialog" title='<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.release") %>' style="display: none">
  	<table id="table-department-release" border="1" width="100%">
  		<tr> 
  			<th><%=ResourceBoundleHolder.resourceBundle.getString("global.row") %></th>
  			<th><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.department") %></th>
  			<th><%=ResourceBoundleHolder.resourceBundle.getString("action.operation") %></th>
  			
  		</tr>
  	</table>
</div>

<div id="dialog-removeDepartmentFromFactor" title='<%=ResourceBoundleHolder.resourceBundle.getString("action.delete") %>' style="display: none">
  	<table id="table-department-fromFactor" border="1" width="100%">
  		<tr> 
  			<th><%=ResourceBoundleHolder.resourceBundle.getString("global.row") %></th>
  			<th><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.department") %></th>
  			<th><%=ResourceBoundleHolder.resourceBundle.getString("action.operation") %></th>
  			
  		</tr>
  	</table>
</div>

<div id="dialog-sendToVisit" style="display: none">
    <table border="1" width="100%" id="service-table" style="" class="serviceTableCss" >
        <tr style="background: linear-gradient(to bottom, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%);">
            <th width="5%">
                <%=ResourceBoundleHolder.resourceBundle.getString("global.row") %>
            </th>
            <th width="10%">
                <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.service_id") %>
            </th>
            <th width="10%">
                <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.receipt") %>
            </th>
            <th width="10%">
                <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.payment") %>
            </th>
            <th width="10%">
                <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.insurance") %>
            </th>
            <th width="10%">
                <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.totalAmount") %>
            </th>
            <th width="10%">
                <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.totalDiscounts") %>
            </th>
            <th width="10%">
                <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.payableAmount") %>
            </th>
            <th width="10%">
                <%=ResourceBoundleHolder.resourceBundle.getString("action.operation") %>
            </th>
        </tr>
    </table>
</div>

<div id="showHistoryDialog" class="background" style="display:none;padding-top: 20px; padding-bottom: 20px; ">
    <base:my-grid name="showHistoryDialogGrid" transportReadUrl="${controllerBasePath}/history-grid-read/-1" isPopup="true" pageSize="2" groupable="false" exportToExcellEnable="false" showOperation="false">
        <base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.date'  field="date" width="100px"/>
        <base:my-grid-column title='com.artonis.clinic.basicInfo.service.name'  field="serviceName" width="100px"/>
        <base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.visitState'  field="visitState" width="100px"/>
        <base:my-grid-schema-field name="date" type="string" />
        <base:my-grid-schema-field name="serviceName" type="string" />
        <base:my-grid-schema-field name="visitState" type="string" />
    </base:my-grid>
</div>

<div id="modals-nursingDataPopup" title="<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.nursingData")%>">
	<form class="uk-form" id="form-popup">
		<input type="hidden" id="modalItemFactorId">
		<div class="uk-grid uk-grid-preserve" style="margin-top: 10px;">
			<base:testBox name="weight" key="clinic.visit.clinicalInformation.weight" styleClass="verysmall" />
			<base:testBox name="bloodPressure" key="clinic.visit.clinicalInformation.bloodPressure" styleClass="verysmall" styledivLabel="margin-right: 50px;"/>
		</div>
	</form>
</div>

<div id="undoReleaseDialog" title='<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.undoRelease")%>' style="display: none">
  	<table id="table-department-undoRelease" border="1" width="100%">
  		<tr> 
  			<th style="width: 15%;"><%=ResourceBoundleHolder.resourceBundle.getString("global.row") %></th>
  			<th style=""><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.department") %></th>
  			<th style="width: 40%;"><%=ResourceBoundleHolder.resourceBundle.getString("action.operation") %></th>
  		</tr>
  	</table>
</div>

<div align="center" style="padding-top: 15px; padding-bottom: 15px;">
    <base:buttonPermission key="com.artonis.clinic.operation.factor.closeFactor" classNames="uk-button uk-button-primary" id="closeFactorBtn" style="width:15%;"/>
</div>

<script type="text/javascript">
 if(window.location.href.indexOf("/returnFromPatient") >0 && '<%=request.getAttribute("backFromPatient_mongo_id")%>'!="-1"){
	$("#department_id").val('<%=request.getAttribute("backFromPatient_department_id")%>');
	$("#h_appointmentId").val('<%=request.getAttribute("backFromPatient_mongo_id")%>');
 	makeCard('<%=request.getAttribute("backFromPatient_mongo_id")%>','<%=request.getAttribute("backFromPatient_nameAndFam")%>','<%=request.getAttribute("backFromPatient_drName")%>','<%=request.getAttribute("backFromPatient_tdTime")%>','<%=request.getAttribute("backFromPatient_actionListNames")%>');
 }


function selectAppointmentReportRowEventCallBack(e){
    $("#h_appointmentId").val(e[0].id);
    $("#h_appointmentTdTime").val(e[0].timeStr);
	$("#h_appointmentNameAndFam").val(e[0].nameAndFam);
	$("#h_appointmentPatientId").val(e[0].patientId);
    if(e[0].patientId!=null && $("#nameAndFam").val()==""){
        var ppb = $("#nameAndFam_Comb").data("kendoComboBox");
        ppb.dataSource.filter({ logic: 'and', filters: [{ field: "id", operator: "equal", value: e[0].patientId }]});
        ppb.value(e[0].patientId);
    }
	$("#h_appointmentDepartmentId").val(e[0].departmentId);
	$("#h_appointmentDoctorName").val(e[0].doctorName);
	$("#h_appointmentActionListNames").val(e[0].actionListNames);
    $("#department_id").val(e[0].departmentId);
    $("#department_id_Comb").data("kendoComboBox").value(e[0].departmentId);
    $("#department_id").val(e[0].departmentId);
    makeCard(e[0].id,e[0].nameAndFam,e[0].doctorName+" "+e[0].fileNumber,e[0].timeStr,e[0].actionListNames);
    modal.hide();

}

function selectRowEventCallBack(e){
	$('#fileNumber').val(e[0].filenumber);
//	$('#oldFileNumber').val(e[0].oldFileNumber);
    $('#patientId').val(e[0].id);
    $('#phone').val(e[0].tel1);
    $('#cellPhone').val(e[0].cellphon);
    $('#age').val(e[0].age);
    ///
//    $('#nameAndFam_Comb').data('kendoComboBox').value(e[0].id);
	var ppb = $("#nameAndFam_Comb").data("kendoComboBox");
//	ppb.dataSource.filter({ logic: 'and', filters: [{ field: "searchField", operator: "contains", value: e[0].filenumber }]});
//	ppb.dataSource.filter({ logic: 'and', filters: [{ field: "id", operator: "equal", value: e[0].id }]});
    ppb.dataSource.read({
        filter: { field: "id", operator: "eq", value: e[0].id },
        page : 1,
        pageSize : 1
    });
//	ppb.dataSource.read();
	ppb.value(e[0].id);
    ///
    modal.hide();
    //
//    setTimeout(function(){
//    	var ppb = $("#nameAndFam_Comb").data("kendoComboBox");
//    	ppb.dataSource.filter([]);
//    }, 1500);
}

function getSearchObject(){
    var docVar = {};
    docVar.fromDate=$("#fromDate").val();
    docVar.toDate=$("#toDate").val();
    docVar.searchPatientFullName=$("#searchPatientFullName").val();
    docVar.patientNationalCode=$("#patientNationalCode").val();
    docVar.patientFileNumber=$("#patientFileNumber").val();
//    docVar.patientOldFileNumber=$("#patientOldFileNumber").val();
    docVar.sendToCash=$("#sendToCash").val();
    docVar.financeReg=$("#financeReg").val();
    docVar.type=$("#type").val();
    docVar.department_id_forsearch=$("#department_id_forsearch").val();
    docVar.visitState=$("#visitState").val();
    docVar.doctor_id=$("#doctor_id").val();
    docVar.posCMB=$("#posCMB").val();
    docVar.factorPaymentPrint=$("#factorPaymentPrint").val();
    docVar.financeRegistrationPrint=$("#financeRegistrationPrint").val();
    docVar.surgerySaveState=$("#surgerySaveState").val();
    docVar.departmentReleaseState=$("#departmentReleaseState").val();
    docVar.closed=$("#closed").val();
    return docVar;
}
$("#saveFactorBtn").click(function(){
		var data={};
		data.patientId=$("#nameAndFam_Comb").data("kendoComboBox").value();
		data.department_id=$("#department_id_Comb").val();
		data.h_appointmentId=$("#h_appointmentId").val();
        if(!($("#nameAndFam_Comb").data("kendoComboBox").value()>0)){
            alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.error.youMustSelectPatient")%>');
            return;
        }
        if(!(data.department_id>0)){
			alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.error.youMustSelectDepartment")%>');
			return;
		}
        jQuery.ajax({
            url:getBaseUrl() + "saveFactor",
            type:"POST",
            data:JSON.stringify(data),
            dataType:"json",
            contentType:"application/json; charset=utf-8",
            success:function (result) {
                if (result.state == "error") {
                    for (var i = 0; i < result.errors.length; i++) {
                        if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                            alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                        } else {
                            alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                        }
                    }
                }
                if (result.state == "success") {
                    alertify.success(result.message);
					$("#searchGrid").data("kendoGrid").dataSource.read();
					$('#formDialog')[0].reset();
					var lbl=document.getElementById('appName');
					lbl.innerHTML = '';
                }
            },
            error:function(result){
                if(result.status==401){
                    window.location.href="";
                }
            }
        });
});
$("#saveAndMakeFactorBtn").click(function(){
		var data={};
		data.patientId=$("#nameAndFam_Comb").data("kendoComboBox").value();
		data.department_id=$("#department_id_Comb").val();
		data.h_appointmentId=$("#h_appointmentId").val();
        if(!($("#nameAndFam_Comb").data("kendoComboBox").value()>0)){
            alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.error.youMustSelectPatient")%>');
            return;
        }
		if(!(data.department_id>0)){
			alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.error.youMustSelectDepartment")%>');
			return;
		}
        $("#saveAndMakeFactorBtn").prop("disabled", true);
        jQuery.ajax({
            url:getBaseUrl() + "saveFactor",
            type:"POST",
            data:JSON.stringify(data),
            dataType:"json",
            contentType:"application/json; charset=utf-8",
            success:function (result) {
                if (result.state == "error") {
                    $("#saveAndMakeFactorBtn").prop("disabled", false);
                    for (var i = 0; i < result.errors.length; i++) {
                        if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                            alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                        } else {
                            alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                        }
                    }
                }
                if (result.state == "success") {
					var factorId = result.baseObjectId;
					window.location = "${pageContext.request.contextPath}"+"/clinic/basicInfo/financeRegistration/create/" + factorId;
                }
            },
            error:function(result){
                $("#saveAndMakeFactorBtn").prop("disabled", false);
                if(result.status==401){
                    window.location.href="";
                }
            }
        });
});
$("#showHistoryBtn").click(function(){
	if(!($("#nameAndFam_Comb").data("kendoComboBox").value()>0)){
		alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.error.youMustSelectPatient")%>');
		return;
	}
	var urlGrid=$("#showHistoryDialogGrid").data("kendoGrid").dataSource.transport.options.read.url;
	var indexnumber=urlGrid.valueOf().lastIndexOf("/");
    var subUrlGrid=urlGrid.valueOf().substring(0,indexnumber);
    urlGrid=subUrlGrid.valueOf()+"/"+$("#nameAndFam_Comb").data("kendoComboBox").value();
    $("#showHistoryDialogGrid").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
    $("#showHistoryDialogGrid").data("kendoGrid").dataSource.read();
	$("#showHistoryDialog").dialog("open");
});
$("#showHistoryDialog").dialog({
    autoOpen:false,
    show:{
        effect:"slide",
        duration:300
    },
    hide:{
        effect:"slide",
        duration:300
    },
    height:300,
    width:800,
    title:'<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.history") %>',
    modal:true,
    buttons:{
        "<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.close") %>":function () {
            $(this).dialog("close");
        }
    }
});
function grid_onFinanceRegistration(e){
	var data = this.dataItem($(e.target).closest("tr"));
	jQuery.ajax({
           url:getBaseUrl() + "saveSearchToSession",
           type:"POST",
           data:JSON.stringify(getSearchObject()),
           dataType:"json",
           contentType:"application/json; charset=utf-8",
           success:function (result) {},
           error:function(result){
               if(result.status==401)
                   window.location.href="";
           }
     });
	 jQuery.ajax({
        url:getBaseUrl() + "saveGridPageNumberToSession",
        type:"POST",
        data:"{gridPageNumber:'"+this.dataSource.page()+"'}",
        dataType:"json",
        contentType:"application/json; charset=utf-8",
        error:function(result){
            if(result.status==401)
                window.location.href="";
        }
  	 });
     window.location = "${pageContext.request.contextPath}"+"/clinic/basicInfo/financeRegistration/create/" + data.id;
}

function grid_filePrint(e){
     var data = this.dataItem($(e.target).closest("tr"));

    if (data.serviceNameList == 'خدمات آزمایشگاهی') {
        window.open('${pageContext.request.contextPath}/lab/operation/labRegistration/printByFactorId/' + data.id).print();
        return;
    }

     	console.log(data);
     	var tmp = {};
		tmp.patient_id=data.patient_id;
		jQuery.ajax({
                    url:getBaseUrl() + "print",
                    type:"POST",
                    data:JSON.stringify(tmp),
                    dataType:"json",
                    contentType:"application/json; charset=utf-8",
                    success:function (result) {
                        if(result.state == "success"){
                            alertify.success(result.message);
                            if (document.getElementById("loadedId") != null) {
                                document.getElementById("loadedId").value = result.baseObjectId;
                            }
                            $.getJSON(basePath + '/reset/', function (data) {
                                $('#mainForm').deserialize(data);
								setNumericTextValue();
                            });
                            //var gridContent = $("#jqxgrid").jqxGrid('exportdata', 'html');
                            var newWindow = window.open('', '', 'width=800, height=500'),
                                    document1 = newWindow.document.open(),
                                    pageContent =
                                            '<!DOCTYPE html>\n' +
                                                    '<html>\n' +
                                                    '<head>\n' +
                                                    '<meta charset="utf-8" />\n' +
                                                    '<title> </title>\n' +
                                                    '</head>\n' +
                                                    '<body>\n'+result.printMessage +'\n</body>\n</html>';
                            document1.write(pageContent);
                            document1.close();
                            newWindow.print();
                        }else{
                            for (var i = 0; i < result.errors.length; i++) {
                                if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                                    alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                                } else {
                                    alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                                }
                            }
                        }

                    },
                    error:function(result){
                        if(result.status==401){
                            window.location.href="";
                        }
                    }
                });
     
     

}

 function grid_surgeryPrint(e){
     var data = this.dataItem($(e.target).closest("tr"));
     	console.log(data);
     	var tmp = {};
		tmp.patient_id=data.patient_id;
		tmp.factor_id=data.id;
		jQuery.ajax({
                    url:getBaseUrl() + "surgeryPrint",
                    type:"POST",
                    data:JSON.stringify(tmp),
                    dataType:"json",
                    contentType:"application/json; charset=utf-8",
                    success:function (result) {
                        if(result.state == "success"){
                            alertify.success(result.message);
                            if (document.getElementById("loadedId") != null) {
                                document.getElementById("loadedId").value = result.baseObjectId;
                            }
                            $.getJSON(basePath + '/reset/', function (data) {
                                $('#mainForm').deserialize(data);
								setNumericTextValue();
                            });
                            //var gridContent = $("#jqxgrid").jqxGrid('exportdata', 'html');
                            var newWindow = window.open('', '', 'width=800, height=500'),
                                    document1 = newWindow.document.open(),
                                    pageContent =
                                            '<!DOCTYPE html>\n' +
                                                    '<html>\n' +
                                                    '<head>\n' +
                                                    '<meta charset="utf-8" />\n' +
                                                    '<title> </title>\n' +
                                                    '</head>\n' +
                                                    '<body>\n'+result.printMessage +'\n</body>\n</html>';
                            document1.write(pageContent);
                            document1.close();
                            newWindow.print();
                        }else{
                            for (var i = 0; i < result.errors.length; i++) {
                                if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                                    alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                                } else {
                                    alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                                }
                            }
                        }

                    },
                    error:function(result){
                        if(result.status==401){
                            window.location.href="";
                        }
                    }
                });



}

function grid_onFactorItemRegistration(e){
     var data = this.dataItem($(e.target).closest("tr"));
     window.location = "${pageContext.request.contextPath}"+"/clinic/basicInfo/financeRegistration/create/" + data.id;
}
function grid_release(e){
	var data = this.dataItem($(e.target).closest("tr"));
	$.getJSON(basePath + "loadDepartmentIntersection/"+data.id, function (data) {
		deleteRow('table-department-release');
	    var tbl=document.getElementById('table-department-release');
	    var tbdy=document.createElement('tbody');
	    var tr = document.createElement("tr");
		tr.style.background= 'linear-gradient(to bottom, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%)';
	      
	    var th1 = document.createElement("th");
		th1.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("global.row") %>'));
		th1.setAttribute('style', 'width: 5%');
		var th2 = document.createElement("th");
		th2.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.department") %>'));
		th2.setAttribute('style', 'width: 10%');
		var th3 = document.createElement("th");
		th3.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("action.operation") %>'));
		th3.setAttribute('style', 'width: 10%');
	    
	    tr.appendChild(th1);
		tr.appendChild(th2);
		tr.appendChild(th3);
		tbdy.appendChild(tr);
		for(i=0;i<data.length;i++){
		    var tr = document.createElement("tr");
		    var td1 = document.createElement("td");
			td1.appendChild(document.createTextNode(i+1));
			td1.setAttribute('style', 'width: 5%');
			var td2 = document.createElement("td");
			td2.appendChild(document.createTextNode(data[i].ComboCaption));
			td2.setAttribute('style', 'width: 10%');
			var td3 = document.createElement("td");
			td3.setAttribute('style', 'width: 10%');
			
			var image = document.createElement("img");
			image.title='<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.sendToRelease") %>';
			if(data[i].releaseable){
				image.src = "<c:url value='/resources/images/release/1.png' />";
			}else{
				image.src = "<c:url value='/resources/images/release/2.png' />";
				image.id='img-release-department-item-'+i+'-'+data[i].factorDepartment_id;
				if(<%=(isCashier && isRegistration)|| isRegistration%>){
					image.onclick = function () {
						var qTxtEleId=this.id.split('-');
						releaseFactorDepartment(qTxtEleId[5],this);

					};
				}
				
				image.onmouseover = function () {
					mouseOver(this);
		   		};
		   		image.onmouseout = function () {
					mouseOut(this);
		   		};

			}
			td3.appendChild(image);
		    tr.appendChild(td1);
			tr.appendChild(td2);
			tr.appendChild(td3);
			tbdy.appendChild(tr);
		}
		tbl.appendChild(tbdy);
		
		$("#dialog" ).dialog( "open" );
	});
     
     //window.location = "${pageContext.request.contextPath}"+"/clinic/basicInfo/financeRegistration/create/" + data.id;
}

function grid_deleteFactor(e){
	var data = this.dataItem($(e.target).closest("tr"));
	initRemoveDepartmentDialog(data.id);    
}
$("#newPatientWithReturn").click(function(){
	//window.location = "${pageContext.request.contextPath}"+"/clinic/patientr/patientr/createNewPatientWithReturnToFactor";
	window.location = "${pageContext.request.contextPath}"+"/clinic/patientr/patientr/createNewPatientWithReturnToFactor/"+$("#h_appointmentId").val();
});
$("#editPatientWithReturn").click(function(){
	if($("#nameAndFam_Comb").data("kendoComboBox").value() == "" ){
		alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.alert.selectPatient") %>');		
	}else{
		window.location = "${pageContext.request.contextPath}"+"/clinic/patientr/patientr/editWP/patientId="+$("#nameAndFam_Comb").data("kendoComboBox").value()
			+",appointmentId="+$("#h_appointmentId").val();
	}
});
$(document).ready(function(){
	$(".nameAndFamClass").find(".k-combobox").css("width","85%").css("padding-right","1%");
    resetForm();
	$("#patientId").val('${patientId}');
	
	
	$('#department_id_Comb').data('kendoComboBox').value('${user_department_id}');
	
	
	$('#nameAndFam_Comb').data('kendoComboBox').value('${patientId}');
	$("#fileNumber").val('${fileNumber}');
	<%--$("#oldFileNumber").val('${oldFileNumber}');--%>
	$("#phone").val('${phone}');
	$("#cellPhone").val('${cellPhone}');
	$("#age").val('${age}');
	
	$( "#dialog" ).dialog({
      autoOpen: false,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });

    $( "#dialog-sendToVisit" ).dialog({
        autoOpen: false,
        show: {
            effect: "slide",
            duration: 300
        },
        hide: {
            effect: "slide",
            duration: 300
        },
        height:400,
        width:800,
        modal:true,
        buttons:{
            "OK":function () {
                $(this).dialog("close");
            }
        }
    });
    
	$( "#dialog-removeDepartmentFromFactor" ).dialog({
      autoOpen: false,
      show: {
        effect: "slide",
        duration: 300
      },
      hide: {
        effect: "slide",
        duration: 300
      },
      modal:true,
      buttons:{
         "OK":function () {
             $(this).dialog("close");
         }
        }
    });
    
    var icons = {
        header: "ui-icon-circle-arrow-e",
        activeHeader: "ui-icon-circle-arrow-s"
    };

    $( "#formAccordion" ).accordion({
        icon:icons,
        heightStyle: "content",
        collapsible: true,
        active:false
    });
    
    $( "#appointmentFormAccordion" ).accordion({
        icon:icons,
        heightStyle: "content",
        collapsible: true,
        active:false
    });
    //---------------------------
    if("${hasFilter}"=="true"){
    	$("#searchPatientFullName").val("${searchPatientFullName}");
    	$("#patientNationalCode").val("${patientNationalCode}");
		$("#fromDate").val("${fromDate}");
		$("#toDate").val("${toDate}");
		$("#patientFileNumber").val("${patientFileNumber}");
		<%--$("#patientOldFileNumber").val("${patientOldFileNumber}");--%>
		$("#doctor_id_Comb").data("kendoComboBox").value("${doctor_id}");
		$("#type_Comb").data("kendoComboBox").value("${type}");
		$("#department_id_forsearch_Comb").data("kendoComboBox").value("${department_id_forsearch}");
		$("#visitState_Comb").data("kendoComboBox").value("${visitState}");
		$("#posCMB_Comb").data("kendoComboBox").value("${posCMB}");
		//
		$("#doctor_id").val("${doctor_id}");
		$("#sendToCash").val("${sendToCash}");
		$("#financeReg").val("${financeReg}");
		$("#type").val("${type}");
		$("#department_id_forsearch").val("${department_id_forsearch}");
		$("#visitState").val("${visitState}");
		$("#posCMB").val("${posCMB}");
		$("#factorPaymentPrint").val("${factorPaymentPrint}");
		$("#financeRegistrationPrint").val("${financeRegistrationPrint}");
		$("#surgerySaveState").val("${surgerySaveState}");
		$("#departmentReleaseState").val("${departmentReleaseState}");
		//
		$("#sendToCash_Comb").data("kendoComboBox").value("${sendToCash_txt}");
		$("#financeReg_Comb").data("kendoComboBox").value("${financeReg_txt}");
		$("#factorPaymentPrint_Comb").data("kendoComboBox").value("${factorPaymentPrint_txt}");
		$("#financeRegistrationPrint_Comb").data("kendoComboBox").value("${financeRegistrationPrint_txt}");
		$("#surgerySaveState_Comb").data("kendoComboBox").value("${surgerySaveState_txt}");
		$("#departmentReleaseState_Comb").data("kendoComboBox").value("${departmentReleaseState_txt}");
		search();
    }
	//---------------------------
});
function doAfterSearch(data){
	setTimeout(function() {	
		if("${hasFilter}"=="true")
			$("#searchGrid").data("kendoGrid").dataSource.page(${gridPageNumber});
	}, 2000);
}
function resetForm(){
    $("#fromDate").val("<%=curStringDate%>");
    $("#toDate").val("<%=curStringDate%>");
	var ppb = $("#nameAndFam_Comb").data("kendoComboBox");
	ppb.dataSource.filter([]);
	ppb.dataSource.read();
	ppb.value("");
}
function deleteRow(tableID) {
    try {
        var table = document.getElementById(tableID);
        var rowCount = table.rows.length;
        for (var i = 0; i < rowCount; i++) {
            var row = table.rows[i];
            /*var chkbox = row.cells[0].childNodes[0];*/
            /*if (null != chkbox && true == chkbox.checked)*/
                table.deleteRow(i);
                rowCount--;
                i--;
            };
    } catch (e) {
        alert(e);
    };
    //getValues();
}

function removeFactorDepartmentAction(factorDepartment_id,factor_id,department_id){
     var tmp={}
     tmp.factorDepartment_id=factorDepartment_id;
     tmp.factor_id=factor_id;
     tmp.department_id=department_id;
     
     jQuery.ajax ({
		    url: basePath + "removeFactorDepartmentAction",
		    type: "POST",
		    data: JSON.stringify(tmp),
		    dataType: "json",
		    contentType: "application/json; charset=utf-8",
		    success: function(result){
		        if(result.state == "success"){
		        	$("#searchGrid").data("kendoGrid").dataSource.read();
	        		alertify.success(result.message);
		        	initRemoveDepartmentDialog(factor_id);
		        }else if(result.state == "error"){
		        	for(var i=0; i<result.errors.length; i++){
		        		alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
		        	}
                    $("#dialog-removeDepartmentFromFactor").dialog("close");
		        }else{
		        	lertify.error("Something is not good! O_o");
		        }
		        
		    },
            error:function(result){
                if(result.status==401){
                    window.location.href="";
                }
            }
      });
}


function initRemoveDepartmentDialog(factor_id){
    var areUShure = "<%=areUShure%>";
	var tmp={};
	tmp.id=factor_id;
     jQuery.ajax ({
				    url: basePath + "removeFactorDepartment",
				    type: "POST",
				    data: JSON.stringify(tmp),
				    dataType: "json",
				    contentType: "application/json; charset=utf-8",
				    success: function(result){
				        if(result.state == "success"){
				        	$("#searchGrid").data("kendoGrid").dataSource.read();
			        		alertify.success(result.message);
			        	}else if(result.state == "arraySuccess"){
			        		var data=result.data;
					        deleteRow('table-department-fromFactor');
					        if(data.length<1){
					        	$("#searchGrid").data("kendoGrid").dataSource.read();
					        	$("#dialog-removeDepartmentFromFactor").dialog("close");
					        	return;
					        }
						    var tbl=document.getElementById('table-department-fromFactor');
						    var tbdy=document.createElement('tbody');
						    var tr = document.createElement("tr");
							tr.style.background= 'linear-gradient(to bottom, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%)';
						      
						    var th1 = document.createElement("th");
							th1.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("global.row") %>'));
							th1.setAttribute('style', 'width: 5%');
							var th2 = document.createElement("th");
							th2.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.department") %>'));
							th2.setAttribute('style', 'width: 10%');
							var th3 = document.createElement("th");
							th3.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("action.operation") %>'));
							th3.setAttribute('style', 'width: 10%');
						    
						    tr.appendChild(th1);
							tr.appendChild(th2);
							tr.appendChild(th3);
							tbdy.appendChild(tr);
							for(i=0;i<data.length;i++){
							    var tr = document.createElement("tr");
							    var td1 = document.createElement("td");
								td1.appendChild(document.createTextNode(i+1));
								td1.setAttribute('style', 'width: 5%');
								var td2 = document.createElement("td");
								td2.appendChild(document.createTextNode(data[i].ComboCaption));
								td2.setAttribute('style', 'width: 10%');
								var td3 = document.createElement("td");
								td3.setAttribute('style', 'width: 10%');
								
								var image = document.createElement("img");
								image.title='<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.sendToRelease") %>';
								image.src = "<c:url value='/resources/images/delete/d_1_32.png' />";
								image.id='img-release-department-item-'+i+'-'+data[i].factorDepartment_id+'-'+factor_id+'-'+data[i].ComboID;
								image.onclick = function () {
									var qTxtEleId=this.id.split('-');
									removeFactorDepartmentAction(qTxtEleId[5],qTxtEleId[6],qTxtEleId[7]);
								};
								
								image.onmouseover = function () {
									mouseOver(this);
						   		};
						   		image.onmouseout = function () {
									mouseOut(this);
						   		};
								td3.appendChild(image);
							    tr.appendChild(td1);
								tr.appendChild(td2);
								tr.appendChild(td3);
								tbdy.appendChild(tr);
							}
					        tbl.appendChild(tbdy);
			        		$("#dialog-removeDepartmentFromFactor").dialog("open");
			        		
				        }else if(result.state == "error"){
				        	for(var i=0; i<result.errors.length; i++){
				        		alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
				        	}
				        }else{
				        	alertify.error("Something is not good! O_o");
				        }
				    },
		            error:function(result){
		                if(result.status==401){
		                    window.location.href="";
		                }
		            }
		      });

}


function releaseFactorDepartment(id,thisVar){
     jQuery.ajax ({
		    url: basePath + "releaseDepartment",
		    type: "POST",
		    data: JSON.stringify({id: id}),
		    dataType: "json",
		    contentType: "application/json; charset=utf-8",
		    success: function(result){
		        if(result.state == "success"){
                    var pageNumber=$("#searchGrid").data("kendoGrid").dataSource.page();
		        	$("#searchGrid").data("kendoGrid").dataSource.read();
		        	$("#searchGrid").data("kendoGrid").dataSource.page(pageNumber);
	        		alertify.success(result.message);
                    thisVar.src = "<c:url value='/resources/images/release/1.png' />";

		        }else if(result.state == "error"){
		        	for(var i=0; i<result.errors.length; i++){
		        		alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
		        	}
		        }else{
		        	alertify.error("Something is not good! O_o");
		        }
		    },
            error:function(result){
                if(result.status==401){
                    window.location.href="";
                }
            }
      });
}

function grid_sendToVisit(e){
    var data = this.dataItem($(e.target).closest("tr"));
    $.getJSON("<c:url value='/' />" + "clinic/basicInfo/financeRegistration/loadServices/"+data.id, function(data) {
        deleteRow('service-table');
        var tbl=document.getElementById('service-table');
        var tbdy=document.createElement('tbody');
        var tr = document.createElement("tr");
        tr.style.background= 'linear-gradient(to bottom, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%)';
        var th1 = document.createElement("th");
        th1.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("global.row") %>'));
        th1.setAttribute('style', 'width: 5%');
        var th2 = document.createElement("th");
        th2.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.service_id") %>'));
        th2.setAttribute('style', 'width: 10%');


        var th3_5 = document.createElement("th");
        th3_5.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.doctorName") %>'));
        th3_5.setAttribute('style', 'width: 10%');

        var th3_6 = document.createElement("th");
        th3_6.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.visitState") %>'));
        th3_6.setAttribute('style', 'width: 10%');



        var th4 = document.createElement("th");
        th4.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("action.operation") %>'));
        th4.setAttribute('style', 'width: 10%');

        tr.appendChild(th1);
        tr.appendChild(th2);
        tr.appendChild(th3_5);
        tr.appendChild(th3_6);
        tr.appendChild(th4);
        tbdy.appendChild(tr);

        var sumAmount=0;
        var sumTotalAmount=0;
        var sumTotalDiscounts=0;
        var sumPayable=0;

        for(i=0;i<data.length;i++){


            var tr = document.createElement("tr");
            var td1 = document.createElement("td");
            td1.align='center';
            td1.appendChild(document.createTextNode(i+1));
            td1.setAttribute('style', 'width: 5%');

            var td2 = document.createElement("td");
            td2.id='tbl-service-'+i+'-2-'+data[i].serviceId;
            td2.style.paddingRight='5px';
            td2.appendChild(document.createTextNode(data[i].serviceName));
            td2.setAttribute('style', 'width: 10%');




            var td3_5 = document.createElement("td");
            td3_5.id='tbl-service-doctorLastName-'+i+'-3';
            td3_5.style.paddingRight='5px';
            td3_5.appendChild(document.createTextNode(data[i].doctorLastName));
            td3_5.setAttribute('style', 'width: 10%;text-align: center;');

            var td3_6 = document.createElement("td");
            td3_6.id='tbl-service-visitState-'+i+'-3';
            td3_6.style.paddingRight='5px';
            td3_6.appendChild(document.createTextNode(data[i].visitState));
            td3_6.setAttribute('style', 'width: 10%;text-align: center;');

            var td4 = document.createElement("td");
            td4.setAttribute('style', 'width: 10%');



            // sendToVisit Img
            var sendToVisitImage = document.createElement("img");
            sendToVisitImage.src = "<c:url value='/resources/images/doctor-icon.png' />";
            //image.style.width='20px';
            sendToVisitImage.id='img-sendtovisit-service-'+i+'-'+data[i].financeRegistration_id;
            sendToVisitImage.onclick = function () {
                sendToVisitService(this.id);
            };
            sendToVisitImage.onmouseover = function () {
                mouseOver(this);
            };
            sendToVisitImage.onmouseout = function () {
                mouseOut(this);
            };


            td4.appendChild(sendToVisitImage);

            tr.appendChild(td1);
            tr.appendChild(td2);
            tr.appendChild(td3_5);
            tr.appendChild(td3_6);
            tr.appendChild(td4);
            tbdy.appendChild(tr);
        };

        tbl.appendChild(tbdy);
        $("#dialog-sendToVisit").dialog("open");
        
    });
}
function sendToVisitService(imageId){

    var financeRegistration_id = imageId.substring(imageId.lastIndexOf('-')+1,imageId.length);

    jQuery.ajax({
        url:"<c:url value='/' />" + "clinic/basicInfo/financeRegistration/sendToVisit",
        type:"POST",
        data:JSON.stringify(financeRegistration_id),
        dataType:"json",
        contentType:"application/json; charset=utf-8",
        success:function (result) {
            if (result.state == "error") {
                for (var i = 0; i < result.errors.length; i++) {
                    if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                        alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                    } else {
                        alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                    }
                }
            }
            if (result.state == "success") {
                alertify.success(result.message);
                var rowNumber=imageId.split('-')[3];
                $("#tbl-service-visitState-"+rowNumber+'-3').html(result.visitState);

//                $("#grid").data("kendoGrid").dataSource.read();
            }
        },
        error:function(result){
            if(result.status==401){
                window.location.href="";
            }
        }
    });
}

function mouseOver(img){
    img.className = 'mouseOverCursor';
}
function mouseOut(img){
    img.removeAttribute('mouseOverCursor');
}
function callback_change_nameAndFam(e){
	var id = e.sender._old;
    if (isNaN(id)){
        return;
    }
	var requestUrl = getBaseUrl() + "loadPatient/" + id;
	$.getJSON(requestUrl, function (data) {
		$('#fileNumber').val(data.filenumber);
//		$('#oldFileNumber').val(data.oldFileNumber);
	    $('#patientId').val(data.id);
	    $('#phone').val(data.tel1);
	    $('#cellPhone').val(data.cellphon);
	    $('#age').val(data.age);
	    $('#nameAndFam_Comb').data('kendoComboBox').value(data.id);
	});
}
function do_before_patientrPopup_popup_button(){
	var ppb = $("#nameAndFam_Comb").data("kendoComboBox");
	ppb.dataSource.filter([]);
	ppb.dataSource.read();
	ppb.value("");
}
function do_before_patientrComplexPopup_popup_button(){
	var ppb = $("#nameAndFam_Comb").data("kendoComboBox");
	ppb.dataSource.filter([]);
	ppb.dataSource.read();
	ppb.value("");
}

	function grid_onAppointmentRptBtnRegister(e){
	    var data = this.dataItem($(e.target).closest("tr"));
	    $("#h_appointmentId").val(data.id);
	    $("#h_appointmentTdTime").val(data.timeStr);
		$("#h_appointmentNameAndFam").val(data.nameAndFam);
		$("#h_appointmentPatientId").val(data.patientId);
		$("#h_appointmentDepartmentId").val(data.departmentId);
		$("#h_appointmentDoctorName").val(data.doctorName);
		$("#h_appointmentActionListNames").val(data.actionListNames);
	    $("#department_id").val(data.departmentId);
	    $("#department_id_Comb").data("kendoComboBox").value(data.departmentId);
	    $("#department_id").val(data.departmentId);
	    makeCard(data.id,data.nameAndFam,data.doctorName+" "+data.fileNumber,data.timeStr,data.actionListNames);
	    modal.hide();
	}
	
	function grid_onAppointmentRptBtnLog(e){
	     //var data = this.dataItem($(e.target).closest("tr"));
	     //window.location = "${pageContext.request.contextPath}"+"/clinic/basicInfo/financeRegistration/create/" + data.id;
	}

	function makeCard(appointmentId,nameAndFam,doctorName,visitTime,actionListNames){
		var lbl=document.getElementById('appName');
		lbl.innerHTML = '';
		var tbl=document.createElement('table');
		tbl.style.width='100%';
		var tbdyWeek=document.createElement('tbody');
		var tr1 = document.createElement("tr");
		var td11 = document.createElement("td");
		td11.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.patientName")%>'+" : "+nameAndFam));
		var td12 = document.createElement("td");
		td12.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.visitTime")%>'+" : "+visitTime));
		tr1.appendChild(td11);
		tr1.appendChild(td12);
		tbdyWeek.appendChild(tr1);
		var tr2 = document.createElement("tr");
		var td21 = document.createElement("td");
		td21.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.doctorName")%>'+" : "+doctorName));
		var td22 = document.createElement("td");
		td22.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.visitReason")%>'+" : "+actionListNames));
		tr2.appendChild(td21);
		tr2.appendChild(td22);
		tbdyWeek.appendChild(tr2);
		tbl.appendChild(tbdyWeek);
	
	    var aTag_cancel = document.createElement("a");
	    var imgTag_cancel = document.createElement("img");
	    imgTag_cancel.src="<c:url value='/resources/images/delete/Actions-button-cancel-icon8.png'/>"
	    aTag_cancel.className ="p-kanban-pin uk-panel-badge";
	    aTag_cancel.href="#";
	    aTag_cancel.appendChild(imgTag_cancel);
	    aTag_cancel.onclick = function (event) {
	        event.stopPropagation();
	        var lbl=document.getElementById('appName');
			lbl.innerHTML = '';
	    };
	
	    var d5 = document.createElement("div");
	    d5.className ="p-card-links";
        d5.appendChild(aTag_cancel);
		d5.style.width="5%";

	    var d3 = document.createElement("div");
	    d3.className ="uk-panel uk-panel-box";
		d3.style.width="20%";	
	    d3.setAttribute('style', 'height: 100%');
	    d3.setAttribute('style', 'width: 100%');
	    d3.appendChild(tbl);
	    d3.appendChild(d5);
	    var d1 = document.createElement("div");
	    d1.id="app-card";
	    d1.style.width ="40%";
	    d1.className="p-kanban-card";
	    d1.appendChild(d3);
	    d1.onclick = function (event) {
	        event.stopPropagation();
	    };
	
	    document.getElementById('appName').appendChild(d1);
	}
	
	function searchGrid_requestStart_callback(e){
		//vaghti safhe dar halate bazgasht ba jostojoye ghabli load mishavad default search gheyrefaal mishavad 
		if("${hasFilter}"=="true"){
			var gridUrl = $("#searchGrid").data("kendoGrid").dataSource.transport.options.read.url;
			if(!(!!gridUrl.indexOf('search/search/') && gridUrl.indexOf('search/search/') > 0)){
				e.preventDefault();
				console.log('prevent default search');
			}
		}
	}
	
    $("#modals-nursingDataPopup").dialog({
        modal : true,
        autoOpen: false,
        width: 800,
        buttons:{
            "<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.save") %>":function () {
            	var dialog = $(this);
				var data = {};
				data.factorId = $("#modalItemFactorId").val();;
				data.weight = $("#weight").val();
				data.bloodPressure = $("#bloodPressure").val();
				//
                jQuery.ajax({
                    url:"<c:url value='/' />" + "clinic/operation/factor/saveNursingData",
                    type:"POST",
                    data:JSON.stringify(data),
                    dataType:"json",
                    contentType:"application/json; charset=utf-8",
                    success:function (result) {
                        if (result.state == "error") {
                           	alertify.error(result.message);
                        }
                        if (result.state == "success") {
                            alertify.success(result.message);
                            dialog.dialog("close");
                        }
                    },
                    error:function(result){
						console.log('Error');
                    }
                });
            },
            "<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.close") %>":function () {
                $(this).dialog("close");
            }
        }
    });
    
	function grid_nursingDataPopup(e){
	     var data = this.dataItem($(e.target).closest("tr"));
	     e.preventDefault();
	     $("#modals-nursingDataPopup input").val("");
	     $("#modalItemFactorId").val(data.id);
	     $.getJSON(basePath + '/loadNursingData/' + data.id, function (result) {
	    	 if (result.state == "success") {
	    	 	$("#weight").val(result.weight);
	    	 	$("#bloodPressure").val(result.bloodPressure);
	    	 }
         });
         $("#modals-nursingDataPopup").dialog('open');
	}
	
	$("#undoReleaseDialog").dialog({
		autoOpen: false,
		width: 500
    });
	
	function grid_undoRelease(e){
		var data = this.dataItem($(e.target).closest("tr"));
		$.get(basePath + "loadFactorDepartments/" + data.id, function(data, status) {
			deleteRow("table-department-undoRelease");
			
		    var tbl=document.getElementById('table-department-undoRelease');
		    var tbdy=document.createElement('tbody');
		    var tr = document.createElement("tr");
			tr.style.background= 'linear-gradient(to bottom, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%)';
		      
		    var th1 = document.createElement("th");
			th1.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("global.row") %>'));
			th1.setAttribute('style', 'width: 15%');
			var th2 = document.createElement("th");
			th2.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.department") %>'));
			th2.setAttribute('style', '');
			var th3 = document.createElement("th");
			th3.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("action.operation") %>'));
			th3.setAttribute('style', 'width: 40%');
		    
		    tr.appendChild(th1);
			tr.appendChild(th2);
			tr.appendChild(th3);
			tbdy.appendChild(tr);
			
			for(i=0; i<data.length; i++){
			    var tr = document.createElement("tr");
			    var td1 = document.createElement("td");
				td1.appendChild(document.createTextNode(i+1));
				td1.setAttribute('style', 'width: 15%');
				var td2 = document.createElement("td");
				td2.appendChild(document.createTextNode(data[i].departmentName));
				td2.setAttribute('style', '');
				var td3 = document.createElement("td");
				td3.setAttribute('style', 'width: 40%');
				
				var image = document.createElement("img");
				if(data[i].releaseable){
					image.title='<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.undoRelease") %>';
					image.src = "<c:url value='/resources/images/release/2.png' />";
					image.id='img-undoRelease-department-item-' + i + '-' + data[i].id+'-'+data[i].factor_id;
					image.onclick = function () {
						var factorDepartmentId = this.id.split('-');
						undoReleaseFactorDepartment(factorDepartmentId[5], this,factorDepartmentId[6]);
					};
					image.onmouseover = function () {
						mouseOver(this);
			   		};
			   		image.onmouseout = function () {
						mouseOut(this);
			   		};
				}
				td3.appendChild(image);
			    tr.appendChild(td1);
				tr.appendChild(td2);
				tr.appendChild(td3);
				tbdy.appendChild(tr);
			}
			tbl.appendChild(tbdy);
			 
			$("#undoReleaseDialog").dialog("open");
		});
	}
	
	function undoReleaseFactorDepartment(factorDepartmentId, thisVar,factorId){
	     jQuery.ajax ({
			    url: basePath + "undoReleaseDepartment",
			    type: "POST",
			    data: JSON.stringify({factorDepartmentId: factorDepartmentId,factorId:factorId}),
			    dataType: "json",
			    contentType: "application/json; charset=utf-8",
			    success: function(result){
			        if(result.state == "success"){
	                    var pageNumber=$("#searchGrid").data("kendoGrid").dataSource.page();
			        	$("#searchGrid").data("kendoGrid").dataSource.read();
			        	$("#searchGrid").data("kendoGrid").dataSource.page(pageNumber);
		        		alertify.success(result.message);
		        		thisVar.hidden = true;
			        }else if(result.state == "error"){
			        	for(var i=0; i<result.errors.length; i++){
			        		alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
			        	}
			        }else{
			        	alertify.error("Something is not good! O_o");
			        }
			    },
	            error:function(result){
	                if(result.status==401){
	                    window.location.href="";
	                }
	            }
	      });
	}

	function grid_undoClosedFactor(e){
        var data = this.dataItem($(e.target).closest("tr"));
        $.getJSON(basePath + '/undoClosedFactor/' + data.id, function (result) {
            if (result.state == "success") {
                var pageNumber=$("#searchGrid").data("kendoGrid").dataSource.page();
                $("#searchGrid").data("kendoGrid").dataSource.page(pageNumber);
                alertify.success(result.message);
            }else{
                for(var i=0; i<result.errors.length; i++){
                    alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                }
            }
        });
    }

	$("#closeFactorBtn").click(function () {
        var data = {};
        var entityGrid=$("#searchGrid").data("kendoGrid");
        var entityGridArray=[];
        if (entityGrid.select().length > 0) {
            for(var j=0;j<entityGrid.select().length;j++){
                entityGridArray[entityGridArray.length]=entityGrid.dataItem(entityGrid.select()[j]).id
            }
            for(var w=0;w<entityGridArray.length;w++){
                if(entityGridArray[w].id!=undefined){
                    data['id'+w]=entityGridArray[w].id;
                }else{
                    data['id'+w]=entityGridArray[w];
                }
            }
            $("#dialogconfirmFactorCloseSelectRow").data('contents', data).dialog("open");

        }else{
            // entityGridArray=entityGrid._data;
            var searchJsonString = "{}";
            if(typeof(getSearchObject)=="function"){
                console.log(getSearchObject())
                searchJsonString = JSON.stringify(getSearchObject());
                searchJsonString = searchJsonString.replace(/\//g, ':@:');
            }
            $("#dialogconfirmFactorClose").data('contents', searchJsonString).dialog("open");
        }



        // $("#dialogconfirmFactorClose").data('contents', data).dialog("open");


        /*$.getJSON(basePath + '/closeFactors', function (result) {
            if (result.state == "success") {
                alertify.success(result.message);
                //
                var pageNumber=$("#searchGrid").data("kendoGrid").dataSource.page();
                $("#searchGrid").data("kendoGrid").dataSource.read();
                $("#searchGrid").data("kendoGrid").dataSource.page(pageNumber);
            } else {
                alertify.error(result.message);
            }
        });*/
    });

 function confirmFactorCloseSelectRow(e) {
     var data=e.data('contents');

     jQuery.ajax ({
         url: basePath + "closeFactors",
         type: "POST",
         data: JSON.stringify(data),
         dataType: "json",
         contentType: "application/json; charset=utf-8",
         success: function(result){
             if(result.state == "success"){
                 alertify.success(result.message);
             }
             else {
                 alertify.error(result.message);
             }
             var pageNumber=$("#searchGrid").data("kendoGrid").dataSource.page();
             $("#searchGrid").data("kendoGrid").dataSource.page(pageNumber);
         },
         error:function(result){
             if(result.status==401){
                 window.location.href="";
             }
         }
     });
 }

 function confirmFactorClose(e) {
     var searchJsonString=e.data('contents');
     jQuery.ajax ({
         url: basePath + "closeFactors/"+searchJsonString,
         type: "POST",
         dataType: "json",
         contentType: "application/json; charset=utf-8",
         success: function(result){
             if(result.state == "success"){
                 alertify.success(result.message);
             }
             else {
                 alertify.error(result.message);
             }
             var pageNumber=$("#searchGrid").data("kendoGrid").dataSource.page();
             $("#searchGrid").data("kendoGrid").dataSource.page(pageNumber);
         },
         error:function(result){
             if(result.status==401){
                 window.location.href="";
             }
         }
     });
 }
</script>

<style>
.mouseOverCursor {
     cursor: pointer;
}
th{
	text-align: right;
}
.th-lable{
	padding-left: 5px;
}
.textBoxBackground{
	background: #DEE0C8;
}
    left: 410px!important;
}
#searchTab{
	margin-bottom: 5px;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(29%,rgba(212,225,241,1)), color-stop(33%,rgba(201,218,238,1)), color-stop(100%,rgba(228,240,253,1)));
	border-width: thin;
	border-color: cornflowerblue;
	color: black;
	text-align: -webkit-center;
	font-weight: bold;
}
#search_back{
	padding-top: 5px;
	padding-bottom: 5px;
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(rgb(242, 245, 246)), color-stop(0.37, rgb(227, 234, 237)), to(rgb(200, 215, 220)));
}
.ui-dialog-title{
	width: 97% !important;
}
.patientInfo div{
	padding-right: 3px !important;
}
.patientInfo input[type='text']{
	text-align: center;
}
</style>