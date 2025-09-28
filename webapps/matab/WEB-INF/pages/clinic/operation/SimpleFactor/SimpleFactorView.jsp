<%@page import="com.artonis.core.base.core.Date"%>
<%@page import="com.artonis.core.base.core.DateUtil"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
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
<base:dialogConfirm name="dialogconfirmRemoveService" key="action.alert.areYouSure.delete"
					yesFunction="confirmRemoveService"/>
<base:dialogConfirm name="dialogconfirmRemovePosItem" key="action.alert.areYouSure.delete"
					yesFunction="confirmRemovePosItem"/>
<base:dialogAlert name="dialogRemoveVisit"
				  key="com.artonis.clinic.basicInfo.financeRegistration.alert.notAllowRemoveVisited"/>
<base:dialogAlert name="dialogRemoveCancel"
				  key="com.artonis.clinic.basicInfo.financeRegistration.alert.notAllowRemoveFRcancel"/>
<base:dialogAlert name="dialogEditPosItem"
				  key="com.artonis.clinic.operation.factor.editPosItem.alert.notAllowEditWithRelease"/>
<div class="body-header" style="padding: 0px 15px 0px 0px !important">
	<div style=" float: right; right: 10px; text-align: right; top: 4px;margin-top:5px">
		<button  id="newPageBtn" class="uk-button uk-button-mini uk-button-danger"
				style="padding-bottom: 3px; margin-bottom: 5px; padding-right: 50px; padding-left: 50px;">
       		<%=ResourceBoundleHolder.resourceBundle.getString("clinic.operation.simpleFactor.new")%>
   		</button>
	</div>
	<div align="center" style="padding-top: 3px; color: blue;">
		<span>${pageTitle}</span> 
	</div>
</div>

<div class="allSections">
	<div class="topSection">
		<div class="rightSection">
			<form class="toPopup" id="formDialog">
	            <div class="uk-grid uk-grid-preserve" align="center" >
	            	<label id="appName" ></label>
	            </div>
				<input type="hidden" id="patientId">
				<input name="h_appointmentId" type="hidden" id="h_appointmentId" />
				<input name="address" type="hidden" id="address" />
				<input name="attachFileListBarSep" type="hidden" id="attachFileListBarSep" />
				<input name="files_uploaderChangeState" type="hidden" id="files_uploaderChangeState" />
				<input name="uniqueLongForFileUpload" type="hidden" id="uniqueLongForFileUpload" />
				<input type="hidden" id="factorId">
	            <div class="uk-grid uk-grid-preserve" id="nameAndFamDiv" style="margin-top: 5px;">
	            	<base:comboBoxAutoComplete name="nameAndFam" styleClass="uk-width-1-10 nameAndFamCombo" key="clinic.simpleFactor.searchPatient" 
            			comboLoaderUrl="/combo/loadPatinent" styledivLabel="width: 25%; padding-right: 0px !important;"
	                    dataTextField="searchField" dataValueField="id" minLength="0" hasTemplate="true" iscomboLoaderUrlRelative="true"
	                    templateComaSep="fullName,filenumber"  headerTemplateComaSep="com.appointment.nameAndFamily,clinic.patient.fileNumber" />
	            </div>
	            <div style="margin-top: 15px;" align="center">
                	<base:buttonPopupForSelectingGrid formPopup="patientrComplexPopup" key="com.artonis.clinic.operation.factor.patientSearch"
                		popUrl="popup/patientrComplexView" isRelative="true" gridName="searchGrid"  onSelectRowEvent="selectRowEventCallBack"  style=" width: 48%"/>
                	<base:buttonPopupForSelectingGrid formPopup="appointmentReportNew" key="com.artonis.clinic.operation.factor.appointmentReport" isRelative="true" 
                		popUrl="popup/appointmentReportNew"	gridName="grid_popup" onSelectRowEvent="appointmentReportSelectRowEventCallBack" style=" width: 48%"/>
	            </div>
	            <div class="uk-grid uk-grid-preserve" style="margin-top: 15px;">
	                <div class="left-align patientInfoLabel">
	                    <base:simpleLabel name="patientName" key="clinic.simpleFactor.patientName"/>
	                </div>
	                <div class="patientInfoField">
	                    <input type="text" id="patientName" class="text ui-widget-content ui-corner-all" autocomplete="off" />
	                </div>
	                  
	                <div class="left-align patientInfoLabel">
	                    <base:simpleLabel name="patientLastName" key="clinic.simpleFactor.patientLastName"/>
	                </div>
	                <div class="patientInfoField">
	                    <input type="text" id="patientLastName" class="text ui-widget-content ui-corner-all" autocomplete="off" />
	                </div>  
	            </div>
	            <div class="uk-grid uk-grid-preserve">
	                <div class="left-align patientInfoLabel">
	                    <base:simpleLabel name="fathername" key="clinic.simpleFactor.fatherName"/>
	                </div>
	                <div class="patientInfoField">
	                    <input type="text" id="fathername" class="text ui-widget-content ui-corner-all" autocomplete="off"/>
	                </div>  

	                <div class="left-align patientInfoLabel">
	                    <base:simpleLabel name="fileNumber" key="clinic.simpleFactor.fileNumber"/>
	                </div>
	                <div class="patientInfoField">
	                    <input type="text" id="fileNumber" class="text ui-widget-content ui-corner-all" autocomplete="off">
	                </div>
	            </div>
	            <div class="uk-grid uk-grid-preserve">
					<div class="left-align patientInfoLabel">
						<base:simpleLabel name="oldFileNumber" key="clinic.simpleFactor.oldFileNumber"/>
					</div>
					<div class="patientInfoField">
						<input type="text" id="oldFileNumber" class="text ui-widget-content ui-corner-all" autocomplete="off" />
					</div>
	            </div>
				<div class="uk-grid uk-grid-preserve">
	                <div class="left-align patientInfoLabel">
	                    <base:simpleLabel name="cellphone" key="clinic.simpleFactor.cellphone"/>
	                </div>
	                <div class="patientInfoField">
	                    <input type="text" id="cellphone" class="text ui-widget-content ui-corner-all" autocomplete="off" />
	                </div>

	                <div class="left-align patientInfoLabel">
	                    <base:simpleLabel name="phone" key="clinic.simpleFactor.phone"/>
	                </div>
	                <div class="patientInfoField">
	                    <input type="text" id="phone" class="text ui-widget-content ui-corner-all" autocomplete="off" />
	                </div>
	            </div>
	            <div class="uk-grid uk-grid-preserve">
	                <base:mDatePicker name="birthDate" styleClass="uk-width-1-10 birthDateFieldStyle" key="clinic.simpleFactor.birthDate"
	                		 styledivLabel="width: 22%;" stylediv="width:27%; padding-right:2%;"/>
	                
	                <div class="left-align patientInfoLabel">
	                    <base:simpleLabel name="age" key="clinic.simpleFactor.age"/>
	                </div>
	                <div class="patientInfoField" style="width: 12%;">
	                    <input type="text" id="age" class="text ui-widget-content ui-corner-all" style="text-align: center;" autocomplete="off" />
	                </div>
					<div class="left-align patientInfoLabel dateMeasureUnit" style="width: 7%;">
	                </div>
	            </div>
	            <div class="uk-grid uk-grid-preserve">
	                <div class="left-align patientInfoLabel">
	                    <base:simpleLabel name="nationalCode" key="clinic.simpleFactor.nationalCode"/>
	                </div>
	                <div class="patientInfoField">
	                    <input type="text" id="nationalCode" class="text ui-widget-content ui-corner-all" autocomplete="off" />
	                </div>
	                
	                <base:comboBox styleClass="small" name="sex" comboLoaderUrl="combo/loadAllSex" key="clinic.simpleFactor.sex" 
	                	styledivLabel="width: 22%;" stylediv="width: 24.5%; padding-right: 2%; margin-top: 2px;"/>
	            </div>
				<div class="uk-grid uk-grid-preserve" id="ins1">
					<base:comboBox styleClass="small" name="insurance_type_1_id"
								   key="com.artonis.clinic.basicInfo.financeRegistration.insurance_type1"
								   comboLoaderUrl="combo/getActiveInsurance" styledivLabel="width: 22%;" stylediv="width: 24.5%; padding-right: 2%; margin-top: 2px;"/>
					<base:cascadeComboBox cascadeCombo="insurance_type_1_id" name="insuranceBookletType" comboLoaderUrl="combo/loadAllInsuranceBookletType" styleClass="small"
										  key="com.artonis.clinic.basicInfo.financeRegistration.insuranceBookletType"
										  styledivLabel="width: 22%;" stylediv="width: 26.5%; padding-right: 5%; margin-top: 2px;"/>
	            </div>
				<div class="uk-grid uk-grid-preserve" id="ins2">
					<div class="left-align patientInfoLabel">
						<base:simpleLabel name="insuranceBookletSerial" key="com.artonis.clinic.basicInfo.financeRegistration.insuranceBookletSerial"/>
					</div>
					<div class="patientInfoField">
						<input type="text" id="insuranceBookletSerial" class="text ui-widget-content ui-corner-all" autocomplete="off" >
					</div>

					<%--<div class="left-align patientInfoLabel">
						<base:simpleLabel name="insuranceBookletPageNumber" key="com.artonis.clinic.basicInfo.financeRegistration.insuranceBookletPageNumber"/>
					</div>
					<div class="patientInfoField">
						<input type="text" id="insuranceBookletPageNumber" class="text ui-widget-content ui-corner-all" >
					</div>
	            </div>
				<div class="uk-grid uk-grid-preserve">
					<base:mDatePicker name="prescriptionDate" key="com.artonis.clinic.basicInfo.financeRegistration.prescriptionDate"
									  styleClass="small" styledivLabel="width: 22%;" stylediv="width: 24.5%; padding-right: 2%; margin-top: 2px;"/>
					<base:mDatePicker name="prescriptionValidityDate" key="com.artonis.clinic.basicInfo.financeRegistration.prescriptionValidityDate"
									  styleClass="small" styledivLabel="width: 22%;" stylediv="width: 26.5%; padding-right: 5%; margin-top: 2px;"/>
	            </div>
				<div class="uk-grid uk-grid-preserve">
					<div class="left-align patientInfoLabel">
						<base:simpleLabel name="serviceRequesterMedicalCouncilCode" key="com.artonis.clinic.basicInfo.financeRegistration.serviceRequesterMedicalCouncilCode"/>
					</div>
					<div class="patientInfoField">
						<input type="text" id="serviceRequesterMedicalCouncilCode" class="text ui-widget-content ui-corner-all" >
					</div>--%>
				</div>
            </form>
			<div align="center" style="padding-top: 1px">
				<base:formPopup  styledivLabel="text-align: right" formPopup="PatientSimpleFactor" disableBackground="true" disableSaveWithoutCloseButton="false"
								 popupUrl="/clinic/operation/patientSimpleFactorPopUp/" keyLabel="clinic.simpleFactor.additionalInfo" functUrlAppend="patientIdAppender"/>
			</div>
            <div align="center" style="padding-top: 15px; padding-bottom: 5px;">
				<base:buttonPermission key="clinic.operation.simpleFactor.savePatient"
									   classNames="uk-button uk-button-success" id="clinic-save-patient" style="width: 20%;margin-bottom: 5%"/>
                <base:buttonPermission key="com.artonis.clinic.basicInfo.financeRegistration.history" classNames="uk-button uk-button-primary" 
                		id="showHistoryBtn" style="width:96%;"/>
            </div>
		</div>
		
		<div class="leftSection">
	        <div align="center" style="margin-top: 5px;">
	            <table border="1" width="98%" id="service-table" style="" class="serviceTableCss">
	                <tr style="background: linear-gradient(rgb(177, 205, 240) 29%, rgb(167, 199, 237) 33%, rgb(95, 132, 173) 100%);" data-rowTye="header">
	                    <th width="2%">
	                        <%=ResourceBoundleHolder.resourceBundle.getString("global.row") %>
	                    </th>
	                    <th width="17%">
	                        <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.service_id") %>
	                    </th>
	                    <th width="7%">
							<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.originalCost") %>	                        
	                    </th>
	                    <th width="4%">
	                        <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.unit") %>
	                    </th>
	                    <th width="7%">
	                        <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.totalAmount") %>
	                    </th>
	                    <th width="7%">
	                        <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.discounts") %>
	                    </th>
	                    <th width="11%">
	                        <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.payableAmount") %>
	                    </th>
	                    <th width="15%">
	                        <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.doctor") %>
	                    </th>
	                    <th width="12%">
	                        <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.visitState") %>
	                    </th>
	                    <th width="2%">
	                        <%=ResourceBoundleHolder.resourceBundle.getString("action.operation") %>
	                    </th>
	                </tr>
	            </table>
 	            <div align="right" style="width: 98%;">
	            	<img id="img-addServiceTableRow" src="<c:url value='/resources/images/blue/button-add.png'/>" onclick="makeServiceTableReady()"
	            			title="<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.new")%>"
	            			style="width: 3.5%; padding-right: 0%; padding-top: 1px; cursor: pointer;" onmouseover="imgAddServiceTableRowOnMouseOver(this)"
	            			onmousedown="imgAddServiceTableRowOnMouseDown(this)" onmouseout="imgAddServiceTableRowOnMouseOut(this)"
	            			onmouseup="imgAddServiceTableRowOnMouseOut(this)">
	            </div>
	        </div>
	        <div align="center">
	        	<base:buttonPermission key="clinic.operation.simpleFactor.saveAndSendToPayment" classNames="uk-button uk-button-success" id="clinic-fnc-save" style="width: 20%;"/>
	        </div>
	        <div align="center">
		        <div class="paymentSection">
					<input type="hidden" id="factorPayment_id" name="factorPayment_id">
	                <div id="paymentFields" class="uk-grid uk-grid-preserve" style="padding-top: 5px; padding-bottom: 5px; margin: 0px;">
	                    <base:testBoxNumericEx name="posAmount" styleClass="verysmall" key="com.artonis.clinic.basicInfo.financeRegistration.cost"/>
	                    <base:comboBox styleClass="small" name="payRecipt" key="com.artonis.clinic.basicInfo.financeRegistration.paymentType"
	                    	 comboLoaderUrl="combo/loadPayReceipt"/>
	                    <base:comboBox styleClass="small" name="posCMB" key="com.artonis.clinic.basicInfo.financeRegistration.paymentType"
	                    	 comboLoaderUrl="combo/loadAllPos" selectIndex="0"/>
	                    <base:testBox name="billNumber" styleClass="verysmall" key="com.artonis.clinic.basicInfo.financeRegistration.billNumber"/>
	                </div>
					<div align="center" style="padding: 5px;">
	                    <base:buttonPermission key="clinic.cash.posSave" classNames="uk-button uk-button-primary" id="clinic-fnc-posSave" style="width: 12%;"/>
	                    <base:buttonPermission key="clinic.cash.posReset" classNames="uk-button uk-button-primary" id="clinic-fnc-posFormReset" style="width: 12%;"/>
	                </div>
	                <div align="center">
	                    <table id="pos-item-table" width="80%" border="1">
	                        <tr style="background: linear-gradient(to bottom, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%);">
	                            <th width="5%" align="center">
	                                <%=ResourceBoundleHolder.resourceBundle.getString("global.row") %>
	                            </th>
	                            <th width="20%">
	                                <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.deviceName") %>
	                            </th>
	                            <th width="20%">
	                                <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.amount") %>
	                            </th>
	                            <th width="20%">
	                                <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.billNumber") %>
	                            </th>
	                            <th width="20%">
	                                <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.userFullName") %>
	                            </th>
	                            <th width="10%">
	                                <%=ResourceBoundleHolder.resourceBundle.getString("action.operation") %>
	                            </th>
	                        </tr>
	                    </table>
	                    <div align="center" style="margin-top: 10px; margin-bottom: 5px;">
	                        <label id="fncTotalCost" style=" font-size: 18px !important; font-weight: bold; color: maroon; "></label>
	                        <label id="fncReportLBL" style=" font-size: 18px !important; font-weight: bold; color: maroon; "></label>
	                    </div>
	                </div>
		        </div>
	        </div>
		</div>
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
						<base:comboBox styleClass="small" name="posCMBFroSearch" key="com.artonis.clinic.basicInfo.financeRegistration.paymentType" comboLoaderUrl="combo/loadAllPos"/>
						<base:comboBox name="doctorId" key="com.artonis.clinic.basicInfo.employeeContract.doctor_id" comboLoaderUrl="combo/loadAllDoctor" styleClass="small" />
						<base:comboBox name="factorPaymentPrint" key="com.artonis.clinic.basicInfo.financeRegistration.factorPrint" comboLoaderUrl="combo/AllFactorPaymentPrintState" styleClass="small" />
					</div>
					<div class="uk-grid uk-grid-preserve">
						<base:comboBox styleClass="small" name="financeRegistrationPrint" key="com.artonis.clinic.basicInfo.financeRegistration.financeRegistrationPrint" comboLoaderUrl="combo/AllFactorPaymentPrintState"/>
						<base:comboBox styleClass="small" name="surgerySaveState" key="com.artonis.clinic.operation.factor.surgerySaveState" comboLoaderUrl="combo/AllSurgerySaveState"/>
						<base:comboBox styleClass="small" name="visitState" comboLoaderUrl="combo/allVisitState" key="com.artonis.clinic.basicInfo.financeRegistration.visitState"/>
					</div>
					<div class="uk-grid uk-grid-preserve">
						<base:comboBox name="sendToCash"  key="com.artonis.clinic.operation.factor.sendToCash" comboLoaderUrl="combo/allSendToCashState" styleClass="small"/>
					</div>
				</form>
			</div>
			<base:searchButton defaultReadUrl="<%=gridUrl%>" defaultReadUrlIsRelative="false"/>
		</div>
	</div>

	<div class="bottomSection">
		<div class="bottomGrid">
			<base:my-grid-search defaultReadUrl="<%=gridUrl%>" defaultReadUrlIsRelative="false" isAccordionable="true" refreshButton="true">
			    <base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fileNumber'  field="patientFileNumber" width="15px"/>
			    <%--<base:my-grid-column title='com.artonis.clinic.operation.factor.oldFileNumber'  field="patientOldFileNumber" width="15px"/>--%>
			    <base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fullName'  field="patientFullName" width="19px"/>
			    <base:my-grid-column title='com.artonis.clinic.operation.factor.patientNationalCode'  field="patientNationalCode" width="20px"/>
				<base:my-grid-column title='com.artonis.clinic.operation.factor.sendToCash'  field="sendToCashText" width="16px"/>
				<base:my-grid-column title='com.artonis.clinic.operation.factor.financeReg'  field="financeRegText" width="16px"/>
				<base:my-grid-column title='com.artonis.clinic.operation.factor.type'  field="factorType" width="14px"/>
				<base:my-grid-column title='com.artonis.clinic.operation.factor.date'  field="date" width="13px"/>
				<base:my-grid-column title='com.artonis.clinic.operation.factor.releaseState'  field="releaseStateText" width="13px"/>
				<base:my-grid-column title='com.artonis.clinic.operation.factor.serviceNameList'  field="serviceNameList" width="20px"/>
				<base:my-grid-column title='com.artonis.clinic.operation.factor.doctorNameList'  field="doctorNameList" width="20px"/>

				<base:my-grid-function text="action.edit" functionClick="grid_editFactor" name="editFactor"  />
				<base:my-grid-function text="clinic.patient.release" functionClick="grid_release" name="releaseFactor" />
				<base:my-grid-function text="clinic.patient.undoRelease" functionClick="grid_undoRelease" name="undoReleaseFactor" />
				<base:my-grid-function text="com.artonis.clinic.operation.factor.nursingData" functionClick="grid_nursingDataPopup" name="nursingDataPopup" />
				<base:my-grid-function text="action.delete" functionClick="grid_deleteFactor" name="deleteFactor"  styleClass="uk-button-danger"/>
			</base:my-grid-search>
		</div>
	</div>

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

<div id="dialog-removeDepartmentFromFactor" title='<%=ResourceBoundleHolder.resourceBundle.getString("action.delete") %>' style="display: none">
  	<table id="table-department-fromFactor" border="1" width="100%">
  		<tr> 
  			<th><%=ResourceBoundleHolder.resourceBundle.getString("global.row") %></th>
  			<th><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.department") %></th>
  			<th><%=ResourceBoundleHolder.resourceBundle.getString("action.operation") %></th>
  		</tr>
  	</table>
</div>
<div id="dialog" title='<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.release") %>' style="display: none">
	<table id="table-department-release" border="1" width="100%">
		<tr>
			<th><%=ResourceBoundleHolder.resourceBundle.getString("global.row") %></th>
			<th><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.department") %></th>
			<th><%=ResourceBoundleHolder.resourceBundle.getString("action.operation") %></th>

		</tr>
	</table>
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
<div id="modals-nursingDataPopup" title="<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.nursingData")%>">
	<form class="uk-form" id="form-popup">
		<input type="hidden" id="modalItemFactorId">
		<div class="uk-grid uk-grid-preserve" style="margin-top: 10px;">
			<base:testBox name="weight" key="clinic.visit.clinicalInformation.weight" styleClass="verysmall" />
			<base:testBox name="bloodPressure" key="clinic.visit.clinicalInformation.bloodPressure" styleClass="verysmall" styledivLabel="margin-right: 50px;"/>
		</div>
	</form>
</div>

<div id="modals-insuranceDataPopup" title="<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.nursingData")%>">
	<form class="uk-form" id="form-popup-insurance">
		<input type="hidden" id="rowNumberId">
		<%--<div class="uk-grid uk-grid-preserve" style="margin-top: 10px;">--%>
			<div class="uk-grid uk-grid-preserve">
				<%--<div class="left-align patientInfoLabel">--%>
					<%--<base:simpleLabel name="insuranceBookletSerial" key="com.artonis.clinic.basicInfo.financeRegistration.insuranceBookletSerial"/>--%>
				<%--</div>--%>
				<%--<div class="patientInfoField">--%>
					<%--<input type="text" id="insuranceBookletSerial" class="text ui-widget-content ui-corner-all" >--%>
				<%--</div>--%>

				<div class="left-align patientInfoLabel">
					<base:simpleLabel name="insuranceBookletPageNumber" key="com.artonis.clinic.basicInfo.financeRegistration.insuranceBookletPageNumber"/>
				</div>
				<div class="patientInfoField">
					<input type="text" id="insuranceBookletPageNumber" class="text ui-widget-content ui-corner-all" >
				</div>
			</div>
			<div class="uk-grid uk-grid-preserve">
				<base:mDatePicker name="prescriptionDate" key="com.artonis.clinic.basicInfo.financeRegistration.prescriptionDate"
								  styleClass="small" styledivLabel="width: 22%;" stylediv="width: 24.5%; padding-right: 2%; margin-top: 2px;"/>
				<base:mDatePicker name="prescriptionValidityDate" key="com.artonis.clinic.basicInfo.financeRegistration.prescriptionValidityDate"
								  styleClass="small" styledivLabel="width: 22%;" stylediv="width: 26.5%; padding-right: 5%; margin-top: 2px;"/>
			</div>
			<div class="uk-grid uk-grid-preserve">
				<div class="left-align patientInfoLabel">
					<base:simpleLabel name="serviceRequesterMedicalCouncilCode" key="com.artonis.clinic.basicInfo.financeRegistration.serviceRequesterMedicalCouncilCode"/>
				</div>
				<div class="patientInfoField">
					<input type="text" id="serviceRequesterMedicalCouncilCode" class="text ui-widget-content ui-corner-all" >
				</div>
			</div>
		<%--</div>--%>
	</form>
</div>

<script type="text/javascript">
var	isReleasedInPage=false
var rounded=0;
$(".bottomGrid .k-rtl").parent().css("padding-top","");
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

resetForm();
var fileNumber;
function callback_onShow_birthDate(){
	$('.pdp-default').css('left', '');
}

var DateDiff = {
	    inDays: function(d1, d2) {
	        var t2 = d2.getTime();
	        var t1 = d1.getTime();
	        return parseInt((t2-t1)/(24*3600*1000));
	    },
	    inMonths: function(d1, d2) {
	        var d1Y = d1.getFullYear();
	        var d2Y = d2.getFullYear();
	        var d1M = d1.getMonth();
	        var d2M = d2.getMonth();
	        return (d2M+12*d2Y)-(d1M+12*d1Y);
	    },
	    inYears: function(d1, d2) {
	        return d2.getFullYear()-d1.getFullYear();
	    }
}

//function callback_change_insurance_type_1_id(e){
	/*if(e.sender._old>1){
		$("#insuranceBookletSerial").prop("disabled",false);
		$("#insuranceBookletPageNumber").prop("disabled",false);
		$("#prescriptionDate").prop("disabled",false);
		$("#prescriptionValidityDate").prop("disabled",false);
		$("#serviceRequesterMedicalCouncilCode").prop("disabled",false);
	}else{
		$("#insuranceBookletSerial").val("");
		$("#insuranceBookletPageNumber").val("");
		$("#prescriptionDate").val("");
		$("#prescriptionValidityDate").val("");
		$("#serviceRequesterMedicalCouncilCode").val("");
		$("#insuranceBookletSerial").prop("disabled",true);
		$("#insuranceBookletPageNumber").prop("disabled",true);
		$("#prescriptionDate").prop("disabled",true);
		$("#prescriptionValidityDate").prop("disabled",true);
		$("#serviceRequesterMedicalCouncilCode").prop("disabled",true);
	}*/


//}

function callback_onSelect_birthDate(){
	var year = '<%=ResourceBoundleHolder.resourceBundle.getString("global.date.year")%>';
	var month = '<%=ResourceBoundleHolder.resourceBundle.getString("global.date.month")%>';
	var day = '<%=ResourceBoundleHolder.resourceBundle.getString("global.date.day")%>';
	//
	var jdf = new jDateFunctions();
	var pd = new persianDate();
    pd.year = parseInt($("#birthDate").val().split("/")[0]);
    pd.month = parseInt($("#birthDate").val().split("/")[1]);
    pd.date = parseInt($("#birthDate").val().split("/")[2]);
	//
	var d1 = jdf.getGDate(pd);
	var d2 = new Date();
	//
	if(DateDiff.inYears(d1, d2) > 0){
		$("#age").val(DateDiff.inYears(d1, d2));
		$(".dateMeasureUnit").text(year);
	}else if(DateDiff.inMonths(d1, d2) > 0){
		$("#age").val(DateDiff.inMonths(d1, d2));
		$(".dateMeasureUnit").text(month);			
	}else if(DateDiff.inDays(d1, d2) > 0){
		$("#age").val(DateDiff.inDays(d1, d2));
		$(".dateMeasureUnit").text(day);	
	}
}

$("#age").keyup(function() {
	fillBirthDateFromAge();
});

function fillBirthDateFromAge(){
	var year = '<%=ResourceBoundleHolder.resourceBundle.getString("global.date.year")%>';
	$(".dateMeasureUnit").text(year);
	//
	if(isNaN($("#age").val().trim())){
		$("#birthDate").val("");
	}else if($("#age").val().trim().length > 0){
		var d = new Date();
		var currnetYear = parseInt(ToShamsi(d.getFullYear(),d.getMonth()+1,d.getDate()).split("/")[0].trim());
		var age = parseInt($("#age").val().trim());
		$("#birthDate").val(currnetYear-age + "/1/1");
	}else{
		$("#birthDate").val("");
	}
}

function callback_change_nameAndFam(e){
	var id = e.sender._old;
    if (isNaN(id)){
        return;
    }
	if(id==""){
		resetPatientInputFields();
	}else{
		loadPatient(id);
	}
}

function loadPatient(id){
	var requestUrl = '<c:url value='/' />' + '/clinic/operation/simpleFactor/' + "loadPatient/" + id;
	$.getJSON(requestUrl, function (data) {
		resetPatientInputFields();
		$('#patientId').val(data.id);
		$('#patientName').val(data.firstname);
		$('#patientLastName').val(data.lastname);
		$('#fathername').val(data.fathername);
		$('#fileNumber').val(data.filenumber);
		$('#oldFileNumber').val(data.oldFileNumber);
		$('#cellphone').val(data.cellphon);
		$('#phone').val(data.tel1);
		$('#age').val(data.age);
		fillBirthDateFromAge();
		$('#nationalCode').val(data.nationalCode);
		$('#sex').val(data.sex);
		$('#attachFileListBarSep').val(data.attachFileListBarSep);
		$('#address').val(data.address);
		$('#uniqueLongForFileUpload').val(data.uniqueLongForFileUpload);
		$('#sex_Comb').data('kendoComboBox').value(data.sex);
		$('#nameAndFam_Comb').data('kendoComboBox').value(data.id);
		if(data.insurance_type_1_id=='' ||data.insurance_type_1_id==undefined || data.insurance_type_1_id==null){
			$('#insurance_type_1_id_Comb').data('kendoComboBox').value(1);
			$('#insurance_type_1_id').val(1);
		}else{
			$('#insurance_type_1_id_Comb').data('kendoComboBox').value(data.insurance_type_1_id);
			$('#insurance_type_1_id').val(data.insurance_type_1_id);
		}
	});
}

function loadFinanceRegistration(factor_id,rowDatas){
//	var requestUrl = getBaseUrl() + "loadFinanceRegistration/" + id;
//	$.getJSON(requestUrl, function (data) {

//	}
	$.getJSON("<c:url value='/' />" + "clinic/operation/simpleFactor/loadFinanceRegistration/" + factor_id, function (data) {
		deleteRow('service-table',true);
		makeServiceTableReady();
		$("#insuranceBookletSerial").val(data[0].insuranceBookletSerial);
		$("#insuranceBookletType").val(data[0].insuranceBookletType);
		for (var i = 0; i < data.length; i++) {
			j=i+1;
			initOneServiceRowData(data[i],j);
			if( j!=data.length){
				makeServiceTableReady();
			}
		}
		if(rowDatas!=undefined){
			var newServiceTableLength= $("#service-table tr").length;
			for(var w=0;w<rowDatas.length;w++){
				makeServiceTableReady();
				initOneServiceRowData(rowDatas[w],newServiceTableLength+w);
			}
		}

	});
}

function initOneServiceRowData(rowData,rowNumber){
	var ppb = $("#service_id_"+rowNumber+"_Comb").data("kendoComboBox");
	ppb.dataSource.query({ logic: 'and', filters: [{ field: "id", operator: "equal", value: rowData.service_id }]});
	ppb.value(rowData.service_id);
	$("#financeRegistration_id_"+rowNumber).val(rowData.id);
	$("#service_id_"+rowNumber).val(rowData.service_id);

	$("#originalPrice_"+rowNumber).val(addCommaSeparator(rowData.originalPrice));
	$("#unit_"+rowNumber).val(rowData.quantity);
	$("#totalAmount_"+rowNumber).val(addCommaSeparator(rowData.serviceItemAmount));
	$("#totalDiscounts_"+rowNumber).val(addCommaSeparator(rowData.discountAmount));
	$("#isReleasable_"+rowNumber).val(rowData.isReleasable);
	$("#department_id_"+rowNumber).val(rowData.department_id);
	$("#serviceItemBasicAmount_"+rowNumber).val(rowData.serviceItemBasicAmount);
	$("#insurancePersent_"+rowNumber).val(rowData.insurancePersent);
	var discountAmount
	if(rowData.discountAmount.toString().indexOf(",")>-1){
		discountAmount=parseInt(rowData.discountAmount.replace(/\,/g, ''));
	}else{
		discountAmount=rowData.discountAmount;
	}

	var serviceItemAmount
	if(rowData.serviceItemAmount.toString().indexOf(",")>-1){
		serviceItemAmount=parseInt(rowData.serviceItemAmount.replace(/\,/g, ''));
	} else{
		serviceItemAmount=rowData.serviceItemAmount;
	}
	$("#payableAmount_"+rowNumber).text(addCommaSeparator(serviceItemAmount-discountAmount));

	$("#visitState_"+rowNumber).text(rowData.visitState);
	$("#doOperationState_"+rowNumber).val(rowData.doOperation);
	$("#cancelState_"+rowNumber).val(rowData.cancel);

	var dpb = $("#doctor_id_"+rowNumber+"_Comb").data("kendoComboBox");
	dpb.dataSource.query({ logic: 'and', filters: [{ field: "id", operator: "equal", value: rowData.doctor_id }]});
	dpb.value(rowData.doctor_id);
	$("#doctor_id_"+rowNumber).val(rowData.doctor_id);

	if(rowData.cancel==true || rowData.cancel=="true"){
		disableServiceRow(rowNumber);
	}
	$("#insuranceBookletPageNumber_" + rowNumber).val(rowData.insuranceBookletPageNumber);
	$("#prescriptionDate_" + rowNumber).val(rowData.prescriptionDate);
	$("#prescriptionValidityDate_" + rowNumber).val(rowData.prescriptionValidityDate);
	$("#serviceRequesterMedicalCouncilCode_" + rowNumber).val(rowData.serviceRequesterMedicalCouncilCode);

}

function disableServiceRow(rowNumber){
	$("#service_id_"+rowNumber+"_Comb").data("kendoComboBox").enable(false);;
	$("#originalPrice_"+rowNumber).prop("disabled",true);
	$("#unit_"+rowNumber).prop("disabled",true);
	$("#totalDiscounts_"+rowNumber).prop("disabled",true);
	$("#doctor_id_"+rowNumber+"_Comb").data("kendoComboBox").enable(false);;
}

function initArrayFromOneServiceRow(rowNumber){
	var dataItem = {};
	dataItem.service_id = $("#service_id_" + rowNumber).val();
	dataItem.serviceItemBasicAmount = $("#serviceItemBasicAmount_" + rowNumber).val();
	dataItem.insurancePersent = $("#insurancePersent_" + rowNumber).val();
	dataItem.originalPrice = $("#originalPrice_" + rowNumber).val();
	dataItem.quantity = $("#unit_" + rowNumber).val();
	dataItem.serviceItemAmount = $("#totalAmount_" + rowNumber).val();
	dataItem.discountAmount = $("#totalDiscounts_" + rowNumber).val();
	dataItem.visitState = $("#visitState_" + rowNumber).val();
	dataItem.doOperation = $("#doOperationState_" + rowNumber).val();
	dataItem.cancel = $("#cancelState_" + rowNumber).val();
	dataItem.doctor_id = $("#doctor_id_" + rowNumber).val();
	dataItem.id=$("#financeRegistration_id_" + rowNumber).val();
	dataItem.isReleasable=$("#isReleasable_" + rowNumber).val();
	dataItem.department_id=$("#department_id_" + rowNumber).val();
	dataItem.insuranceBookletPageNumber=$("#insuranceBookletPageNumber_" + rowNumber).val();
	dataItem.prescriptionDate=$("#prescriptionDate_" + rowNumber).val();
	dataItem.prescriptionValidityDate=$("#prescriptionValidityDate_" + rowNumber).val();
	dataItem.serviceRequesterMedicalCouncilCode=$("#serviceRequesterMedicalCouncilCode_" + rowNumber).val();

	return dataItem;
}

function confirmRemoveService(e) {
	removeService(e.data('contents'));
}

function removeService(imageId) {
	var patientId = document.getElementById("patientId").value;
	var rowNumber = imageId.split("_")[1];
	var financeRegistration_id=$("#financeRegistration_id_"+rowNumber).val();

	if(rowNumber == 1){
		if((financeRegistration_id==null ||financeRegistration_id==undefined ||financeRegistration_id=="") && $("#service-table tr").length==2) {
			deleteRow('service-table',true);
			makeServiceTableReady();
		}if(financeRegistration_id==null ||financeRegistration_id==undefined ||financeRegistration_id==""){
			reorderServiceAfterRemove(rowNumber);
		}else {
			removeServiceFromServer(patientId,financeRegistration_id,rowNumber);
		}


	}else{
		if($("#financeRegistration_id_"+rowNumber).val()!=""){
			removeServiceFromServer(patientId,financeRegistration_id,rowNumber)
		}else{
//			$("#deleteService_" + rowNumber).parent().parent().remove();
			reorderServiceAfterRemove(rowNumber);
		}
	}



}

function removeServiceFromServer(patientId,financeRegistration_id,deletedRowNumber){
	$.getJSON("<c:url value='/' />" + "clinic/operation/simpleFactor/removeService/" + patientId + "/" + financeRegistration_id, function (result) {
		if (result.state == "error") {
			for (var i = 0; i < result.errors.length; i++) {
				if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
					alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
				} else {
					alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
				}
			}
		} else {
			alertify.success(result.message);
			var serviceTableLength= $("#service-table tr").length;
			var rowDatas=[];
			var j=-1;
			for(var i=parseInt(deletedRowNumber)+1;i<serviceTableLength;i++ ){
				var financeRegistration_id=$("#financeRegistration_id_"+i).val();
				if(financeRegistration_id==null ||financeRegistration_id==undefined ||financeRegistration_id==""){
					var dataItem=initArrayFromOneServiceRow(i);
					j++;
					rowDatas[j]=dataItem;
				}
			}
			deleteRow('service-table',true);
			makeServiceTableReady();
			loadFinanceRegistration($("#factorId").val(),rowDatas);
			drawPosTable();
			loadPaymentable();
		}
	});
}


function sendToVisitService(imageId) {
	var patientId = document.getElementById("patientId").value;
	var rowNumber = imageId.split("_")[1];
	var financeRegistration_id=$("#financeRegistration_id_"+rowNumber).val();
	if(financeRegistration_id==undefined||financeRegistration_id==''){
		alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("clinic.operation.simpleFactor.error.notSavedService") %>');
		return;
	}

	jQuery.ajax({
		url: '<c:url value='/' />' + '/clinic/operation/simpleFactor/' + "sendToVisit",
		type: "POST",
		data: JSON.stringify(financeRegistration_id),
		dataType: "json",
		contentType: "application/json; charset=utf-8",
		success: function (result) {
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
				$("#visitState_" + rowNumber).html(result.visitState);

//                $("#grid").data("kendoGrid").dataSource.read();
			}
		},
		error: function (result) {
			if (result.status == 401) {
				window.location.href = "";
			}
		}
	});
}



function resetPatientInputFields(){
	$('#patientId').val("");
	$('#patientName').val("");
	$('#patientLastName').val("");
	$('#fathername').val("");
	$('#fileNumber').val("");
	$('#cellphone').val("");
    $('#phone').val("");
    $('#age').val("");
    fillBirthDateFromAge();
    $('#nationalCode').val("");
    $('#sex_Comb').data('kendoComboBox').value("");
	$('#attachFileListBarSep').val("");
	$('#address').val("");
}

$("#showHistoryBtn").click(function(){
//	if(!($("#nameAndFam_Comb").data("kendoComboBox").value()>0)){
	if(!($('#patientId').val()>-1)){
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
				url:"<c:url value='/' />" + "clinic/operation/simpleFactor/saveNursingData",
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


$("#modals-insuranceDataPopup").dialog({
	modal : true,
	autoOpen: false,
	width: 800,
	buttons:{
		"<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.save") %>":function () {
			var dialog = $(this);
			var rowNumber=$("#rowNumberId").val();
			$("#insuranceBookletPageNumber_"+rowNumber).val($("#insuranceBookletPageNumber").val());
			$("#prescriptionDate_"+rowNumber).val($("#prescriptionDate").val());
			$("#prescriptionValidityDate_"+rowNumber).val($("#prescriptionValidityDate").val());
			$("#serviceRequesterMedicalCouncilCode_"+rowNumber).val($("#serviceRequesterMedicalCouncilCode").val());

			/*var data = {};
			data.factorId = $("#modalItemFactorId").val();;
			data.weight = $("#weight").val();
			data.bloodPressure = $("#bloodPressure").val();
			//
			jQuery.ajax({
				url:"<c:url value='/' />" + "clinic/operation/simpleFactor/saveNursingData",
				type:"POST",
				data:JSON.stringify(data),
				dataType:"json",
				contentType:"application/json; charset=utf-8",
				success:function (result) {
					if (result.state == "error") {
						alertify.error(result.message);
					}
					if (result.state == "success") {
						alertify.success(result.message);*/
						dialog.dialog("close");
					/*}
				},
				error:function(result){
					console.log('Error');
				}
			});*/
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
				image.id='img-undoRelease-department-item-' + i + '-' + data[i].id;
				image.onclick = function () {
					var factorDepartmentId = this.id.split('-');
					undoReleaseFactorDepartment(factorDepartmentId[5], this);
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

function undoReleaseFactorDepartment(factorDepartmentId, thisVar){
	jQuery.ajax ({
		url: basePath + "undoReleaseDepartment",
		type: "POST",
		data: JSON.stringify({factorDepartmentId: factorDepartmentId}),
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

function grid_deleteFactor(e){
	var data = this.dataItem($(e.target).closest("tr"));
	initRemoveDepartmentDialog(data.id);    
}

function grid_editFactor(e){
	var data = this.dataItem($(e.target).closest("tr"));
	$("#factorId").val(data.id);
	loadPatient(data.patient_id);
	loadFinanceRegistration(data.id);
	loadPaymentable();
	drawPosTable();
	if(data.release && data.type==1){
		isReleasedInPage=true;
		$("#clinic-fnc-save").prop("disabled", true);
		$("#clinic-fnc-posSave").prop("disabled", true);
	}else{
		isReleasedInPage=false;
		$("#clinic-fnc-save").prop("disabled", false);
		$("#clinic-fnc-posSave").prop("disabled", false);
	}
	existFileArray=[];
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
  
function deleteRow(tableID,notDeleteFirstRow) {
    try {
        var table = document.getElementById(tableID);
        var rowCount = table.rows.length;
        for (var i = 0; i < rowCount; i++) {
			if(i==0 && notDeleteFirstRow!=undefined & notDeleteFirstRow){
				continue;
			}
            var row = table.rows[i];
                table.deleteRow(i);
                rowCount--;
                i--;
            };
    } catch (e) {
        alert(e);
    };
}

function do_before_patientrComplexPopup_popup_button(){
	var ppb = $("#nameAndFam_Comb").data("kendoComboBox");
	ppb.dataSource.filter([]);
	ppb.dataSource.read();
	ppb.value("");
}

function selectRowEventCallBack(e){
	resetPatientInputFields();
	$('#patientId').val(e[0].id);
	$('#patientName').val(e[0].firstname);
	$('#patientLastName').val(e[0].lastname);
	$('#fathername').val(e[0].fathername);
	$('#fileNumber').val(e[0].filenumber);
	$('#oldFileNumber').val(e[0].oldFileNumber);
	$('#cellphone').val(e[0].cellphon);
    $('#phone').val(e[0].tel1);
    $('#age').val(e[0].age);
    fillBirthDateFromAge();
    $('#nationalCode').val(e[0].nationalCode);
    $('#sex').val(e[0].sex);
    $('#attachFileListBarSep').val(e[0].attachFileListBarSep);
    $('#address').val(e[0].address);
    $('#sex_Comb').data('kendoComboBox').value(e[0].sex);
    ///
	var ppb = $("#nameAndFam_Comb").data("kendoComboBox");
	ppb.dataSource.filter({ logic: 'and', filters: [{ field: "id", operator: "equal", value: e[0].id }]});
	ppb.value(e[0].id);
	$("#nameAndFam").val(e[0].id);
	if(e[0].insurance_type_1_id=='' ||e[0].insurance_type_1_id==undefined || e[0].insurance_type_1_id==null){
		$('#insurance_type_1_id_Comb').data('kendoComboBox').value(1);
		$('#insurance_type_1_id').val(1);
	}else{
		$('#insurance_type_1_id_Comb').data('kendoComboBox').value(e[0].insurance_type_1_id);
		$('#insurance_type_1_id').val(e[0].insurance_type_1_id);
	}
    ///
    modal.hide();
    ///
//    setTimeout(function(){
//    	var ppb = $("#nameAndFam_Comb").data("kendoComboBox");
//    	ppb.dataSource.filter([]);
//    }, 2000);
}

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
	if(data.patientId!=null){
		var ppb = $("#nameAndFam_Comb").data("kendoComboBox");
		ppb.dataSource.filter({ logic: 'and', filters: [{ field: "id", operator: "equal", value: data.patientId }]});
		ppb.value(data.patientId);
		$("#nameAndFam").val(data.patientId);
		loadPatient(data.patientId)
	}else{
		resetPatientInputFields();
		$('#fileNumber').val(fileNumber);
		$("#nameAndFam").val("");
		$('#cellphone').val(data.cellPhone);
		$('#phone').val(data.phone);
	}

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
	tr1.appendChild(td11);
	tbdyWeek.appendChild(tr1);
	//
	var tr2 = document.createElement("tr");
	var td21 = document.createElement("td");
	td21.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.visitTime")%>'+" : "+visitTime));
	tr2.appendChild(td21);
	tbdyWeek.appendChild(tr2);
	//
	var tr3 = document.createElement("tr");
	var td31 = document.createElement("td");
	td31.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.visitReason")%>'+" : "+actionListNames));
	tr3.appendChild(td31);
	tbdyWeek.appendChild(tr3);
	//
	var tr4 = document.createElement("tr");
	var td41 = document.createElement("td");
	td41.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.doctorName")%>'+" : "+doctorName));
	tr4.appendChild(td41);
	tbdyWeek.appendChild(tr4);
	
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
    d3.setAttribute('style', 'padding: 8px; padding-right: 20px;');
    d3.appendChild(tbl);
    d3.appendChild(d5);
    var d1 = document.createElement("div");
    d1.id="app-card";
    d1.setAttribute('style', 'width: 95%; margin-top: 5px;');
    d1.className="p-kanban-card";
    d1.appendChild(d3);
    d1.onclick = function (event) {
        event.stopPropagation();
    };

    document.getElementById('appName').appendChild(d1);
}

function selectAppointmentReportRowEventCallBack(e){
    $("#h_appointmentId").val(e[0].id);
    $("#h_appointmentTdTime").val(e[0].timeStr);
	$("#h_appointmentNameAndFam").val(e[0].nameAndFam);
	$("#h_appointmentPatientId").val(e[0].patientId);
	$("#h_appointmentDepartmentId").val(e[0].departmentId);
	$("#h_appointmentDoctorName").val(e[0].doctorName);
	$("#h_appointmentActionListNames").val(e[0].actionListNames);
    $("#department_id").val(e[0].departmentId);
	if(e[0].patientId!=null){
		var ppb = $("#nameAndFam_Comb").data("kendoComboBox");
		ppb.dataSource.filter({ logic: 'and', filters: [{ field: "id", operator: "equal", value: e[0].patientId }]});
		ppb.value(e[0].patientId);
		$("#nameAndFam").val(e[0].patientId);
		loadPatient(e[0].patientId)
	}else{
		resetPatientInputFields();
		$('#fileNumber').val(fileNumber);
		$("#nameAndFam").val("");
		$('#cellphone').val(e[0].cellPhone);
		$('#phone').val(e[0].phone);
	}

	makeCard(e[0].id,e[0].nameAndFam,e[0].doctorName+" "+e[0].fileNumber,e[0].timeStr,e[0].actionListNames);
    modal.hide();
}

makeServiceTableReady();
function makeServiceTableReady(){
	var flag = false;
	for(var i=1; i <= $("#service-table tr").length-1; i++){
		if($("#service_id_" + i).val() == ""){
			flag = true;
		}
	}
	if(flag){
		alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("clinic.operation.simpleFactor.error.plzCompleteAllRow")%>");
		return;
	}
	//
	var newtr = document.createElement('tr');
	var rowNumber = $("#service-table tr").length;
	//
	var tdRowNumber = document.createElement('td');
	tdRowNumber.align = "center";
	tdRowNumber.style.color = "red";

	var financeRegistrationId = document.createElement('input');
	financeRegistrationId.type = "hidden";
	financeRegistrationId.id = "financeRegistration_id_" + rowNumber;
	tdRowNumber.appendChild(financeRegistrationId);
	newtr.appendChild(tdRowNumber);

	var isReleasable = document.createElement('input');
	isReleasable.type = "hidden";
	isReleasable.id = "isReleasable_" + rowNumber;
	tdRowNumber.appendChild(isReleasable);
	newtr.appendChild(tdRowNumber);

	var department_id = document.createElement('input');
	department_id.type = "hidden";
	department_id.id = "department_id_" + rowNumber;
	tdRowNumber.appendChild(department_id);
	newtr.appendChild(tdRowNumber);

	var doOperationState = document.createElement('input');
	doOperationState.type = "hidden";
	doOperationState.id = "doOperationState_" + rowNumber;

	var cancelState = document.createElement('input');
	cancelState.type = "hidden";
	cancelState.id = "cancelState_" + rowNumber;

	var insuranceBookletPageNumber = document.createElement('input');
	insuranceBookletPageNumber.type = "hidden";
	insuranceBookletPageNumber.id = "insuranceBookletPageNumber_" + rowNumber;

	var prescriptionDate = document.createElement('input');
	prescriptionDate.type = "hidden";
	prescriptionDate.id = "prescriptionDate_" + rowNumber;

	var prescriptionValidityDate = document.createElement('input');
	prescriptionValidityDate.type = "hidden";
	prescriptionValidityDate.id = "prescriptionValidityDate_" + rowNumber;

	var serviceRequesterMedicalCouncilCode = document.createElement('input');
	serviceRequesterMedicalCouncilCode.type = "hidden";
	serviceRequesterMedicalCouncilCode.id = "serviceRequesterMedicalCouncilCode_" + rowNumber;

	var serviceItemBasicAmount = document.createElement('input');
	serviceItemBasicAmount.type = "hidden";
	serviceItemBasicAmount.id = "serviceItemBasicAmount_" + rowNumber;

	var insurancePersent = document.createElement('input');
	insurancePersent.type = "hidden";
	insurancePersent.id = "insurancePersent_" + rowNumber;

	tdRowNumber.appendChild(document.createTextNode(rowNumber));
	tdRowNumber.appendChild(doOperationState);
	tdRowNumber.appendChild(cancelState);
	tdRowNumber.appendChild(insuranceBookletPageNumber);
	tdRowNumber.appendChild(prescriptionDate);
	tdRowNumber.appendChild(prescriptionValidityDate);
	tdRowNumber.appendChild(serviceRequesterMedicalCouncilCode);
	tdRowNumber.appendChild(serviceItemBasicAmount);
	tdRowNumber.appendChild(insurancePersent);

	newtr.appendChild(tdRowNumber);
	//
	var tdService = document.createElement('td');
	var serviceCombo = '<div class="uk-width-4-10 k-rtl" id="service_id_'+rowNumber+'_Div"> \
						    <span class="k-widget k-combobox k-header uk-width-1-1" style="height: 100%;"><span tabindex="-1" unselectable="on" class="k-dropdown-wrap \
						    	k-state-default"><input name="service_id_'+rowNumber+'_Comb_input" class="k-input uk-width-1-1" type="text" autocomplete="off" \
						    	role="combobox" aria-expanded="false" placeholder="<%=ResourceBoundleHolder.resourceBundle.getString("system.combo.pleaseSelect")%>" \
						    	tabindex="0" aria-disabled="false" aria-readonly="false" aria-autocomplete="list" aria-owns="service_id_'+rowNumber+'_Comb_listbox" \
						    	aria-busy="false" style="height: 100%; width: 100%;"><span tabindex="-1" unselectable="on" class="k-select"><span unselectable="on" \
						    	class="k-icon k-i-arrow-s" role="button" tabindex="-1" aria-controls="service_id_'+rowNumber+'_Comb_listbox">select</span></span></span> \
						    	<input id="service_id_'+rowNumber+'_Comb" name="service_id_'+rowNumber+'_Comb" placeholder="Select type..." class="uk-width-1-1" \
						    	style="height: 100%; display: none;" data-ignore="true" data-role="combobox" aria-disabled="false" aria-readonly="false"></span> \
						    <input type="hidden" id="service_id_'+rowNumber+'" name="service_id_'+rowNumber+'" class="uk-width-1-1" data-ignore=""> \
						    <input type="hidden" id="" name="" class="uk-width-1-1" data-ignore="true"> \
						</div>';
	tdService.innerHTML = serviceCombo;
	newtr.appendChild(tdService);
	//
	var tdOriginalPrice = document.createElement('td');
	var inputOriginalPrice = document.createElement('input');
	inputOriginalPrice.type = "text";
	inputOriginalPrice.id = "originalPrice_" + rowNumber;
	inputOriginalPrice.className = "serviceTableInputField_"+rowNumber;
	tdOriginalPrice.appendChild(inputOriginalPrice);
	newtr.appendChild(tdOriginalPrice);
	//
	var tdUnit = document.createElement('td');
	var inputUnit = document.createElement('input');
	inputUnit.id = "unit_" + rowNumber;
	inputUnit.type = "text";
	inputUnit.setAttribute('style', 'text-align: center;');
	inputUnit.className = "serviceTableInputField_"+rowNumber;
	tdUnit.appendChild(inputUnit);
	newtr.appendChild(tdUnit);
	//
	var tdTotalAmount = document.createElement('td');
	var inputTotalAmount = document.createElement('input');
	inputTotalAmount.type = "text";
	inputTotalAmount.id = "totalAmount_" + rowNumber;
	inputTotalAmount.className = "serviceTableInputField_"+rowNumber;
	inputTotalAmount.setAttribute("disabled", true);;

	tdTotalAmount.appendChild(inputTotalAmount);
	newtr.appendChild(tdTotalAmount);
	//
	var tdTotalDiscounts = document.createElement('td');
	var inputTotalDiscounts = document.createElement('input');
	inputTotalDiscounts.type = "text";
	inputTotalDiscounts.id = "totalDiscounts_" + rowNumber;
	inputTotalDiscounts.className = "serviceTableInputField_"+rowNumber;
	tdTotalDiscounts.appendChild(inputTotalDiscounts);
	newtr.appendChild(tdTotalDiscounts);
	//
	var tdPayableAmount = document.createElement('td');
	var divPayableAmount = document.createElement('div');
	divPayableAmount.id = "payableAmount_" + rowNumber;
	divPayableAmount.align = "center";
	divPayableAmount.setAttribute('style', 'color: #FFEB3B; background-color: #00a5e2; border-style: solid; border-color: #00a5e2;');
	divPayableAmount.innerHTML = 0;
	tdPayableAmount.appendChild(divPayableAmount);
	newtr.appendChild(tdPayableAmount);
	//
	var tdDoctor = document.createElement('td');
	var doctorCombo = '<div class="uk-width-4-10 k-rtl" id="doctor_id_'+rowNumber+'_Div"> \
						    <span class="k-widget k-combobox k-header uk-width-1-1" style="height: 100%;"><span tabindex="-1" unselectable="on" class="k-dropdown-wrap \
						    	k-state-default"><input name="doctor_id_'+rowNumber+'_Comb_input" class="k-input uk-width-1-1" type="text" autocomplete="off" \
						    	role="combobox" aria-expanded="false" placeholder="<%=ResourceBoundleHolder.resourceBundle.getString("system.combo.pleaseSelect")%>" \
						    	tabindex="0" aria-disabled="false" aria-readonly="false" aria-autocomplete="list" aria-owns="doctor_id_'+rowNumber+'_Comb_listbox" \
						    	aria-busy="false" style="height: 100%; width: 100%;"><span tabindex="-1" unselectable="on" class="k-select"><span unselectable="on" \
						    	class="k-icon k-i-arrow-s" role="button" tabindex="-1" aria-controls="doctor_id_'+rowNumber+'_Comb_listbox">select</span></span></span> \
						    	<input id="doctor_id_'+rowNumber+'_Comb" name="doctor_id_'+rowNumber+'_Comb" placeholder="Select type..." class="uk-width-1-1" \
						    	style="height: 100%; display: none;" data-ignore="true" data-role="combobox" aria-disabled="false" aria-readonly="false"></span> \
						    <input type="hidden" id="doctor_id_'+rowNumber+'" name="doctor_id_'+rowNumber+'" class="uk-width-1-1" data-ignore=""> \
						    <input type="hidden" id="" name="" class="uk-width-1-1" data-ignore="true"> \
						</div>';
	tdDoctor.innerHTML = doctorCombo;
	newtr.appendChild(tdDoctor);
	//
	var tdVisitState = document.createElement('td');
	tdVisitState.align = "center";
	tdVisitState.id = "visitState_"+rowNumber;
	tdVisitState.appendChild(document.createTextNode(''));
	newtr.appendChild(tdVisitState);
	//
	var tdOperation = document.createElement('td');
	tdOperation.align = "center";
	tdOperation.setAttribute('style', 'width: 10%');
	var insurnaceImg = document.createElement('img');
	insurnaceImg.id = "" + rowNumber;
	insurnaceImg.title = '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.remove") %>';
	insurnaceImg.src = "<c:url value='/resources/images/surgeon-icon-32.png' />";
	insurnaceImg.setAttribute('style', 'cursor: pointer;');
	insurnaceImg.onclick = function() {
		var rowNumber=this.id;
		$("#rowNumberId").val(rowNumber);
		$("#insuranceBookletPageNumber").val($("#insuranceBookletPageNumber_"+rowNumber).val());
		$("#prescriptionDate").val($("#prescriptionDate_"+rowNumber).val());
		$("#prescriptionValidityDate").val($("#prescriptionValidityDate_"+rowNumber).val());
		$("#serviceRequesterMedicalCouncilCode").val($("#serviceRequesterMedicalCouncilCode_"+rowNumber).val());


		$("#modals-insuranceDataPopup").dialog('open');
//		if($("#cancelState_"+rowNumber).val()=="true"){
//			return;
//		}
//		var doOperation = $("#doOperationState_"+rowNumber);
//		var cancel = $("#cancelState_"+rowNumber);
//		if (doOperation == "true") {
//			$("#dialogRemoveVisit").dialog("open");
//			return
//		}else if(cancel=="true"){
//			$("#dialogRemoveCancel").dialog("open");
//			return
//		}
//		$("#dialogconfirmRemoveService").data('contents', this.id).dialog("open");

    }
	tdOperation.appendChild(insurnaceImg);

	var sendToVisitImage = document.createElement('img');
	sendToVisitImage.id = "sendToVisitService_" + rowNumber;
	sendToVisitImage.title = '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.sendToVisit") %>';
	sendToVisitImage.src = "<c:url value='/resources/images/doctor-icon.png' />";
	sendToVisitImage.setAttribute('style', 'cursor: pointer;');
	sendToVisitImage.onclick = function() {
		sendToVisitService(this.id);

	};
	tdOperation.appendChild(sendToVisitImage);

	var delImg = document.createElement('img');
	delImg.id = "deleteService_" + rowNumber;
	delImg.title = '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.remove") %>';
	delImg.src = "<c:url value='/resources/images/delete/Actions-edit-delete-icon7.png' />";
	delImg.setAttribute('style', 'cursor: pointer;');
	delImg.onclick = function() {
		if($("#cancelState_"+rowNumber).val()=="true"){
			return;
		}
		var doOperation = $("#doOperationState_"+rowNumber);
		var cancel = $("#cancelState_"+rowNumber);
		if (doOperation == "true") {
			$("#dialogRemoveVisit").dialog("open");
			return
		}else if(cancel=="true"){
			$("#dialogRemoveCancel").dialog("open");
			return
		}
		$("#dialogconfirmRemoveService").data('contents', this.id).dialog("open");

    };
	tdOperation.appendChild(delImg);
	newtr.appendChild(tdOperation);
	//
	var serviceTable = document.getElementById("service-table");
	serviceTable.appendChild(newtr);
	//
	serviceComboInitializing(rowNumber);
	doctorComboInitializing(rowNumber);
	serviceTableInputFieldInitializing(rowNumber);
}

function reorderServiceAfterRemove(deletedRowNumber){

	var rowDatas=[];
	var j=-1;
	var serviceTableLength= $("#service-table tr").length;
	if(parseInt(deletedRowNumber)+1==serviceTableLength){
		$("#deleteService_" + deletedRowNumber).parent().parent().remove();
		return;
	}
	for(var i=parseInt(deletedRowNumber)+1;i<serviceTableLength;i++ ){
		var dataItem=initArrayFromOneServiceRow(i);
		j++;
		rowDatas[j]=dataItem;
		$("#deleteService_" + i).parent().parent().remove();
	}

	for(var w=0;w<rowDatas.length;w++){
		initOneServiceRowData(rowDatas[w],parseInt(deletedRowNumber)+w);
	}

}

function serviceTableInputFieldInitializing(rowNumber){
//	$(".serviceTableInputField").keypress(function(){
//		return onlyNos(event,this);
//	});
	$(".serviceTableInputField_"+rowNumber).keyup(function(){
		myAddCommas(event,this,rowNumber);
	});
}
function serviceComboInitializing(rowNumber){
	var serviceNVal = $("#service_id_"+rowNumber);

    serviceNVal.data("value", serviceNVal.val());

    setInterval(function() {
        var data = serviceNVal.data("value"),
                val = serviceNVal.val();

        if (data !== val) {
            serviceNVal.data("value", val);
            if(val==""){
                $("#service_id_"+rowNumber+"_Comb").data("kendoComboBox").text('');
            }
        }
    }, 100);

    window["openCalled_service_id_"+rowNumber] = false;
    var baseUrl = basePath;
	var dataSource_service_id = new kendo.data.DataSource({
		serverFiltering: true,
		transport: {
			parameterMap: function (options) {
				if(options.filter!=undefined){
					options.filter.filters[0].field=$("#insurance_type_1_id").val();
				}
				return JSON.stringify(options);
			},
			read: {
				contentType: "application/json",
				type: "POST",
				async: true,
				url: baseUrl + "/combo/loadAllService/",
				dataType: "json",
			}
		}
	});

    dataSource_service_id.bind("error",dataSource_error);
    function dataSource_error(e) {
        errorRequestAjax(e);
    }
    var nameScript = "service_id_"+rowNumber;

    $("#service_id_"+rowNumber+"_Comb").kendoComboBox({
        placeholder:"<%=ResourceBoundleHolder.resourceBundle.getString("system.combo.pleaseSelect")%>",
        dataTextField:"ComboCaption",
        dataValueField:"ComboID",
        filter:"contains",
        autoBind:"true",
        minLength:"1",
        dataSource: dataSource_service_id,
        open:function (e) {
            if (("" != 'true' && !eval("openCalled_service_id_"+rowNumber))
                    ||(window.location.href.indexOf("/create")>-1)) {
                //eval("openCalled_service_id_"+rowNumber=true);
                var combobox = $("#service_id_"+rowNumber+"_Comb").data("kendoComboBox");
                combobox.setDataSource(eval(dataSource_service_id));
                combobox.dataSource.query();
                combobox.refresh();
            }
        },
        select:function (e) {
            var item = e.item;
            var dataItem = this.dataItem(e.item.index());
            $("#service_id_"+rowNumber).val(dataItem.ComboID);
        },
        change:function (e) {
            if ($("#service_id_"+rowNumber+"_Comb").val().length == 0) {
                $("#service_id_"+rowNumber).val("");
            }else{
		        $.getJSON("<c:url value='/' />" + "clinic/operation/simpleFactor/getServiceData/" + $("#service_id_"+rowNumber).val()+'/'+
						$("#insurance_type_1_id").val(), function (data) {
					console.log(data);
		            var cost = 0;
//		            for (i = 0; i < data.length; i++) {
						if(data[0].insurancePersent!=0){
							cost = data[0].insuranceCost;
						}else{
							cost = data[0].serviceitem_cost;
						}

//		            }
		            $("#originalPrice_"+rowNumber).val(addCommaSeparator(cost));
		            $("#unit_"+rowNumber).val(data[0].serviceitem_quantity);
		            $("#totalAmount_"+rowNumber).val(addCommaSeparator(Math.round(data[0].serviceitem_quantity*cost)));
		            $("#totalDiscounts_"+rowNumber).val(0);
		            $("#payableAmount_"+rowNumber).text(addCommaSeparator(Math.round(data[0].serviceitem_quantity*cost)));
					$("#isReleasable_"+rowNumber).val(data[0].isReleasable);
					$("#department_id_"+rowNumber).val(data[0].department_id);
					$("#serviceItemBasicAmount_"+rowNumber).val(data[0].serviceitem_cost);
					$("#insurancePersent_"+rowNumber).val(data[0].insurancePersent);
					if($("#doctor_id_"+rowNumber+"_Comb").data("kendoComboBox").dataSource._data.length==1){
                        $("#doctor_id_"+rowNumber+"_Comb").data("kendoComboBox").select(0);
                        $("#doctor_id_"+rowNumber).val($("#doctor_id_"+rowNumber+"_Comb").data("kendoComboBox").dataSource._data[0].ComboID);
                    }
		        });
            }
        },
        close:function(e){
            $("#service_id_"+rowNumber).val(e.sender._old);
        },
        dataBound:function(e){
        }
    });
    var combobox = $("#service_id_"+rowNumber+"_Comb").data("kendoComboBox");

  /*   combobox.input.bind("keydown", function (e) {
        if (e.keyCode == 40) {
            combobox.open();
        }
    }); */

    window["called_service_id_"+rowNumber] = false;

    window["bindToEntityById_after_service_id_"+rowNumber+"_Comb"] = function () {
        if ($("#service_id_"+rowNumber).val() == "") {
            var combobox = $("#service_id_"+rowNumber+"_Comb").data("kendoComboBox");
            combobox.setDataSource(dataSource_service_id);
            combobox.refresh();
        } else {
                /*var combobox = $("#service_id_"+rowNumber+"_Comb").data("kendoComboBox");
                var a2 = $("#service_id_"+rowNumber).val();
                var a = $("#${value}").val();
                if(a==undefined && a2==undefined){
                    return;
                }
                combobox.dataSource.data([
                    {ComboCaption:a, ComboID:a2}
                ]);
                combobox.dataSource.query();
                combobox.select(combobox.ul.children().eq(0));*/
        }
    }
}

function imgAddServiceTableRowOnMouseOver(img){
	img.src = "<c:url value='/resources/images/blue/button-add-mouseOver.png'/>";
}

function imgAddServiceTableRowOnMouseDown(img){
	img.src = "<c:url value='/resources/images/blue/button-add-mouseClick.png'/>";
}

function imgAddServiceTableRowOnMouseOut(img){
	img.src = "<c:url value='/resources/images/blue/button-add.png'/>";	
}

function doctorComboInitializing(rowNumber){
	var doctorNVal = $("#doctor_id_"+rowNumber);

    doctorNVal.data("value", doctorNVal.val());

//    setInterval(function() {
//        var data = doctorNVal.data("value"),
//                val = doctorNVal.val();
//
//        if (data !== val) {
//            doctorNVal.data("value", val);
//            if(val==""){
//                $("#doctor_id_"+rowNumber+"_Comb").data("kendoComboBox").text('');
//            }
//        }
//    }, 100);

    window["openCalled_doctor_id_"+rowNumber] = false;
    var baseUrl = basePath;
    eval("var dataSource_doctor_id" + " = new kendo.data.DataSource({" +
            "serverFiltering: true," +
            "transport: {" +
            "parameterMap: function (options) {" +
            "              return JSON.stringify(options);" +
            "          }," +
            "read: {" +
            "contentType: \"application/json\"," +
            "type: \"POST\"," +
            "async : false," +
            "url: baseUrl+" + "\"/combo/loadDoctorByService\"," +
            "dataType:" + "\"json\" " +
            "}" +
            "}" +
            "});");

    dataSource_doctor_id.bind("error",dataSource_error);
    function dataSource_error(e) {
        errorRequestAjax(e);
    }
    var nameScript = "doctor_id_"+rowNumber;

    $("#doctor_id_"+rowNumber+"_Comb").kendoComboBox({
        placeholder:"<%=ResourceBoundleHolder.resourceBundle.getString("system.combo.pleaseSelect")%>",
        cascadeFrom: "service_id_"+rowNumber+"_Comb",
        dataTextField:"ComboCaption",
        dataValueField:"ComboID",
        filter:"contains",
        autoBind:"false",
        minLength:"1",
        dataSource: dataSource_doctor_id,
        open:function (e) {
           	if (!eval("openCalled_doctor_id_"+rowNumber)) {
                //eval("openCalled_doctor_id_"+rowNumber=true);
                var combobox = $("#doctor_id_"+rowNumber+"_Comb").data("kendoComboBox");
                combobox.setDataSource(eval(dataSource_doctor_id));
                combobox.dataSource.query();
                combobox.refresh();
            }
        },
        select:function (e) {
            var item = e.item;
            var dataItem = this.dataItem(e.item.index());
            $("#doctor_id_"+rowNumber).val(dataItem.ComboID);
        },
        change:function (e) {
            if ($("#doctor_id_"+rowNumber+"_Comb").val().length == 0) {
                $("#doctor_id_"+rowNumber).val("");
            }else{
            }
        },
        close:function(e){
            $("#doctor_id_"+rowNumber).val(e.sender._old);
        },
        cascade:function(e){
			console.log('cascade called');
           // if(e.sender._selectedValue==""){
            //	$("#doctor_id_"+rowNumber).val("");
            //}
        },
        dataBound:function(e){
        	if(e.sender.dataSource._data.length == 1){
				console.log('select doctor')
        		$("#doctor_id_"+rowNumber+"_Comb").data("kendoComboBox").select(0);
        		/*setInterval(function() {
        			combobox.select(0);
        			$("#doctor_id_" + rowNumber).val(combobox.dataSource._data[0].ComboID);
        	    }, 800);*/
        	}
        }
    });


  /*   combobox.input.bind("keydown", function (e) {
        if (e.keyCode == 40) {
            combobox.open();
        }
    }); */

    window["called_doctor_id_"+rowNumber] = false;

    window["bindToEntityById_after_doctor_id_"+rowNumber+"_Comb"] = function () {
        if ($("#doctor_id_"+rowNumber).val() == "") {
            var combobox = $("#doctor_id_"+rowNumber+"_Comb").data("kendoComboBox");
            combobox.setDataSource(dataSource_doctor_id);
            combobox.refresh();
        } else {
                /*var combobox = $("#doctor_id_"+rowNumber+"_Comb").data("kendoComboBox");
                var a2 = $("#doctor_id_"+rowNumber).val();
                var a = $("#${value}").val();
                if(a==undefined && a2==undefined){
                    return;
                }
                combobox.dataSource.data([
                    {ComboCaption:a, ComboID:a2}
                ]);
                combobox.dataSource.query();
                combobox.select(combobox.ul.children().eq(0));*/
        }
    }
}

function onlyNos(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if (charCode!=46 && charCode > 31 && (charCode < 48 || charCode > 57 )) {
            return false;
        }
        return true;
    }
    catch (err) {
        alert(err.Description);
    }
}

function myAddCommas(event,data,rowNumber){
//	if(!(event.keyCode==110 || event.keyCode==190 || event.keyCode==8 || (event.keyCode>=46 && event.keyCode<=57)||(event.keyCode>=96 && event.keyCode<=105))){
//		return;
//	}
	/*if ((data.value).length == 0 || isNaN(data.value)) {
		data.value = 0;
	}*/
	var value = data.value.replace(/,/g, '');
	if (!isNumberKey(event)) {
		var str = (value).toUpperCase();
		value = str.replace(String.fromCharCode(event.keyCode), "");
	}
	if ((value).length == 0 || isNaN(value)) {
		value = 0;
	}
	if(data.id.indexOf("totalDiscount")>-1){
		if(parseFloat(data.value.replace(/,/g, ''))>parseFloat($("#totalAmount_"+rowNumber).val().replace(/,/g, ''))){
			value=data.value.replace(/,/g, '').substring(0,data.value.replace(/,/g, '').length-1);
		}
	}


//	document.getElementById(data.id.replace('_txt','')).value = value;
	if(data.id.indexOf("unit")>-1){
		var hasDotLastOfString = false;
		if ((value+"").indexOf('.') + 1 == (value+"").length) {
			hasDotLastOfString = true;
		}
		value = parseFloat(value);
		if (hasDotLastOfString) {
			value = value + '.';
		}
		document.getElementById(data.id.replace('_txt','')).value=addCommaSeparator(value);
//		$("#totalDiscounts_" + rowNumber).text(0);
		$("#totalDiscounts_" + rowNumber).val(0);
	}else{
		value=parseFloat(value);
		document.getElementById(data.id.replace('_txt','')).value=addCommaSeparator(Math.round(value));
	}
	//
	calcPriceFields(rowNumber);
}

function addCommaSeparator(nStr){
	nStr += '';
	x = nStr.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1)) {
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2; 
}

function calcPriceFields(rowNumber){
	var originalPrice = $("#originalPrice_" + rowNumber).val().replace(/\,/g, '');
	var unit = $("#unit_" + rowNumber).val().replace(/\,/g, '');
	$("#totalAmount_" + rowNumber).val(addCommaSeparator(Math.round(originalPrice * unit)));
	//
	var totalAmount = $("#totalAmount_" + rowNumber).val().replace(/\,/g, '');
	var totalDiscounts = $("#totalDiscounts_" + rowNumber).val().replace(/\,/g, '');
	$("#payableAmount_" + rowNumber).text(addCommaSeparator(Math.round(totalAmount - totalDiscounts)));
}

function isNumberKey(evt) {
	var charCode = (evt.which) ? evt.which : event.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 190)
		return false;
	return true;
}

$("#newPageBtn").click(function(){
	window.location = '<c:url value='/' />' + '/clinic/operation/simpleFactor/';
});

$("#clinic-fnc-save").click(function () {
	$("#clinic-fnc-save").prop("disabled", true);
	if(validating()){
		disablePatientInfo();
 		savePatient(function(){
				makeFactor(function(){
						makeFinanceRegistration();
				});
		});
	}
//	$("#clinic-fnc-save").prop("disabled", false);
});

$("#clinic-save-patient").click(function () {
	$("clinic-save-patient").prop("disabled", true);
	disablePatientInfo();
 	savePatient();

//	$("#clinic-fnc-save").prop("disabled", false);
});

function validating(){
	for(i=1; i <= $("#service-table tr").length-1; i++){
		if($("#service_id_" + i).val() == ""){
			alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("clinic.operation.simpleFactor.error.fillAllService")%>");
			$("#clinic-fnc-save").prop("disabled", false);
			return false;
		}
		if($("#doctor_id_" + i).val() == ""){
			if($("#doctor_id_"+i+"_Comb").data("kendoComboBox").dataSource._data.length > 0){
				alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("clinic.operation.simpleFactor.error.selectDoctor")%>");
				$("#clinic-fnc-save").prop("disabled", false);
				return false;				
			}
		}
	}

	var items = [];
	for(i=1; i <= $("#service-table tr").length-1; i++){
		var dataItem = {};
		for(var j=0;j<items.length;j++){
			if(items[j].serviceId==$("#service_id_" + i).val() &&
					items[j].doctorId==$("#doctor_id_" + i).val() && items[j].cancelState!="true"){
				alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("clinic.operation.simpleFactor.error.duplicateServiceDoctor")%>");
				$("#clinic-fnc-save").prop("disabled", false);
				return false;
			}
		}
		dataItem.serviceId = $("#service_id_" + i).val();
		dataItem.doctorId = $("#doctor_id_" + i).val();
		dataItem.cancelState = $("#cancelState_"+i).val();
		items[i-1] = dataItem;
	}
	var isReleasable;
	for(i=1; i <= $("#service-table tr").length-1; i++){
		if(i==1){
			isReleasable=$("#isReleasable_"+i).val();
		}else if(i>1 && $("#isReleasable_"+i).val()!=isReleasable){
			alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("clinic.operation.simpleFactor.error.factorReleasableORNotReleasable")%>");
			$("#clinic-fnc-save").prop("disabled", false);
			return false;
		}
	}
	if(!isReleasable){
		for(i=1; i <= $("#service-table tr").length-1; i++){
			for(j=1; j <= $("#service-table tr").length-1; j++)
			if(i!=j){
				if($("#department_id_"+i).val()!=$("#department_id_"+j).val()){
					alertify.error("department not same");
					$("#clinic-fnc-save").prop("disabled", false);
					return false;
				}
			}

		}
	}


	return true;
}

function savePatient(callback){
	console.log("call savePatient");
	var patientId = $("#nameAndFam_Comb").data("kendoComboBox").value();
	if(!(patientId > 0)){
		patientId = null;
		if($("#patientId").val()!=""){
			patientId=$("#patientId").val();
		}
	}
	//
	var patient = {};
	patient.id = patientId;
	patient.firstname = $("#patientName").val();
	patient.lastname = $("#patientLastName").val();
	patient.fathername = $("#fathername").val();
	patient.filenumber = $("#fileNumber").val();
	patient.age = $("#age").val();
	patient.tel1 = $("#phone").val();
	patient.cellphon = $("#cellphone").val();
	patient.sex = $("#sex").val();
	patient.birthDate = $("#birthDate").val();
	patient.nationalCode = $("#nationalCode").val();
	patient.oldFileNumber = $("#oldFileNumber").val();
	if($('#files_uploaderChangeState').val()!=undefined){
		patient.files_uploaderChangeState=$('#files_uploaderChangeState').val();
	}
	patient.attachFileListBarSep=$('#attachFileListBarSep').val();
	patient.address=$('#address').val();
	patient.insurance_type_1_id=$('#insurance_type_1_id').val();
    patient.uniqueLongForFileUpload=$('#uniqueLongForFileUpload').val();
	//
    jQuery.ajax({
          url: '<c:url value='/' />' + '/clinic/operation/simpleFactor' + "/savePatient",
          type: "POST",
          data: JSON.stringify(patient),
          dataType: "json",
          contentType: "application/json; charset=utf-8",
          success: function (result) {
              if (result.state == "error") {
                  for (var i = 0; i < result.errors.length; i++) {
                      if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                          alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                      } else {
                          alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                      }
                  }
				  $("#clinic-fnc-save").prop("disabled", false);
				  $("clinic-save-patient").prop("disabled", false);
				  enablePatientInfo();
              }
              if (result.state == "success") {
           		  var ppb = $("#nameAndFam_Comb").data("kendoComboBox");
           		  ppb.dataSource.filter({ logic: 'and', filters: [{ field: "id", operator: "equal", value: result.baseObjectId }]});
           		  ppb.value(result.baseObjectId);
	           	  setTimeout(function(){
						ppb.dataSource.filter([]);	
	           	  }, 2000);
	           	  $("#fileNumber").val(result.patientFileNumber);
				  $("#patientId").val(result.baseObjectId);
				  $("#attachFileListBarSep").val(result.attachFileListBarSep);
            	  if(typeof callback === 'function'){
            		  callback();
            	  }
              }
          },
          error: function (result) {
			  $("#clinic-fnc-save").prop("disabled", false);
			  $("clinic-save-patient").prop("disabled", false);
			  enablePatientInfo();
        	  console.log(result);
          }
      });
}

function makeFactor(callback){
	if($("#factorId").val()>0 && typeof callback === 'function'){
		callback();
		return;
	}

	console.log("call makeFactor");
	var data = {};
	if($("#nameAndFam_Comb").data("kendoComboBox").value().length>0){
		data.patientId = $("#nameAndFam_Comb").data("kendoComboBox").value();
	}else{
		data.patientId = $("#patientId").val();

	}
	data.h_appointmentId = $("#h_appointmentId").val();
	service=[];
	for(i=1; i <= $("#service-table tr").length-1; i++){
		service[i-1] = $("#service_id_"+i).val();
	}
	data.service=service;

    jQuery.ajax({
        url:'<c:url value='/' />' + '/clinic/operation/simpleFactor/' + "saveFactor",
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
				$("#clinic-fnc-save").prop("disabled", false);
            }
            if (result.state == "success") {
				var factorId = result.baseObjectId;
				$("#factorId").val(factorId);
				$("#searchGrid").data("kendoGrid").dataSource.read();
          	    if(typeof callback === 'function'){
        		    callback();
        	    }
            }
        },
        error:function(result){
			$("#clinic-fnc-save").prop("disabled", false);
        	console.log(result);
        }
    });
}
var dataArrayForSend = {};
function makeFinanceRegistration(callback){
	console.log("call makeFinanceRegistration");
	var items = [];
	for(i=1; i <= $("#service-table tr").length-1; i++){
		var dataItem = {};
		dataItem.serviceId = $("#service_id_" + i).val();
		dataItem.originalCost = $("#originalPrice_" + i).val().replace(/\,/g, '');
		dataItem.serviceItemBasicAmount = $("#serviceItemBasicAmount_" + i).val();
		dataItem.insurancePercent = $("#insurancePersent_" + i).val();
		dataItem.unit = $("#unit_" + i).val();
		dataItem.discounts = $("#totalDiscounts_" + i).val().replace(/\,/g, '');;
		dataItem.doctorId = $("#doctor_id_" + i).val();
		dataItem.financeRegistration_id=$("#financeRegistration_id_" + i).val();
		dataItem.insuranceBookletPageNumber=$("#insuranceBookletPageNumber_" + i).val();
		dataItem.prescriptionDate=$("#prescriptionDate_" + i).val();
		dataItem.prescriptionValidityDate=$("#prescriptionValidityDate_" + i).val();
		dataItem.serviceRequesterMedicalCouncilCode=$("#serviceRequesterMedicalCouncilCode_" + i).val();
		items[i-1] = dataItem;
	}
	

	if($("#nameAndFam").val()>0){
		dataArrayForSend.patientId = $("#nameAndFam").val();
	} else{
		dataArrayForSend.patientId = $("#patientId").val();
	}

    dataArrayForSend.factorId = $("#factorId").val();
    dataArrayForSend.appointmentMongo_id = $("#h_appointmentId").val();
    dataArrayForSend.items = items;
	dataArrayForSend.insuranceBookletSerial = $("#insuranceBookletSerial").val();
//	dataArrayForSend.insuranceBookletPageNumber = $("#insuranceBookletPageNumber").val();
//	dataArrayForSend.prescriptionDate = $("#prescriptionDate").val();
//	dataArrayForSend.prescriptionValidityDate = $("#prescriptionValidityDate").val();
	dataArrayForSend.insuranceBookletType = $("#insuranceBookletType").val();
//	dataArrayForSend.serviceRequesterMedicalCouncilCode = $("#serviceRequesterMedicalCouncilCode").val();
	dataArrayForSend.insurance_type_1=$('#insurance_type_1_id').val();

    jQuery.ajax({
        url: '<c:url value='/' />' + "/clinic/operation/simpleFactor/saveFinanceRegistration",
        type: "POST",
        data: JSON.stringify(dataArrayForSend),
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (result) {
            if (result.state == "error") {
                for (var i = 0; i < result.errors.length; i++) {
                    if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                        alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                    } else {
                        alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                    }
                }
				$("#clinic-fnc-save").prop("disabled", false);
            }
            if (result.state == "success") {
            	$("#posAmount").val(result.factorTotalCost);
				var items=dataArrayForSend.items;
				for(var j=0;j<result.financeRegistrationArray.length;j++){
					for(var i=0;i<items.length;i++){
						if(result.financeRegistrationArray[j].financeRegistration_id==items[i].financeRegistration_id){
							break;
						}
						if(items[i].financeRegistration_id!=""){
							continue;
						}
						var w=i+1;
						if($("#financeRegistration_id_"+w).val()=="" &&
								items[i].serviceId==result.financeRegistrationArray[j].service_id &&
								items[i].doctorId==result.financeRegistrationArray[j].doctor_id){
							$("#financeRegistration_id_" + w).val(result.financeRegistrationArray[j].financeRegistration_id);
							break;
						}
					}
				}
				loadPaymentable();
//				if($('#posAmount').val()=="0"){
					loadFinanceRegistration($("#factorId").val());
//				}
				setNumericTextValue();
				$("#searchGrid").data("kendoGrid").dataSource.read();
				$("#clinic-fnc-save").prop("disabled", false);
            	if(typeof callback === 'function'){
        		    callback();
        	    }
            }
        },
        error: function (result) {
        	console.log(result);
        }
    });	
}

function fncReport(factorTotalCost) {
    if ($('#posAmount').val() > 0) {
        $("#fncReportLBL").text(addCommaSeparator($('#posAmount').val()) + ' : <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.debtorPatient")%>');
        $("#payRecipt").val(1);
        $("#payRecipt_Comb").data("kendoComboBox").value(1);
    } else if ($('#posAmount').val() < 0) {
        $("#fncReportLBL").text(addCommaSeparator($('#posAmount').val() * -1) + ' : <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.creditorPatient")%>');
        $('#posAmount').val($('#posAmount').val() * -1);
        $("#payRecipt").val(2);
        $("#payRecipt_Comb").data("kendoComboBox").value(2);
    } else if ($('#posAmount').val() == 0) {
        $("#fncReportLBL").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.settlement")%>');
		disablePatientInfo();
    }
	$("#fncTotalCost").text(addCommaSeparator(factorTotalCost) + ' : <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.factorTotalCost")%>'+'  .  ');
	$("#clinic-fnc-posSave").prop("disabled", false);
	setNumericTextValue();
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

$("#clinic-fnc-posSave").click(function () {
	addFactorPeyment();
});

$("#clinic-fnc-posFormReset").click(function () {
//    createItemTable(-1, -1, -1);
//    createServiceTable();
//    drawPosTable();
	$('#billNumber').val('');
	$('#factorPayment_id').val("");
	loadPaymentable();
});

function addFactorPeyment() {
	if($('#posAmount').val()==""){
		return;
	}
	var dataPosForSend = {};
	dataPosForSend.amount = $('#posAmount').val();
	dataPosForSend.payReciptType = $('#payRecipt').val();
	dataPosForSend.posId = $('#posCMB').val();
	dataPosForSend.billNumber = $('#billNumber').val();
	dataPosForSend.factor_id = $('#factorId').val();
	dataPosForSend.rounded = rounded;

	if ($('#factorPayment_id').val() != "") {
		dataPosForSend.id = $('#factorPayment_id').val();
		$('#factorPayment_id').val("");
	}
	$("#clinic-fnc-posSave").prop("disabled", true);
	jQuery.ajax({
		url: '<c:url value='/' />' + '/clinic/operation/simpleFactor/' + "saveFactorPeyment",
		type: "POST",
		data: JSON.stringify(dataPosForSend),
		dataType: "json",
		contentType: "application/json; charset=utf-8",
		success: function (result) {
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
				if (document.getElementById("loadedId") != null) {
					document.getElementById("loadedId").value = result.baseObjectId;
				}
//				document.getElementById("id").value = result.baseObjectId;
				$("#factorTotalCost").val(addCommaSeparator(result.factorTotalCost));
				loadFinanceRegistration($('#factorId').val());
			}
			try {
//				$('#service_id_Comb').data('kendoComboBox').value("");
			}
			catch (err) {
			}
//			createItemTable(-1, -1, -1);
//			createServiceTable();
			drawPosTable();
			$('#billNumber').val('');
			loadPaymentable();
//			$("#clinic-fnc-posSave").prop("disabled", false);
		},
		error: function (result) {
			$("#clinic-fnc-posSave").prop("disabled", false);
			drawPosTable();
			if (result.status == 401) {
				window.location.href = "";
			}
		}
	});
}

function editPosItem(imageId) {

	if(isReleasedInPage){
		$("#dialogEditPosItem").dialog("open");
		return;
	}
	var factorPaymentId = imageId.substring(imageId.lastIndexOf('-') + 1, imageId.length);
	$.getJSON("<c:url value='/' />" + "clinic/operation/simpleFactor/editFactorPaymentItem/" + factorPaymentId, function (data) {

		$('#billNumber').val(data.billNumber);
		$('#factorPayment_id').val(data.id);
		if (data.payment != 0) {
			$('#posAmount').val(data.payment);
			$('#posAmount_txt').val(data.payment);
			setNumericTextValue();
			$('#payRecipt').val(2);
			$("#payRecipt_Comb").data("kendoComboBox").value(2);
		} else if (data.receipt != 0) {
			$('#posAmount').val(data.receipt);
			$('#posAmount_txt').val(data.receipt);
			setNumericTextValue();
			$('#payRecipt').val(1);
			$("#payRecipt_Comb").data("kendoComboBox").value(1);
		}
		if (data.type == 1) {
			$('#posCMB').val(1);
			$("#posCMB_Comb").data("kendoComboBox").value(1);
		} else if (data.pos_id != null) {
			$('#posCMB').val(data.pos_id);
			$("#posCMB_Comb").data("kendoComboBox").value(data.pos_id);
		}

//		alertify.success(data.message);
//		drawPosTable();
//		loadPaymentable();
	});
}

function loadPaymentable() {
	$.getJSON("${pageContext.request.contextPath}" + "/clinic/operation/simpleFactor/loadPaymentable/" + $('#factorId').val(), function (data) {
//		hasServiceInLoadingPage = data.hasService;
		rounded=data.rounded;
		paymentable=data.paymentable;
		$('#posAmount').val(data.paymentable);
		fncReport(data.factorTotalCost);
	});
}

function drawPosTable() {
	if (document.getElementById('pos-item-table') == null) {
		return;
	}
	var localFactor_id = document.getElementById("factorId").value;

	$.getJSON("<c:url value='/' />" + "clinic/operation/simpleFactor/loadPosItem/" + localFactor_id, function (posDataItem) {
		factorPaymentTableTotalRowCount = posDataItem.length;
//	        if(serviceTableTotalRowCount>0 && (!${factorFNCState})|| <%=isCashier%>){
//	        	$("#clinic-fnc-sendToCash").prop("disabled", false);
//				$("#clinic-fnc-finalizeBasket").prop("disabled", false);
//			}
		try {
			deleteRow('pos-item-table');
		} catch (e) {
		}
		/////////////////////////////////////////


		var tbl = document.getElementById('pos-item-table');
		tbl.setAttribute('style', 'width: 100%');
		var tbdyPos = document.createElement('tbody');

		var tr = document.createElement("tr");
		tr.style.background = 'linear-gradient(to bottom, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%)';
		var th1 = document.createElement("th");
		th1.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("global.row") %>'));
		th1.setAttribute('style', 'width: 5%');
		var th2 = document.createElement("th");
		th2.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.deviceName") %>'));
		th2.setAttribute('style', 'width: 10%');
		var th3 = document.createElement("th");
		th3.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.receipt") %>'));
		th3.setAttribute('style', 'width: 10%');
		var th3_1 = document.createElement("th");
		th3_1.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.payment") %>'));
		th3_1.setAttribute('style', 'width: 10%');
		var th4 = document.createElement("th");
		th4.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.billNumber") %>'));
		th4.setAttribute('style', 'width: 10%');

		var th4_1 = document.createElement("th");
		th4_1.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.userFullName") %>'));
		th4_1.setAttribute('style', 'width: 10%');

		var th4_2 = document.createElement("th");
		th4_2.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.isPrintFactor") %>'));
		th4_2.setAttribute('style', 'width: 10%');

		var th5 = document.createElement("th");
		th5.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("action.operation") %>'));
		th5.setAttribute('style', 'width: 20%');

		tr.appendChild(th1);
		tr.appendChild(th2);
		tr.appendChild(th3);
		tr.appendChild(th3_1);
		tr.appendChild(th4);
		tr.appendChild(th4_1);
		tr.appendChild(th4_2);
		if (<%=isCashier%>){
			tr.appendChild(th5);
		}
		tbdyPos.appendChild(tr);


		var factorPaymentItemSum = 0;
		var factorReceiptItemSum = 0;
		if (factorPaymentTableTotalRowCount > 0) {
			for (i = 0; i < posDataItem.length; i++) {
				var tr = document.createElement("tr");
				var td1 = document.createElement("td");
				td1.align = 'center';
				td1.appendChild(document.createTextNode(i + 1));
				td1.setAttribute('style', 'width: 5%');
				var td2 = document.createElement("td");
				td2.style.paddingRight = '5px';
				td2.appendChild(document.createTextNode(posDataItem[i].posName));
				td2.setAttribute('style', 'width: 10%');
				var td3 = document.createElement("td");
				td3.style.paddingRight = '5px';
				td3.appendChild(document.createTextNode(addCommaSeparator(posDataItem[i].receipt)));
				td3.setAttribute('style', 'width: 10%');
				factorReceiptItemSum += (posDataItem[i].receipt * 1);

				var td3_1 = document.createElement("td");
				td3_1.style.paddingRight = '5px';
				td3_1.appendChild(document.createTextNode(addCommaSeparator(posDataItem[i].payment)));
				td3_1.setAttribute('style', 'width: 10%');
				factorPaymentItemSum += (posDataItem[i].payment * 1);

				var td4 = document.createElement("td");
				td4.style.paddingRight = '5px';
				td4.appendChild(document.createTextNode(posDataItem[i].billNumber));
				td4.setAttribute('style', 'width: 15%');

				var td4_1 = document.createElement("td");
				td4_1.style.paddingRight = '5px';
				td4_1.appendChild(document.createTextNode(posDataItem[i].userFullName));
				td4_1.setAttribute('style', 'width: 10%');

				var td4_2 = document.createElement("td");
				td4_2.style.paddingRight = '5px';
				td4_2.appendChild(document.createTextNode(posDataItem[i].isPrintFactor));
				td4_2.setAttribute('style', 'width: 10%');

				var td5 = document.createElement("td");
				td5.setAttribute('style', 'width: 15%');


				// edit Img
				var editImage = document.createElement("img");
				editImage.src = "<c:url value='/resources/images/edit/999.png' />";
				editImage.title = '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.edit") %>';
				//editImage.style.width='20px';
				editImage.id = 'img-edit-pos-item-' + i + '-' + posDataItem[i].id;
				editImage.onclick = function () {
					editPosItem(this.id);
				};
				editImage.onmouseover = function () {
					mouseOver(this);
				};
				editImage.onmouseout = function () {
					mouseOut(this);
				};

				// remove Img
				var image = document.createElement("img");
				image.src = "<c:url value='/resources/images/delete/Actions-button-cancel-icon6.png' />";
				//image.style.width='20px';
				image.title = '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.remove") %>';
				image.id = 'img-delete-pos-item-' + i + '-' + posDataItem[i].id;
				image.onclick = function () {
					$("#dialogconfirmRemovePosItem").data('contents', this.id).dialog("open");
//								removePosItem(this.id);
				};
				image.onmouseover = function () {
					mouseOver(this);
				};
				image.onmouseout = function () {
					mouseOut(this);
				};

				td5.align = 'center';
				td5.appendChild(editImage);
				td5.appendChild(image);

				tr.appendChild(td1);
				tr.appendChild(td2);
				tr.appendChild(td3);
				tr.appendChild(td3_1);
				tr.appendChild(td4);
				tr.appendChild(td4_1);
				tr.appendChild(td4_2);
				if (<%=isCashier%>){
					tr.appendChild(td5);
				}
				tbdyPos.appendChild(tr);
			}
			;
			///////////////////////////////////////////
		}
		var tr = document.createElement("tr");
		tr.style.background = '-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(126,133,144,1)), color-stop(49%,rgba(40,49,67,1)), color-stop(50%,rgba(19,30,50,1)), color-stop(100%,rgba(3,14,35,1)))';
		tr.style.color = '#ffffff';

		var td1 = document.createElement("td");
		var td2 = document.createElement("td");
		var td3 = document.createElement("td");
		var td3_1 = document.createElement("td");
		var td4 = document.createElement("td");
		var td4_1 = document.createElement("td");
		var td4_2 = document.createElement("td");
		var td5 = document.createElement("td");
		td1.setAttribute('style', 'width: 5%');
		td2.setAttribute('style', 'width: 10%');
		td3.setAttribute('style', 'width: 15%');
		td3_1.setAttribute('style', 'width: 15%');
		td4.setAttribute('style', 'width: 10%');
		td4_1.setAttribute('style', 'width: 15%');
		td4_2.setAttribute('style', 'width: 15%');
		td5.setAttribute('style', 'width: 10%');
		td3.appendChild(document.createTextNode(addCommaSeparator(factorReceiptItemSum)));
		td3_1.appendChild(document.createTextNode(addCommaSeparator(factorPaymentItemSum)));
		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td3_1);
		tr.appendChild(td4);
		tr.appendChild(td4_1);
		tr.appendChild(td4_2);
		if (<%=isCashier%>){
			tr.appendChild(td5);
		}
		tbdyPos.appendChild(tr);
		tbl.appendChild(tbdyPos);
	});
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
	docVar.doctor_id=$("#doctorId").val();
	docVar.posCMB=$("#posCMBFroSearch").val();
	docVar.factorPaymentPrint=$("#factorPaymentPrint").val();
	docVar.financeRegistrationPrint=$("#financeRegistrationPrint").val();
	docVar.surgerySaveState=$("#surgerySaveState").val();
	docVar.departmentReleaseState=$("#departmentReleaseState").val();
	return docVar;
}


function resetForm(){
	$("#fromDate").val("<%=curStringDate%>");
	$("#toDate").val("<%=curStringDate%>");
	$.getJSON(basePath + 'reset/', function(data) {
		//alert("ok!?");
		fileNumber=data.filenumber;
		$('#fileNumber').val(data.filenumber);
		$('#uniqueLongForFileUpload').val(data.uniqueLongForFileUpload);
        $('#billNumber').val('');

		if(data.insurance_type_1_id!=undefined){
//			$('#insurance_type_1_id_Comb').data('kendoComboBox').value(data.insurance_type_1_id);
			$('#insurance_type_1_id').val(data.insurance_type_1_id);
			if(data.insurance_type_1_id==1){
				$('#ins1').hide();
				$('#ins2').hide();
			}
		}

//		$('#mainForm').deserialize(data);
	});
//	var ppb = $("#nameAndFam_Comb").data("kendoComboBox");
//	ppb.dataSource.filter([]);
//	ppb.dataSource.read();
//	ppb.value("");
}

function confirmRemovePosItem(e) {
	removePosItem(e.data('contents'));
}

function removePosItem(imageId) {
	var factorPaymentId = imageId.substring(imageId.lastIndexOf('-') + 1, imageId.length);
	$.getJSON("<c:url value='/' />" + "clinic/operation/simpleFactor/removeFactorPaymentItem/" + factorPaymentId, function (result) {
		if (result.state == "error") {
			for (var i = 0; i < result.errors.length; i++) {
				if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
					alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
				} else {
					alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
				}
			}
		} else {
			alertify.success(result.message);
			drawPosTable();
			loadPaymentable();
		}

	});
}

	function disablePatientInfo(){
		$("#nameAndFam_Comb").data("kendoComboBox").enable(false);
		$("#patientrComplexPopup_popup_button").prop("disabled",true);
		$("#appointmentReportNew_popup_button").prop("disabled",true);
		$('#patientName').prop("disabled",true);
		$('#patientLastName').prop("disabled",true)
		$('#fathername').prop("disabled",true);
		$('#fileNumber').prop("disabled",true);
		$('#oldFileNumber').prop("disabled",true);
		$('#cellphone').prop("disabled",true);
		$('#phone').prop("disabled",true);
		$('#age').prop("disabled",true);
		$("#birthDate").prop("disabled",true);
		$('#nationalCode').prop("disabled",true);
		$('#sex_Comb').data('kendoComboBox').enable(false);

	}

function enablePatientInfo(){
		$("#nameAndFam_Comb").data("kendoComboBox").enable(true);
		$("#patientrComplexPopup_popup_button").prop("disabled",false);
		$("#appointmentReportNew_popup_button").prop("disabled",false);
		$('#patientName').prop("disabled",false);
		$('#patientLastName').prop("disabled",false)
		$('#fathername').prop("disabled",false);
		$('#fileNumber').prop("disabled",false);
		$('#oldFileNumber').prop("disabled",false);
		$('#cellphone').prop("disabled",false);
		$('#phone').prop("disabled",false);
		$('#age').prop("disabled",false);
		$("#birthDate").prop("disabled",false);
		$('#nationalCode').prop("disabled",false);
		$('#sex_Comb').data('kendoComboBox').enable(true);

	}

function fileuploadEdit(){
	var idValue=$("#patientId").val();
	if(idValue.length>0){
		$.getJSON("fileLoad/"+idValue, function (data) {
			$.each(data, function(name, val){
				$.each(val, function (filename, url) {
					if (imageCounter == 0) {
						$("#file-preview-files").append(tag_ui);
					}

					var imgTag = document.createElement("img");
					imgTag.id = "showImage-" + filename;
					imgTag.style.width = "100px";
					imgTag.style.height = "75px";
					imgTag.style.paddingRight = "5px";

					var aTag = document.createElement("a");
					aTag.className = "fancybox";
					aTag.rel = "gallery1";
					aTag.href = url;
					aTag.appendChild(imgTag);

					$("#li-images").append(imgTag);

					$("#showImage-" + filename).attr('src', url);
				});
			});
		});
	}
	$('.k-upload-status.k-upload-status-total').hide();
}

var existFileArray=[];
function onSuccess(e) {
	if (e.operation == "upload") {
		callback_successUploadFile_files(e);
	}else if(e.operation == "remove"){
		var fileAddresses = document.getElementById("attachFileListBarSepInPopup").value;
		var filesNames = fileAddresses.split('|');
		var newFileNames = '';
		for (var i = 0; i < filesNames.length; i++) {
			fileName = filesNames[i];
			if(fileName.length==0){
				continue;
			}
			var filenameWithoutPostfix = fileName.split('.')[0];
			var fileNameRemoving = e.files[0].name.split('.')[0];
			$("#showImage-"+fileNameRemoving).remove();
			if(fileName.indexOf(e.files[0].name)==-1){
				newFileNames += fileName+"|";
			}
			callback_successRemoveFile_files(fileNameRemoving);

		}
		document.getElementById("attachFileListBarSepInPopup").value = newFileNames;
	}
	if(typeof(callback_onSuccess_files)=="function"){
		callback_onSuccess_files(e);
	}
	$('.k-upload-status.k-upload-status-total').hide();
}

function callback_successRemoveFile_files(fileName){
	var newExistFileArray=[];
	for(var j=0;j<existFileArray.length;j++){
		if(existFileArray[j].fileName!=fileName){
			newExistFileArray.push(existFileArray[j]);
		}
	}
	existFileArray=newExistFileArray;
}

function callback_successUploadFile_files(e){
	var fileName=e.files[0].rawFile.name.split('.')[0];
	var existFile={};
	existFile.fileName=fileName;
	existFile.event=e;
	existFileArray.push(existFile);
	var fileReader = new FileReader();
	fileReader.onload = function (event) {
		imageCounter++;
		var mapImage = event.target.result;

		if (imageCounter == 1) {
			$("#file-preview-files").append(tag_ui);
		}

		var imgTag = document.createElement("img");
		imgTag.id = "showImage-" + fileName;
		imgTag.style.width = "100px";
		imgTag.style.height = "75px";
		imgTag.style.paddingRight = "5px";

		var aTag = document.createElement("a");
		aTag.className = "fancybox";
		aTag.rel = "gallery1";
		aTag.href = mapImage;
		aTag.appendChild(imgTag);

		$("#li-images").append(imgTag);

		$("#showImage-" + fileName).attr('src', mapImage);

	}
	fileReader.readAsDataURL(e.files[0].rawFile);
	document.getElementById("attachFileListBarSepInPopup").value += e.response.savedFile + "|";
}


function onRemove(e) {
	var removeUrl = "file/fileRemove";
	var value_ = $("#uniqueLongForFileUpload").val();
	this.options.async.removeUrl = removeUrl + "/" + value_;
	$('.k-upload-status.k-upload-status-total').hide();
	$('#PatientSimpleFactor  input[name=files_uploaderChangeState]').val('changed');
}


function onUpload(e) {
	var temp = "uniqueLongForFileUpload";
	var valueFieldName_ = "uniqueLongForFileUpload";
	var saveUrl_ = "file/fileUpload";
	if (temp != null && temp != "") {
		var value_ = $("#" + valueFieldName_).val();
		if (value_ != null && value_ != "") {
			var idVal = $("#patientId").val();
			if(idVal == null || idVal == ""){
				idVal = "-1";
			}
			this.options.async.saveUrl = saveUrl_ + "/" + value_ + "/" + idVal + "/" + imageCounter + "?disableCharacterFilter=true";
		}
	}
	$('.k-upload-status.k-upload-status-total').hide();
	$('#PatientSimpleFactor  input[name=files_uploaderChangeState]').val('changed');
}

function onError(e){
	alertify.error(e.XMLHttpRequest.responseText);
	$('.k-upload-status.k-upload-status-total').hide();
}

function reset_files(){
	$(".k-upload-files").remove();
	$(".k-upload-status").remove();
	$(".k-upload.k-header").addClass("k-upload-empty");
	$(".k-upload-button").removeClass("k-state-focused");
	$('#li-images').html('');
	$('#PatientSimpleFactor  input[name=files_uploaderChangeState]').val('');
}

function callback_custom_deserialize_popup_PatientSimpleFactor(data) {
	$('#address').val(data.addressInPopup);
	$('#attachFileListBarSep').val(data.attachFileListBarSepInPopup);
	$('#files_uploaderChangeState').val(data.files_uploaderChangeState);

}

function callback_popup_load_PatientSimpleFactor(){
	var attachFileListBarSep = $('#attachFileListBarSep').val();
	$('#attachFileListBarSepInPopup').val(attachFileListBarSep);

	$('#addressInPopup').val($('#address').val());
	var fileNames = attachFileListBarSep.substring(0, attachFileListBarSep.length - 1).split("|");
	for(i=0; i<fileNames.length ;i++){
		addImageToThumbnails(fileNames[i]);
	}
	$(".uk-modal-close").hide();
	$('button[data-form="popup"]')[0].innerText="بستن";
	fileShowForNotFileSave();
}

function patientIdAppender() {
	if($('#attachFileListBarSep').val()==""){
		if($('#patientId').val()==""){
			return '-1/null';
		}
		return $('#patientId').val()+'/null';
	}else{
		var attachFileListBarSep=$('#attachFileListBarSep').val().split('|').join('&&&');
		attachFileListBarSep=attachFileListBarSep.split('.').join(':@:');
		var patientId=$('#patientId').val();
		if(patientId==""){
			return '-1/'+attachFileListBarSep;
		}else{
			return patientId+'/'+attachFileListBarSep;
		}
	}
}

function addImageToThumbnails(fileName){
	if(fileName=="")
		return;
	var imgElement = document.createElement("img");
	imgElement.src="/prjResource/patientFile/"+fileName;
	imgElement.className="thumbnailsImg";
	var aElement = document.createElement("a");
	aElement.href="/prjResource/patientFile/"+fileName;

	var http = new XMLHttpRequest();
	http.open('HEAD', imgElement.src, false);
	http.send();
	if(http.status!=404){
		aElement.appendChild(imgElement);
		var liElement = document.createElement("li");
		liElement.appendChild(aElement);
		$("#clearfixUl")[0].appendChild(liElement);
		$('#thumbnails a').lightBox();
	}


}

function fileShowForNotFileSave(){
	for(var i=0;i<existFileArray.length;i++){
		existFileMap=existFileArray[i];
		var fileName=existFileMap.fileName;
		var e=existFileMap.event;
		var fileReader = new FileReader();
		fileReader.onload = function (event) {
			imageCounter++;
			var mapImage = event.target.result;

			if (imageCounter == 1) {
				$("#file-preview-files").append(tag_ui);
			}
			var fileName=existFileArray[imageCounter-1].fileName;

			var imgTag = document.createElement("img");
			imgTag.id = "showImage-" + fileName;
			imgTag.style.width = "100px";
			imgTag.style.height = "75px";
			imgTag.style.paddingRight = "5px";

			var aTag = document.createElement("a");
			aTag.className = "fancybox";
			aTag.rel = "gallery1";
			aTag.href = mapImage;
			aTag.appendChild(imgTag);

			$("#li-images").append(imgTag);

			$("#showImage-" + fileName).attr('src', mapImage);

		}
		fileReader.readAsDataURL(e.files[0].rawFile);
	}

}
</script>

<style>
.topSection{
	width: 100%;
	display: flex;
}
.rightSection{
	width: 30%; 
	min-height: 100px;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(29%,rgba(212,225,241,1)), color-stop(33%,rgba(201,218,238,1)), color-stop(100%,rgba(228,240,253,1)));
    border: 1px solid #cacaca;
}
.leftSection{
	width: 70%; 
	min-height: 100px;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(29%,rgba(212,225,241,1)), color-stop(33%,rgba(201,218,238,1)), color-stop(100%,rgba(228,240,253,1)));
    border: 1px solid #cacaca;
}
.bottomSection{
	background: -webkit-gradient(linear, left top, left bottom, color-stop(29%,rgba(212,225,241,1)), color-stop(33%,rgba(201,218,238,1)), color-stop(100%,rgba(228,240,253,1)));
	min-height: 100px;
}
.patientInfoLabel{
    width: 22%;
    float: right;
    padding-left: 2%;
}
.patientInfoField{
	float: right;
	width: 25%;
}
.patientInfoField input {
	width: 90%;
	padding: 3px;
	margin-top: 2px;
}
.rightSection .uk-grid{
	margin: 0;
}
.nameAndFamCombo{
    width: 75%;
    padding-right: 10px !important;
    padding-left: 10px !important;
}
.birthDateFieldStyle input{
 	border-radius: 4px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(170, 170, 170);
	width: 90%;
	padding: 3px;
	margin-top: 2px;
}
#service-table th {
	font-size: 10px !important;
}
#service-table .uk-width-4-10{
	width: 100%;
}
/*.serviceTableInputField{*/
input[class^='serviceTableInputField'], input[class*='serviceTableInputField']{
	width: 100%;
	padding: 3px; 
	border-radius: 4px; 
	border-style: solid; 
	border-width: 1px; 
	border-color: gray;
}
.paymentSection{
    background: linear-gradient(to bottom, rgba(160, 188, 197, 1) 0%, rgba(190, 201, 206, 1) 50%, rgba(166, 186, 190, 1) 100%);
    width: 98%;
    margin-top: 15px;
    border-radius: 4px;
    border-width: thin;
    border-style: solid;
    padding-bottom: 5px;
    margin-bottom: 5px;
}
#paymentFields .uk-width-1-10{
    width: 10%;
    padding-right: 0.5% !important;
}
#paymentFields .uk-width-2-10{
	padding-right: 0.5% !important;
	width: 15%;
}
#pos-item-table th{
	font-size: 10px !important;
}
#paymentFields input[type=text] {
	padding: 3px; 
	border-radius: 4px; 
	border-style: solid; 
	border-width: 1px; 
	border-color: gray;
}

#search_back{
	padding-top: 5px;
	padding-bottom: 5px;
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(rgb(242, 245, 246)), color-stop(0.37, rgb(227, 234, 237)), to(rgb(200, 215, 220)));
}
.thumbnailsImg {
	height: 200px;
}
</style>