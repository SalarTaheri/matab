<%@page import="com.artonis.core.system.config.model.SettingConstValue.ClinicTypeEnum"%>
<%@page import="com.artonis.core.system.config.service.util.ConfigServiceUtil"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@ page import="java.util.ResourceBundle" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>
<%
    String menuSysCode = String.valueOf(request.getAttribute("menuSystemCode"));
    int factorType = Integer.valueOf(String.valueOf(request.getAttribute("factorType")));
    boolean isCashier = GlobalVariable.getButtonContainer(menuSysCode, "cashier-user-permission");
    boolean isSurgery = GlobalVariable.getButtonContainer(menuSysCode, "surgery-user-permission");
    boolean factorFncState = (Boolean) request.getAttribute("factorFNCState");
    boolean isReleasable = (Boolean) request.getAttribute("isReleasable");
    boolean isReleased = (Boolean) request.getAttribute("isReleased");
    boolean isFactorClosed = (Boolean) request.getAttribute("isFactorClosed");
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String areUShure=resource.getString("action.alert.areYouSure.delete");
    boolean changeServicePricePermision = GlobalVariable.getButtonContainer(menuSysCode, "changeServicePricePermision");
    boolean changeQuanityPermision = GlobalVariable.getButtonContainer(menuSysCode, "changeQuanityPermision");
    boolean changeQuanityPermisionBasedOnField = GlobalVariable.getButtonContainer(menuSysCode, "changeQuanityPermisionBasedOnField");

%>
<base:dialogAlert name="dialogNotSelectAnyDoctorForService"
                  key="com.artonis.clinic.basicInfo.financeRegistration.alarm.notSelectAnyDoctorForService"/>
<base:dialogAlert name="dialogNotSelectAnyDoctorForServiceShouldQuantityZero"
                  key="com.artonis.clinic.basicInfo.financeRegistration.alarm.notSelectAnyDoctorForServiceShouldQuantityZero"/>
<base:dialogAlert name="dialogRepeatSendVisit" key="com.artonis.clinic.operation.factor.sent.visit.alert"/>
<base:dialogAlert name="dialogRemoveVisit"
                  key="com.artonis.clinic.basicInfo.financeRegistration.alert.notAllowRemoveVisited"/>
<base:dialogAlert name="dialogRemoveServiceItem"
                  key="com.artonis.clinic.basicInfo.financeRegistration.alert.notAllowRemoveServiceItem"/>
<base:dialogAlert name="dialogEditPosItem"
                  key="com.artonis.clinic.operation.factor.editPosItem.alert.notAllowEditWithRelease"/>
<base:dialogConfirm name="dialogconfirmRemoveService" key="action.alert.areYouSure.delete"
                    yesFunction="confirmRemoveService"/>
<base:dialogConfirm name="dialogconfirmRemovePosItem" key="action.alert.areYouSure.delete"
                    yesFunction="confirmRemovePosItem"/>
<base:dialogConfirm name="dialogconfirmRemoveServiceItem" key="action.alert.areYouSure.delete"
                    yesFunction="confirmRemoveServiceItem"/>
<jsp:include page="AgentDoctorComboFunc.jsp"/>
<div class="body-header">
    <ul class="uk-breadcrumb uk-h3" id="breadcrumb" style=" margin-bottom: 2px; ">
        <li id="breadcrumb-main-section">
            <span><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration")%></span>
        </li>
    </ul>
    <div id="header-toolbar">
        <div id="body-heade-save-div" style="">
            <base:buttonPermission classNames="uk-button uk-button-danger" id="btn-cancel" key="global.crud.cancel"/>
            <base:buttonPermission classNames="uk-button uk-button-danger"
                                   key="com.artonis.clinic.basicInfo.financeRegistration.backToFactor"
                                   id="clinic-fnc-backToFactor"/>
            <base:buttonPermission classNames="uk-button uk-button-success"
                                   key="com.artonis.clinic.basicInfo.financeRegistration.history"
                                   id="clinic-fnc-history"/>
            <base:buttonPermission classNames="uk-button uk-button-success"
                                   key="com.artonis.clinic.basicInfo.financeRegistration.financeRegistrationlog"
                                   id="clinic-fnc-financeRegistrationlog"/>
            <base:buttonPermission classNames="uk-button uk-button-success"
                                   key="com.artonis.clinic.basicInfo.financeRegistration.changingDateFactor"
                                   id="changing-date-factor"/>
        </div>
    </div>
</div>
<div class="uk-width-1-10 left-align">

    <div style="display:inline;" id="modal-surgeryPopup"></div>
    <div style="display:inline;" id="modal-agentDoctorPopup"></div>
    <div style="display:inline;" id="modal-rvuModifiedCodeApplyPopup"></div>
</div>

<base:pageInputHeader/>
<form class="uk-form" id="mainForm">
    <div class="uk-container uk-container-center my-uk-container enteringFields" style=" margin-bottom: 5px; margin-top: 5px;padding-top: 5px; padding-bottom: 5px; ">
        <base:hasPermission id="cashier-user-permission"/>
        <base:hasPermission id="registration-user-permission"/>
        <base:hasPermission id="finance-user-permission"/>
        <base:hasPermission id="surgeryInfo"/>
        <base:hasPermission id="reagentDoctor"/>
        <base:hasPermission id="rvuModifiedCodeApp"/>
        <base:hasPermission id="variableEmployeeContractPercent"/>
        <base:hasPermission id="changingDateFinanceRegistration"/>
        <base:hasPermission id="changingDateFactorPayment"/>
        <input type="hidden" id="id" name="id">
        <input type="hidden" id="patient_id" name="patient_id">
        <input type="hidden" id="factor_id" name="factor_id">
        <input type="hidden" id="isInsuranceDefined" name="isInsuranceDefined">
        <input type="hidden" id="currentDate" name="currentDate">
        <input type="hidden" id="factorDate" name="factorDate">

        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="patient_name"
                          key="com.artonis.clinic.basicInfo.financeRegistration.patient_name" disabled="true"/>
            <base:testBox styleClass="small" name="patient_family"
                          key="com.artonis.clinic.basicInfo.financeRegistration.patient_family" disabled="true"/>
            <base:testBox styleClass="small" name="patient_fileNumber"
                          key="com.artonis.clinic.basicInfo.financeRegistration.patient_fileNumber" disabled="true"/>
        </div>
        <% if (GlobalVariable.getButtonContainer(menuSysCode, "registration-user-permission")) { %>
        <div id="notDefinedDiv" style="padding-top: 10px;">
            <div class="uk-grid uk-grid-preserve">
                <base:comboBox styleClass="small" name="insurance_type1"
                               key="com.artonis.clinic.basicInfo.financeRegistration.insurance_type1"
                               comboLoaderUrl="combo/getActiveInsurance"/>
                <base:comboBox name="department_id" styleClass="small" comboLoaderUrl="combo/loadDepartment/${factor_id}" key="com.artonis.clinic.operation.department"/>
                <base:cascadeComboBox cascadeCombo="department_id" name="service_id" key="com.artonis.clinic.basicInfo.financeRegistration.service_id"
						comboLoaderUrl="combo/loadAllService" styleClass="small" minLength="0"/>
			</div>
        </div>
        <div class="uk-grid uk-grid-preserve" style="display: none">
               <base:cascadeComboBox cascadeCombo="department_id" name="appointmentMongo_id" key="com.artonis.clinic.basicInfo.financeRegistration.appointmentTitle"
                            comboLoaderUrl="combo/loadFactorAppointment/${factor_id}" styleClass="small" selectIndex="0"/>
        </div>
        <% if (GlobalVariable.getButtonContainer(menuSysCode, "reagentDoctor")) { %>
                <div class="uk-grid uk-grid-preserve" >
                    <base:comboBoxAutoComplete-buttonNew name="doctorId" key="clinic.patient.radiology.doctor" dataTextField="fullName"  styleClass="small"
                                                 iscomboLoaderUrlRelative="true" comboLoaderUrl="combo/loadAllAgentDoctor" dataValueField="id" minLength="0"
                                                 hasTemplate="false" popupUrl="popup/doctorInput" relativeSaveUrl="/popupDoctor/save" />


                </div>
                <div class="uk-grid uk-grid-preserve" >

                </div>

        <%}%>

        <%}%>
    </div>
    <% if (GlobalVariable.getButtonContainer(menuSysCode, "registration-user-permission")) { %>
            <c:if test="${showInsuranceFields}">
    <div class="uk-container uk-container-center my-uk-container enteringFields" id="insuranceConfirmDiv" style=" margin-bottom: 5px; margin-top: 10px;padding-top: 5px; padding-bottom: 5px; ">
        <%--<div class="uk-grid uk-grid-preserve" >--%>
            <%--<base:cascadeComboBox cascadeCombo="insurance_type1" name="insuranceProficiency" key="com.artonis.clinic.basicInfo.financeRegistration.insuranceProficiency"--%>
                                  <%--comboLoaderUrl="combo/loadInsuranceProficiency" styleClass="small" minLength="0"/>--%>
            <%--<base:cascadeComboBox cascadeCombo="insurance_type1" name="insuranceDoctorType" key="com.artonis.clinic.basicInfo.financeRegistration.insuranceDoctorType"--%>
                                  <%--comboLoaderUrl="combo/loadInsuranceDoctorType" styleClass="small" minLength="0"/>--%>
            <%--<base:cascadeComboBox cascadeCombo="insurance_type1" name="insuranceParaclinicType" key="com.artonis.clinic.basicInfo.financeRegistration.insuranceParaclinicType"--%>
                                  <%--comboLoaderUrl="combo/loadInsuranceParaclinicType" styleClass="small" minLength="0"/>--%>
        <%--</div>--%>
        <%--<div class="uk-grid uk-grid-preserve" >--%>
            <%--<base:cascadeComboBox cascadeCombo="insurance_type1" name="insurancePrescriptionType" key="com.artonis.clinic.basicInfo.financeRegistration.insurancePrescriptionType"--%>
                                  <%--comboLoaderUrl="combo/loadInsurancePrescriptionType" styleClass="small" minLength="0"/>--%>

        <%--</div>--%>

    </div>
    <div class="uk-container uk-container-center my-uk-container enteringFields" id="insuranceDiv" style=" margin-bottom: 5px; margin-top: 10px;padding-top: 5px; padding-bottom: 5px; ">
				<div class="uk-grid uk-grid-preserve">
					<base:cascadeComboBox cascadeCombo="insurance_type1" name="insuranceBookletType" comboLoaderUrl="combo/loadAllInsuranceBookletType" styleClass="small" 
							key="com.artonis.clinic.basicInfo.financeRegistration.insuranceBookletType"/>
					<base:testBox styleClass="small" name="insuranceBookletSerial" key="com.artonis.clinic.basicInfo.financeRegistration.insuranceBookletSerial" />
					<base:testBoxNumericEx styleClass="small" name="insuranceBookletPageNumber" key="com.artonis.clinic.basicInfo.financeRegistration.insuranceBookletPageNumber"/>
	            </div>
	
	            <div class="uk-grid uk-grid-preserve">
	            	<base:mDatePicker name="prescriptionDate" key="com.artonis.clinic.basicInfo.financeRegistration.prescriptionDate" styleClass="small" />
	            	<base:mDatePicker name="prescriptionValidityDate" key="com.artonis.clinic.basicInfo.financeRegistration.prescriptionValidityDate" styleClass="small" />
	            	<base:testBox name="serviceRequesterMedicalCouncilCode" key="com.artonis.clinic.basicInfo.financeRegistration.serviceRequesterMedicalCouncilCode" styleClass="small" />
	            </div>
            </c:if>
            			

        <div id="preDefinedDiv" style="padding-top: 10px;">
            <div class="uk-grid uk-grid-preserve">
                <input type="hidden" id="insuranceType2Id" name="insuranceType2Id">
            </div>
        </div>
        <%}%>
    </div>
    <div align="center" style="padding-top: 1px">

        <%--<base:formPopup-completeForm  styledivLabel="text-align: right" formPopup="RvuModifiedCodeApply" disableBackground="true"--%>
                         <%--popupUrl="/clinic/basicInfo/rvuModifiedCodeApplyPopup/" keyLabel="com.artonis.clinic.basicInfo.financeRegistration.addServiceItem"/>--%>
    </div>

    <div class="background" style="padding-top: 5px; padding-bottom: 5px;margin-top: 2px; ">
        <div  >
            <%--<base:testBox styleClass="small" name="search-list-table"--%>
                          <%--key="com.artonis.clinic.basicInfo.financeRegistration.patient_name" disabled="true"/>--%>
            <div style=" width: 43%; display: inline-block;margin-bottom: 10px; ">
                <label for="search-list-table" ><%=ResourceBoundleHolder.resourceBundle.getString("global.crud.search")%></label>
                <input id="search-list-table" style=" width: 80%; margin-bottom: 5px; " />
            </div>
            <div style="display: inline-block; ">
             <base:formPopup  styledivLabel="text-align: right" formPopup="ServiceItem" disableBackground="true" disableSaveWithoutCloseButton="true"
                                 popupUrl="/clinic/basicInfo/serviceItemPopUp/" keyLabel="com.artonis.clinic.basicInfo.financeRegistration.addServiceItem" valEndOfPopupUrl="insurance_type1"/>
            </div>
        </div>
        <table border="1" width="100%" id="list-table">
            <tr style="background: linear-gradient(to bottom, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%);">
                <th width="5%">
                    <%=ResourceBoundleHolder.resourceBundle.getString("global.row") %>
                </th>
                <th width="20%">
                    <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.serviceItem") %>
                </th>
                <th width="7%">
                    <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.measureUnit") %>
                </th>
                <% if (GlobalVariable.getButtonContainer(menuSysCode, "finance-user-permission") ||
                        GlobalVariable.getButtonContainer(menuSysCode, "cashier-user-permission")) { %>
                <th width="10%">
                    <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.originalCost") %>
                </th>
                <%} %>
                <% if (GlobalVariable.getButtonContainer(menuSysCode, "registration-user-permission")) { %>
                <th width="5%">
                    <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.unit") %>
                </th>

                <th width="15%">
                    <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.doctor") %>
                </th>

                <%} %>
                <% if (GlobalVariable.getButtonContainer(menuSysCode, "cashier-user-permission")) { %>
                <th width="7%">
                    <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.offPercent")%>
                </th>
                <th width="10%">
                    <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.discountLocation")%>
                </th>
                <th width="7%">
                    <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.discountAmount")%>
                </th>

                <%} %>
                <% if (GlobalVariable.getButtonContainer(menuSysCode, "finance-user-permission") ||
                        GlobalVariable.getButtonContainer(menuSysCode, "cashier-user-permission")) { %>
                <th width="15%">
                    <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.amount")%>
                </th>
                <%} %>

            </tr>
        </table>
        <div align="center"
             style="padding-top: 5px; padding-bottom: 5px;background: linear-gradient(to bottom, rgba(160, 188, 197, 1) 0%,rgba(190, 201, 206, 1) 37%,rgba(166, 186, 190, 1) 100%);">
            <%
                if ((factorType == 2 && (!factorFncState || GlobalVariable.getButtonContainer(menuSysCode, "cashier-user-permission"))) ||
                        (factorType == 1 && (!isReleasable || GlobalVariable.getButtonContainer(menuSysCode, "cashier-user-permission")))) {
            %>
            <base:buttonPermission id="clinic-fnc-addToBasket" key="global.crud.save"
                                   classNames="uk-button uk-button-primary" style="width:180px;"/>
            <%} %>
        </div>
        <div align="center">
            <table border="1" width="80%" id="service-table" style="" class="serviceTableCss">
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

        <% if (!factorFncState || GlobalVariable.getButtonContainer(menuSysCode, "cashier-user-permission")) { %>
        <div align="center" style="padding-top: 5px; padding-bottom: 5px;">
            <base:buttonPermission key="clinic.cash.sendToCash" classNames="uk-button uk-button-primary"
                                   id="clinic-fnc-sendToCash"/>
        </div>
        <%} %>

        <% if (GlobalVariable.getButtonContainer(menuSysCode, "cashier-user-permission")) { %>
        <input type="hidden" id="factorPayment_id" name="factorPayment_id">

        <div id="accordion111">
            <div style=" padding-top: 10px; ">
                <div class="uk-grid uk-grid-preserve" style=" margin-left: 20px; ">
                    <base:testBoxNumericEx name="posAmount" styleClass="verysmall"
                                           key="com.artonis.clinic.basicInfo.financeRegistration.cost"/>
                    <base:comboBox styleClass="small" name="payRecipt"
                                   key="com.artonis.clinic.basicInfo.financeRegistration.paymentType"
                                   comboLoaderUrl="combo/loadPayReceipt"/>
                    <base:comboBox styleClass="small" name="posCMB"
                                   key="com.artonis.clinic.basicInfo.financeRegistration.paymentType"
                                   comboLoaderUrl="combo/loadAllPos" selectIndex="0"/>
                    <base:testBox name="billNumber" styleClass="verysmall"
                                  key="com.artonis.clinic.basicInfo.financeRegistration.billNumber"/>

                </div>
                <div class="uk-grid uk-grid-preserve" style=" margin-left: 20px; ">
                    <base:comboBox  styleClass="midsmall"  name="coffer_id" key="com.artonis.fnc.treasury.payment.paymentBill.coffer" comboLoaderUrl="combo/loadAllCoffer" />
                </div>
                <div class="uk-grid uk-grid-preserve">
                </div>
                <div align="center"
                     style="background: linear-gradient(to bottom, rgba(140, 172, 182, 1) 0%,rgba(172, 193, 202, 1) 37%,rgba(131, 166, 173, 1) 100%);">
                    <base:buttonPermission key="clinic.cash.posSave" classNames="uk-button uk-button-primary"
                                           id="clinic-fnc-posSave"
                                           style=" width: 10%; margin-top: 5px; margin-bottom: 5px; "/>
                    <base:buttonPermission key="clinic.cash.posReset" classNames="uk-button uk-button-primary"
                                           id="clinic-fnc-posFormReset"
                                           style=" width: 10%; margin-top: 5px; margin-bottom: 5px; "/>
                </div>
                <div align="center">
                    <table id="pos-item-table" width="50%" border="1">
                        <tr style="background: linear-gradient(to bottom, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%);">
                            <th width="5%" align="center">
                                <%=ResourceBoundleHolder.resourceBundle.getString("global.row") %>
                            </th>
                            <th width="10%">
                                <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.deviceName") %>
                            </th>
                            <th width="30%">
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

                    <div align="center"
                         style="background: linear-gradient(to bottom, rgba(242,245,246,1) 0%,rgba(227,234,237,1) 37%,rgba(200,215,220,1) 100%);">
                        <label id="fncReportLBL"
                               style=" font-size: 18px !important; font-weight: bold; color: maroon; "></label>
                    </div>
                </div>

                <div align="center"
                     style="background: linear-gradient(to bottom, rgba(140, 172, 182, 1) 0%,rgba(172, 193, 202, 1) 37%,rgba(131, 166, 173, 1) 100%); margin-top: 10px;">
                    <%if (factorType == 1 && isReleasable && !isReleased) { %>
                    <base:buttonPermission key="clinic.cash.release" classNames="uk-button uk-button-primary"
                                           id="clinic-fnc-release"/>
                    <%}%>
                    <%--<%}else if(factorType == 1 && isReleased) {%>--%>
                        <label id="fncReleased"
                           style=" font-size: 18px !important; font-weight: bold; color: maroon; "></label>
                        <label id="factorClosed"
                           style=" font-size: 18px !important; font-weight: bold; color: maroon; "></label>
                           <%--style=" font-size: 18px !important; font-weight: bold; color: maroon; "><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.releaseState.isRelease") %></label>--%>
                    <%--<%}%>--%>
                    <div  align="center">
                    	<%if(ConfigServiceUtil.getClinicType() == ClinicTypeEnum.DOCTOR_OFFICE){%>
                    		<base:checkbox name="hasDeliveryGoods" key="com.artonis.clinic.basicInfo.financeRegistration.hasPack" style="display: none;" divLableStyle="display: none;"/>
                    	<%}else{%>
                    		<base:checkbox name="hasDeliveryGoods" key="com.artonis.clinic.basicInfo.financeRegistration.hasPack"/>
                    	<%}%>
                        <base:buttonPermission key="com.artonis.clinic.basicInfo.financeRegistration.factorPrint"
                                               classNames="uk-button uk-button-success" id="factorPrint-btn"/>
                        <base:buttonPermission key="com.artonis.clinic.basicInfo.financeRegistration.factorPrintSendToVisit"
                                			   classNames="uk-button uk-button-success" id="factorPrintSendToVisit-btn"/>
                        <base:buttonPermission key="com.artonis.clinic.basicInfo.financeRegistration.bill"
                                               classNames="uk-button uk-button-success" id="bill-btn"/>
                        <base:buttonPermission key="com.artonis.clinic.basicInfo.financeRegistration.patientBill"
                                               classNames="uk-button uk-button-success" id="bill-patient-btn"/>
                        <base:buttonPermission key="com.artonis.clinic.basicInfo.financeRegistration.billDetail"
                                               classNames="uk-button uk-button-success" id="bill-detail-btn"/>
                        <base:buttonPermission key="com.artonis.clinic.basicInfo.financeRegistration.briefOperationReport"
                                               classNames="uk-button uk-button-success" id="briefOperationReport-btn"/>
                        <%--<base:button  text="update-fr-payable" id="update-fr-payable"/>--%>
                        <%--<base:button  text="update-fri-insuranceAndPatientPortionAndDifference" id="update-fri-insuranceAndPatientPortionAndDifference"/>--%>
                        <base:buttonPermission key="com.artonis.clinic.basicInfo.financeRegistration.surgeryReport" classNames="uk-button uk-button-success"
                                     id="patientSurgeryReport-btn"/>
                    </div>
                </div>


            </div>

        </div>
        <%}else{%>
        <div  align="center">
            <% if (GlobalVariable.getButtonContainer(menuSysCode, "pos-item-table-grid")) { %>
                <table id="pos-item-table" width="50%" border="1">
                    <tr style="background: linear-gradient(to bottom, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%);">
                        <th width="5%" align="center">
                            <%=ResourceBoundleHolder.resourceBundle.getString("global.row") %>
                        </th>
                        <th width="10%">
                            <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.deviceName") %>
                        </th>
                        <th width="30%">
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
            <%}%>
            <base:buttonPermission key="com.artonis.clinic.basicInfo.financeRegistration.bill"
                                   classNames="uk-button uk-button-success" id="bill-btn"/>
            <base:buttonPermission key="com.artonis.clinic.basicInfo.financeRegistration.patientBill"
                                   classNames="uk-button uk-button-success" id="bill-patient-btn"/>
            <base:buttonPermission key="com.artonis.clinic.basicInfo.financeRegistration.billDetail"
                                   classNames="uk-button uk-button-success" id="bill-detail-btn"/>
            <base:buttonPermission key="com.artonis.clinic.basicInfo.financeRegistration.briefOperationReport"
                                   classNames="uk-button uk-button-success" id="briefOperationReport-btn"/>
            <base:buttonPermission key="com.artonis.clinic.basicInfo.financeRegistration.surgeryReport" classNames="uk-button uk-button-success"
                                   id="patientSurgeryReport-btn"/>
            <%--<base:button  text="update-fr-payable" id="update-fr-payable"/>--%>
            <%--<base:button  text="update-fri-insuranceAndPatientPortionAndDifference" id="update-fri-insuranceAndPatientPortionAndDifference"/>--%>
        </div>

        <%} %>
    </div>

    <div id="dialog" class="background" style="display:none;padding-top: 20px; padding-bottom: 20px; ">
        <base:my-grid name="grid" transportReadUrl="${controllerBasePath}/grid-read/${patient_id}" isPopup="true"
                      pageSize="2" groupable="false" exportToExcellEnable="false" showOperation="false">
            <base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.date' field="date"
                                 width="100px"/>
            <base:my-grid-column title='com.artonis.clinic.basicInfo.service.name' field="serviceName" width="100px"/>
            <base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.visitState' field="visitState" width="100px"/>
            <base:my-grid-schema-field name="date" type="string"/>
            <base:my-grid-schema-field name="serviceName" type="string"/>
            <base:my-grid-schema-field name="visitState" type="string"/>
        </base:my-grid>
    </div>

    <div id="modals-variablePercentDataPopup" title="<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.variablePercent")%>">
        <form class="uk-form" id="form-popup">
            <input type="hidden" id="rowIndex">
            <div class="uk-grid uk-grid-preserve" style="margin-top: 10px;">
                <base:testBoxNumericEx name="totalAmount" disabled="true" key="com.artonis.clinic.basicInfo.financeRegistration.grid.totalAmount" styleClass="small" />
            </div>
            <div class="uk-grid uk-grid-preserve" style="margin-top: 10px;">
                <base:testBoxNumericEx name="doctorPercentPortion" onChangeFunction="changingDoctorPercentPortion(event)"
                                       key="com.artonis.clinic.basicInfo.financeRegistration.variablePercent.doctorPercentPortion" styleClass="small" />
                <base:testBoxNumericEx name="doctorPricePortion" onChangeFunction="changingDoctorPricePortion(event)" key="com.artonis.clinic.basicInfo.financeRegistration.variablePercent.doctorPricePortion" styleClass="small" />
                <base:testBoxNumericEx name="clinicPricePortion" onChangeFunction="changingClinicPricePortion(event)" key="com.artonis.clinic.basicInfo.financeRegistration.variablePercent.clinicPricePortion" styleClass="small" />
            </div>
        </form>
    </div>
    <div id="modals-changingDateFinanceRegistrationDataPopup" title="<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.changingDateFinanceRegistration")%>">
        <form class="uk-form" id="form-changingDateDataPopup">
            <input type="hidden" id="financeRegistrationId">
            <div class="uk-grid uk-grid-preserve" style="margin-top: 10px;">
                <base:mDatePicker name="financeRegistrationDate" key="com.artonis.clinic.basicInfo.financeRegistration.data" styleClass="small"/>
            </div>

        </form>
    </div>
   <div id="modals-changingDateFactorPaymentDataPopup" title="<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.changingDateFactorPayment")%>">
        <form class="uk-form" id="form-changingDateFactorPayment">
            <input type="hidden" id="factorPaymentId">
            <div class="uk-grid uk-grid-preserve" style="margin-top: 10px;">
                <base:mDatePicker name="factorPaymentDate" key="com.artonis.clinic.basicInfo.financeRegistration.data" styleClass="small"/>
            </div>

        </form>
    </div>
    <div id="modals-changingDateFactorDataPopup" title="<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.changingDateFactor")%>">
        <form class="uk-form" id="form-changingDateFactor">
            <div class="uk-grid uk-grid-preserve" style="margin-top: 10px;">
                <base:mDatePicker name="factorDateForChanging" key="com.artonis.clinic.basicInfo.financeRegistration.data" styleClass="small"/>
            </div>

        </form>
    </div>
    <%--
<div class="background" style="display:none; padding-top: 20px; padding-bottom: 20px; " >
<%
	String gridUrl = new UrlPathHelper().getOriginatingRequestUri(request);
	if (gridUrl.indexOf("/create") > -1)
		gridUrl = gridUrl.substring(0, gridUrl.indexOf("/create"));
	gridUrl += "/serviceItemCost/grid-read/-1/-1/-1";
%>
	<base:custom-my-grid-financeRegisteration name="serviceGrid" transportReadUrl="<%=gridUrl%>" selectable="single" showOperation="false" >
		<base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.grid.serviceItem' field="serviceitem_name" width="50px" />
		<base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.grid.originalCost' field="serviceitem_cost" width="50px"/>
		<base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.grid.insuranceCost' field="insuranceCost" width="50px"/>

        <base:my-grid-schema-field name="service_text" type="string"/>
	</base:custom-my-grid-financeRegisteration>
	<div align="center" style="padding-left: 80px">
	 	<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" onClick="javascript:saveFinanceRegistration();" style="background-color: rgb(175,214,101);" id="saveFinanceRegistration"/>
	</div>
</div>
--%>
</form>
<div align="center" >
    <base:buttonPermission style="margin: 25px;" id="makeConsumptionslip" key="com.artonis.clinic.operation.factorView.consumptionslip" classNames="uk-button" onClick="makeConsumptionslip()"/>
</div>
<style type="text/css">

    #accordion111 {
        background: linear-gradient(to bottom, rgba(160, 188, 197, 1) 0%, rgba(190, 201, 206, 1) 37%, rgba(166, 186, 190, 1) 100%);

    }

    .mouseOverCursor {
        cursor: pointer;
    }

    .background {
        margin: 16px;
        padding: 16px;
        border: 1px solid #c8c8d3;
        -moz-box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
        -webkit-box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
        background: rgb(242, 245, 246); /* Old browsers */
        background: -moz-linear-gradient(top, rgba(242, 245, 246, 1) 0%, rgba(227, 234, 237, 1) 37%, rgba(200, 215, 220, 1) 100%); /* FF3.6+ */
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(242, 245, 246, 1)), color-stop(37%, rgba(227, 234, 237, 1)), color-stop(100%, rgba(200, 215, 220, 1))); /* Chrome,Safari4+ */
        background: -webkit-linear-gradient(top, rgba(242, 245, 246, 1) 0%, rgba(227, 234, 237, 1) 37%, rgba(200, 215, 220, 1) 100%); /* Chrome10+,Safari5.1+ */
        background: -o-linear-gradient(top, rgba(242, 245, 246, 1) 0%, rgba(227, 234, 237, 1) 37%, rgba(200, 215, 220, 1) 100%); /* Opera 11.10+ */
        background: -ms-linear-gradient(top, rgba(242, 245, 246, 1) 0%, rgba(227, 234, 237, 1) 37%, rgba(200, 215, 220, 1) 100%); /* IE10+ */
        background: linear-gradient(to bottom, rgba(242, 245, 246, 1) 0%, rgba(227, 234, 237, 1) 37%, rgba(200, 215, 220, 1) 100%); /* W3C */
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f2f5f6', endColorstr='#c8d7dc', GradientType=0); /* IE6-9 */
    }
    ul.ui-autocomplete{background-color: rgb(243, 241, 229);}
</style>
<script type="text/javascript">
    var insuranceInfo=[];
    var hasInsuranceLimit=false;
    var tlbWrapper = [];
    var tlbService = [];
    var totalRowCount = 0;
    var serviceTableWrapper = [];
    var serviceTableTotalRowCount = 0;
    var serviceTableNotCancelTotalRowCount = 0;
    var hasServiceInLoadingPage;
    var currentFinanceRegistration_id = null;
    var currentDepartment_id = null;
    var currentService_id = null;
    var currentGroup_id = null;
    var paymentable=0;
    var rounded=0;
    var tbdyWeek;
    var sumCost = 0;
    var sumIns = 0;
    var sumTot = 0;
    var sumDiscountAmount = 0;
    $("#clinic-fnc-addToBasket").prop("disabled", true);
    $("#ServiceItem_popup_button").prop("disabled", true);
    $("#clinic-fnc-sendToCash").prop("disabled", true);
    $("#clinic-fnc-finalizeBasket").prop("disabled", true);
    var isReleasedInPage=<%=isReleased%>;
    var isFactorClosedInPage=<%=isFactorClosed%>;
    var roundBaseOn = ${roundBaseOn};
    $(document).ready(function () {
        var patientId = ${patient_id};
        var factorId = ${factor_id};
        var currentDate = "${currentDate}";
        var factorDate = "${factorDate}";
        $('#factorDateForChanging').val(factorDate);
        $('#patient_id').val(patientId);
        $('#factor_id').val(factorId);
        $('#currentDate').val(currentDate);
        $('#factorDate').val(factorDate);
        $('#bill-btn').hide();
        $('#bill-patient-btn').hide();
        $('#bill-detail-btn').show();

        loadPaymentable();
        var requestUrl = "${pageContext.request.contextPath}" + "/clinic/basicInfo/financeRegistration/loadPatient/" + patientId;
        createServiceTable();

        $.getJSON(requestUrl, function (data) {
            $('#patient_name').val(data.name);
            $('#patient_family').val(data.family);
            $('#patient_fileNumber').val(data.fileNumber);
            var isInsuranceDefined = data.isInsuranceDefined;
            $("#isInsuranceDefined").val(isInsuranceDefined);
            if(isInsuranceDefined=="true"){
                $("#insurance_type1_Comb").data("kendoComboBox").value(data.insuranceType1Id);
                $("#insurance_type1").val(data.insuranceType1Id);
//                popUpUrl.val(data.insuranceType1Id);
                $("#insurance_type1_Comb").data("kendoComboBox").enable(false)
            }
            else{
            	<%--$.getJSON("${pageContext.request.contextPath}/clinic/basicInfo/financeRegistration/getActiveInsurance", function (data) {--%>
	                <%--try {--%>
	                    $("#insurance_type1_Comb").data("kendoComboBox").value(1);
	                    $("#insurance_type1").val(1);
                        if($("#insuranceDiv").length>0){
                            $("#insuranceDiv").hide();
                        }
                        if($("#insuranceConfirmDiv").length>0){
                            $("#insuranceConfirmDiv").hide();
                        }
	                <%--} catch (e) {--%>
	                <%--}--%>
            	<%--});--%>

            }
            //if(isInsuranceDefined=="true"){
            //$("#notDefinedDiv").hide();
            //$("#preDefinedDiv").show();
            //$("#insuranceType1Id").val(data.insuranceType1Id);
            //$("#insurance_type1_preDefined").val(data.insuranceType1Name);
            //$("#insuranceNumber_type1_preDefined").val(data.insuranceType1Number);
            //$("#insuranceType2Id").val(data.insuranceType2Id);
            //$("#insurance_type2_preDefined").val(data.insuranceType2Name);
            //$("#insuranceNumber_type2_preDefined").val(data.insuranceType2Number);
            //}else{
            //$("#notDefinedDiv").show();
            //$("#preDefinedDiv").hide();
            //}
        });
        if (!isEditable()) {
            $("#notDefinedDiv").hide();
        }
        <%--if (<%=isCashier%>) {--%>
            drawPosTable();
//        }
    });

    function isEditable() {
        return !($('#currentDate').val() != $('#factorDate').val() && ${isReleasable});
    }

    function callback_DataBound_department_id(e) {
        if (e.sender.dataSource._data.length > 0) {
            var combobox = $("#department_id_Comb").data("kendoComboBox")
            combobox.select(0);
            $("#department_id").val(e.sender.dataSource._data[0].ComboID);
        }
//    $("#payRecipt_Comb").data("kendoComboBox").value(2);
//    $("#payRecipt").val(2);

    }
    function callback_change_service_id(e) {
        var serviceId = e.sender._old;
        var insuranceType1Id = $("#insurance_type1").val();
        var insuranceType2Id = $("#insuranceType2Id").val();
        if ($("#isInsuranceDefined").val() != "true") {
            insuranceType1Id = $("#insurance_type1").val();
            insuranceType2Id = $("#insurance_type2_notDefined").val();
        }
        if (insuranceType1Id == NaN) {
            insuranceType1Id = -1;
        }
        if (insuranceType2Id == NaN || insuranceType2Id == "") {
            insuranceType2Id = -1;
        }
        currentFinanceRegistration_id = null;
        currentService_id=null;
        createItemTable(serviceId, insuranceType1Id, insuranceType2Id);
        /*
         var urlGrid=$("#serviceGrid").data("kendoGrid").dataSource.transport.options.read.url;
         var indexnumber=urlGrid.valueOf().lastIndexOf("grid-read/");
         var subUrlGrid=urlGrid.valueOf().substring(0,indexnumber);
         urlGrid=subUrlGrid.valueOf()+"grid-read/"+serviceId+"/"+insuranceType1Id+"/"+insuranceType2Id;
         $("#serviceGrid").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
         $("#serviceGrid").data("kendoGrid").dataSource.read();
         */
    }

    function fillTableByChangeCombo() {
        if($("#insurance_type1").val()==1){
            if($("#insuranceDiv").length>0){
                $("#insuranceDiv").hide();
            }
            if($("#insuranceConfirmDiv").length>0){
                $("#insuranceConfirmDiv").hide();
            }

        }else{
            if($("#insuranceDiv").length>0){
                $("#insuranceDiv").show();
            }
            if($("#insuranceConfirmDiv").length>0){
                $("#insuranceConfirmDiv").show();
            }
        }
        var serviceId = $("#service_id").val();
        if (serviceId != "") {
            var insuranceType1Id = $("#insurance_type1").val();
            var insuranceType2Id = $("#insuranceType2Id").val();
            if ($("#isInsuranceDefined").val() != "true") {
                insuranceType1Id = $("#insurance_type1").val();
                insuranceType2Id = $("#insurance_type2_notDefined").val();
            }
            if (insuranceType1Id == NaN) {
                insuranceType1Id = -1;
            }
            if (insuranceType2Id == NaN || insuranceType2Id == "") {
                insuranceType2Id = -1;
            }
            currentFinanceRegistration_id = null;
            createItemTable(serviceId, insuranceType1Id, insuranceType2Id);
        }
    }

    function emptyInsuranceData(){
        $("#insuranceBookltPageNumber").val('');
        $("#insuranceBookletPageNumber_txt").val('');
        $("#insuranceBookletSerial").val('');
        $("#insuranceBookletType").val('');
        $("#insuranceBookletType_Comb").data("kendoComboBox").value('');
        $("#prescriptionDate").val('');
        $("#prescriptionValidityDate").val('');
        $("#serviceRequesterMedicalCouncilCode").val('');
    }

    function callback_change_insurance_type1(e) {
        fillTableByChangeCombo();
    }

    function callback_change_insurance_type2_notDefined(e) {
        fillTableByChangeCombo();
    }

    function readingAllRowsFRItems(){
        var items = [];

        var itemIndex = -1;
        for (i = 0; i < totalRowCount; i++) {

            itemIndex++;
            var dataItem = {};

            if(currentService_id!=null && currentService_id!=undefined){
                dataItem.service_id = currentService_id;
            }else{
                dataItem.service_id = $('#service_id').val();
            }

            dataItem.serviceitem_id = tlbWrapper[i].serviceitem_id;
            dataItem.insurance_type1 = $("#insurance_type1").val();
            dataItem.insuranceCost = tlbWrapper[i].insuranceCost;
            dataItem.quantity = tlbWrapper[i].quantityTxt;
            dataItem.insuranceAcceptablePrice = tlbWrapper[i].insuranceAcceptablePrice;
            dataItem.franshiz = tlbWrapper[i].franshiz;
            dataItem.difference = tlbWrapper[i].difference;
            dataItem.insurancePercent = tlbWrapper[i].insurancePercent;
            dataItem.serviceitem_cost = tlbWrapper[i].serviceitem_cost;
            dataItem.insurance_itemType = tlbWrapper[i].insuranceItemType;
            dataItem.isAnesthesiaService = tlbWrapper[i].isAnesthesiaService;
            dataItem.serviceitem_name = tlbWrapper[i].serviceitem_name;
            dataItem.rvu_id = tlbWrapper[i].rvu_id;
            if(this.id.split!=undefined){
                var quantityId =this.id.split('-');
                if(tlbWrapper[quantityId[2]].serviceitem_id==tlbWrapper[i].serviceitem_id){
                    dataItem.isCurrentChange=true;
                }
            }


            items[itemIndex] = dataItem;
        }
        return items;
    }

    function createFinanceRegistrationRow(serviceItemDataItem, sumTot, sumDiscountAmount, sumCost, sumIns, tbdyWeek,addByPopup) {

        var indexOfRow=tlbWrapper.length;
        var tmpRowWrapper = {};
        if (serviceItemDataItem.financeRegistration_id > 0) {
            tmpRowWrapper.id = serviceItemDataItem.financeRegistration_id;
        } else {
            tmpRowWrapper.id = null;
        }
        tmpRowWrapper.serviceitem_id = serviceItemDataItem.serviceitem_id;
        tmpRowWrapper.service_item_cost_id = serviceItemDataItem.service_item_cost_id;
        tmpRowWrapper.rvu_id = serviceItemDataItem.rvu_id;
        tmpRowWrapper.professionalComponent = serviceItemDataItem.professionalPercent;
        tmpRowWrapper.technicalComponent = serviceItemDataItem.technicalPercent;
        tmpRowWrapper.serviceitem_name = serviceItemDataItem.serviceitem_name;
        tmpRowWrapper.serviceitem_cost = serviceItemDataItem.serviceitem_cost;
        tmpRowWrapper.insuranceDiscount = (serviceItemDataItem.serviceitem_cost - serviceItemDataItem.insuranceCost);
        tmpRowWrapper.insuranceCost = serviceItemDataItem.insuranceCost;
        tmpRowWrapper.insurancePercent = serviceItemDataItem.insurancePersent;
        tmpRowWrapper.itemType = serviceItemDataItem.itemType;
        tmpRowWrapper.doctorNameFam = serviceItemDataItem.doctorNameFam;
        tmpRowWrapper.discountLocation = serviceItemDataItem.discountLocation;
       if(serviceItemDataItem.insurancePersent>0){
        // if($("#insurance_type1").val()>1){
            tmpRowWrapper.total = serviceItemDataItem.serviceitem_quantity*serviceItemDataItem.insuranceCost;
        }else{
            tmpRowWrapper.total = serviceItemDataItem.serviceitem_cost_mul_unit;
        }
        tmpRowWrapper.discountPercent = serviceItemDataItem.serviceItem_discountPercent;
        tmpRowWrapper.serviceitem_discountAmount = serviceItemDataItem.serviceitem_discountAmount;
       if(serviceItemDataItem.insurancePersent>0){
        // if($("#insurance_type1").val()>1){
            sumTot +=Math.round(serviceItemDataItem.insuranceCost*serviceItemDataItem.serviceitem_quantity);
        }else{
            sumTot += serviceItemDataItem.serviceitem_cost_mul_unit;
        }
        sumDiscountAmount += serviceItemDataItem.serviceitem_discountAmount;
        tmpRowWrapper.quantityTxt = serviceItemDataItem.serviceitem_quantity;
        tmpRowWrapper.isPrimaryOperation = serviceItemDataItem.isPrimaryOperation;
        tmpRowWrapper.doctor_id = serviceItemDataItem.doctorId;
        tmpRowWrapper.service_item_cost_group_id = serviceItemDataItem.service_item_cost_group_id;
        tmpRowWrapper.service_item_cost_group_bill_id = serviceItemDataItem.service_item_cost_group_bill_id;
        tmpRowWrapper.service_item_cost_group_patient_bill_id = serviceItemDataItem.service_item_cost_group_patient_bill_id;
        tmpRowWrapper.service_item_cost_group_detail_bill_id = serviceItemDataItem.service_item_cost_group_detail_bill_id;
        tmpRowWrapper.isNotShowInPatientBill = serviceItemDataItem.isNotShowInPatientBill;
        tmpRowWrapper.isNotShowInDetailBill = serviceItemDataItem.isNotShowInDetailBill;
        tmpRowWrapper.isNotShowInFishPrint = serviceItemDataItem.isNotShowInFishPrint;
        tmpRowWrapper.isShowAsTree = serviceItemDataItem.isShowAsTree;
        tmpRowWrapper.consumption_slip_goods_id = serviceItemDataItem.consumption_slip_goods_id;
        tmpRowWrapper.insuranceAcceptablePrice = serviceItemDataItem.insuranceAcceptablePrice;
        tmpRowWrapper.franshiz = serviceItemDataItem.franshiz;
        tmpRowWrapper.difference = serviceItemDataItem.difference;
        tmpRowWrapper.allowRemoveEdit = serviceItemDataItem.allowRemoveEdit;
        tmpRowWrapper.insuranceItemType = serviceItemDataItem.insuranceItemType;
        tmpRowWrapper.isAnesthesiaService = serviceItemDataItem.isAnesthesiaService;
        tmpRowWrapper.hasAllowChangeQuantity = serviceItemDataItem.hasAllowChangeQuantity;
        if(serviceItemDataItem.isVariablePercent!=undefined){
            tmpRowWrapper.isVariablePercent = serviceItemDataItem.isVariablePercent;
            tmpRowWrapper.doctorPercentPortion = serviceItemDataItem.doctorPercentPortion;
            tmpRowWrapper.doctorPricePortion = serviceItemDataItem.doctorPricePortion;
            tmpRowWrapper.clinicPricePortion = serviceItemDataItem.clinicPricePortion;
        }
        tmpRowWrapper.professional_ka_id=serviceItemDataItem.professional_ka_id;
        tmpRowWrapper.professional_ka_price=serviceItemDataItem.professional_ka_price;
        tmpRowWrapper.professional_ka_total=serviceItemDataItem.professional_ka_total;
        tmpRowWrapper.professional_ka_price_acceptable_insurance=serviceItemDataItem.professional_ka_price_acceptable_insurance;
        tmpRowWrapper.professional_ka_total_acceptable_insurance=serviceItemDataItem.professional_ka_total_acceptable_insurance;

        tlbWrapper[indexOfRow] = tmpRowWrapper;

        var tr = document.createElement("tr");
        if (indexOfRow % 2 == 0) {
            tr.style.background = "ivory";
        }
        var td1 = document.createElement("td");
        td1.align = 'center';
        td1.appendChild(document.createTextNode(indexOfRow + 1));
        var td2 = document.createElement("td");
        td2.id = 'tbl-' + indexOfRow + '-2-' + serviceItemDataItem.serviceitem_id;
        td2.style.paddingRight = '5px';
        td2.appendChild(document.createTextNode(serviceItemDataItem.serviceitem_name));

        var td2_1 = document.createElement("td");
        td2_1.id = 'tbl-goodsMeasureUnit-' + indexOfRow;
        td2_1.style.paddingRight = '5px';
        if(serviceItemDataItem.goodsMeasureUnit!=null && serviceItemDataItem.goodsMeasureUnit!=undefined){
            td2_1.appendChild(document.createTextNode(serviceItemDataItem.goodsMeasureUnit));
        }

        var td3 = document.createElement("td");
        td3.id = 'tbl-' + indexOfRow + '-3';
        var serjury =<%=isSurgery%>;
        if (!serjury ) {
            td3.style.paddingRight = '5px';
            td3.style.textAlign = 'center';
            td3.appendChild(document.createTextNode(addCommaSeparator(serviceItemDataItem.serviceitem_cost)));
//        } else if(serviceItemDataItem.insurancePersent!=0){
        } else if($("#insurance_type1").val()>1){
            td3.style.paddingRight = '5px';
            td3.style.textAlign = 'center';
            td3.appendChild(document.createTextNode(addCommaSeparator(serviceItemDataItem.insuranceCost)));
        } else {
            var baseAmount_input = document.createElement("input");
            baseAmount_input.className = "uk-width-1-1";
            baseAmount_input.id = 'baseAmount-txt-' + indexOfRow;
            baseAmount_input.type = 'text';
            baseAmount_input.style.textAlign = 'center';
            baseAmount_input.value = addCommaSeparator(serviceItemDataItem.serviceitem_cost);
            if (<%=changeServicePricePermision%> == false || serviceItemDataItem.rvu_id != undefined ) {
                baseAmount_input.readOnly = true;
            }
            if(serviceItemDataItem.doctorPricePortion!=undefined){
//                    doctorPercent=tlbWrapper[local_tbl_row_id].doctorPercentPortion;
                baseAmount_input.readOnly = true;
            }
            if(serviceItemDataItem.allowRemoveEdit==false){
                baseAmount_input.disabled=true;
            }
            baseAmount_input.onkeypress = function (e) {


            }
            baseAmount_input.onkeyup = function (e) {
                var value = this.value.replace(/,/g, '');
                if (!isNumberKey(e)) {
                    var str = (value).toUpperCase();
                    value = str.replace(String.fromCharCode(e.keyCode), "");
                }
                if ((value).length == 0 || isNaN(value)) {
                    value = 0;
                }

                var hasDotLastOfString = false;
                if (value.indexOf('.') + 1 == value.length) {
                    hasDotLastOfString = true;
                }
                value = parseFloat(value);
                if (hasDotLastOfString) {
                    value = value + '.';
                }

                var baseAmountTxtId = this.id.split('-');
                var local_tbl_row_id = baseAmountTxtId[2];
                ;

                var doctor;
                if ($("#dr-select-" + local_tbl_row_id).length == 0) {
                    doctor = tlbWrapper[local_tbl_row_id].doctor_id;
                } else {
                    doctor = $("#dr-select-" + local_tbl_row_id).val();
                }

                var doctorPercent = 0;
                var contractType=0;
                var contractPrice=0;
                if (doctor != -1 && doctor != undefined) {
                    doctorPercent = doctor.split('-')[2];
                    contractType = doctor.split('-')[5];
                    contractPrice = doctor.split('-')[6];
                }
                if(contractType==2 && tlbWrapper[local_tbl_row_id].professionalComponent!=undefined){
                    doctorPercent=doctorPercent*tlbWrapper[local_tbl_row_id].professionalComponent/(tlbWrapper[local_tbl_row_id].quantityTxt).toFixed(0);
                }else if(contractType==3){
                    doctorPercent=contractPrice/Number(tlbWrapper[local_tbl_row_id].total)*100;
                }

                var percentDiscount = tlbWrapper[local_tbl_row_id].discountPercent;
                var discountLocation = $('#discountLocation-select-input-' + local_tbl_row_id).val();

                var tdTotal = document.getElementById('tbl-' + local_tbl_row_id + '-7');
                tlbWrapper[local_tbl_row_id].serviceitem_cost = value;
                tlbWrapper[local_tbl_row_id].total = (value * tlbWrapper[local_tbl_row_id].quantityTxt).toFixed(0);
                tdTotal.innerHTML = tlbWrapper[local_tbl_row_id].total;
                tdTotal.innerHTML = addCommaSeparator(tdTotal.innerHTML);
                var localTotSum = 0;
                var localSumDiscountAmount = 0;
                var txtEleId = this.id.split('-');

                var tdDiscountAmount = document.getElementById('tbl-' + local_tbl_row_id + '-6_1');

                if (discountLocation == undefined) {
                    discountLocation = 1;
                }
                if (discountLocation == 1) {//clinic

                    if(tlbWrapper[local_tbl_row_id].insurancePercent>0){
                        tlbWrapper[local_tbl_row_id].serviceitem_discountAmount = Number(tlbWrapper[local_tbl_row_id].quantityTxt * tlbWrapper[local_tbl_row_id].insuranceCost * (100 - doctorPercent) * percentDiscount / 100 / 100).toFixed(1);
                    }else{
                        tlbWrapper[local_tbl_row_id].serviceitem_discountAmount = Number(tlbWrapper[local_tbl_row_id].quantityTxt * tlbWrapper[local_tbl_row_id].serviceitem_cost * (100 - doctorPercent) * percentDiscount / 100 / 100).toFixed(1);
                    }
                } else if (discountLocation == 2) {//doctor
//
                    if(tlbWrapper[local_tbl_row_id].insurancePercent>0){
                        tlbWrapper[local_tbl_row_id].serviceitem_discountAmount = Number(tlbWrapper[local_tbl_row_id].quantityTxt * tlbWrapper[local_tbl_row_id].insuranceCost * doctorPercent * percentDiscount / 100 / 100).toFixed(1);
                    }else{
                        tlbWrapper[local_tbl_row_id].serviceitem_discountAmount = Number(tlbWrapper[local_tbl_row_id].quantityTxt * tlbWrapper[local_tbl_row_id].serviceitem_cost * doctorPercent * percentDiscount / 100 / 100).toFixed(1);
                    }

                } else if (discountLocation == 3) {//bothOfThem
//
                    if(tlbWrapper[local_tbl_row_id].insurancePercent>0){
                        tlbWrapper[local_tbl_row_id].serviceitem_discountAmount = Number(tlbWrapper[local_tbl_row_id].quantityTxt * tlbWrapper[local_tbl_row_id].insuranceCost * percentDiscount / 100).toFixed(3);
                    }else{
                        tlbWrapper[local_tbl_row_id].serviceitem_discountAmount = Number(tlbWrapper[local_tbl_row_id].quantityTxt * tlbWrapper[local_tbl_row_id].serviceitem_cost * percentDiscount / 100).toFixed(3);
                    }

                }
                if (tdDiscountAmount != null) {
                    tdDiscountAmount.value = tlbWrapper[local_tbl_row_id].serviceitem_discountAmount;
                    tdDiscountAmount.value = addCommaSeparator(tdDiscountAmount.value);
                }

                for (k = 0; k < tlbWrapper.length; k++) {
                    if(tlbWrapper[k].shouldSave==false){
                        continue;
                    }
                    var tdTotalK = document.getElementById('tbl-' + k + '-7');
                    localTotSum += (tlbWrapper[k].total * 1);
                    localSumDiscountAmount += (tlbWrapper[k].serviceitem_discountAmount * 1);
                }

//
                var n= tlbWrapper.length;
                var tdTotalSum = document.getElementById('tbl-' + n + '-7');
//
                tdTotalSum.innerHTML = addCommaSeparator(localTotSum);

                var tdSumDiscountAmount = document.getElementById('tbl-' + n + '-6_1');
                if (tdSumDiscountAmount != null) {
                    tdSumDiscountAmount.innerHTML = addCommaSeparator(localSumDiscountAmount);
                    sumDiscountAmount=localSumDiscountAmount;
                }
                this.value = addCommaSeparator(value);

            }
            td3.appendChild(baseAmount_input);
        }

        sumCost += serviceItemDataItem.serviceitem_cost;

        var td4 = document.createElement("td");
        td4.appendChild(document.createTextNode(serviceItemDataItem.serviceitem_cost - serviceItemDataItem.insuranceCost));
        sumIns += (serviceItemDataItem.serviceitem_cost - serviceItemDataItem.insuranceCost);
        td4.style.paddingRight = '5px';
        td4.id = 'tbl-' + indexOfRow + '-4';
        var td5 = document.createElement("td");
        td5.id = 'tbl-' + indexOfRow + '-5';
        if (serviceItemDataItem.itemType == 2) {
            <%--if(!${factorFNCState}){--%>
//            if (!serviceItemDataItem.doOperation &&  serviceItemDataItem.serviceitem_discountAmount==0) {
//             if (!serviceItemDataItem.doOperation && !serviceItemDataItem.isPrintFactor) {
            if (!serviceItemDataItem.doOperation ) {
                var select_input = document.createElement("select");
                select_input.className = "uk-width-1-1";
                select_input.id = 'dr-select-' + indexOfRow;
                select_input.onchange = function (e) {
                    calculateDisCount(this.id.split('-')[2]);
                    applyIsVariablePercent(e,this.id.split('-')[2]);
                }
                $.ajax({
                    url: "${pageContext.request.contextPath}" + "/clinic/basicInfo/financeRegistration/doctorService/" + serviceItemDataItem.serviceitem_id,
                    type: "GET",
                    serviceItemDataType: "json",
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    success: function (drserviceItemData) {
                        for (j = 0; j < drserviceItemData.length; j++) {
                            var option1 = document.createElement("option");
                            if(drserviceItemData[j].type!=undefined){
                                if(drserviceItemData[j].percent!=undefined) {
                                    option1.value = drserviceItemData[j].id + "-" + drserviceItemData[j].employeeContractId + "-" + drserviceItemData[j].percent + "-"
                                    + drserviceItemData[j].employeeContractItemId + "-" + drserviceItemData[j].isVariablePercent + "-" + drserviceItemData[j].type + "-null";
                                }else{
                                    option1.value = drserviceItemData[j].id + "-" + drserviceItemData[j].employeeContractId + "-"  + "-"
                                    + drserviceItemData[j].employeeContractItemId + "-" + drserviceItemData[j].isVariablePercent + "-" + drserviceItemData[j].type + "-" + drserviceItemData[j].price;
                                }
                            }else{
                                option1.value = drserviceItemData[j].id + "-" + drserviceItemData[j].employeeContractId + "-" + drserviceItemData[j].percent + "-"
                                + drserviceItemData[j].employeeContractItemId+"-"+drserviceItemData[j].isVariablePercent+"-";
                            }
                            option1.text = drserviceItemData[j].fullName;
                            select_input.add(option1);
                        }
                        ;
                    }, error: function (result) {
                        if (result.status == 401) {
                            top.location.href = top.location.href;
                        }
                    }
                });
                td5.appendChild(select_input);
                if (serviceItemDataItem.doctorId != -1) {
                    var options=select_input.options;
                    for(var i=0;i<options.length;i++){
                        var value=options[i].value
                        if(value.split('-')[0]==serviceItemDataItem.doctorId.split('-')[0]){
                            select_input.value=value;
                        }
                    }
                    // select_input.value = serviceItemDataItem.doctorId;
                }
                /*else if(select_input.options!=undefined && select_input.options.length==1){
                    select_input.value=select_input.options[0].value;
                    select_input.dispatchEvent(new Event('change'));
                }*/
            } else {
                td5.appendChild(document.createTextNode(serviceItemDataItem.doctorNameFam));
                td5.style.textAlign="center";
            }
        }


        var td5_1 = document.createElement("td");
        td5_1.id = "quantity-lbl-" + indexOfRow;
        <%--if(!${factorFNCState}){--%>
        var qTxt_input = document.createElement("input");
        qTxt_input.className = "uk-width-1-1";
        qTxt_input.id = 'quantity-txt-' + indexOfRow;
        qTxt_input.type = 'text';
        qTxt_input.style.textAlign = 'center';
        qTxt_input.value = serviceItemDataItem.serviceitem_quantity;
        if(serviceItemDataItem.allowRemoveEdit==false){
            qTxt_input.disabled=true;
        }
        if(serviceItemDataItem.doctorPricePortion ){
//                    doctorPercent=tlbWrapper[local_tbl_row_id].doctorPercentPortion;
            qTxt_input.readOnly = true;
        }


        if(<%=changeQuanityPermision%> ){
            qTxt_input.disabled=false;
        }else{
            if(<%=changeQuanityPermisionBasedOnField%>){
                if(serviceItemDataItem.hasAllowChangeQuantity==false){
                    qTxt_input.disabled=true;
                }else{
                    qTxt_input.disabled=false;
                }
            }else{
                qTxt_input.disabled=true;
            }
        }
        if(serviceItemDataItem.professionalPercent!=undefined && serviceItemDataItem.professionalPercent>0 &&
                    serviceItemDataItem.technicalPercent!=undefined && serviceItemDataItem.technicalPercent>0 && serviceItemDataItem.itemType==2){
            qTxt_input.disabled=true;
        }



        /////

        qTxt_input.onkeypress = function (e) {


        }
        qTxt_input.onkeyup = function (e) {

            if (!isNumberKey(e)) {
                var str = (this.value).toUpperCase();
                this.value = str.replace(String.fromCharCode(e.keyCode), "");
            }
            if ((this.value).length == 0 || isNaN(this.value)) {
                this.value = 0;
            }
            var hasDotLastOfString = false;
            if (this.value.indexOf('.') + 1 == this.value.length) {
                hasDotLastOfString = true;
            }
            this.value = parseFloat(this.value);
            if (hasDotLastOfString) {
                this.value = this.value + '.';
            }

            if($("#insurance_type1").val()==1 || !hasInsuranceLimit) {
              quantityChanging(this);
              return;
            }

            tlbWrapper[this.id.split('-')[2]].quantityTxt = this.value;

            var items=readingAllRowsFRItems();

            var quantity=this;
            var currentServiceNum=0;
            for(var c=0;c<tlbService.length;c++){
               if(!tlbService[c].cancel && tlbService[c].financeRegistration_id==currentFinanceRegistration_id){
                   currentServiceNum++;
                   break
               }else if(!tlbService[c].cancel && tlbService[c].groupId==currentGroup_id){
                   currentServiceNum++;
               }
            }

            for(var w=0;w<insuranceInfo.length;w++){
                items[items.length]=insuranceInfo[w];
            }
            var cFRId=-1;
            if(currentFinanceRegistration_id!=null){
                cFRId=currentFinanceRegistration_id;
            }

            jQuery.ajax({
                url: '<c:url value='/' />' + '/clinic/basicInfo/financeRegistration' + "/quantityChanging/"+currentServiceNum+"/"+$("#factor_id").val()+"/"+cFRId,
                type: "POST",
                data: JSON.stringify(items),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (result) {
//                    if (result.state == "error") {
//                    }
//                    if (result.state == "success") {
//                    }
                    var localTotSum = 0;
                    var localSumDiscountAmount = 0;
                    for(var i=0;i<result.length;i++){
                        for(var j=0;j<tlbWrapper.length;j++){
                            if(result[i].serviceitem_id==tlbWrapper[j].serviceitem_id){

                                tlbWrapper[j].insuranceCost=result[i].insuranceCost;
                                var tdPayableCost = document.getElementById('tbl-' + j + '-3');
                                tdPayableCost.innerHTML=addCommaSeparator(result[i].insuranceCost);

                                tlbWrapper[j].total = (tlbWrapper[j].quantityTxt * tlbWrapper[j].insuranceCost).toFixed(0);
                                var tdTotal = document.getElementById('tbl-' + j + '-7');
                                if (tdTotal != null) {
                                    tdTotal.innerHTML = tlbWrapper[j].total;
                                    tdTotal.innerHTML = addCommaSeparator(tdTotal.innerHTML);
                                }

                                tlbWrapper[j].difference=result[i].difference;
                                tlbWrapper[j].franshiz=result[i].franshiz;

                                tlbWrapper[j].serviceitem_discountAmount=0;

                                document.getElementById('txt-percent-discount-'+j).value=0;

                                tlbWrapper[j].discountPercent='0';
                                document.getElementById('tbl-'+j+'-6_1').value=0;
                                localTotSum += (tlbWrapper[j].total * 1);
                                localSumDiscountAmount += (tlbWrapper[j].serviceitem_discountAmount * 1);
                            }
                        }
                        var n = tlbWrapper.length;
                        var tdTotalSum = document.getElementById('tbl-' + n + '-7');
                        tdTotalSum.innerHTML = addCommaSeparator(localTotSum);

                        var tdSumDiscountAmount = document.getElementById('tbl-' + n + '-6_1');
                        if (tdSumDiscountAmount != null) {
                            tdSumDiscountAmount.value = addCommaSeparator(localSumDiscountAmount);
                        }
                    }
                    quantityChanging(quantity);

                },
                error: function (result) {

                }
            });

            function quantityChanging( quantityTxt) {
                var qTxtEleId = quantityTxt.id.split('-');
                var doctor;
                if ($("#dr-select-" + qTxtEleId[2]).length == 0) {
                    doctor = tlbWrapper[qTxtEleId[2]].doctor_id;
                } else {
                    doctor = $("#dr-select-" + qTxtEleId[2]).val();
                }
                var doctorPercent = 0;
                var contractType = 0;
                var contractPrice = 0;
                if (doctor != -1 && doctor != undefined) {
                    doctorPercent = doctor.split('-')[2];
                    contractType = doctor.split('-')[5];
                    contractPrice = doctor.split('-')[5];
                }
//            if(tlbWrapper[qTxtEleId[2]].isVariablePercent!=undefined && tlbWrapper[qTxtEleId[2]].isVariablePercent){
//                doctorPercent=tlbWrapper[qTxtEleId[2]].doctorPercentPortion;
//            }
                //var percentDiscount=$('#txt-percent-discount-'+qTxtEleId[2]).val(); abbas
                var percentDiscount = tlbWrapper[qTxtEleId[2]].discountPercent;
                var discountLocation = $('#discountLocation-select-input-' + qTxtEleId[2]).val();
                if (contractType == 2 && tlbWrapper[qTxtEleId[2]].professionalComponent != undefined) {
                    doctorPercent = doctorPercent * tlbWrapper[qTxtEleId[2]].professionalComponent / quantityTxt.value;
                } else if (contractType == 3) {
                    doctorPercent = contractPrice / Number(tlbWrapper[qTxtEleId[2]].total) * 100;
                }
                var tdTotal = document.getElementById('tbl-' + qTxtEleId[2] + '-7');
                if (tlbWrapper[qTxtEleId[2]].insurancePercent == 0) {
                    tlbWrapper[qTxtEleId[2]].total = (quantityTxt.value * tlbWrapper[qTxtEleId[2]].serviceitem_cost).toFixed(0);
                } else {
                    tlbWrapper[qTxtEleId[2]].total = (quantityTxt.value * tlbWrapper[qTxtEleId[2]].insuranceCost).toFixed(0);
                }
                if (tdTotal != null) {
                    tdTotal.innerHTML = tlbWrapper[qTxtEleId[2]].total;
                    tdTotal.innerHTML = addCommaSeparator(tdTotal.innerHTML);
                }
                tlbWrapper[qTxtEleId[2]].quantityTxt = quantityTxt.value;
                 calculateDisCount(qTxtEleId[2]);
                var localTotSum = 0;
                // var localSumDiscountAmount = 0;
                // var txtEleId = quantityTxt.id.split('-');
                // var tdDiscountAmount = document.getElementById('tbl-' + qTxtEleId[2] + '-6_1');
                //		     				var tdDiscountAmount=tlbWrapper[qTxtEleId[2]].serviceitem_discountAmount;
                //var tdDiscountPercent=document.getElementById('txt-percent-discount-'+qTxtEleId[2]); abbas
              /*  if (discountLocation == undefined) {
                    discountLocation = 1;
                }
                if (discountLocation == 1) {//clinic
//                tlbWrapper[qTxtEleId[2]].serviceitem_discountAmount = Number(this.value * tlbWrapper[qTxtEleId[2]].serviceitem_cost * (100 - doctorPercent) * percentDiscount / 100 / 100).toFixed(1);
                    if (tlbWrapper[qTxtEleId[2]].insurancePercent == 0) {
                        tlbWrapper[qTxtEleId[2]].serviceitem_discountAmount = Number(quantityTxt.value * tlbWrapper[qTxtEleId[2]].insuranceCost * (100 - doctorPercent) * percentDiscount / 100 / 100).toFixed(1);
                    } else {
                        tlbWrapper[qTxtEleId[2]].serviceitem_discountAmount = Number(quantityTxt.value * tlbWrapper[qTxtEleId[2]].serviceitem_cost * (100 - doctorPercent) * percentDiscount / 100 / 100).toFixed(1);
                    }
                } else if (discountLocation == 2) {//doctor
//                tlbWrapper[qTxtEleId[2]].serviceitem_discountAmount = Number(this.value * tlbWrapper[qTxtEleId[2]].serviceitem_cost * doctorPercent * percentDiscount / 100 / 100).toFixed(1);
                    if (tlbWrapper[qTxtEleId[2]].insurancePercent == 0) {
                        tlbWrapper[qTxtEleId[2]].serviceitem_discountAmount = Number(quantityTxt.value * tlbWrapper[qTxtEleId[2]].insuranceCost * doctorPercent * percentDiscount / 100 / 100).toFixed(1);
                    } else {
                        tlbWrapper[qTxtEleId[2]].serviceitem_discountAmount = Number(quantityTxt.value * tlbWrapper[qTxtEleId[2]].serviceitem_cost * doctorPercent * percentDiscount / 100 / 100).toFixed(1);
                    }
                } else if (discountLocation == 3) {//bothOfThem
//                tlbWrapper[qTxtEleId[2]].serviceitem_discountAmount = Number(this.value * tlbWrapper[qTxtEleId[2]].serviceitem_cost * percentDiscount / 100).toFixed(3);
                    if (tlbWrapper[qTxtEleId[2]].insurancePercent == 0) {
                        tlbWrapper[qTxtEleId[2]].serviceitem_discountAmount = Number(quantityTxt.value * tlbWrapper[qTxtEleId[2]].insuranceCost * percentDiscount / 100).toFixed(3);
                    } else {
                        tlbWrapper[qTxtEleId[2]].serviceitem_discountAmount = Number(quantityTxt.value * tlbWrapper[qTxtEleId[2]].serviceitem_cost * percentDiscount / 100).toFixed(3);
                    }
                }
                if (tdDiscountAmount != null) {
                    tdDiscountAmount.value = tlbWrapper[qTxtEleId[2]].serviceitem_discountAmount;
                    tdDiscountAmount.value = addCommaSeparator(tdDiscountAmount.value);
                }*/
//            var totalRowIndex=0;
                for (k = 0; k < tlbWrapper.length; k++) {
//                if(tlbWrapper[k].shouldSave!=false){
//                    totalRowIndex++;
//                }
                    if (tlbWrapper[k].shouldSave == false) {
                        continue;
                    }
                    var tdTotalK = document.getElementById('tbl-' + k + '-7');
                    localTotSum += (tlbWrapper[k].total * 1);
                    // localSumDiscountAmount += (tlbWrapper[k].serviceitem_discountAmount * 1);
                }
//            var n= document.getElementById('list-table').rows.length-2;
                var n = tlbWrapper.length;
                var tdTotalSum = document.getElementById('tbl-' + n + '-7');
//            sumTot=localTotSum;
                if (tdTotalSum != null) {
                    tdTotalSum.innerHTML = addCommaSeparator(Math.round(localTotSum));
                }
             /*   var tdSumDiscountAmount = document.getElementById('tbl-' + n + '-6_1');
                if (tdSumDiscountAmount != null) {
                    tdSumDiscountAmount.innerHTML = addCommaSeparator(localSumDiscountAmount);
                    sumDiscountAmount = localSumDiscountAmount;
                }*/
            }

        };

        td5_1.appendChild(qTxt_input);
        //				}else{
        //					td5_1.appendChild(document.createTextNode(serviceItemDataItem.serviceitem_quantity));
        //				}


        var td6 = document.createElement("td");
        var txt_input = document.createElement("input");
        txt_input.className = "uk-width-1-1";
        txt_input.id = 'txt-percent-discount-' + indexOfRow;
        txt_input.type = 'text';
        txt_input.style.textAlign = 'center';
        txt_input.value = serviceItemDataItem.serviceItem_discountPercent;
        if(serviceItemDataItem.allowRemoveEdit==false){
            txt_input.disabled=true;
        }
        txt_input.onkeyup = function (e) {
            if (!isNumberKey(e)) {
                var str = (this.value).toUpperCase();
                this.value = str.replace(String.fromCharCode(e.keyCode), "");
            }
            if ((this.value).length == 0 || isNaN(this.value)) {
                this.value = 0;
            }
            var hasDotLastOfString = false;
            if (this.value.indexOf('.') + 1 == this.value.length) {
                hasDotLastOfString = true;
            }
            this.value = parseFloat(this.value);
            if ((this.value) > 100) {
                this.value = 100;
            }
            if (hasDotLastOfString) {
                this.value = this.value + '.';
            }


            var localSumDiscountAmount = 0;
            var txtEleId = this.id.split('-');
            var doctor;
            if ($("#dr-select-" + txtEleId[3]).length == 0) {
                doctor = tlbWrapper[txtEleId[3]].doctor_id;
            } else {
                doctor = $("#dr-select-" + txtEleId[3]).val();
            }

            var doctorPercent = 0;
            var contractType = 0;
            var contractPrice = 0;
            if (doctor != -1 && doctor != undefined) {
                doctorPercent = doctor.split('-')[2];
                contractType = doctor.split('-')[5];
                if(contractType==""){
                    contractType=1;
                }
                contractPrice = doctor.split('-')[6];
            }
            var quantity = $('#quantity-txt-' + txtEleId[3]).val();

            if (quantity == undefined) {
                quantity = $('#quantity-lbl-' + txtEleId[3])[0].innerText;
            }
            var discountLocation = $('#discountLocation-select-input-' + txtEleId[3]).val();

            var tdDiscountAmount = document.getElementById('tbl-' + txtEleId[3] + '-6_1');
            if (discountLocation == undefined) {
                discountLocation = 1;
            }

            //shoro az inja ghabli
            /*if(contractType==2 && tlbWrapper[txtEleId[3]].professionalComponent!=undefined){
                doctorPercent=doctorPercent*tlbWrapper[txtEleId[3]].professionalComponent/quantity;
            }else if(contractType==3){
                doctorPercent=contractPrice/Number(tlbWrapper[txtEleId[3]].total)*100;
            }
            if (discountLocation == 1) {//clinic
                if(tlbWrapper[txtEleId[3]].isVariablePercent!=undefined && tlbWrapper[txtEleId[3]].isVariablePercent && tlbWrapper[txtEleId[3]].clinicPricePortion!=undefined){
                    tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ( tlbWrapper[txtEleId[3]].clinicPricePortion * this.value / 100);
                }else{
                    if( tlbWrapper[txtEleId[3]].insurancePercent>0){
                        tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((quantity * tlbWrapper[txtEleId[3]].insuranceCost) * (100 - doctorPercent) * this.value / 100 / 100);
                    }else{
                        tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((quantity * tlbWrapper[txtEleId[3]].serviceitem_cost) * (100 - doctorPercent) * this.value / 100 / 100);
                    }

                }
//                tlbWrapper[txtEleId[3]].serviceitem_discountAmount = (quantity * tlbWrapper[txtEleId[3]].serviceitem_cost * (100 - doctorPercent) * this.value / 100 / 100);
//                tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((quantity * tlbWrapper[txtEleId[3]].insuranceCost) * (100 - doctorPercent) * this.value / 100 / 100);
            } else if (discountLocation == 2) {//doctor
                if(tlbWrapper[txtEleId[3]].isVariablePercent!=undefined && tlbWrapper[txtEleId[3]].isVariablePercent && tlbWrapper[txtEleId[3]].doctorPricePortion!=undefined){
                    tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ( tlbWrapper[txtEleId[3]].doctorPricePortion * this.value / 100);
                }else{
//                    tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((quantity * tlbWrapper[txtEleId[3]].serviceitem_cost) * doctorPercent * this.value / 100 / 100);
                    if( tlbWrapper[txtEleId[3]].insurancePercent>0){
                        tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((quantity * tlbWrapper[txtEleId[3]].insuranceCost) * doctorPercent * this.value / 100 / 100);
                    }else{
                        tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((quantity * tlbWrapper[txtEleId[3]].serviceitem_cost) * doctorPercent * this.value / 100 / 100);

                    }
                }
//                tlbWrapper[txtEleId[3]].serviceitem_discountAmount = (quantity * tlbWrapper[txtEleId[3]].serviceitem_cost * doctorPercent * this.value / 100 / 100);
//                tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((quantity * tlbWrapper[txtEleId[3]].insuranceCost) * doctorPercent * this.value / 100 / 100);

            } else if (discountLocation == 3) {//bothOfThem
//                tlbWrapper[txtEleId[3]].serviceitem_discountAmount = (quantity * tlbWrapper[txtEleId[3]].serviceitem_cost * this.value / 100);
                if (tlbWrapper[txtEleId[3]].insurancePercent > 0) {
                    tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((quantity * tlbWrapper[txtEleId[3]].insuranceCost) * this.value / 100);
                } else {
                    tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((quantity * tlbWrapper[txtEleId[3]].serviceitem_cost) * this.value / 100);
                }
            }*/
            if (discountLocation == 1 &&tlbWrapper[txtEleId[3]].isVariablePercent != undefined && tlbWrapper[txtEleId[3]].isVariablePercent && tlbWrapper[txtEleId[3]].clinicPricePortion != undefined) {//clinic
                    tlbWrapper[txtEleId[3]].serviceitem_discountAmount = (tlbWrapper[txtEleId[3]].clinicPricePortion * this.value / 100);
            }else if (discountLocation == 2 && tlbWrapper[txtEleId[3]].isVariablePercent != undefined && tlbWrapper[txtEleId[3]].isVariablePercent && tlbWrapper[txtEleId[3]].doctorPricePortion != undefined) {//doctor
                    tlbWrapper[txtEleId[3]].serviceitem_discountAmount = (tlbWrapper[txtEleId[3]].doctorPricePortion * this.value / 100);
            }else{
                if(contractType==1){
                    if(discountLocation==1){//clinic
                        tlbWrapper[txtEleId[3]].serviceitem_discountAmount=Math.round(tlbWrapper[txtEleId[3]].total)*(100-doctorPercent)/100*this.value/100;
                    }else if(discountLocation==2){//doctor
                        tlbWrapper[txtEleId[3]].serviceitem_discountAmount=Math.round(tlbWrapper[txtEleId[3]].total)*(doctorPercent)/100*this.value/100;
                    }else if (discountLocation == 3) {//bothOfThem
                        tlbWrapper[txtEleId[3]].serviceitem_discountAmount =Math.round(tlbWrapper[txtEleId[3]].total) * this.value / 100;
                    }
                }else if(contractType==2){
                    if(discountLocation==1){//clinic
                        if(tlbWrapper[txtEleId[3]].rvu_id!=undefined){
                            if(tlbWrapper[txtEleId[3]].insurancePercent>0){
                                // doctorPercent= tlbWrapper[txtEleId[3]].professional_ka_total_acceptable_insurance* doctorPercent/100;
                                tlbWrapper[txtEleId[3]].serviceitem_discountAmount=
                                    ((Math.round(tlbWrapper[txtEleId[3]].total)-Math.round((tlbWrapper[txtEleId[3]].professional_ka_total-
                                            (tlbWrapper[txtEleId[3]].professional_ka_total_acceptable_insurance*tlbWrapper[txtEleId[3]].insurancePercent/100))*doctorPercent/100 ))*this.value/100);
                            }else{
                                doctorPercent= tlbWrapper[txtEleId[3]].professional_ka_total * doctorPercent/100;
                                tlbWrapper[txtEleId[3]].serviceitem_discountAmount=
                                    ((Math.round(tlbWrapper[txtEleId[3]].total)-Math.round(((100-tlbWrapper[txtEleId[3]].insurancePercent)/100)*doctorPercent))*this.value/100);
                            }
                        }else{
                            tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((Math.round(tlbWrapper[txtEleId[3]].total)) * (100 - doctorPercent) * this.value / 100 / 100);
                        }
                    }else if(discountLocation==2){//doctor
                        if(tlbWrapper[txtEleId[3]].rvu_id!=undefined){
                            if(tlbWrapper[txtEleId[3]].insurancePercent>0){
                                tlbWrapper[txtEleId[3]].serviceitem_discountAmount=
                                    ((Math.round((tlbWrapper[txtEleId[3]].professional_ka_total-
                                        (tlbWrapper[txtEleId[3]].professional_ka_total_acceptable_insurance*tlbWrapper[txtEleId[3]].insurancePercent/100))*doctorPercent/100 ))*this.value/100);
                            }else{
                                doctorPercent= tlbWrapper[txtEleId[3]].professional_ka_total * doctorPercent/100;
                                tlbWrapper[txtEleId[3]].serviceitem_discountAmount=((Math.round(((100-tlbWrapper[txtEleId[3]].insurancePercent)/100)*doctorPercent))*this.value/100);
                            }
                        }else{
                            tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((Math.round(tlbWrapper[txtEleId[3]].total)) * (doctorPercent) * this.value / 100 / 100);
                        }

                    }else if (discountLocation == 3) {//bothOfThem
                        tlbWrapper[txtEleId[3]].serviceitem_discountAmount =Math.round(tlbWrapper[txtEleId[3]].total) * this.value / 100;
                    }
                }else if (contractType==3){
                    var totalFree=Math.round(Math.round(tlbWrapper[txtEleId[3]].serviceitem_cost*tlbWrapper[txtEleId[3]].quantityTxt));
                    if(discountLocation==1){//clinic
                        if(tlbWrapper[txtEleId[3]].insurancePercent>0){
                            tlbWrapper[txtEleId[3]].serviceitem_discountAmount =(tlbWrapper[txtEleId[3]].total*((totalFree-contractPrice)/totalFree) * this.value / 100);
                        }else{
                            tlbWrapper[txtEleId[3]].serviceitem_discountAmount =(tlbWrapper[txtEleId[3]].total*((totalFree-contractPrice)/Math.round(tlbWrapper[txtEleId[3]].total)) * this.value / 100);
                        }

                    }else if(discountLocation==2){//doctor
                        if(tlbWrapper[txtEleId[3]].insurancePercent>0){
                            tlbWrapper[txtEleId[3]].serviceitem_discountAmount =tlbWrapper[txtEleId[3]].total*(contractPrice/Math.round(Math.round(tlbWrapper[txtEleId[3]].serviceitem_cost*tlbWrapper[txtEleId[3]].quantityTxt))) * this.value / 100;
                        }else{
                            tlbWrapper[txtEleId[3]].serviceitem_discountAmount =tlbWrapper[txtEleId[3]].total*(contractPrice/Math.round(tlbWrapper[txtEleId[3]].total)) * this.value / 100;
                        }
                    }else if (discountLocation == 3) {//bothOfThem
                        tlbWrapper[txtEleId[3]].serviceitem_discountAmount =Math.round(tlbWrapper[txtEleId[3]].total) * this.value / 100;
                    }
                }else{
                    tlbWrapper[txtEleId[3]].serviceitem_discountAmount = (( tlbWrapper[txtEleId[3]].total) * (100 - doctorPercent) * this.value / 100 / 100);
                }

            }



            //inja
           /* if(contractType==2 && tlbWrapper[txtEleId[3]].rvu_id!=undefined){
                //inja
                if(tlbWrapper[txtEleId[3]].insurancePercent>0){

                }else{
                    doctorPercent=doctorPercent*tlbWrapper[txtEleId[3]].professional_ka_total/100;
                }
            }else if(contractType==2 && tlbWrapper[txtEleId[3]].professionalComponent!=undefined){
                doctorPercent=doctorPercent*tlbWrapper[txtEleId[3]].professionalComponent/quantity;
            }else if(contractType==3){
                doctorPercent=contractPrice/Number(tlbWrapper[txtEleId[3]].total)*100;
            }
            if (discountLocation == 1) {//clinic
                if(tlbWrapper[txtEleId[3]].isVariablePercent!=undefined && tlbWrapper[txtEleId[3]].isVariablePercent && tlbWrapper[txtEleId[3]].clinicPricePortion!=undefined){
                    tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ( tlbWrapper[txtEleId[3]].clinicPricePortion * this.value / 100);
                }else{
                    if( tlbWrapper[txtEleId[3]].insurancePercent>0){
                        //inja
                        if(tlbWrapper[txtEleId[3]].rvu_id!=undefined){
                            tlbWrapper[txtEleId[3]].serviceitem_discountAmount=
                                ((Math.round(tlbWrapper[txtEleId[3]].total)-Math.round(tlbWrapper[txtEleId[3]].professional_ka_total_acceptable_insurance*((100-tlbWrapper[txtEleId[3]].insurancePercent)/100)*doctorPercent/100))*this.value/100);
                        }else{
                            tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((quantity * tlbWrapper[txtEleId[3]].insuranceCost) * (100 - doctorPercent) * this.value / 100 / 100);
                        }
                    }else{
                        //inja
                        if(tlbWrapper[txtEleId[3]].rvu_id!=undefined){
                            tlbWrapper[txtEleId[3]].serviceitem_discountAmount = Number(tlbWrapper[txtEleId[3]].total - doctorPercent) * this.value / 100 ;
                        }else{
                            tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((quantity * tlbWrapper[txtEleId[3]].serviceitem_cost) * (100 - doctorPercent) * this.value / 100 / 100);
                        }
                    }

                }
            } else if (discountLocation == 2) {//doctor
                if(tlbWrapper[txtEleId[3]].isVariablePercent!=undefined && tlbWrapper[txtEleId[3]].isVariablePercent && tlbWrapper[txtEleId[3]].doctorPricePortion!=undefined){
                    tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ( tlbWrapper[txtEleId[3]].doctorPricePortion * this.value / 100);
                }else{
                    if( tlbWrapper[txtEleId[3]].insurancePercent>0){
                        //inja
                        if(tlbWrapper[txtEleId[3]].rvu_id!=undefined){
                            tlbWrapper[txtEleId[3]].serviceitem_discountAmount=
                                ((Math.round(tlbWrapper[txtEleId[3]].professional_ka_total_acceptable_insurance*((100-tlbWrapper[txtEleId[3]].insurancePercent)/100)*doctorPercent/100))*this.value/100);
                        }else{
                            tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((quantity * tlbWrapper[txtEleId[3]].insuranceCost) * (100 - doctorPercent) * this.value / 100 / 100);
                        }
                    }else{
                        if(tlbWrapper[txtEleId[3]].rvu_id!=undefined){
                            tlbWrapper[txtEleId[3]].serviceitem_discountAmount = Number(doctorPercent) * this.value / 100 ;
                        }else{
                            tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((quantity * tlbWrapper[txtEleId[3]].serviceitem_cost) * (100 - doctorPercent) * this.value / 100 / 100);
                        }
                    }
                }
            } else if (discountLocation == 3) {//bothOfThem
                tlbWrapper[txtEleId[3]].serviceitem_discountAmount =Math.round(tlbWrapper[txtEleId[3]].total) * this.value / 100;
            }*/



            tlbWrapper[txtEleId[3]].serviceitem_discountAmount = Number(tlbWrapper[txtEleId[3]].serviceitem_discountAmount).toFixed(2);
            tlbWrapper[txtEleId[3]].serviceitem_discountAmount = parseInt(tlbWrapper[txtEleId[3]].serviceitem_discountAmount);
            tdDiscountAmount.value = tlbWrapper[txtEleId[3]].serviceitem_discountAmount;
            tdDiscountAmount.value = addCommaSeparator(tdDiscountAmount.value);
            for (k = 0; k < tlbWrapper.length; k++) {
                if(tlbWrapper[k].shouldSave==false){
                    continue;
                }
                localSumDiscountAmount += (tlbWrapper[k].serviceitem_discountAmount * 1);
            }
//            var n= document.getElementById('list-table').rows.length-2;
            var n = tlbWrapper.length ;
            var tdSumDiscountAmount = document.getElementById('tbl-' + n + '-6_1');
            if (tdSumDiscountAmount != null) {
                tdSumDiscountAmount.innerHTML = addCommaSeparator(localSumDiscountAmount);
            }
            tlbWrapper[txtEleId[3]].discountPercent = this.value;
        };

        td6.appendChild(txt_input);

        var td6_0_1 = document.createElement("td");
        if (serviceItemDataItem.itemType == 2) {
            var discount_select_input = document.createElement("select");
            discount_select_input.className = "uk-width-1-1";
            discount_select_input.id = 'discountLocation-select-input-' + indexOfRow;
            discount_select_input.onchange = function (e) {
                calculateDisCount(this.id.split('-')[3])
            }
            $.ajax({
                url: "${pageContext.request.contextPath}" + "/clinic/basicInfo/financeRegistration/discountLocations",
                type: "GET",
                serviceItemDataType: "json",
                async: false,
                contentType: "application/json; charset=utf-8",
                success: function (drserviceItemData) {
                    for (j = 0; j < drserviceItemData.length; j++) {
                        var option2 = document.createElement("option");
                        option2.value = drserviceItemData[j].ComboID;
                        option2.text = drserviceItemData[j].ComboCaption;
                        discount_select_input.add(option2);
                    }
                    ;
                }, error: function (result) {
                    if (result.status == 401) {
                        top.location.href = top.location.href;
                    }
                }
            });
            td6_0_1.appendChild(discount_select_input);
            if (serviceItemDataItem.discountLocation > 0) {
                discount_select_input.value = serviceItemDataItem.discountLocation;
            }
        }

        var td6_1 = document.createElement("td");
        td6_1.id = 'tbl-' + indexOfRow + '-6_1';
        td6_1.style.paddingRight = '5px';
        td6_1.appendChild(document.createTextNode(addCommaSeparator(serviceItemDataItem.serviceitem_discountAmount)));

        var discountAmountTxt_input = document.createElement("input");
        discountAmountTxt_input.className = "uk-width-1-1";
        discountAmountTxt_input.id = 'tbl-' + indexOfRow + '-6_1';
        discountAmountTxt_input.type = 'text';
        discountAmountTxt_input.style.textAlign = 'center';
        //                discountAmountTxt_input.style.direction='ltr';
        discountAmountTxt_input.value = addCommaSeparator(serviceItemDataItem.serviceitem_discountAmount);
        if(serviceItemDataItem.allowRemoveEdit==false){
            discountAmountTxt_input.disabled = true;
        }
        discountAmountTxt_input.onkeyup = function (e) {

            var value = this.value.replace(/,/g, '');
            if (!isNumberKey(e)) {
                var str = (value).toUpperCase();
                value = str.replace(String.fromCharCode(e.keyCode), "");
            }
            if ((value).length == 0 || isNaN(value)) {
                value = 0;
            }
            value = Number(value).toFixed(2);

            value = parseInt(value);
            var txtEleId = this.id.split('-')
            if (tlbWrapper[txtEleId[1]].total < value) {
                this.value = addCommaSeparator(tlbWrapper[txtEleId[1]].serviceitem_discountAmount);
                return;
            }

            var doctor;
            if ($("#dr-select-" + txtEleId[1]).length == 0) {
                doctor = tlbWrapper[txtEleId[1]].doctor_id;
            } else {
                doctor = $("#dr-select-" + txtEleId[1]).val();
            }

            var doctorPercent = 0;
            var contractType = 0;
            var contractPrice=0;
            if (doctor != -1 && doctor != undefined) {
                doctorPercent = doctor.split('-')[2];
                contractType = doctor.split('-')[5];
                if(contractType==""){
                    contractType=1;
                }
                contractPrice = doctor.split('-')[6];
            }
//            if(tlbWrapper[txtEleId[1]].isVariablePercent!=undefined && tlbWrapper[txtEleId[1]].isVariablePercent){
//                doctorPercent=tlbWrapper[txtEleId[1]].doctorPercentPortion;
//            }
            //                    if(doctorPercent==""){
            //                        this.value=addCommaSeparator(tlbWrapper[txtEleId[1]].serviceitem_discountAmount);
            //                        return;
            //                    }
            var quantity = $('#quantity-txt-' + txtEleId[1]).val();

            if (quantity == undefined) {
                quantity = $('#quantity-lbl-' + txtEleId[1])[0].innerText;
            }
            var discountLocation = $('#discountLocation-select-input-' + txtEleId[1]).val();
            //	     				var tdTotal=document.getElementById('tbl-'+txtEleId[3]+'-7');
            //                    var tdDiscountAmount=document.getElementById('tbl-'+txtEleId[3]+'-6_1');
            if (discountLocation == undefined) {
                discountLocation = 3;
            }
            tlbWrapper[txtEleId[1]].serviceitem_discountAmount = value;

            //inja
          /*  if(contractType==2 && tlbWrapper[txtEleId[1]].professionalComponent!=undefined){
                doctorPercent=doctorPercent*tlbWrapper[txtEleId[1]].professionalComponent/quantity;
            }else if(contractType==3){
                doctorPercent=contractPrice/Number(tlbWrapper[txtEleId[1]].total)*100;
            }
            console.log(doctorPercent);
            if (discountLocation == 1) {//clinic
                var clinicPortion=0
                if(tlbWrapper[txtEleId[1]].isVariablePercent!=undefined && tlbWrapper[txtEleId[1]].isVariablePercent && tlbWrapper[txtEleId[1]].clinicPricePortion!=undefined){
                    clinicPortion=tlbWrapper[txtEleId[1]].clinicPricePortion;
                }else{
                    if(tlbWrapper[txtEleId[1]].insurancePercent>0){
                        clinicPortion = quantity * tlbWrapper[txtEleId[1]].insuranceCost * (100 - doctorPercent) / 100;
                    }else{
                        clinicPortion = quantity * tlbWrapper[txtEleId[1]].serviceitem_cost * (100 - doctorPercent) / 100;
                    }
                }
                var disCountAm = (value / clinicPortion * 100);
                tlbWrapper[txtEleId[1]].discountPercent = parseFloat(disCountAm);
                $("#txt-percent-discount-" + txtEleId[1]).val(Number((tlbWrapper[txtEleId[1]].discountPercent).toFixed(2)));
            } else if (discountLocation == 2) {//doctor
                var doctorPortion=0;
                if(tlbWrapper[txtEleId[1]].isVariablePercent!=undefined && tlbWrapper[txtEleId[1]].isVariablePercent && tlbWrapper[txtEleId[1]].doctorPricePortion!=undefined){
                    doctorPortion=tlbWrapper[txtEleId[1]].doctorPricePortion;
                }else{
                    if(tlbWrapper[txtEleId[1]].insurancePercent>0){
                        doctorPortion = quantity * tlbWrapper[txtEleId[1]].insuranceCost * doctorPercent / 100;
                    }else{
                        doctorPortion = quantity * tlbWrapper[txtEleId[1]].serviceitem_cost * doctorPercent / 100;
                    }
                }

                var disCountAm = value / doctorPortion * 100;

                tlbWrapper[txtEleId[1]].discountPercent = parseFloat(disCountAm);
                $("#txt-percent-discount-" + txtEleId[1]).val(Number((tlbWrapper[txtEleId[1]].discountPercent).toFixed(3)));
            } else if (discountLocation == 3) {//bothOfThem
                if(tlbWrapper[txtEleId[1]].insurancePercent>0){
                    tlbWrapper[txtEleId[1]].discountPercent = parseFloat(value / (tlbWrapper[txtEleId[1]].insuranceCost *quantity)* 100);
                }else{
                    tlbWrapper[txtEleId[1]].discountPercent = parseFloat(value / (tlbWrapper[txtEleId[1]].serviceitem_cost *quantity)* 100);
                }
                $("#txt-percent-discount-" + txtEleId[1]).val(Number(tlbWrapper[txtEleId[1]].discountPercent).toFixed(3));
            }*/

            //ta inja

            var disCountAm;
            if (discountLocation == 1 &&tlbWrapper[txtEleId[1]].isVariablePercent != undefined && tlbWrapper[txtEleId[1]].isVariablePercent && tlbWrapper[txtEleId[1]].clinicPricePortion != undefined) {//clinic
                // tlbWrapper[txtEleId[3]].serviceitem_discountAmount = (tlbWrapper[txtEleId[3]].clinicPricePortion * this.value / 100);
                disCountAm=value*100/tlbWrapper[txtEleId[1]].clinicPricePortion;

            }else if (discountLocation == 2 && tlbWrapper[txtEleId[1]].isVariablePercent != undefined && tlbWrapper[txtEleId[1]].isVariablePercent && tlbWrapper[txtEleId[1]].doctorPricePortion != undefined) {//doctor
                // tlbWrapper[txtEleId[3]].serviceitem_discountAmount = (tlbWrapper[txtEleId[3]].doctorPricePortion * this.value / 100);

                disCountAm=value*100/tlbWrapper[txtEleId[1]].doctorPricePortion
            }else{
                if(contractType==1){
                    if(discountLocation==1){//clinic
                        // tlbWrapper[txtEleId[3]].serviceitem_discountAmount=Math.round(tlbWrapper[txtEleId[3]].total)*(100-doctorPercent)/100*this.value/100;

                        disCountAm=value/Math.round(tlbWrapper[txtEleId[1]].total)/(100-doctorPercent)*10000;
                    }else if(discountLocation==2){//doctor
                        // tlbWrapper[txtEleId[3]].serviceitem_discountAmount=Math.round(tlbWrapper[txtEleId[3]].total)*(doctorPercent)/100*this.value/100;

                        disCountAm=value/(Math.round(tlbWrapper[txtEleId[1]].total)*(doctorPercent))*10000;
                    }else if (discountLocation == 3) {//bothOfThem
                        // tlbWrapper[txtEleId[3]].serviceitem_discountAmount =Math.round(tlbWrapper[txtEleId[3]].total) * this.value / 100;

                        disCountAm=value/Math.round(tlbWrapper[txtEleId[1]].total)*100;
                    }
                }else if(contractType==2){
                    if(discountLocation==1){//clinic
                        if(tlbWrapper[txtEleId[1]].rvu_id!=undefined){
                            if(tlbWrapper[txtEleId[1]].insurancePercent>0){
                                // doctorPercent= tlbWrapper[txtEleId[1]].professional_ka_total_acceptable_insurance* doctorPercent/100;
                                disCountAm=value/((Math.round(tlbWrapper[txtEleId[1]].total)-Math.round((tlbWrapper[txtEleId[1]].professional_ka_total-
                                        (tlbWrapper[txtEleId[1]].professional_ka_total_acceptable_insurance*tlbWrapper[txtEleId[1]].insurancePercent/100))*doctorPercent/100 )))*100;
                            }else{
                                doctorPercent= tlbWrapper[txtEleId[1]].professional_ka_total * doctorPercent/100;
                                disCountAm=value/ (Math.round(tlbWrapper[txtEleId[1]].total)-Math.round(((100-tlbWrapper[txtEleId[1]].insurancePercent)/100)*doctorPercent))*100;
                            }
                            // tlbWrapper[txtEleId[3]].serviceitem_discountAmount=
                            //     ((Math.round(tlbWrapper[txtEleId[3]].total)-Math.round(((100-tlbWrapper[txtEleId[3]].insurancePercent)/100)*doctorPercent))*this.value/100);
                        }else{
                            // tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((Math.round(tlbWrapper[txtEleId[3]].total)) * (100 - doctorPercent) * this.value / 100 / 100);

                            disCountAm=value/((Math.round(tlbWrapper[txtEleId[1]].total))* (100 - doctorPercent))*10000;
                        }
                    }else if(discountLocation==2){//doctor
                        if(tlbWrapper[txtEleId[1]].rvu_id!=undefined){
                            if(tlbWrapper[txtEleId[1]].insurancePercent>0){
                                // doctorPercent= tlbWrapper[txtEleId[1]].professional_ka_total_acceptable_insurance* doctorPercent/100;
                                disCountAm=value/((Math.round((tlbWrapper[txtEleId[1]].professional_ka_total-
                                    (tlbWrapper[txtEleId[1]].professional_ka_total_acceptable_insurance*tlbWrapper[txtEleId[1]].insurancePercent/100))*doctorPercent/100 )))*100;
                            }else{
                                doctorPercent= tlbWrapper[txtEleId[1]].professional_ka_total * doctorPercent/100;
                                disCountAm=value/(Math.round(((100-tlbWrapper[txtEleId[1]].insurancePercent)/100)*doctorPercent))*100
                            }
                            // tlbWrapper[txtEleId[3]].serviceitem_discountAmount=((Math.round(((100-tlbWrapper[txtEleId[3]].insurancePercent)/100)*doctorPercent))*this.value/100);
                        }else{
                            // tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((Math.round(tlbWrapper[txtEleId[3]].total)) * (doctorPercent) * this.value / 100 / 100);
                            disCountAm = value/(Math.round(tlbWrapper[txtEleId[1]].total) * doctorPercent)  * 10000;
                        }

                    }else if (discountLocation == 3) {//bothOfThem
                        // tlbWrapper[txtEleId[3]].serviceitem_discountAmount =Math.round(tlbWrapper[txtEleId[3]].total) * this.value / 100;
                        disCountAm =value/ Math.round(tlbWrapper[txtEleId[1]].total) * 100;
                    }
                }else if (contractType==3){
                    var totalFree=Math.round(Math.round(tlbWrapper[txtEleId[1]].serviceitem_cost*tlbWrapper[txtEleId[1]].quantityTxt));
                    if(discountLocation==1){//clinic
                        if(tlbWrapper[txtEleId[1]].insurancePercent>0){
                            // tlbWrapper[txtEleId[3]].serviceitem_discountAmount =(tlbWrapper[txtEleId[3]].total*((totalFree-contractPrice)/totalFree) * this.value / 100);

                            disCountAm=value/(tlbWrapper[txtEleId[1]].total*((totalFree-contractPrice)/totalFree))*100;
                        }else{
                            // tlbWrapper[txtEleId[3]].serviceitem_discountAmount =(tlbWrapper[txtEleId[3]].total*((totalFree-contractPrice)/Math.round(tlbWrapper[txtEleId[3]].total)) * this.value / 100);
                            disCountAm=value/(tlbWrapper[txtEleId[1]].total*((totalFree-contractPrice)/Math.round(tlbWrapper[txtEleId[1]].total)) ) *  100;
                        }

                    }else if(discountLocation==2){//doctor
                        if(tlbWrapper[txtEleId[1]].insurancePercent>0){
                            // tlbWrapper[txtEleId[3]].serviceitem_discountAmount =tlbWrapper[txtEleId[3]].total*(contractPrice/Math.round(Math.round(tlbWrapper[txtEleId[3]].serviceitem_cost*tlbWrapper[txtEleId[3]].quantityTxt))) * this.value / 100;
                            disCountAm=value/(tlbWrapper[txtEleId[1]].total*(contractPrice/Math.round(Math.round(tlbWrapper[txtEleId[1]].serviceitem_cost*tlbWrapper[txtEleId[1]].quantityTxt)))) *100;
                        }else{
                            // tlbWrapper[txtEleId[3]].serviceitem_discountAmount =tlbWrapper[txtEleId[3]].total*(contractPrice/Math.round(tlbWrapper[txtEleId[3]].total)) * this.value / 100;
                            disCountAm = value/(tlbWrapper[txtEleId[1]].total*(contractPrice/Math.round(tlbWrapper[txtEleId[1]].total)) ) * 100;
                        }
                    }else if (discountLocation == 3) {//bothOfThem
                        // tlbWrapper[txtEleId[3]].serviceitem_discountAmount =Math.round(tlbWrapper[txtEleId[3]].total) * this.value / 100;
                        disCountAm =value/ Math.round(tlbWrapper[txtEleId[1]].total) * 100;
                    }
                }else{
                    // tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((quantity * tlbWrapper[txtEleId[3]].insuranceCost) * (100 - doctorPercent) * this.value / 100 / 100);
                    disCountAm =value/ (( tlbWrapper[txtEleId[1]].total) * (100 - doctorPercent) )* 10000;
                }
            }



            tlbWrapper[txtEleId[1]].discountPercent = parseFloat(disCountAm);
            $("#txt-percent-discount-" + txtEleId[1]).val(Number((tlbWrapper[txtEleId[1]].discountPercent).toFixed(2)));
            //ta ina taghir


            var nStr = value;

            nStr += '';
            x = nStr.split('.');
            x1 = x[0];
            x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(x1)) {
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
            }
            this.value = x1 + x2;

            var localSumDiscountAmount = 0;
            for (k = 0; k < tlbWrapper.length; k++) {
                if(tlbWrapper[k].shouldSave==false){
                    continue;
                }
                var tdTotalK = document.getElementById('tbl-' + k + '-7');
                localSumDiscountAmount += (tlbWrapper[k].serviceitem_discountAmount * 1);
            }
//            var n= document.getElementById('list-table').rows.length-2;
            var n = tlbWrapper.length;

            var tdSumDiscountAmount = document.getElementById('tbl-' + n + '-6_1');
            if (tdSumDiscountAmount != null) {
                tdSumDiscountAmount.innerHTML = addCommaSeparator(localSumDiscountAmount);
            }
        }


        var td7 = document.createElement("td");
        td7.id = 'tbl-' + indexOfRow + '-7';
        td7.style.paddingRight = '5px';
        if (serviceItemDataItem.serviceItem_finalCost == undefined) {
           if(serviceItemDataItem.insurancePersent>0) {
            // if($("#insurance_type1").val()>1) {
                td7.appendChild(document.createTextNode(addCommaSeparator(Math.round(serviceItemDataItem.serviceitem_quantity*serviceItemDataItem.insuranceCost))));
            }else{
                td7.appendChild(document.createTextNode(addCommaSeparator(serviceItemDataItem.serviceitem_cost_mul_unit)));
            }
        } else{
            td7.appendChild(document.createTextNode(addCommaSeparator(serviceItemDataItem.serviceItem_finalCost)));
        }
        //sumTot+=serviceItemDataItem.insuranceCost;

        tr.appendChild(td1);
        tr.appendChild(td2);
        tr.appendChild(td2_1);
        if ($("#cashier-user-permission").val() == 1 ||
                $("#finance-user-permission").val() == 1) {
            tr.appendChild(td3);
        }

        if ($("#registration-user-permission").val() == 1) {
            tr.appendChild(td5_1);
            tr.appendChild(td5);
        }
        if ($("#cashier-user-permission").val() == 1) {
            tr.appendChild(td6);
            tr.appendChild(td6_0_1);
            //		        	tr.appendChild(td6_1);
            var td6_0_2 = document.createElement("td");
            td6_0_2.appendChild(discountAmountTxt_input);
            tr.appendChild(td6_0_2);
        }
        if ($("#cashier-user-permission").val() == 1 ||
                $("#finance-user-permission").val() == 1) {
            tr.appendChild(td7);
        }

        var td8 = document.createElement("td");
        td8.setAttribute('style', 'width: 10%');
        td8.align = 'center';
        if(serviceItemDataItem.isPrimaryOperation!=true && serviceItemDataItem.allowRemoveEdit!=false) {
            var image = document.createElement("img");
            image.src = "<c:url value='/resources/images/delete/Actions-button-cancel-icon6.png' />";
            //image.style.width='20px';
            image.id = 'img-delete-serviceitem-' + indexOfRow;
            image.title = '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.remove") %>';
            image.onclick = function () {
                $("#dialogconfirmRemoveServiceItem").data('contents', this).dialog("open");
            };
            image.onmouseover = function () {
                mouseOver(this);
            };
            image.onmouseout = function () {
                mouseOut(this);
            };


//            td8.appendChild(image);


        }
        if(serviceItemDataItem.isVariablePercent && $("#variableEmployeeContractPercent").val()==1) {
            td8.appendChild(createVariablePercentIcon(indexOfRow));
//            $("#baseAmount-txt-"+indexOfRow).attr('readonly', true);
//            $("#quantity-txt-"+indexOfRow).attr('readonly', true);
        }
        tr.appendChild(td8);

        tbdyWeek.appendChild(tr);
        return {
            tmpRowWrapper: tmpRowWrapper,
            sumTot: sumTot,
            sumDiscountAmount: sumDiscountAmount,
            tr: tr,
            td1: td1,
            td2: td2,
            td3: td3,
            baseAmount_input: baseAmount_input,
            sumCost: sumCost,
            td4: td4,
            sumIns: sumIns,
            td5: td5,
            select_input: select_input,
            td5_1: td5_1,
            qTxt_input: qTxt_input,
            td6: td6,
            txt_input: txt_input,
            td6_0_1: td6_0_1,
            discount_select_input: discount_select_input,
            td6_1: td6_1,
            discountAmountTxt_input: discountAmountTxt_input,
            td7: td7
        };
    }


    function createDeleteIcon(indexOfRow){
        var image = document.createElement("img");
        image.src = "<c:url value='/resources/images/delete/Actions-button-cancel-icon6.png' />";
        //image.style.width='20px';
        image.id = 'img-delete-serviceitem-' + indexOfRow;
        image.title = '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.remove") %>';
        image.onclick = function () {
            $("#dialogconfirmRemoveServiceItem").data('contents', this).dialog("open");
        };
        image.onmouseover = function () {
            mouseOver(this);
        };
        image.onmouseout = function () {
            mouseOut(this);
        };
        return image;
    }

    function drawTable_serviceItem(serviceItemData) {

        totalRowCount = serviceItemData.length;
        deleteRow('list-table');
        tlbWrapper = [];
        var tbl = document.getElementById('list-table');
        tbdyWeek = document.createElement('tbody');
        var nEmptyList = true;
        try {
            nEmptyList = !serviceItemData[0].empty;
        } catch (e) {
            nEmptyList = true;
        }
        var tr = document.createElement("tr");
        tr.style.background = 'linear-gradient(to bottom, rgba(177, 205, 240, 1) 29%,rgba(167, 199, 237, 1) 33%,rgba(95, 132, 173, 1) 100%)';
        var th1 = document.createElement("th");
        th1.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("global.row") %>'));
        th1.setAttribute('style', 'width: 5%');
        var th2 = document.createElement("th");
        th2.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.serviceItem") %>'));
        th2.setAttribute('style', 'width: 20%');
        var th2_1 = document.createElement("th");
        th2_1.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.measureUnit") %>'));
        th2_1.setAttribute('style', 'width: 7%');
        var th3 = document.createElement("th");
        th3.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.originalCost") %>'));
        th3.setAttribute('style', 'width: 10%');
        var th4 = document.createElement("th");
        th4.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.insuranceCost") %>'));
        th4.setAttribute('style', 'width: 15%');
        var th5 = document.createElement("th");
        th5.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.doctor") %>'));
        th5.setAttribute('style', 'width: 17%');
        var th5_1 = document.createElement("th");
        th5_1.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.unit") %>'));
        th5_1.setAttribute('style', 'width: 5%');

        var th6 = document.createElement("th");
        th6.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.offPercent")%>'));
        th6.setAttribute('style', 'width: 7%');

        var th6_0_1 = document.createElement("th");
        th6_0_1.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.discountLocation")%>'));
        th6_0_1.setAttribute('style', 'width: 10%');


        var th6_1 = document.createElement("th");
        th6_1.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.discountAmount")%>'));
        th6_1.setAttribute('style', 'width: 7%');

        var th7 = document.createElement("th");
        th7.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.amount")%>'));
        th7.setAttribute('style', 'width: 10%');

        var th8 = document.createElement("th");
        <%--th8.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.amount")%>'));--%>
        th8.setAttribute('style', 'width: 15%');

        tr.appendChild(th1);
        tr.appendChild(th2);
        tr.appendChild(th2_1);

        if ($("#cashier-user-permission").val() == 1 ||
                $("#finance-user-permission").val() == 1) {
            tr.appendChild(th3);
        }

        if ($("#registration-user-permission").val() == 1) {
            tr.appendChild(th5_1);
            tr.appendChild(th5);

        }
        if ($("#cashier-user-permission").val() == 1) {
            tr.appendChild(th6);
            tr.appendChild(th6_0_1);
            tr.appendChild(th6_1);

        }
        if ($("#cashier-user-permission").val() == 1 ||
                $("#finance-user-permission").val() == 1) {
            tr.appendChild(th7);
        }

        if(totalRowCount>1){
            tr.appendChild(th8);
        }
        tbdyWeek.appendChild(tr);

        sumCost = 0;
        sumIns = 0;
        sumTot = 0;
        sumDiscountAmount = 0;


        if (nEmptyList) {
            if (serviceItemData.length > 0) {
                if(serviceItemData[0].appointmentMongo_id!=undefined){
                    $("#appointmentMongo_id").val(serviceItemData[0].appointmentMongo_id);
                }
                if(!isReleasedInPage){
                    $("#clinic-fnc-addToBasket").prop("disabled", false);
                    $("#ServiceItem_popup_button").prop("disabled", false);
                }
                if( isFactorClosedInPage){
                    $("#clinic-fnc-addToBasket").prop("disabled", true);
                    $("#ServiceItem_popup_button").prop("disabled", true);
                }
                if(serviceItemData[0].group_id!=undefined){
                    currentGroup_id=serviceItemData[0].group_id;
                }
            }
            for (i = 0; i < serviceItemData.length; i++) {
                var __ret = createFinanceRegistrationRow(serviceItemData[i], sumTot, sumDiscountAmount, sumCost, sumIns, tbdyWeek);
                var tmpRowWrapper = __ret.tmpRowWrapper;
                sumTot = __ret.sumTot;
                sumDiscountAmount = __ret.sumDiscountAmount;
                var tr = __ret.tr;
                var td1 = __ret.td1;
                var td2 = __ret.td2;
                var td3 = __ret.td3;
                var baseAmount_input = __ret.baseAmount_input;
                sumCost = __ret.sumCost;
                var td4 = __ret.td4;
                sumIns = __ret.sumIns;
                var td5 = __ret.td5;
                var select_input = __ret.select_input;
                var td5_1 = __ret.td5_1;
                var qTxt_input = __ret.qTxt_input;
                var td6 = __ret.td6;
                var txt_input = __ret.txt_input;
                var td6_0_1 = __ret.td6_0_1;
                var discount_select_input = __ret.discount_select_input;
                var td6_1 = __ret.td6_1;
                var discountAmountTxt_input = __ret.discountAmountTxt_input;
                var td7 = __ret.td7;
            }
            i--;
            ;
        }
        ;
        if (nEmptyList) {
            var tr = document.createElement("tr");
            tr.style.background = '-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(126,133,144,1)), color-stop(49%,rgba(40,49,67,1)), color-stop(50%,rgba(19,30,50,1)), color-stop(100%,rgba(3,14,35,1)))';
            tr.style.color = '#ffffff';

            var td1 = document.createElement("td");
            var td2 = document.createElement("td");
            var td2_1 = document.createElement("td");
            var td3 = document.createElement("td");
            td3.id = 'tbl-' + serviceItemData.length + '-3';
            td3.style.paddingRight = '5px';
            //td3.appendChild(document.createTextNode(addCommaSeparator(sumCost)));
            var td4 = document.createElement("td");
            td4.appendChild(document.createTextNode(addCommaSeparator(sumIns)));
            td4.style.paddingRight = '5px';
            td4.id = 'tbl-' + serviceItemData.length + '-4';
            var td5 = document.createElement("td");
            var td5_1 = document.createElement("td");
            var td6 = document.createElement("td");
            var td6_0_1 = document.createElement("td");
            var td6_1 = document.createElement("td");
            td6_1.id = 'tbl-' + serviceItemData.length + '-6_1';
            td6_1.appendChild(document.createTextNode(addCommaSeparator(sumDiscountAmount)));

            var td7 = document.createElement("td");
            td7.id = 'tbl-' + serviceItemData.length + '-7';
            td7.style.paddingRight = '5px';
            td7.appendChild(document.createTextNode(addCommaSeparator(sumTot)));

            tr.appendChild(td1);
            tr.appendChild(td2);
            tr.appendChild(td2_1);
            if ($("#cashier-user-permission").val() == 1 ||
                    $("#finance-user-permission").val() == 1) {
                tr.appendChild(td3);
            }

            if ($("#registration-user-permission").val() == 1) {
                tr.appendChild(td5_1);
                tr.appendChild(td5);
            }
            if ($("#cashier-user-permission").val() == 1) {
                tr.appendChild(td6);
                tr.appendChild(td6_0_1);
                tr.appendChild(td6_1);

            }
            if ($("#cashier-user-permission").val() == 1 ||
                    $("#finance-user-permission").val() == 1) {
                tr.appendChild(td7);
            }
            tbdyWeek.appendChild(tr);
        }
        ;
        tbl.appendChild(tbdyWeek);

        appendTextSearchListTable();

    }

    function appendTextSearchListTable(){

        $( "#search-list-table").val('');
        var searchItems=[];
        if(tlbWrapper.length>0){
           for(var i=0;i<tlbWrapper.length;i++){
               if(tlbWrapper[i].shouldSave != false){
                   searchItems[searchItems.length]=tlbWrapper[i].serviceitem_name;
               }
           }
        }
        $( "#search-list-table" ).autocomplete({
            source: searchItems,
            minLength: 0,
            select: function( event, ui ) {
                console.log(ui.item.label);
                var foundId=$("td").filter(function () {
                    return $(this).text() == ui.item.label;
                })[0].id;
                $('html,body').animate({
                            scrollTop: $("#"+foundId).offset().top},
                        'slow');
//                $("#"+ui.item.id).children().css('background-color','rgb(166,180,71);');
            }
        });

    }

    function applyIsVariablePercent(e,rowIndex){

        var isPrimaryOperation=tlbWrapper[rowIndex].isPrimaryOperation;
        var td8 = document.createElement("td");
        td8.setAttribute('style', 'width: 10%');
        td8.align = 'center';
        if(e.currentTarget.parentElement.parentElement.childNodes.length>10){
            e.currentTarget.parentElement.parentElement.childNodes[10].remove();
        }
        var doctor=$("#dr-select-" + rowIndex).val();
        var isVariablePercent=doctor.split('-')[4];
        if(isVariablePercent=="true" && $("#variableEmployeeContractPercent").val()==1){
            td8.appendChild(createVariablePercentIcon(rowIndex));
        }else{
            tlbWrapper[rowIndex].isVariablePercent=false;
            $("#baseAmount-txt-"+rowIndex).attr('readonly', false);
            $("#quantity-txt-"+rowIndex).attr('readonly', false);
        }
        if (<%=changeServicePricePermision%> == false) {
            $("#baseAmount-txt-"+rowIndex).attr('readonly', true);
        }



        if(!isPrimaryOperation){
            if(tlbWrapper[rowIndex].allowRemoveEdit!=false){
                // td8.appendChild(createDeleteIcon(rowIndex));
            }
        }
        e.currentTarget.parentElement.parentElement.appendChild(td8);
    }

    function createVariablePercentIcon(rowIndex){
        var variablePercentImage = document.createElement("img");
        <%--variablePercentImage.src = "<c:url value='/resources/images/surgeon-icon-32.png' />";--%>
        variablePercentImage.src = "<c:url value='/resources/images/edit/999.png' />";

        variablePercentImage.id = rowIndex;
        variablePercentImage.title = '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.variablePercent") %>';
        variablePercentImage.onclick = function () {
//            rvuModifiedCodeApplyInfoPopup(this.id);
            var rowEntity=tlbWrapper[this.id];
            if(rowEntity.isVariablePercent!=undefined && rowEntity.isVariablePercent && rowEntity.doctorPricePortion!=undefined){
                rowEntity.isVariablePercent=true;
                $("#totalAmount").val(Math.round(rowEntity.total));
                $("#totalAmount_txt").val(Math.round(rowEntity.total));
                $("#doctorPercentPortion").val(rowEntity.doctorPercentPortion);
                $("#doctorPercentPortion_txt").val(rowEntity.doctorPercentPortion);
                $("#doctorPricePortion").val(rowEntity.doctorPricePortion);
                $("#doctorPricePortion_txt").val(rowEntity.doctorPricePortion);
                $("#clinicPricePortion").val(rowEntity.clinicPricePortion);
                $("#clinicPricePortion_txt").val(rowEntity.clinicPricePortion);
                $("#baseAmount-txt-"+this.id).attr('readonly', true);
                $("#quantity-txt-"+this.id).attr('readonly', true);
            }else{
                settingDefaultDoctorPercent(this.id);
//                var doctor=$("#dr-select-"+this.id).val();
//                var doctorPercentPortion=doctor.split("-")[2];
//                var doctorPricePortion=doctorPercentPortion*tlbWrapper[this.id].total/100;
//                var clinicPricePortion=rowEntity.total-doctorPricePortion;
//                $("#doctorPercentPortion").val(doctorPercentPortion);
//                $("#doctorPercentPortion_txt").val(doctorPercentPortion);
//                $("#doctorPricePortion").val(doctorPricePortion);
//                $("#doctorPricePortion_txt").val(doctorPricePortion);
//                $("#clinicPricePortion").val(clinicPricePortion);
//                $("#clinicPricePortion_txt").val(clinicPricePortion);
            }

            $("#rowIndex").val(this.id);
            setNumericTextValue();
            $("#modals-variablePercentDataPopup").dialog('open');
        };
        variablePercentImage.onmouseover = function () {
            mouseOver(this);
        };
        variablePercentImage.onmouseout = function () {
            mouseOut(this);
        };
        return   variablePercentImage;
    }

    function settingDefaultDoctorPercent(rowNumber){
        var rowEntity = tlbWrapper[rowNumber];

        var doctor;
        if ($("#dr-select-" + rowNumber).length == 0) {
            doctor = rowEntity.doctor_id;
        } else {
            doctor = $("#dr-select-" + rowNumber).val();
        }

        // var doctorPercent = doctor.split('-')[2];
        var contractType = doctor.split('-')[5];
        var contractPrice = doctor.split('-')[6];

        // var doctor=$("#dr-select-"+rowNumber).val();
        var doctorPercentPortion = doctor.split("-")[2];
        var basicServiceItem;
        var doctorPricePortion;
        var clinicPricePortion;
        //inja
        /*  if( rowEntity.insurancePercent>0){
              basicServiceItem=rowEntity.insuranceCost;
          }else{
              basicServiceItem=rowEntity.serviceitem_cost;
          }

          if(contractType==2 && rowEntity.professionalComponent!=undefined){
              doctorPricePortion=Math.round(rowEntity.professionalComponent*basicServiceItem*doctorPercentPortion/100);
              clinicPricePortion=Math.round(rowEntity.total-doctorPricePortion);
              doctorPercentPortion=doctorPricePortion/rowEntity.total*100;
          }else if(contractType==3){
              doctorPricePortion=contractPrice;
              clinicPricePortion=Math.round(rowEntity.total-doctorPricePortion);
              doctorPercentPortion=doctorPricePortion/rowEntity.total*100;
          }else{
              doctorPricePortion=Math.round(doctorPercentPortion*tlbWrapper[rowNumber].total/100);
              clinicPricePortion=Math.round(rowEntity.total-doctorPricePortion);
          }*/

        if(contractType==2){
            if(tlbWrapper[rowNumber].rvu_id!=undefined){
                if(tlbWrapper[rowNumber].insurancePercent>0){
                    // doctorPercentPortion= tlbWrapper[rowNumber].professional_ka_total_acceptable_insurance* doctorPercentPortion/100;

                    doctorPricePortion=(tlbWrapper[rowNumber].professional_ka_total-
                            (tlbWrapper[rowNumber].professional_ka_total_acceptable_insurance*tlbWrapper[rowNumber].insurancePercent/100))*doctorPercentPortion/100;
                    clinicPricePortion=(Math.round(tlbWrapper[rowNumber].total)-doctorPricePortion);
                }else{
                    doctorPercentPortion= tlbWrapper[rowNumber].professional_ka_total * doctorPercentPortion/100;
                    doctorPricePortion =((Math.round(((100-tlbWrapper[rowNumber].insurancePercent)/100)*doctorPercentPortion)));
                    clinicPricePortion=((Math.round(tlbWrapper[rowNumber].total)-Math.round(((100-tlbWrapper[rowNumber].insurancePercent)/100)*doctorPercentPortion)));
                }
            }else{
                doctorPricePortion = ((Math.round(tlbWrapper[rowNumber].total)) * (doctorPercentPortion) / 100);
                clinicPricePortion = ((Math.round(tlbWrapper[rowNumber].total)) * (100 - doctorPercentPortion) / 100);
            }
        }else if(contractType==3){

            var totalFree = Math.round(Math.round(tlbWrapper[rowNumber].serviceitem_cost * tlbWrapper[rowNumber].quantityTxt));
            if (tlbWrapper[rowNumber].insurancePercent > 0) {
                clinicPricePortion = Math.round(tlbWrapper[rowNumber].total * ((totalFree - contractPrice) / totalFree));
                doctorPricePortion = Math.round(tlbWrapper[rowNumber].total * (contractPrice / Math.round(Math.round(tlbWrapper[rowNumber].serviceitem_cost * tlbWrapper[rowNumber].quantityTxt))));
            } else {
                clinicPricePortion = Math.round(tlbWrapper[rowNumber].total * ((totalFree - contractPrice) / Math.round(tlbWrapper[rowNumber].total)));
                doctorPricePortion = Math.round(tlbWrapper[rowNumber].total * (contractPrice / Math.round(tlbWrapper[rowNumber].total)));
            }

        }else{
            doctorPricePortion= Math.round(tlbWrapper[rowNumber].total)*(doctorPercentPortion)/100;
            clinicPricePortion= Math.round(tlbWrapper[rowNumber].total)*(100-doctorPercentPortion)/100;
        }
        doctorPercentPortion=doctorPricePortion/rowEntity.total*100;


        $("#doctorPercentPortion").val(doctorPercentPortion);
        $("#doctorPercentPortion_txt").val(doctorPercentPortion);
        $("#doctorPricePortion").val(doctorPricePortion);
        $("#doctorPricePortion_txt").val(doctorPricePortion);
        $("#clinicPricePortion").val(clinicPricePortion);
        $("#clinicPricePortion_txt").val(clinicPricePortion);
        $("#totalAmount").val(Math.round(rowEntity.total));
        $("#totalAmount_txt").val(Math.round(rowEntity.total));
        rowEntity.isVariablePercent = false;
        $("#baseAmount-txt-" + rowNumber).attr('readonly', false);
        $("#quantity-txt-" + rowNumber).attr('readonly', false);
        setNumericTextValue();

    }

    $("#modals-variablePercentDataPopup").dialog({
        modal : true,
        autoOpen: false,
        width: 800,
        buttons:{
            "<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.save") %>":function () {
                var dialog = $(this);
                var rowIndex=$("#rowIndex").val();
//                var drSelectValue=$("#dr-select-"+rowIndex).val();
//                var drSelectValueSplit=drSelectValue.split("-");
//
//                drSelectValue=drSelectValueSplit[0]+"-"+drSelectValueSplit[1]+"-"+$("#doctorPercentPortion").val()+"-"+drSelectValueSplit[3]+"-"+drSelectValueSplit[4];

                if(tlbWrapper[rowIndex].discountPercent>0){
                    alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.variablePercent.error.discountShouldBeZero") %>");
                    return;
                }
                if(isFactorClosedInPage ){
                    alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.error.closed") %>");
                    return;
                }
                if(isReleasedInPage ){
                    alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.alert.notAllowChangingReleased") %>");
                    return;
                }
                if(tlbWrapper[rowIndex].isVariablePercent!=undefined && tlbWrapper[rowIndex].isVariablePercent){
                    $("#baseAmount-txt-"+rowIndex).attr('readonly', true);
                    $("#quantity-txt-"+rowIndex).attr('readonly', true);
                }else{
                    $("#baseAmount-txt-"+rowIndex).attr('readonly', false);
                    $("#quantity-txt-"+rowIndex).attr('readonly', false);
                }
                tlbWrapper[rowIndex].doctorPercentPortion=$("#doctorPercentPortion").val();
                tlbWrapper[rowIndex].doctorPricePortion=$("#doctorPricePortion").val();
                tlbWrapper[rowIndex].clinicPricePortion=$("#clinicPricePortion").val();

//                totalAmount = $("#totalAmount").val();
//                doctorPercentPortion = $("#doctorPercentPortion").val();
//                doctorPricePortion = $("#doctorPricePortion").val();
//                clinicPricePortion = $("#clinicPricePortion").val();


                alertify.success("Operation successfull");
                dialog.dialog("close");

            },
            "<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.variablePercent.default") %>":function () {
                if(isFactorClosedInPage ){
                    alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.error.closed") %>");
                    return;
                }
                if(isReleasedInPage ){
                    alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.alert.notAllowChangingReleased") %>");
                    return;
                }
                var rowIndex=$("#rowIndex").val();
                if(tlbWrapper[rowIndex].discountPercent>0){
                    alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.variablePercent.error.discountShouldBeZero") %>");
                    return;
                }
                settingDefaultDoctorPercent($("#rowIndex").val());
            },
            "<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.close") %>":function () {
                var rowIndex=$("#rowIndex").val();
                if(
                    // tlbWrapper[i].isVariablePercent!=undefined || tlbWrapper[i].isVariablePercent &&
                    tlbWrapper[rowIndex].doctorPercentPortion==undefined ||
                    tlbWrapper[rowIndex].doctorPricePortion==undefined ||
                    tlbWrapper[rowIndex].clinicPricePortion==undefined){
                        tlbWrapper[rowIndex].isVariablePercent=undefined;
                }
                $(this).dialog("close");
            }
        }
    });

    $("#modals-changingDateFinanceRegistrationDataPopup").dialog({
        modal : true,
        autoOpen: false,
        width: 800,
        buttons:{
            "<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.save") %>":function () {
                var dialog = $(this);
                var financeRegistrationId=$("#financeRegistrationId").val();
                var financeRegistrationDate=$("#financeRegistrationDate").val();

                var tmp = {};
                tmp.id=financeRegistrationId;
                tmp.date=financeRegistrationDate;
                tmp.realDate=financeRegistrationDate;
                var image=$(this).data('image');

                jQuery.ajax ({
                    url: '<%=request.getContextPath()%>'+'/clinic/basicInfo/financeRegistration/updateDateFinanceRegistration',
                    type: "POST",
                    data: JSON.stringify(tmp),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function(result){
                        if(result.state == "error"){
                            for(var i=0; i<result.errors.length; i++){
                                if($("label[for='"+ result.errors[i].Field + "']").text().length>0){
                                    alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                                }else{
                                    alertify.error( result.errors[i].Field + ":  " +  result.errors[i].Message);
                                }
                            }
                        }
                        if(result.state == "success"){
                            image.id='changingDateFinanceRegistration-' + financeRegistrationId+'-'+financeRegistrationDate;
                            alertify.success(result.message);


                        }
                    },
                    error:function(result){
//                        console.log(result);
                        if(result.status==401){
                            window.location.href="";
                        }
                    }
                });

                dialog.dialog("close");

            },
            "<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.close") %>":function () {
                $(this).dialog("close");
            }
        }
    });

    $("#modals-changingDateFactorPaymentDataPopup").dialog({
        modal : true,
        autoOpen: false,
        width: 800,
        buttons:{
            "<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.save") %>":function () {
                var dialog = $(this);
                var factorPaymentId=$("#factorPaymentId").val();
                var factorPaymentDate=$("#factorPaymentDate").val();

                var tmp = {};
                tmp.id=factorPaymentId;
                tmp.date=factorPaymentDate;
                tmp.realDate=factorPaymentDate;
                var image=$(this).data('image');

                jQuery.ajax ({
                    url: '<%=request.getContextPath()%>'+'/clinic/basicInfo/financeRegistration/updateDateFactorPayment',
                    type: "POST",
                    data: JSON.stringify(tmp),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function(result){
                        if(result.state == "error"){
                            for(var i=0; i<result.errors.length; i++){
                                if($("label[for='"+ result.errors[i].Field + "']").text().length>0){
                                    alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                                }else{
                                    alertify.error( result.errors[i].Field + ":  " +  result.errors[i].Message);
                                }
                            }
                        }
                        if(result.state == "success"){
                            image.id='changingDateFactorPayment-' + factorPaymentId+'-'+factorPaymentDate;
                            alertify.success(result.message);


                        }
                    },
                    error:function(result){
//                        console.log(result);
                        if(result.status==401){
                            window.location.href="";
                        }
                    }
                });

                dialog.dialog("close");

            },
            "<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.close") %>":function () {
                $(this).dialog("close");
            }
        }
    });

    $("#modals-changingDateFactorDataPopup").dialog({
        modal : true,
        autoOpen: false,
        width: 800,
        buttons:{
            "<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.save") %>":function () {
                var dialog = $(this);
                var factorId=$("#factor_id").val();
                var factorDate=$("#factorDateForChanging").val();

                var tmp = {};
                tmp.id=factorId;
                tmp.date=factorDate;
                tmp.realDate=factorDate;
                var image=$(this).data('image');

                jQuery.ajax ({
                    url: '<%=request.getContextPath()%>'+'/clinic/basicInfo/financeRegistration/updateDateFactor',
                    type: "POST",
                    data: JSON.stringify(tmp),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function(result){
                        if(result.state == "error"){
                            for(var i=0; i<result.errors.length; i++){
                                if($("label[for='"+ result.errors[i].Field + "']").text().length>0){
                                    alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                                }else{
                                    alertify.error( result.errors[i].Field + ":  " +  result.errors[i].Message);
                                }
                            }
                        }
                        if(result.state == "success"){
                            alertify.success(result.message);


                        }
                    },
                    error:function(result){
//                        console.log(result);
                        if(result.status==401){
                            window.location.href="";
                        }
                    }
                });

                dialog.dialog("close");

            },
            "<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.close") %>":function () {
                $(this).dialog("close");
            }
        }
    });

    function changingDoctorPercentPortion(e){
        tlbWrapper[$("#rowIndex").val()].isVariablePercent=true;
        var value = $("#doctorPercentPortion").val().replace(/,/g, '');
        if (!isNumberKey(e)) {
            var str = (value).toUpperCase();
            value = str.replace(String.fromCharCode(e.keyCode), "");
        }
        if(value>100){
            value=100;
        }
        if ((value).length == 0 || isNaN(value)) {
            value=0;
        }
        $("#doctorPercentPortion").val(parseFloat(value));
        $("#doctorPercentPortion_txt").val(parseFloat(value));

        var totalAmount = $("#totalAmount").val();
        var doctorPercentPortion = $("#doctorPercentPortion").val();
        $("#doctorPricePortion").val(Math.round(totalAmount*doctorPercentPortion/100));
        $("#doctorPricePortion_txt").val(Math.round(totalAmount*doctorPercentPortion/100));
        $("#clinicPricePortion").val(Math.round(totalAmount-totalAmount*doctorPercentPortion/100));
        $("#clinicPricePortion_txt").val(Math.round(totalAmount-totalAmount*doctorPercentPortion/100));
        setNumericTextValue();
    }

    function changingDoctorPricePortion(e){
        tlbWrapper[$("#rowIndex").val()].isVariablePercent=true;
        var value = $("#doctorPricePortion").val().replace(/,/g, '');
        var totalAmount = $("#totalAmount").val();
        if (!isNumberKey(e)) {
            var str = (value).toUpperCase();
            value = str.replace(String.fromCharCode(e.keyCode), "");
        }
        if ((value).length == 0 || isNaN(value)) {
            value=0;
        }
        if(parseInt(value)>parseInt(totalAmount)){
            value=totalAmount;
        }
        $("#doctorPricePortion").val(parseInt(value));
        $("#doctorPricePortion_txt").val(parseInt(value));

        $("#doctorPercentPortion").val(value/totalAmount*100);
        $("#doctorPercentPortion_txt").val(value/totalAmount*100);
        $("#clinicPricePortion").val(totalAmount-value);
        $("#clinicPricePortion_txt").val(totalAmount-value);
        setNumericTextValue();
    }

    function changingClinicPricePortion(e){
        tlbWrapper[$("#rowIndex").val()].isVariablePercent=true;
        var value = $("#clinicPricePortion").val().replace(/,/g, '');
        var totalAmount = $("#totalAmount").val();
        if (!isNumberKey(e)) {
            var str = (value).toUpperCase();
            value = str.replace(String.fromCharCode(e.keyCode), "");
        }
        if ((value).length == 0 || isNaN(value)) {
            value=0;
        }
        if(parseInt(value)>parseInt(totalAmount)){
            value=totalAmount;
        }
        $("#clinicPricePortion").val(parseInt(value));
        $("#clinicPricePortion_txt").val(parseInt(value));

        $("#doctorPercentPortion").val((totalAmount-value)/totalAmount*100);
        $("#doctorPercentPortion_txt").val((totalAmount-value)/totalAmount*100);
        $("#doctorPricePortion").val(totalAmount-value);
        $("#doctorPricePortion_txt").val(totalAmount-value);
        setNumericTextValue();
    }

    function calculateDisCount(rowIndex) {
//    var doctorElement=this.id.split('-');
//
        var doctor;
        var localSumDiscountAmount = 0;
        if ($("#dr-select-" + rowIndex).length == 0) {
            doctor = tlbWrapper[rowIndex].doctor_id;
        } else {
            doctor = $("#dr-select-" + rowIndex).val();
        }
        if(doctor==undefined ||doctor==-1){
            tlbWrapper[rowIndex].serviceitem_discountAmount=tlbWrapper[rowIndex].total*tlbWrapper[rowIndex].discountPercent/100;
            tlbWrapper[rowIndex].serviceitem_discountAmount = Number(tlbWrapper[rowIndex].serviceitem_discountAmount).toFixed(2);
            tlbWrapper[rowIndex].serviceitem_discountAmount = parseInt(tlbWrapper[rowIndex].serviceitem_discountAmount);
            var tdDiscountAmount = document.getElementById('tbl-' + rowIndex + '-6_1');
            if (tdDiscountAmount != null) {
                tdDiscountAmount.value = tlbWrapper[rowIndex].serviceitem_discountAmount;
                tdDiscountAmount.value = addCommaSeparator(tdDiscountAmount.value);
            }
            var i = 0;
            for (k = 0; k < tlbWrapper.length; k++) {
                if(tlbWrapper[k].shouldSave==false){
                    continue;
                }
                var tdTotalK = document.getElementById('tbl-' + k + '-7');
                if (tlbWrapper[k].serviceitem_discountAmount != undefined) {
                    localSumDiscountAmount += (tlbWrapper[k].serviceitem_discountAmount * 1);
                    i = k;
                }
            }
            i++;
            var tdSumDiscountAmount = document.getElementById('tbl-' + i + '-6_1');
            if (tdSumDiscountAmount != null) {
                tdSumDiscountAmount.innerHTML = addCommaSeparator(localSumDiscountAmount);
            }
            return;
        }
        var doctorPercent = doctor.split('-')[2];
        var contractType = doctor.split('-')[5];
        if(contractType==""){
            contractType=1;
        }
        var contractPrice = doctor.split('-')[6];

        if(tlbWrapper[rowIndex].isVariablePercent!=undefined && tlbWrapper[rowIndex].isVariablePercent && tlbWrapper[rowIndex].doctorPercentPortion!=undefined){
            doctorPercent=tlbWrapper[rowIndex].doctorPercentPortion;
        }
        var percentDiscount = $('#txt-percent-discount-' + rowIndex).val();
        if (percentDiscount == 0) {
            return;
        }
        var discountLocation = $('#discountLocation-select-input-' + rowIndex).val();
        var quantity = $('#quantity-txt-' + rowIndex).val();
        if (quantity == undefined) {
            quantity = $('#quantity-lbl-' + rowIndex)[0].innerText;
        }


        //inja ghabi
      /*  if(contractType==2 && tlbWrapper[rowIndex].professionalComponent!=undefined){
            doctorPercent=doctorPercent*tlbWrapper[rowIndex].professionalComponent/quantity;
        }else if(contractType==3){
            doctorPercent=contractPrice/Number(tlbWrapper[rowIndex].total)*100;
        }

        if (discountLocation == 1) {//clinic
            if(tlbWrapper[rowIndex].isVariablePercent!=undefined && tlbWrapper[rowIndex].isVariablePercent && tlbWrapper[rowIndex].clinicPricePortion!=undefined){
                tlbWrapper[rowIndex].serviceitem_discountAmount = ( tlbWrapper[rowIndex].clinicPricePortion *percentDiscount / 100);
            }else{
                if(tlbWrapper[rowIndex].insurancePercent>0){
                    tlbWrapper[rowIndex].serviceitem_discountAmount = (quantity * tlbWrapper[rowIndex].insuranceCost * (100 - doctorPercent) * percentDiscount / 100 / 100);
                }else{
                    tlbWrapper[rowIndex].serviceitem_discountAmount = (quantity * tlbWrapper[rowIndex].serviceitem_cost * (100 - doctorPercent) * percentDiscount / 100 / 100);
                }

            }
        } else if (discountLocation == 2) {//doctor
            if(tlbWrapper[rowIndex].isVariablePercent!=undefined && tlbWrapper[rowIndex].isVariablePercent && tlbWrapper[rowIndex].doctorPricePortion!=undefined){
                tlbWrapper[rowIndex].serviceitem_discountAmount = ( tlbWrapper[rowIndex].doctorPricePortion * percentDiscount / 100);
            }else{
//                    tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((quantity * tlbWrapper[txtEleId[3]].serviceitem_cost) * doctorPercent * this.value / 100 / 100);
                if( tlbWrapper[rowIndex].insurancePercent>0){
                    tlbWrapper[rowIndex].serviceitem_discountAmount = ((quantity * tlbWrapper[rowIndex].insuranceCost) * doctorPercent * percentDiscount / 100 / 100);
                }else{
                    tlbWrapper[rowIndex].serviceitem_discountAmount = ((quantity * tlbWrapper[rowIndex].serviceitem_cost) * doctorPercent * percentDiscount / 100 / 100);

                }
            }
//                tlbWrapper[txtEleId[3]].serviceitem_discountAmount = (quantity * tlbWrapper[txtEleId[3]].serviceitem_cost * doctorPercent * this.value / 100 / 100);
//                tlbWrapper[txtEleId[3]].serviceitem_discountAmount = ((quantity * tlbWrapper[txtEleId[3]].insuranceCost) * doctorPercent * this.value / 100 / 100);

        } else if (discountLocation == 3) {//bothOfThem
            if (tlbWrapper[rowIndex].insurancePercent > 0) {
                tlbWrapper[rowIndex].serviceitem_discountAmount = (quantity * tlbWrapper[rowIndex].insuranceCost * percentDiscount / 100);
            } else {
                tlbWrapper[rowIndex].serviceitem_discountAmount = (quantity * tlbWrapper[rowIndex].serviceitem_cost * percentDiscount / 100);
            }
        }*/

        if (discountLocation == 1 &&tlbWrapper[rowIndex].isVariablePercent != undefined && tlbWrapper[rowIndex].isVariablePercent && tlbWrapper[rowIndex].clinicPricePortion != undefined) {//clinic
            tlbWrapper[rowIndex].serviceitem_discountAmount = (tlbWrapper[rowIndex].clinicPricePortion * percentDiscount / 100);
        }else if (discountLocation == 2 && tlbWrapper[rowIndex].isVariablePercent != undefined && tlbWrapper[rowIndex].isVariablePercent && tlbWrapper[rowIndex].doctorPricePortion != undefined) {//doctor
            tlbWrapper[rowIndex].serviceitem_discountAmount = (tlbWrapper[rowIndex].doctorPricePortion * percentDiscount / 100);
        }else{
            if(contractType==1){
                if(discountLocation==1){//clinic
                    tlbWrapper[rowIndex].serviceitem_discountAmount=Math.round(tlbWrapper[rowIndex].total)*(100-doctorPercent)/100*percentDiscount/100;
                }else if(discountLocation==2){//doctor
                    tlbWrapper[rowIndex].serviceitem_discountAmount=Math.round(tlbWrapper[rowIndex].total)*(doctorPercent)/100*percentDiscount/100;
                }else if (discountLocation == 3) {//bothOfThem
                    tlbWrapper[rowIndex].serviceitem_discountAmount =Math.round(tlbWrapper[rowIndex].total) * percentDiscount / 100;
                }
            }else if(contractType==2){
                if(discountLocation==1){//clinic
                    if(tlbWrapper[rowIndex].rvu_id!=undefined){
                        if(tlbWrapper[rowIndex].insurancePercent>0){
                            // doctorPercent= tlbWrapper[rowIndex].professional_ka_total_acceptable_insurance* doctorPercent/100;
                            // if(tlbWrapper[rowIndex].professional_ka_total-tlbWrapper[rowIndex].professional_ka_total_acceptable_insurance>0){
                            //     doctorPercent=(tlbWrapper[rowIndex].professional_ka_total-tlbWrapper[rowIndex].professional_ka_total_acceptable_insurance)* doctorPercent/100;
                            // }else{
                            //     doctorPercent=tlbWrapper[rowIndex].professional_ka_total* doctorPercent/100;
                            // }
                            tlbWrapper[rowIndex].serviceitem_discountAmount=
                                ((Math.round(tlbWrapper[rowIndex].total)-Math.round((tlbWrapper[rowIndex].professional_ka_total-
                                    (tlbWrapper[rowIndex].professional_ka_total_acceptable_insurance*tlbWrapper[rowIndex].insurancePercent/100))*doctorPercent/100 ))*percentDiscount/100);

                        }else{
                            doctorPercent= tlbWrapper[rowIndex].professional_ka_total * doctorPercent/100;
                            tlbWrapper[rowIndex].serviceitem_discountAmount=
                                ((Math.round(tlbWrapper[rowIndex].total)-Math.round(((100-tlbWrapper[rowIndex].insurancePercent)/100)*doctorPercent))*percentDiscount/100);
                        }
                    }else{
                        tlbWrapper[rowIndex].serviceitem_discountAmount = ((Math.round(tlbWrapper[rowIndex].total)) * (100 - doctorPercent) * percentDiscount / 100 / 100);
                    }
                }else if(discountLocation==2){//doctor
                    if(tlbWrapper[rowIndex].rvu_id!=undefined){
                        if(tlbWrapper[rowIndex].insurancePercent>0){
                            // doctorPercent= tlbWrapper[rowIndex].professional_ka_total_acceptable_insurance* doctorPercent/100;
                            /*if(tlbWrapper[rowIndex].professional_ka_total-tlbWrapper[rowIndex].professional_ka_total_acceptable_insurance>0){
                                doctorPercent=(tlbWrapper[rowIndex].professional_ka_total-tlbWrapper[rowIndex].professional_ka_total_acceptable_insurance)* doctorPercent/100;
                            }else{
                                doctorPercent=tlbWrapper[rowIndex].professional_ka_total* doctorPercent/100;
                            }*/
                            tlbWrapper[rowIndex].serviceitem_discountAmount=
                                ((Math.round((tlbWrapper[rowIndex].professional_ka_total-
                                    (tlbWrapper[rowIndex].professional_ka_total_acceptable_insurance*tlbWrapper[rowIndex].insurancePercent/100))*doctorPercent/100 ))*percentDiscount/100);
                        }else{
                            doctorPercent= tlbWrapper[rowIndex].professional_ka_total * doctorPercent/100;
                            tlbWrapper[rowIndex].serviceitem_discountAmount=((Math.round(((100-tlbWrapper[rowIndex].insurancePercent)/100)*doctorPercent))*percentDiscount/100);
                        }
                    }else{
                        tlbWrapper[rowIndex].serviceitem_discountAmount = ((Math.round(tlbWrapper[rowIndex].total)) * (doctorPercent) * percentDiscount / 100 / 100);
                    }

                }else if (discountLocation == 3) {//bothOfThem
                    tlbWrapper[rowIndex].serviceitem_discountAmount =Math.round(tlbWrapper[rowIndex].total) * percentDiscount / 100;
                }
            }else if (contractType==3){
                var totalFree=Math.round(Math.round(tlbWrapper[rowIndex].serviceitem_cost*tlbWrapper[rowIndex].quantityTxt));
                if(discountLocation==1){//clinic
                    if(tlbWrapper[rowIndex].insurancePercent>0){
                        tlbWrapper[rowIndex].serviceitem_discountAmount =(tlbWrapper[rowIndex].total*((totalFree-contractPrice)/totalFree) * percentDiscount / 100);
                    }else{
                        tlbWrapper[rowIndex].serviceitem_discountAmount =(tlbWrapper[rowIndex].total*((totalFree-contractPrice)/Math.round(tlbWrapper[rowIndex].total)) * percentDiscount / 100);
                    }

                }else if(discountLocation==2){//doctor
                    if(tlbWrapper[rowIndex].insurancePercent>0){
                        tlbWrapper[rowIndex].serviceitem_discountAmount =tlbWrapper[rowIndex].total*(contractPrice/Math.round(Math.round(tlbWrapper[rowIndex].serviceitem_cost*tlbWrapper[rowIndex].quantityTxt))) * percentDiscount / 100;
                    }else{
                        tlbWrapper[rowIndex].serviceitem_discountAmount =tlbWrapper[rowIndex].total*(contractPrice/Math.round(tlbWrapper[rowIndex].total)) * percentDiscount / 100;
                    }
                }else if (discountLocation == 3) {//bothOfThem
                    tlbWrapper[rowIndex].serviceitem_discountAmount =Math.round(tlbWrapper[rowIndex].total) * percentDiscount / 100;
                }
            }else{
                tlbWrapper[rowIndex].serviceitem_discountAmount = (( tlbWrapper[rowIndex].total) * (100 - doctorPercent) * percentDiscount / 100 / 100);
            }

        }


        //ta inja


        tlbWrapper[rowIndex].serviceitem_discountAmount = Number(tlbWrapper[rowIndex].serviceitem_discountAmount).toFixed(2);
        tlbWrapper[rowIndex].serviceitem_discountAmount = parseInt(tlbWrapper[rowIndex].serviceitem_discountAmount);
        var tdDiscountAmount = document.getElementById('tbl-' + rowIndex + '-6_1');
        if (tdDiscountAmount != null) {
            tdDiscountAmount.value = tlbWrapper[rowIndex].serviceitem_discountAmount;
            tdDiscountAmount.value = addCommaSeparator(tdDiscountAmount.value);
        }
        var i = 0;
        for (k = 0; k < tlbWrapper.length; k++) {
            if(tlbWrapper[k].shouldSave==false){
                continue;
            }
            var tdTotalK = document.getElementById('tbl-' + k + '-7');
            if (tlbWrapper[k].serviceitem_discountAmount != undefined) {
                localSumDiscountAmount += (tlbWrapper[k].serviceitem_discountAmount * 1);
                i = k;
            }
        }
        i++;
        var tdSumDiscountAmount = document.getElementById('tbl-' + i + '-6_1');
        if (tdSumDiscountAmount != null) {
            tdSumDiscountAmount.innerHTML = addCommaSeparator(localSumDiscountAmount);
        }
    }

    function createItemTable(serviceId, insuranceType1Id, insuranceType2Id) {
        deleteRow('list-table');
        if($.isNumeric(serviceId)) {
            jQuery.ajax({
                url: '<c:url value='/' />' + "clinic/basicInfo/financeRegistration/serviceItemCost/" + serviceTableNotCancelTotalRowCount + "/"+ serviceId + "/" + insuranceType1Id + "/" + insuranceType2Id,
                type: "POST",
                data: JSON.stringify(insuranceInfo),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    $("#insuranceBookletPageNumber").val('');
                    $("#insuranceBookletPageNumber_txt").val('');
                    $("#prescriptionDate").val('');
                    $("#prescriptionValidityDate").val('');
                    $("#serviceRequesterMedicalCouncilCode").val('');
                    if(data.length !=undefined && data.length>0){
                        hasInsuranceLimit=data[0].hasInsuranceLimit;
                    }

                    drawTable_serviceItem(data);
                },
                error: function (data) {

                }
            });

            <%--$.getJSON("<c:url value='/' />" + "clinic/basicInfo/financeRegistration/serviceItemCost/" + serviceId + "/" + insuranceType1Id + "/" + insuranceType2Id, function (data) {--%>

            <%--})--%>
        }
    }

    function updateFrPayable(){
        $.getJSON("<c:url value='/' />" + "clinic/basicInfo/financeRegistration/updateFrPayable/", function (result) {
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
            }
        })
    }

    function updateFriInsuranceAndPatientPortionAndDifference(){
        $.getJSON("<c:url value='/' />" + "clinic/basicInfo/financeRegistration/updateFriInsuranceAndPatientPortionAndDifference/", function (result) {
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
            }
        })
    }
    function changePercentOffTextBox(e) {
        alert("fire...");
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
            }
            ;
        } catch (e) {
            alert(e);
        }
        ;
        //getValues();
    }


    $("#factorPrint-btn").click(function () {
        var tmp = {};
        tmp.patient_id = $('#patient_id').val();
        tmp.factor_id = $('#factor_id').val();
        tmp.hasDeliveryGoods=$("input[name='hasDeliveryGoods']")[0].checked;
        jQuery.ajax({
            url: '<c:url value='/' />' + '/clinic/basicInfo/financeRegistration/' + "printAndMakeFinal",
            type: "POST",
            data: JSON.stringify(tmp),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.state == "success") {
                    alertify.success(result.message);
                    if (document.getElementById("loadedId") != null) {
                        document.getElementById("loadedId").value = result.baseObjectId;
                    }
                    document.getElementById("id").value = result.baseObjectId;
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
                                    '<title>printAndMakeFinal</title>\n' +
                                    '</head>\n' +
                                    '<body  style="font-family:bnazanin;" >\n' + result.printMessage + '\n</body>\n</html>';
                    document1.write(pageContent);
                    document1.close();
                    newWindow.print();
                    createItemTable(-1, -1, -1);
                    createServiceTable();
                    drawPosTable();
                    $("#clinic-fnc-addToBasket").prop("disabled",true);
                } else {
                    for (var i = 0; i < result.errors.length; i++) {
                        if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                            alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                        } else {
                            alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                        }
                    }
                }

            },
            error: function (result) {
                if (result.status == 401) {
                    window.location.href = "";
                }
            }
        });
    });
    $("#factorPrintSendToVisit-btn").click(function () {
        var tmp = {};
        tmp.patient_id = $('#patient_id').val();
        tmp.factor_id = $('#factor_id').val();
        tmp.hasDeliveryGoods=$("input[name='hasDeliveryGoods']")[0].checked;
        jQuery.ajax({
            url: '<c:url value='/' />' + '/clinic/basicInfo/financeRegistration/' + "printAndMakeFinalAndSendToVisit",
            type: "POST",
            data: JSON.stringify(tmp),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.state == "success") {
                    alertify.success(result.message);
                    if (document.getElementById("loadedId") != null) {
                        document.getElementById("loadedId").value = result.baseObjectId;
                    }
                    document.getElementById("id").value = result.baseObjectId;
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
                                    '<title>printAndMakeFinalAndSendToVisit</title>\n' +
                                    '</head>\n' +
                                    '<body style="font-family: B Nazanin !important;">\n' + result.printMessage + '\n</body>\n</html>';
                    document1.write(pageContent);
                    document1.close();
                    newWindow.print();
                    createItemTable(-1, -1, -1);
                    createServiceTable();
                    drawPosTable();
                    $("#clinic-fnc-addToBasket").prop("disabled",true);
                } else {
                    for (var i = 0; i < result.errors.length; i++) {
                        if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                            alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                        } else {
                            alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                        }
                    }
                }

            },
            error: function (result) {
                if (result.status == 401) {
                    window.location.href = "";
                }
            }
        });
    });
    $("#bill-btn").click(function () {
        var tmp = {};
        tmp.patient_id = $('#patient_id').val();
        tmp.factor_id = $('#factor_id').val();
        jQuery.ajax({
            url: '<c:url value='/' />' + '/clinic/basicInfo/financeRegistration/' + "printBill",
            type: "POST",
            data: JSON.stringify(tmp),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.state == "success") {
                    alertify.success(result.message);
                    if (document.getElementById("loadedId") != null) {
                        document.getElementById("loadedId").value = result.baseObjectId;
                    }
                    document.getElementById("id").value = result.baseObjectId;
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
                                    '<title>printBill</title>\n' +
                                    '</head>\n' +
                                    '<body>\n' + result.printMessage + '\n</body>\n</html>';
                    document1.write(pageContent);
                    document1.close();
                    newWindow.print();
                    createItemTable(-1, -1, -1);
                    createServiceTable();
                    drawPosTable();
                    $("#clinic-fnc-addToBasket").prop("disabled",true);
                } else {
                    for (var i = 0; i < result.errors.length; i++) {
                        if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                            alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                        } else {
                            alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                        }
                    }
                }

            },
            error: function (result) {
                if (result.status == 401) {
                    window.location.href = "";
                }
            }
        });
    });


    $("#bill-detail-btn").click(function () {
        var tmp = {};
        tmp.patient_id = $('#patient_id').val();
        tmp.factor_id = $('#factor_id').val();
        jQuery.ajax({
            url: '<c:url value='/' />' + '/clinic/basicInfo/financeRegistration/' + "printBillDetail",
            type: "POST",
            data: JSON.stringify(tmp),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.state == "success") {
                    alertify.success(result.message);
                    if (document.getElementById("loadedId") != null) {
                        document.getElementById("loadedId").value = result.baseObjectId;
                    }
                    document.getElementById("id").value = result.baseObjectId;
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
                                    '<title>printBillDetail</title>\n' +
                                    '</head>\n' +
                                    '<body>\n' + result.printMessage + '\n</body>\n</html>';
                    document1.write(pageContent);
                    document1.close();
                    newWindow.print();
                    createItemTable(-1, -1, -1);
                    createServiceTable();
                    drawPosTable();
                    $("#clinic-fnc-addToBasket").prop("disabled",true);
                } else {
                    for (var i = 0; i < result.errors.length; i++) {
                        if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                            alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                        } else {
                            alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                        }
                    }
                }

            },
            error: function (result) {
                if (result.status == 401) {
                    window.location.href = "";
                }
            }
        });
    });

    $("#bill-patient-btn").click(function () {
        var tmp = {};
        tmp.patient_id = $('#patient_id').val();
        tmp.factor_id = $('#factor_id').val();
        jQuery.ajax({
            url: '<c:url value='/' />' + '/clinic/basicInfo/financeRegistration/' + "printPatientBill",
            type: "POST",
            data: JSON.stringify(tmp),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.state == "success") {
                    alertify.success(result.message);
                    if (document.getElementById("loadedId") != null) {
                        document.getElementById("loadedId").value = result.baseObjectId;
                    }
                    document.getElementById("id").value = result.baseObjectId;
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
                                    '<title>printPatientBill</title>\n' +
                                    '</head>\n' +
                                    '<body>\n' + result.printMessage + '\n</body>\n</html>';
                    document1.write(pageContent);
                    document1.close();
                    newWindow.print();
                    createItemTable(-1, -1, -1);
                    createServiceTable();
                    drawPosTable();
                    $("#clinic-fnc-addToBasket").prop("disabled",true);
                } else {
                    for (var i = 0; i < result.errors.length; i++) {
                        if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                            alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                        } else {
                            alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                        }
                    }
                }

            },
            error: function (result) {
                if (result.status == 401) {
                    window.location.href = "";
                }
            }
        });
    });

    $("#patientSurgeryReport-btn").click(function () {
        var tmp = {};
        tmp.patient_id = $('#patient_id').val();
        tmp.factor_id = $('#factor_id').val();
        jQuery.ajax({
            url: '<c:url value='/' />' + '/clinic/basicInfo/financeRegistration/' + "printSurgery",
            type: "POST",
            data: JSON.stringify(tmp),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.state == "success") {
                    alertify.success(result.message);
                    if (document.getElementById("loadedId") != null) {
                        document.getElementById("loadedId").value = result.baseObjectId;
                    }
                    document.getElementById("id").value = result.baseObjectId;
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
                                    '<title>printPatientBill</title>\n' +
                                    '</head>\n' +
                                    '<body>\n' + result.printMessage + '\n</body>\n</html>';
                    document1.write(pageContent);
                    document1.close();
                    newWindow.print();
                } else {
                    for (var i = 0; i < result.errors.length; i++) {
                        if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                            alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                        } else {
                            alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                        }
                    }
                }

            },
            error: function (result) {
                if (result.status == 401) {
                    window.location.href = "";
                }
            }
        });
    });

    $("#clinic-fnc-posSave").click(function () {
        addFactorPeyment();
    });

    $("#update-fr-payable").click(function () {
        updateFrPayable();
    });

    $("#update-fri-insuranceAndPatientPortionAndDifference").click(function () {
        updateFriInsuranceAndPatientPortionAndDifference();
    });

    $("#clinic-fnc-posFormReset").click(function () {
//    createItemTable(-1, -1, -1);
//    createServiceTable();
//    drawPosTable();
        $('#billNumber').val('');
        $('#factorPayment_id').val("");
        loadPaymentable();
    });

    $("#clinic-fnc-release").click(function () {
        var releaseData = {};
        releaseData.factor_id = $('#factor_id').val();
        jQuery.ajax({
            url: '<c:url value='/' />' + '/clinic/basicInfo/financeRegistration/' + "release",
            type: "POST",
            data: JSON.stringify(releaseData),
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
                } else {
                    $("#fncReleased").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.releaseState.isRelease")%>');
                    isReleasedInPage=true;
                    $("#clinic-fnc-release").hide();
                    $("#factorPrint-btn").hide();
                    $("#factorPrintSendToVisit-btn").hide();
                    $("#notDefinedDiv").hide();
                    $("#clinic-fnc-addToBasket").prop("disabled", true);
                    $("#ServiceItem_popup_button").prop("disabled", true);
                    $("#clinic-fnc-posSave").prop("disabled", true);
                    alertify.success(result.message);
                }

            },
            error: function (result) {
                if (result.status == 401) {
                    window.location.href = "";
                }
            }
        });
    });


    $("#clinic-fnc-addToBasket").click(function () {
        $("#clinic-fnc-addToBasket").prop("disabled", true);
        $("#ServiceItem_popup_button").prop("disabled", true);
        var items = [];
        var totalDiscounts = 0;
        var itemIndex = -1;
        for (i = 0; i < totalRowCount; i++) {

            itemIndex++;
            var dataItem = {};
            dataItem.id = tlbWrapper[i].id;
            dataItem.service_item_id = tlbWrapper[i].serviceitem_id;
            dataItem.service_item_cost_id = tlbWrapper[i].service_item_cost_id;
            dataItem.rvu_id = tlbWrapper[i].rvu_id;
            dataItem.serviceItemBasicAmount = tlbWrapper[i].serviceitem_cost;
            dataItem.discountPersent = tlbWrapper[i].discountPercent;
            dataItem.discountAmount = tlbWrapper[i].serviceitem_discountAmount;
            dataItem.insurancePersent = tlbWrapper[i].insurancePercent;
            dataItem.insuranceAmount = tlbWrapper[i].insuranceCost;
            dataItem.quantity = tlbWrapper[i].quantityTxt;
            dataItem.isPrimaryOperation = tlbWrapper[i].isPrimaryOperation;
            dataItem.service_item_cost_group_id = tlbWrapper[i].service_item_cost_group_id;
            dataItem.service_item_cost_group_bill_id = tlbWrapper[i].service_item_cost_group_bill_id;
            dataItem.service_item_cost_group_patient_bill_id = tlbWrapper[i].service_item_cost_group_patient_bill_id;
            dataItem.service_item_cost_group_detail_bill_id = tlbWrapper[i].service_item_cost_group_detail_bill_id;
            dataItem.isNotShowInPatientBill = tlbWrapper[i].isNotShowInPatientBill;
            dataItem.isNotShowInDetailBill = tlbWrapper[i].isNotShowInDetailBill;
            dataItem.isNotShowInFishPrint = tlbWrapper[i].isNotShowInFishPrint;
            dataItem.isShowAsTree = tlbWrapper[i].isShowAsTree;
            dataItem.insuranceAcceptablePrice = tlbWrapper[i].insuranceAcceptablePrice;
            dataItem.franshiz = tlbWrapper[i].franshiz;
            dataItem.difference = tlbWrapper[i].difference;
            dataItem.professional_ka_id=tlbWrapper[i].professional_ka_id;
            dataItem.professional_ka_price=tlbWrapper[i].professional_ka_price;
            dataItem.professional_ka_total=tlbWrapper[i].professional_ka_total;
            dataItem.professional_ka_price_acceptable_insurance=tlbWrapper[i].professional_ka_price_acceptable_insurance;
            dataItem.professional_ka_total_acceptable_insurance=tlbWrapper[i].professional_ka_total_acceptable_insurance;
            //inja
            // dataItem.serviceItemAmount = (dataItem.serviceItemBasicAmount * dataItem.quantity).toFixed(0);
            if($("#insurance_type1").val()>1){
                dataItem.serviceItemAmount = (dataItem.serviceItemBasicAmount * dataItem.quantity).toFixed(0);
            }else{
                dataItem.serviceItemAmount = tlbWrapper[i].total;
            }
                if (tlbWrapper[i].shouldSave == false) {
                dataItem.shouldRemoveFromDB=true;
            }
            if(tlbWrapper[i].consumption_slip_goods_id!=undefined){
                dataItem.consumption_slip_goods_id = tlbWrapper[i].consumption_slip_goods_id;
            }
            if (tlbWrapper[i].shouldSave != false) {

                totalDiscounts += (dataItem.discountAmount * 1);
            }

            if (tlbWrapper[i].itemType == 2) {
                // if ($('#dr-select-' + i).length > 0 && $('#dr-select-' + i).val() == null) {
//                    $("#dialogNotSelectAnyDoctorForService").dialog("open");
//                    return;
//                 }
                 if ($('#dr-select-' + i).val() == undefined) {
                    if(tlbWrapper[i].doctor_id!=-1 && tlbWrapper[i].doctor_id!=undefined){
                        dataItem.doctor_id = tlbWrapper[i].doctor_id.split('-')[0];
                        dataItem.employeeContract_id = tlbWrapper[i].doctor_id.split('-')[1];
                        dataItem.employeeContractItem_id = tlbWrapper[i].doctor_id.split('-')[3];
                        if(tlbWrapper[i].isVariablePercent!=undefined && tlbWrapper[i].isVariablePercent==true){
                            dataItem.isVariablePercent=tlbWrapper[i].isVariablePercent;
                            dataItem.doctorPercentPortion=tlbWrapper[i].doctorPercentPortion;
                            dataItem.doctorPricePortion=tlbWrapper[i].doctorPricePortion;
                            dataItem.clinicPricePortion=tlbWrapper[i].clinicPricePortion;
                        }else{
                            dataItem.doctorPercentPortion=0;
                            dataItem.doctorPricePortion=null;
                            dataItem.clinicPricePortion=null;

                        }
                    }else{
                        if(dataItem.quantity!=0){
                            $("#clinic-fnc-addToBasket").prop("disabled", false);
                            $("#ServiceItem_popup_button").prop("disabled", false);
                            $("#dialogNotSelectAnyDoctorForServiceShouldQuantityZero").dialog("open");
                            return;
                        }
                    }
                } else {
                    if ($('#dr-select-' + i).val().indexOf("-1") == 0 ) {
                        $("#clinic-fnc-addToBasket").prop("disabled", false);
                        $("#ServiceItem_popup_button").prop("disabled", false);
                        $("#dialogNotSelectAnyDoctorForService").dialog("open");
                        return;
                    }
                    dataItem.doctor_id = $('#dr-select-' + i).val().split('-')[0];
                    dataItem.employeeContract_id = $('#dr-select-' + i).val().split('-')[1];
                    dataItem.employeeContractItem_id = $('#dr-select-' + i).val().split('-')[3];
                    if(tlbWrapper[i].isVariablePercent!=undefined && tlbWrapper[i].isVariablePercent && tlbWrapper[i].doctorPercentPortion!=undefined &&
                     tlbWrapper[i].doctorPricePortion!=undefined &&
                     tlbWrapper[i].clinicPricePortion!=undefined){
                        dataItem.isVariablePercent=tlbWrapper[i].isVariablePercent;
                        dataItem.doctorPercentPortion=tlbWrapper[i].doctorPercentPortion;
                        dataItem.doctorPricePortion=tlbWrapper[i].doctorPricePortion;
                        dataItem.clinicPricePortion=tlbWrapper[i].clinicPricePortion;
                    }else{
                        dataItem.doctorPercentPortion=0;
                        dataItem.doctorPricePortion=null;
                        dataItem.clinicPricePortion=null;
                    }
                }

                if ($('#discountLocation-select-input-' + i).val() != undefined) {
                    dataItem.discountLocation = $('#discountLocation-select-input-' + i).val();
                } else {
                    dataItem.discountLocation = 1;
                }

            } else {
                dataItem.doctor_id = null;
                discountLocation = null;
            }
            items[itemIndex] = dataItem;
        }
        var dataArrayForSend = {};
        dataArrayForSend.id = currentFinanceRegistration_id;
        var insuranceType1Id = $("#insurance_type1").val();
        var insuranceType2Id = $("#insuranceType2Id").val();
        var insuranceType1Number = $("#insuranceNumber_type1_preDefined").val();
        var insuranceType2Number = $("#insuranceNumber_type2_preDefined").val();
        if ($("#isInsuranceDefined").val() != "true") {
            insuranceType1Id = $("#insurance_type1").val();
            insuranceType2Id = $("#insurance_type2_notDefined").val();
            insuranceType1Number = $("#insuranceNumber_type1_notDefined").val();
            insuranceType2Number = $("#insuranceNumber_type2_notDefined").val();
        }
        dataArrayForSend.factor_id = $('#factor_id').val();
        dataArrayForSend.patient_id = $('#patient_id').val();
        dataArrayForSend.insurance_type_1 = insuranceType1Id;
        dataArrayForSend.insurance_type_2 = insuranceType2Id;
        if(currentService_id!=null && currentService_id!=undefined){
            dataArrayForSend.service_id = currentService_id;
        }else{
            dataArrayForSend.service_id = $('#service_id').val();
        }
        dataArrayForSend.insurance_type_1_num = insuranceType1Number;
        dataArrayForSend.insurance_type_2_num = insuranceType2Number;
        dataArrayForSend.totalDiscounts = totalDiscounts;
        if(currentDepartment_id!=null && currentDepartment_id!=undefined){
            dataArrayForSend.department_id = currentDepartment_id;
        }else{
            dataArrayForSend.department_id = $('#department_id').val();
        }
        dataArrayForSend.appointmentMongo_id = $('#appointmentMongo_id').val();
        dataArrayForSend.items = items;
        dataArrayForSend.insuranceBookletSerial = $("#insuranceBookletSerial").val();
        dataArrayForSend.insuranceBookletPageNumber = $("#insuranceBookletPageNumber").val();
        dataArrayForSend.prescriptionDate = $("#prescriptionDate").val();
        dataArrayForSend.prescriptionValidityDate = $("#prescriptionValidityDate").val();
        dataArrayForSend.insuranceBookletType = $("#insuranceBookletType").val();
        dataArrayForSend.serviceRequesterMedicalCouncilCode = $("#serviceRequesterMedicalCouncilCode").val();
        if($("#doctorId").length>0){
            dataArrayForSend.reagent_agent_doctor_id=$('#doctorId').val();
        }
        jQuery.ajax({
            url: '<c:url value='/' />' + '/clinic/basicInfo/financeRegistration' + "/saveFinanceRegistration",
            type: "POST",
            data: JSON.stringify(dataArrayForSend),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.state == "error") {
                    $("#clinic-fnc-addToBasket").prop("disabled", false);
                    $("#ServiceItem_popup_button").prop("disabled", false);
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
                    document.getElementById("id").value = result.baseObjectId;
                    $("#factorTotalCost").val(addCommaSeparator(result.factorTotalCost));
                    createItemTable(-1, -1, -1);
                    createServiceTable();
                    loadPaymentable();
                    $("#insuranceBookltPageNumber").val('');
                    $("#insuranceBookletPageNumber_txt").val('');
                    $("#prescriptionDate").val('');
                    $("#prescriptionValidityDate").val('');
                    $("#serviceRequesterMedicalCouncilCode").val('');

                    $("#clinic-fnc-addToBasket").prop("disabled", true);
                    $("#ServiceItem_popup_button").prop("disabled", true);
                    if($("#doctorId").length>0){
                        $('#doctorId_Comb').data('kendoComboBox').value("");
                        $('#doctorId').val('');
                    }
                    try {
                        $('#service_id_Comb').data('kendoComboBox').value("");
                    }
                    catch (err) {
                    }
                    currentDepartment_id=null;
                    currentService_id=null;

                }


            },
            error: function (result) {
                if (result.status == 401) {
                    window.location.href = "";
                }
            }
        });

    })
    function createServiceTable() {
        var patientId = document.getElementById("patient_id").value;
        var localFactor_id = document.getElementById("factor_id").value;

        $.getJSON("<c:url value='/' />" + "clinic/basicInfo/financeRegistration/loadServices/" + localFactor_id, function (data) {
            serviceTableTotalRowCount = data.length-1;
            $("#clinic-fnc-sendToCash").prop("disabled", true);
            $("#clinic-fnc-finalizeBasket").prop("disabled", true);
            if (serviceTableTotalRowCount > 0 && (!${factorFNCState}) || <%=isCashier%>) {
                $("#clinic-fnc-sendToCash").prop("disabled", false);
                $("#clinic-fnc-finalizeBasket").prop("disabled", false);
            }

            deleteRow('service-table');
            var tbl = document.getElementById('service-table');
            tbl.setAttribute('style', 'width: 100%');
            var tbdy = document.createElement('tbody');
            var tr = document.createElement("tr");
            tr.style.background = 'linear-gradient(to bottom, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%)';
            var th1 = document.createElement("th");
            th1.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("global.row") %>'));
            th1.setAttribute('style', 'width: 5%');
            var th2 = document.createElement("th");
            th2.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.service_id") %>'));
            th2.setAttribute('style', 'width: 10%');
            var th3 = document.createElement("th");
            th3.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.amount") %>'));
            th3.setAttribute('style', 'width: 10%');

            var th3_1 = document.createElement("th");
            th3_1.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.insurance") %>'));
            th3_1.setAttribute('style', 'width: 10%');

            var th3_2 = document.createElement("th");
            th3_2.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.totalAmount") %>'));
            th3_2.setAttribute('style', 'width: 10%');

            var th3_3 = document.createElement("th");
            th3_3.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.totalDiscounts") %>'));
            th3_3.setAttribute('style', 'width: 10%');

            var th3_4 = document.createElement("th");
            th3_4.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.grid.payableAmount") %>'));
            th3_4.setAttribute('style', 'width: 10%');

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

            if ($("#cashier-user-permission").val() == 1 ||
                    $("#finance-user-permission").val() == 1) {
                tr.appendChild(th3);
                tr.appendChild(th3_1);
                tr.appendChild(th3_2);
                tr.appendChild(th3_3);
                tr.appendChild(th3_4);
            }
            tr.appendChild(th3_5);
            tr.appendChild(th3_6);
            tr.appendChild(th4);
            tbdy.appendChild(tr);

            var sumAmount = 0;
            var sumTotalAmount = 0;
            var sumTotalDiscounts = 0;
            var sumPayable = 0;
            insuranceInfo=[];
            for(var j=0;j<data.length;j++){
                if(data[j].group_id !=undefined){
                    insuranceInfo[insuranceInfo.length]=data[j];
                }
            }
            serviceTableNotCancelTotalRowCount=0;
            for (i = 0; i < data.length; i++) {
                if(data[i].cancel==undefined){
                    continue;
                }
                var tmpRowWrapper = {};
                tmpRowWrapper.serviceId = data[i].serviceId;
                tmpRowWrapper.serviceName = data[i].serviceName;
                tmpRowWrapper.totalCost = (data[i].totalCost);
                tmpRowWrapper.cancel = data[i].cancel;
                tlbWrapper[i] = tmpRowWrapper;
                tmpRowWrapper.financeRegistration_id= data[i].financeRegistration_id;
                tlbService[i]= tmpRowWrapper;
                tlbService[i].groupId= data[i].groupId;
                var payable;
                if (!tmpRowWrapper.cancel) {
                    serviceTableNotCancelTotalRowCount++;
                    sumAmount += data[i].totalCost;
                    sumTotalAmount += data[i].totalCost - (data[i].totalCost * (data[i].insurancePercent / 100));
                    var sumTotalAmountStr = "" + sumTotalAmount + "";
                    if (sumTotalAmountStr.indexOf(".") > -1) {
                        sumTotalAmount = Math.round(sumTotalAmount);
//                        sumTotalAmount = (sumTotalAmount);
                    }
                    sumTotalDiscounts += data[i].totalDiscounts;
//                    payable = (data[i].totalCost - (data[i].totalCost * (data[i].insurancePercent / 100))) - data[i].totalDiscounts;
                    payable = data[i].payableCost;
                    var payableStr = "" + payable + "";
                    if (payableStr.indexOf(".") > -1) {
                        payable = Math.round(payable);
                    }
                    sumPayable += payable;
                    var sumPayableStr = "" + sumPayable + "";
                    if (sumPayableStr.indexOf(".") > -1) {
                        sumPayable = Math.round(sumPayable);
                    }
                } else {
//                    payable = (data[i].totalCost - (data[i].totalCost * (data[i].insurancePercent / 100))) - data[i].totalDiscounts;
                    payable = data[i].payableCost;
                    var payableStr = "" + payable + "";
                    /*if (payableStr.indexOf(".") > -1) {
                        payable = Math.round(payable);
                    }*/

                }
                var tr = document.createElement("tr");
                var td1 = document.createElement("td");
                td1.align = 'center';
                td1.appendChild(document.createTextNode(i + 1));
                td1.setAttribute('style', 'width: 5%');
                var td2 = document.createElement("td");
                td2.id = 'tbl-service-' + i + '-2-' + data[i].serviceId;
                td2.style.paddingRight = '5px';
                td2.appendChild(document.createTextNode(data[i].serviceName));
                td2.setAttribute('style', 'width: 10%');
                var td3 = document.createElement("td");
                td3.id = 'tbl-service-' + i + '-3';
                td3.style.paddingRight = '5px';
                td3.appendChild(document.createTextNode(addCommaSeparator(data[i].totalCost)));
                td3.setAttribute('style', 'width: 10%');

                var td3_1 = document.createElement("td");
                td3_1.id = 'tbl-service-' + i + '-3';
                td3_1.style.paddingRight = '5px';
                td3_1.appendChild(document.createTextNode(addCommaSeparator(data[i].insuranceCost)));
                td3_1.setAttribute('style', 'width: 10%');

                var td3_2 = document.createElement("td");
                td3_2.id = 'tbl-service-' + i + '-3';
                td3_2.style.paddingRight = '5px';
                var orginAmount = "" + data[i].totalCost - (data[i].totalCost * (data[i].insurancePercent / 100)) + "";
                if (orginAmount.indexOf(".") > -1) {
                    td3_2.appendChild(document.createTextNode(addCommaSeparator(Math.round((data[i].totalCost - (data[i].totalCost * (data[i].insurancePercent / 100)))))));
//                    td3_2.appendChild(document.createTextNode(addCommaSeparator(((data[i].totalCost - (data[i].totalCost * (data[i].insurancePercent / 100)))))));

                } else {
//                    td3_2.appendChild(document.createTextNode(addCommaSeparator((data[i].totalCost - (data[i].totalCost * (data[i].insurancePercent / 100))))));
                    td3_2.appendChild(document.createTextNode(addCommaSeparator(Math.round(data[i].totalCost - (data[i].totalCost * (data[i].insurancePercent / 100))))));

                }
                td3_2.setAttribute('style', 'width: 10%');

                var td3_3 = document.createElement("td");
                td3_3.id = 'tbl-service-' + i + '-3';
                td3_3.style.paddingRight = '5px';
                td3_3.appendChild(document.createTextNode(addCommaSeparator(data[i].totalDiscounts)));
                td3_3.setAttribute('style', 'width: 10%');

                var td3_4 = document.createElement("td");
                td3_4.id = 'tbl-service-' + i + '-3';
                td3_4.style.paddingRight = '5px';
                td3_4.appendChild(document.createTextNode(addCommaSeparator(payable)));
                td3_4.setAttribute('style', 'width: 10%');

                var td3_5 = document.createElement("td");
                td3_5.id = 'tbl-service-doctorLastName-' + i + '-3';
                td3_5.style.paddingRight = '5px';
                td3_5.appendChild(document.createTextNode(data[i].doctorLastName));
                td3_5.setAttribute('style', 'width: 10%;text-align: center;');

                var td3_6 = document.createElement("td");
                td3_6.id = 'tbl-service-visitState-' + i + '-3';
                td3_6.style.paddingRight = '5px';
                td3_6.appendChild(document.createTextNode(data[i].visitState));
                td3_6.setAttribute('style', 'width: 10%;text-align: center;');

                var td4 = document.createElement("td");
                if ($("#surgeryInfo").val() == 1) {
                    td4.setAttribute('style', 'width: 15%');
                }else{
                    td4.setAttribute('style', 'width: 10%');
                }
                // edit Img
                var editImage = document.createElement("img");
                editImage.src = "<c:url value='/resources/images/edit/999.png' />";
                editImage.title = '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.edit") %>';
                //editImage.style.width='20px';
                editImage.id = 'img-edit-service-' + i + '-' + data[i].financeRegistration_id;
                editImage.department_id=data[i].department_id;
                editImage.service_id=data[i].serviceId;
                editImage.group_id=data[i].groupId;
                editImage.onclick = function () {
                    editService(this.id,this.department_id,this.service_id,this.group_id);
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
                image.id = 'img-delete-service-' + data[i].doOperation + '-' + i + '-' + data[i].financeRegistration_id;
                image.title = '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.remove") %>';
                image.onclick = function () {
                    $("#dialogconfirmRemoveService").data('contents', this.id).dialog("open");
//							removeService(this.id);
                };
                image.onmouseover = function () {
                    mouseOver(this);
                };
                image.onmouseout = function () {
                    mouseOut(this);
                };

                // sendToVisit Img
                var sendToVisitImage = document.createElement("img");
                sendToVisitImage.src = "<c:url value='/resources/images/doctor-icon.png' />";
                //image.style.width='20px';
                sendToVisitImage.id = 'img-sendtovisit-service-' + i + '-' + data[i].financeRegistration_id;
                sendToVisitImage.title = '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.sendToVisit") %>';
                sendToVisitImage.onclick = function () {
                    sendToVisitService(this.id);
                };
                sendToVisitImage.onmouseover = function () {
                    mouseOver(this);
                };
                sendToVisitImage.onmouseout = function () {
                    mouseOut(this);
                };

                // surgeryInfo Img
                var surgeryImage = document.createElement("img");
                surgeryImage.src = "<c:url value='/resources/images/surgeon-icon-32.png' />";
                surgeryImage.id = 'imgSurgeryService-' + i + '-' + data[i].financeRegistration_id;
                surgeryImage.title = '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.surgery") %>';
                surgeryImage.onclick = function () {
                    surgeryInfo(this.id);
                };
                surgeryImage.onmouseover = function () {
                    mouseOver(this);
                };
                surgeryImage.onmouseout = function () {
                    mouseOut(this);
                };

                // rvuModifiedCodeApply Img
                var rvuModifiedCodeApply = document.createElement("img");
                rvuModifiedCodeApply.src = "<c:url value='/resources/images/surgeon-icon-32.png' />";
                rvuModifiedCodeApply.id = data[i].financeRegistration_id;
                rvuModifiedCodeApply.title = '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.rvuModifiedCodeApply") %>';
                rvuModifiedCodeApply.onclick = function () {
                    rvuModifiedCodeApplyInfoPopup(this.id);
                };
                rvuModifiedCodeApply.onmouseover = function () {
                    mouseOver(this);
                };
                rvuModifiedCodeApply.onmouseout = function () {
                    mouseOut(this);
                };

                // agentDoctor Img
                var agentDoctorImage = document.createElement("img");
                agentDoctorImage.src = "<c:url value='/resources/images/Doctor.png' />";
                agentDoctorImage.id = 'imgSurgeryService-' + i + '-' + data[i].financeRegistration_id;
                agentDoctorImage.title = '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.agentDoctor") %>';
                agentDoctorImage.onclick = function () {
                    agentDoctorPopup(this.id);
                };
                agentDoctorImage.onmouseover = function () {
                    mouseOver(this);
                };
                agentDoctorImage.onmouseout = function () {
                    mouseOut(this);
                };

                // changingDateFinanceRegistration Img
                var changingDateFinanceRegistration = document.createElement("img");
                changingDateFinanceRegistration.src = "<c:url value='/resources/images/calendar.png' />";
                changingDateFinanceRegistration.id = 'changingDateFinanceRegistration-' + data[i].financeRegistration_id+'-'+data[i].date;
                changingDateFinanceRegistration.title = '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.changingDateFinanceRegistration") %>';
                changingDateFinanceRegistration.onclick = function () {

                    var financeRegistration_id = this.id.split('-')[1];
                    var date = this.id.split('-')[2];

                    $("#financeRegistrationDate").val(date);
                    $("#financeRegistrationId").val(financeRegistration_id);
                    $("#modals-changingDateFinanceRegistrationDataPopup").data('image',this).dialog('open');
                };
                changingDateFinanceRegistration.onmouseover = function () {
                    mouseOver(this);
                };
                changingDateFinanceRegistration.onmouseout = function () {
                    mouseOut(this);
                };


                td4.align = 'center';
                td4.appendChild(editImage);
                if ((${factorType} == 2 && (!${factorFNCState} || <%=isCashier%>)) ||
                (${factorType} == 1 && (!${isReleasable} || <%=isCashier%>)
            ))
                {
                    td4.appendChild(image);

                }

                td4.appendChild(sendToVisitImage);
                if ($("#surgeryInfo").val() == 1){
                    td4.appendChild(surgeryImage);
                }

                if ($("#rvuModifiedCodeApp").val() == 1){
                    td4.appendChild(rvuModifiedCodeApply);
                }
                if ($("#changingDateFinanceRegistration").val() == 1){
                    td4.appendChild(changingDateFinanceRegistration);
                }

//                if ($("#reagentDoctor").val() == 1){
//                    td4.appendChild(agentDoctorImage);
//                }

                tr.appendChild(td1);
                tr.appendChild(td2);

                if ($("#cashier-user-permission").val() == 1 ||
                        $("#finance-user-permission").val() == 1) {
                    tr.appendChild(td3);
                    tr.appendChild(td3_1);
                    tr.appendChild(td3_2);
                    tr.appendChild(td3_3);
                    tr.appendChild(td3_4);
                }
                tr.appendChild(td3_5);
                tr.appendChild(td3_6);
                tr.appendChild(td4);
                tbdy.appendChild(tr);
            }
            ;

            var tr = document.createElement("tr");
            tr.style.background = '-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(126,133,144,1)), color-stop(49%,rgba(40,49,67,1)), color-stop(50%,rgba(19,30,50,1)), color-stop(100%,rgba(3,14,35,1)))';
            tr.style.color = '#ffffff';

            var td1 = document.createElement("td");
            var td2 = document.createElement("td");
            var td3 = document.createElement("td");
            td3.style.paddingRight = '5px';
            td3.appendChild(document.createTextNode(addCommaSeparator(sumAmount)));

            var td3_1 = document.createElement("td");
            var td3_2 = document.createElement("td");
            td3_2.appendChild(document.createTextNode(addCommaSeparator(sumTotalAmount)));

            var td3_3 = document.createElement("td");
            td3_3.appendChild(document.createTextNode(addCommaSeparator(sumTotalDiscounts)));

            var td3_4 = document.createElement("td");
            td3_4.appendChild(document.createTextNode(addCommaSeparator(sumPayable)));


            var td4 = document.createElement("td");
            var td5 = document.createElement("td");
            var td6 = document.createElement("td");

            tr.appendChild(td1);
            tr.appendChild(td2);
            if ($("#cashier-user-permission").val() == 1 ||
                    $("#finance-user-permission").val() == 1) {
            }
            tr.appendChild(td3);
            tr.appendChild(td3_1);
            tr.appendChild(td3_2);
            tr.appendChild(td3_3);
            tr.appendChild(td3_4);
            tr.appendChild(td4);
            tr.appendChild(td5);
            tr.appendChild(td6);
            if ($("#cashier-user-permission").val() == 1 ||
                    $("#finance-user-permission").val() == 1) {
                tbdy.appendChild(tr);
            }

            tbl.appendChild(tbdy);
        });
    }
    function mouseOver(img) {
        img.className = 'mouseOverCursor';
    }
    function mouseOut(img) {
        img.removeAttribute('mouseOverCursor');
    }

    function confirmRemoveService(e) {
        removeService(e.data('contents'));
    }

    function confirmRemovePosItem(e) {
        removePosItem(e.data('contents'));
    }

    function confirmRemoveServiceItem(e) {
        removeServiceItem(e.data('contents'));
        document.getElementById('list-table').deleteRow(document.getElementById('list-table').rows.length - 1)
        var localTotSum = 0;
        var localSumDiscountAmount = 0;
        for (k = 0; k < tlbWrapper.length; k++) {
            if(tlbWrapper[k].shouldSave==false){
                continue;
            }
            localTotSum += (tlbWrapper[k].total * 1);
            localSumDiscountAmount += (tlbWrapper[k].serviceitem_discountAmount * 1);
        }
        sumRowsOnRemoveRow(localTotSum,localSumDiscountAmount);
    }


    function removePosItem(imageId) {
        var factorPaymentId = imageId.substring(imageId.lastIndexOf('-') + 1, imageId.length);
        $.getJSON("<c:url value='/' />" + "clinic/basicInfo/financeRegistration/removeFactorPaymentItem/" + factorPaymentId, function (result) {
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

    function editPosItem(imageId) {

        if(isReleasedInPage || isFactorClosedInPage){
            $("#dialogEditPosItem").dialog("open");
            return;
        }
        var factorPaymentId = imageId.substring(imageId.lastIndexOf('-') + 1, imageId.length);
        $.getJSON("<c:url value='/' />" + "clinic/basicInfo/financeRegistration/editFactorPaymentItem/" + factorPaymentId, function (data) {

            $('#billNumber').val(data.billNumber);
            $('#factorPayment_id').val(data.id);
            $('#coffer_id').val(data.coffer_id);
            $("#coffer_id_Comb").data("kendoComboBox").value(data.coffer_id);
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
        $.getJSON("${pageContext.request.contextPath}" + "/clinic/basicInfo/financeRegistration/loadPaymentable/" + $('#factor_id').val(), function (data) {
            hasServiceInLoadingPage = data.hasService;
            paymentable=data.paymentable;
            rounded=data.rounded;
            $('#posAmount').val(data.paymentable);
            fncReport();
        });
    }

    function removeServiceItem(thisClicked) {
        var rowNumber = thisClicked.id.split('img-delete-serviceitem-')[1];
        thisClicked.parentElement.parentElement.remove();
        tlbWrapper[rowNumber].shouldSave = false;
        appendTextSearchListTable();
        reorderServiceItemRowNumber();
    }

    function removeService(imageId) {
        var patientId = document.getElementById("patient_id").value;
        var financeRegistration_id = imageId.substring(imageId.lastIndexOf('-') + 1, imageId.length);
        var doOperation = imageId.split('-')[3];
        if (doOperation == "true") {
            $("#dialogRemoveVisit").dialog("open");
            return
        }

        $.getJSON("<c:url value='/' />" + "clinic/basicInfo/financeRegistration/removeService/" + patientId + "/" + financeRegistration_id, function (result) {
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
                var rowNumber = imageId.split('-')[3];
                $("#tbl-service-visitState-" + rowNumber + '-3').html(result.visitState);
                createServiceTable();
                drawPosTable();
                loadPaymentable();
                if (result.visitState != undefined && result.visitStateInt == 1) {
                    $("#appointmentMongo_id_Comb").data("kendoComboBox").text('');
                    $("#appointmentMongo_id").val("");
                }
            }
        });
    }

    function editService(imageId,department_id,service_id,group_id) {
        var patientId = document.getElementById("patient_id").value;
        var financeRegistration_id = imageId.substring(imageId.lastIndexOf('-') + 1, imageId.length);
        currentFinanceRegistration_id = financeRegistration_id;
        currentDepartment_id=department_id;
        currentService_id=service_id;
        currentGroup_id=group_id;
        $.getJSON("<c:url value='/' />" + "clinic/basicInfo/financeRegistration/editService/" + patientId + "/" + financeRegistration_id, function (result) {
            if (result.state == "error") {
                for (var i = 0; i < result.errors.length; i++) {
                    if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                        alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                    } else {
                        alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                    }
                }
            } else {
                if(result.insurance_type1==1){
                    if($("#insuranceDiv").length>0){
                        $("#insuranceDiv").hide();
                    }
                    if($("#insuranceConfirmDiv").length>0){
                        $("#insuranceConfirmDiv").hide();
                    }
                }else{
                    $("#insuranceBookletPageNumber").val(result.insuranceBookletPageNumber);
                    $("#insuranceBookletPageNumber_txt").val(result.insuranceBookletPageNumber);
                    $("#insuranceBookletSerial").val(result.insuranceBookletSerial);
                    $("#insuranceBookletType").val(result.insuranceBookletType);
                    if($("#insuranceBookletType_Comb").data("kendoComboBox")!=null){
                        $("#insuranceBookletType_Comb").data("kendoComboBox").value(result.insuranceBookletType);
                    }
                    $("#prescriptionDate").val(result.prescriptionDate);
                    $("#prescriptionValidityDate").val(result.prescriptionValidityDate);
                    $("#serviceRequesterMedicalCouncilCode").val(result.serviceRequesterMedicalCouncilCode);
                    if($("#insuranceDiv").length>0){
                        $("#insuranceDiv").show();
                    }
                    if($("#insuranceConfirmDiv").length>0){
                        $("#insuranceConfirmDiv").show();
                    }
                }
                $("#insurance_type1").val(result.insurance_type1);
                hasInsuranceLimit=result.hasInsuranceLimit;
                $("#insurance_type1_Comb").data("kendoComboBox").value(result.insurance_type1);
                if($("#doctorId").length>0){
                    if(result.reagent_agent_doctor_id>0){

                        var combobox=$("#doctorId_Comb").data("kendoComboBox");
                        combobox.dataSource.read({
                            filter: { field: "id", operator: "eq", value: '2'+result.reagent_agent_doctor_id },
                            page : 1,
                            pageSize : 1
                        });
                        combobox.select(combobox.ul.children().eq(0));
                        $("#doctorId").val('2'+result.reagent_agent_doctor_id);
                        $("#doctorId_Comb").data("kendoComboBox").value('2'+result.reagent_agent_doctor_id);
                    }else if(result.reagent_employee_id>0) {

                        var combobox=$("#doctorId_Comb").data("kendoComboBox");
                        combobox.dataSource.read({
                            filter: { field: "id", operator: "eq", value: '1'+result.reagent_employee_id },
                            page : 1,
                            pageSize : 1
                        });
                        combobox.select(combobox.ul.children().eq(0));
                        $("#doctorId").val('1'+result.reagent_employee_id);
                        $("#doctorId_Comb").data("kendoComboBox").value('1'+result.reagent_employee_id);
                    }else{
                        $('#doctorId_Comb').data('kendoComboBox').value("");
                        $('#doctorId').val('');
                    }
                }


                drawTable_serviceItem(result.frItems);
            }
        });
    }

    function sendToVisitService(imageId) {
        var patientId = document.getElementById("patient_id").value;
        var financeRegistration_id = imageId.substring(imageId.lastIndexOf('-') + 1, imageId.length);

        currentFinanceRegistration_id = financeRegistration_id;

        jQuery.ajax({
            url: '<c:url value='/' />' + '/clinic/basicInfo/financeRegistration/' + "sendToVisit",
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
                    var rowNumber = imageId.split('-')[3];
                    $("#tbl-service-visitState-" + rowNumber + '-3').html(result.visitState);

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

    function surgeryInfo(imageId){
        var financeRegistration_id = imageId.substring(imageId.lastIndexOf('-') + 1, imageId.length);
        jQuery.ajax({
            url: '<c:url value='/' />' + '/clinic/basicInfo/financeRegistration/' + "surgeryPopupChecking",
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
//                    alertify.success(result.message);
//                    var rowNumber = imageId.split('-')[3];
//                    $("#tbl-service-visitState-" + rowNumber + '-3').html(result.visitState);
                    surgeryPopup(imageId)

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

    function surgeryPopup(imageId){
        $.get('<%=request.getContextPath()%>'+'/clinic/basicInfo/surgeryPopUp/' , function (data) {
            $("#modal-surgeryPopup").empty();
            var id = 'surgery_popup';
            $("#modal-surgeryPopup").append('<div id="' + id + '" class="uk-modal">');
            $("#" + id).append(data);
            var modal = new $.UIkit.modal.Modal("#" + id);
            getBaseUrl();
            $("#" + id).on(
                    {
                        'uk.modal.hide':function () {
                            $("#modal-surgeryPopup").empty();
//                            $.getJSON(originUrl+'setOriginUrl', function(data){

//                            });
                        }
                    }
            );

            if (typeof (callback_popup_load_surgeryPopup) == "function") {
                callback_popup_load_surgeryPopup(imageId);
            }
            modal.show();

            if("${disableBackground}" == "true"){
                $('.uk-modal').css('background','rgba(255, 255, 255, 0)');
            }


            $('button[data-action="saveWithoutClose"]', $("#"+id)).hide();


            <%--$('button[data-form="popup"]').html('<%=ResourceBoundleHolder.resourceBundle.getString("global.approve")%>');--%>

            $('button[data-action="save"]', $("#" + id)).unbind("click").click(function() {
                var tmp=serializeFromFormId("surgeryPopup");
                tmp.finnance_registration_id=imageId.substring(imageId.lastIndexOf('-') + 1, imageId.length);
                tmp.patient_id=$('#patient_id').val();
                if (typeof (callback_custom_deserialize_popup_surgeryPopup) == "function") {
                    callback_custom_deserialize_popup_surgeryPopup(tmp);
                }
                modal.hide();
            });
        });
    }

    function agentDoctorPopup(imageId){
        $.get('<%=request.getContextPath()%>'+'/clinic/basicInfo/agentDoctorPopup/' , function (data) {
            $("#modal-agentDoctorPopup").empty();
            var id = 'agentDoctor_popup';
            $("#modal-agentDoctorPopup").append('<div id="' + id + '" class="uk-modal">');
            $("#" + id).append(data);
            var modal = new $.UIkit.modal.Modal("#" + id);
            getBaseUrl();
            $("#" + id).on(
                    {
                        'uk.modal.hide':function () {
                            $("#modal-agentDoctorPopup").empty();
                            $("#doctorId").val('');

//                            $.getJSON(originUrl+'setOriginUrl', function(data){

//                            });
                        }
                    }
            );

            if (typeof (callback_popup_load_agentDoctorPopup) == "function") {
                callback_popup_load_agentDoctorPopup(imageId);
            }
            modal.show();

            if("${disableBackground}" == "true"){
                $('.uk-modal').css('background','rgba(255, 255, 255, 0)');
            }


            $('button[data-action="saveWithoutClose"]', $("#"+id)).hide();


            <%--$('button[data-form="popup"]').html('<%=ResourceBoundleHolder.resourceBundle.getString("global.approve")%>');--%>

            $('button[data-action="save"]', $("#" + id)).unbind("click").click(function() {
                var tmp=serializeFromFormId("agentDoctorPopup");
                tmp.id=imageId.substring(imageId.lastIndexOf('-') + 1, imageId.length);
                tmp.reagent_agent_doctor_id=$('#doctorId').val();
                if (typeof (callback_custom_deserialize_popup_agentDoctorPopup) == "function") {
                    callback_custom_deserialize_popup_agentDoctorPopup(tmp);
                }
                modal.hide();
            });
        });
    }

    function rvuModifiedCodeApplyInfoPopup(imageId){
        $.get('<%=request.getContextPath()%>'+'/clinic/basicInfo/rvuModifiedCodeApplyPopup/' , function (data) {
            var patient_id=$("#patient_id").val()
            $("#modal-rvuModifiedCodeApplyPopup").empty();
            var id = 'rvuModifiedCodeApplyPopup';
            $("#modal-rvuModifiedCodeApplyPopup").append('<div id="' + id + '" class="uk-modal">');
            $("#" + id).append(data);
            var modal = new $.UIkit.modal.Modal("#" + id);
            getBaseUrl();
            $("#" + id).on(
                    {
                        'uk.modal.hide':function () {
                            $("#modal-rvuModifiedCodeApplyPopup").empty();
//                            $.getJSON(originUrl+'setOriginUrl', function(data){

//                            });
                        }
                    }
            );

            if (typeof (callback_popup_load_rvuModifiedCodeApplyPopup) == "function") {
                callback_popup_load_rvuModifiedCodeApplyPopup(imageId,patient_id);
            }
            modal.show();

            if("${disableBackground}" == "true"){
                $('.uk-modal').css('background','rgba(255, 255, 255, 0)');
            }

            $("#cancel-button").click(function(){
                if (typeof (callback_popup_close_rvuModifiedCodeApplyPopup) == "function") {
                    callback_popup_close_rvuModifiedCodeApplyPopup();
                }
            });

        });
    }

    function callback_popup_load_rvuModifiedCodeApplyPopup(finnanceReg_id,patient_id){
        $("#RvuModifiedCodeApply #finnance_registration_id").val(finnanceReg_id);
        $("#RvuModifiedCodeApply #patient_id").val(patient_id);
    }

    function callback_custom_deserialize_popup_surgeryPopup(tmp){
        ////---- This part is for get value from multiSelects -----------
        var getOptionArray = function(options){
        	var arr = [];
        	for(var i=0;i<options.length;i++){
            	arr[i]=options[i].value;
            }
        	return arr;
        };
        $("*[data-role='multiselect']").each(function(){
              tmp[this.id.replace("_multiSelect","")] = getOptionArray(this.selectedOptions);
        })
		////---------- END -------------
    	jQuery.ajax ({
            url: '<%=request.getContextPath()%>'+'/clinic/operation/surgery/save',
            type: "POST",
            data: JSON.stringify(tmp),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function(result){
                if(result.state == "error"){
                    for(var i=0; i<result.errors.length; i++){
                        if($("label[for='"+ result.errors[i].Field + "']").text().length>0){
                            alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                        }else{
                            alertify.error( result.errors[i].Field + ":  " +  result.errors[i].Message);
                        }
                    }
                }
                if(result.state == "success"){
                    alertify.success(result.message);


                }
            },
            error:function(result){
//                        console.log(result);
                if(result.status==401){
                    window.location.href="";
                }
            }
        });

    }

    function callback_custom_deserialize_popup_agentDoctorPopup(tmp){
        ////---- This part is for get value from multiSelects -----------
//        var getOptionArray = function(options){
//        	var arr = [];
//        	for(var i=0;i<options.length;i++){
//            	arr[i]=options[i].value;
//            }
//        	return arr;
//        };
//        $("*[data-role='multiselect']").each(function(){
//              tmp[this.id.replace("_multiSelect","")] = getOptionArray(this.selectedOptions);
//        })
		////---------- END -------------
    	jQuery.ajax ({
            url: '<%=request.getContextPath()%>'+'/clinic/basicInfo/agentDoctorPopup/save',
            type: "POST",
            data: JSON.stringify(tmp),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function(result){
                if(result.state == "error"){
                    for(var i=0; i<result.errors.length; i++){
                        if($("label[for='"+ result.errors[i].Field + "']").text().length>0){
                            alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                        }else{
                            alertify.error( result.errors[i].Field + ":  " +  result.errors[i].Message);
                        }
                    }
                }
                if(result.state == "success"){
                    alertify.success(result.message);


                }
            },
            error:function(result){
//                        console.log(result);
                if(result.status==401){
                    window.location.href="";
                }
            }
        });

    }

    function callback_popup_load_surgeryPopup(imageId){
        bindToEntityByIdFormIdUrl(imageId.substring(imageId.lastIndexOf('-') + 1, imageId.length),
                'surgeryPopup','<%=request.getContextPath()%>'+'/clinic/operation/surgery/loadFinnance_registration_id/');
    }

    function callback_popup_load_agentDoctorPopup(imageId){
        bindToEntityByIdFormIdUrl(imageId.substring(imageId.lastIndexOf('-') + 1, imageId.length),
                'agentDoctorPopup','<%=request.getContextPath()%>'+'/clinic/basicInfo/agentDoctorPopup/loadFinnance_registration_id/');
    }

    //for agentDoctorPopup
    function callback_deserialize(data){
        if(data.reagent_agent_doctor_id>0){
            $("#doctorId").val('2'+data.reagent_agent_doctor_id);
        }else if(data.reagent_employee_id>0) {
            $("#doctorId").val('1'+data.reagent_employee_id);
        }
//        $("form", $("#agentDoctorPopup")).deserialize(data);
    }

    $("#dialog").dialog({
        autoOpen: false,
        show: {
            effect: "slide",
            duration: 300
        },
        hide: {
            effect: "slide",
            duration: 300
        },
        height: 300,
        width: 800,
        title: '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.history") %>',
        modal: true,
        buttons: {
            "<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.close") %>": function () {
                $(this).dialog("close");
            }
        }
    });

    $("#clinic-fnc-history").click(function () {
        $("#dialog").dialog("open");

    });

    $("#changing-date-factor").click(function () {
        $("#modals-changingDateFactorDataPopup").dialog("open");

    });

    $("#clinic-fnc-sendToCash").click(function () {
        var factorIdForSendToCash = $('#factor_id').val();
        jQuery.ajax({
            url: '<c:url value='/' />' + '/clinic/basicInfo/financeRegistration/' + "sendToCash",
            type: "POST",
            data: factorIdForSendToCash,
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
                    window.location = "<c:url value='/' />" + "clinic/operation/factor/";
                }
            }
        });
    });


    $("#clinic-fnc-finalizeBasket").click(function () {
        var factorIdForSendToCash = $('#factor_id').val();
        jQuery.ajax({
            url: '<c:url value='/' />' + '/clinic/basicInfo/financeRegistration/' + "settlement",
            type: "POST",
            data: factorIdForSendToCash,
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
                    window.location = "<c:url value='/' />" + "clinic/operation/factor/";
                }

            }
        });
    });

    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 190)
            return false;
        return true;
    }

    function drawPosTable() {
        if (document.getElementById('pos-item-table') == null) {
            return;
        }
        var localFactor_id = document.getElementById("factor_id").value;

        $.getJSON("<c:url value='/' />" + "clinic/basicInfo/financeRegistration/loadPosItem/" + localFactor_id, function (posDataItem) {
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


                    // changingDateFactorPayment Img
                    var changingDateFactorPayment = document.createElement("img");
                    changingDateFactorPayment.src = "<c:url value='/resources/images/calendar.png' />";
                    changingDateFactorPayment.id = 'changingDateFactorPayment-' + posDataItem[i].id+'-'+posDataItem[i].date;
                    changingDateFactorPayment.title = '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.changingDateFactorPayment") %>';
                    changingDateFactorPayment.onclick = function () {

                        var factorPayment_id = this.id.split('-')[1];
                        var date = this.id.split('-')[2];

                        $("#factorPaymentDate").val(date);
                        $("#factorPaymentId").val(factorPayment_id);
                        $("#modals-changingDateFactorPaymentDataPopup").data('image',this).dialog('open');
                    };
                    changingDateFactorPayment.onmouseover = function () {
                        mouseOver(this);
                    };
                    changingDateFactorPayment.onmouseout = function () {
                        mouseOut(this);
                    };

                    td5.align = 'center';
                    td5.appendChild(editImage);
                    td5.appendChild(image);
                    if ($("#changingDateFactorPayment").val() == 1){
                        td5.appendChild(changingDateFactorPayment);
                    }


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
    $("#btn-cancel").click(function () {
        window.location = "<c:url value='/' />" + "clinic/operation/factor/resetSession";
    });
    $("#clinic-fnc-backToFactor").click(function () {
        window.location = "<c:url value='/' />" + "clinic/operation/factor/";
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
        dataPosForSend.factor_id = $('#factor_id').val();
        dataPosForSend.coffer_id = $('#coffer_id').val();
        dataPosForSend.rounded = rounded;

        if ($('#factorPayment_id').val() != "") {
            dataPosForSend.id = $('#factorPayment_id').val();
            $('#factorPayment_id').val("");
        }
        $("#clinic-fnc-posSave").prop("disabled", true);
        jQuery.ajax({
            url: '<c:url value='/' />' + '/clinic/basicInfo/financeRegistration/' + "saveFactorPeyment",
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
                    document.getElementById("id").value = result.baseObjectId;
                    $("#factorTotalCost").val(addCommaSeparator(result.factorTotalCost));
                }
                try {
                    $('#service_id_Comb').data('kendoComboBox').value("");
                }
                catch (err) {
                }
                createItemTable(-1, -1, -1);
                createServiceTable();
                drawPosTable();
                $('#billNumber').val('');
                loadPaymentable();
                $("#clinic-fnc-posSave").prop("disabled", false);
                $("#clinic-fnc-addToBasket").prop("disabled",true);
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
    function fncReport() {
        if ($('#posAmount').val() > 0) {
            $("#fncReportLBL").text(addCommaSeparator($('#posAmount').val()) + ' : <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.debtorPatient")%>');
            $("#payRecipt").val(1);
            $("#payRecipt_Comb").data("kendoComboBox").value(1);
        } else if ($('#posAmount').val() < 0) {
            $("#fncReportLBL").text(addCommaSeparator($('#posAmount').val() * -1) + ' : <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.creditorPatient")%>');
            $('#posAmount').val($('#posAmount').val() * -1);
            $("#payRecipt").val(2);
            $("#payRecipt_Comb").data("kendoComboBox").value(2);
        } else if (!hasServiceInLoadingPage) {
            $("#fncReportLBL").text('');
        } else if ($('#posAmount').val() == 0 || hasServiceInLoadingPage) {
            $("#fncReportLBL").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.settlement")%>');
//            $('#bill-btn').show();
//            $('#bill-patient-btn').show();
            if(paymentable==0){
                $('#bill-detail-btn').show();
                $('#bill-patient-btn').show();
                $('#bill-btn').show();
            }else{
//                $('#bill-detail-btn').hide();
                $('#bill-patient-btn').hide();
                $('#bill-btn').hide();
            }
        }

        if(isReleasedInPage){
            $("#fncReleased").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.releaseState.isRelease")%>');
            $("#clinic-fnc-release").hide();
            $("#factorPrint-btn").hide();
            $("#factorPrintSendToVisit-btn").hide();
            $("#clinic-fnc-addToBasket").prop("disabled", true);
            $("#ServiceItem_popup_button").prop("disabled", true);
            $("#clinic-fnc-posSave").prop("disabled", true);
            $("#notDefinedDiv").hide();
        }
        if(isFactorClosedInPage){
            $("#factorClosed").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.factor.closeState.isClosed")%>');
            $("#clinic-fnc-addToBasket").prop("disabled", true);
            $("#ServiceItem_popup_button").prop("disabled", true);
            $("#clinic-fnc-posSave").prop("disabled", true);

        }
        setNumericTextValue();
    }

    function sumRow() {
        var localTotSum=0;
        var localSumDiscountAmount=0;
        for(var w=0;w<tlbWrapper.length;w++){
            if(tlbWrapper[w].shouldSave!=false){
                localTotSum+=(tlbWrapper[w].total*1);
                localSumDiscountAmount+=(tlbWrapper[w].serviceitem_discountAmount*1);
            }
        }
        sumDiscountAmount=localSumDiscountAmount;
        sumTot=Math.round(localTotSum);
        var tr = document.createElement("tr");
        tr.style.background = '-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(126,133,144,1)), color-stop(49%,rgba(40,49,67,1)), color-stop(50%,rgba(19,30,50,1)), color-stop(100%,rgba(3,14,35,1)))';
        tr.style.color = '#ffffff';

        var td1 = document.createElement("td");
        var td2 = document.createElement("td");
        var td2_1 = document.createElement("td");
        var td3 = document.createElement("td");
//        var n = document.getElementById('list-table').rows.length - 1;
        var n = tlbWrapper.length ;
        td3.id = 'tbl-' + n + '-3';
        td3.style.paddingRight = '5px';
        //td3.appendChild(document.createTextNode(addCommaSeparator(sumCost)));
        var td4 = document.createElement("td");
        td4.appendChild(document.createTextNode(addCommaSeparator(sumIns)));
        td4.style.paddingRight = '5px';
        td4.id = 'tbl-' + n + '-4';
        var td5 = document.createElement("td");
        var td5_1 = document.createElement("td");
        var td6 = document.createElement("td");
        var td6_0_1 = document.createElement("td");
        var td6_1 = document.createElement("td");

        td6_1.id = 'tbl-' + n + '-6_1';
        td6_1.appendChild(document.createTextNode(addCommaSeparator(sumDiscountAmount)));

        var td7 = document.createElement("td");
        td7.id = 'tbl-' + n + '-7';
        td7.style.paddingRight = '5px';
        td7.appendChild(document.createTextNode(addCommaSeparator(sumTot)));

        tr.appendChild(td1);
        tr.appendChild(td2);
        tr.appendChild(td2_1);
        if ($("#cashier-user-permission").val() == 1 ||
                $("#finance-user-permission").val() == 1) {
            tr.appendChild(td3);
        }


        if ($("#registration-user-permission").val() == 1) {
            tr.appendChild(td5_1);
            tr.appendChild(td5);
        }
        if ($("#cashier-user-permission").val() == 1) {
            tr.appendChild(td6);
            tr.appendChild(td6_0_1);
            tr.appendChild(td6_1);

        }
        if ($("#cashier-user-permission").val() == 1 ||
                $("#finance-user-permission").val() == 1) {
            tr.appendChild(td7);
        }
        tbdyWeek.appendChild(tr);
        document.getElementById('list-table').appendChild(tbdyWeek);
        return {
            tr: tr,
            td1: td1,
            td2: td2,
            td3: td3,
            n: n,
            td4: td4,
            td5: td5,
            td5_1: td5_1,
            td6: td6,
            td6_0_1: td6_0_1,
            td6_1: td6_1,
            td7: td7
        };
    }

    function sumRowsOnRemoveRow(localTotSum,localSumDiscountAmount) {
        localTotSum=0;
        localSumDiscountAmount=0;
        for(var w=0;w<tlbWrapper.length;w++){
             if(tlbWrapper[w].shouldSave!=false){
                 localTotSum+=tlbWrapper[w].total;
                 localSumDiscountAmount+= parseFloat(tlbWrapper[w].serviceitem_discountAmount);
             }
        }
        sumTot=localTotSum;
        sumDiscountAmount=localSumDiscountAmount;
        var tr = document.createElement("tr");
        tr.style.background = '-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(126,133,144,1)), color-stop(49%,rgba(40,49,67,1)), color-stop(50%,rgba(19,30,50,1)), color-stop(100%,rgba(3,14,35,1)))';
        tr.style.color = '#ffffff';

        var td1 = document.createElement("td");
        var td2 = document.createElement("td");
        var td2_1 = document.createElement("td");
        var td3 = document.createElement("td");
//        var n = document.getElementById('list-table').rows.length - 1;
        var n = tlbWrapper.length;
        td3.id = 'tbl-' + n + '-3';
        td3.style.paddingRight = '5px';
        //td3.appendChild(document.createTextNode(addCommaSeparator(sumCost)));
        var td4 = document.createElement("td");
//        td4.appendChild(document.createTextNode(addCommaSeparator(sumIns)));
        td4.style.paddingRight = '5px';
        td4.id = 'tbl-' + n + '-4';
        var td5 = document.createElement("td");
        var td5_1 = document.createElement("td");
        var td6 = document.createElement("td");
        var td6_0_1 = document.createElement("td");
        var td6_1 = document.createElement("td");

        td6_1.id = 'tbl-' + n + '-6_1';
        td6_1.appendChild(document.createTextNode(addCommaSeparator(localSumDiscountAmount)));

        var td7 = document.createElement("td");
        td7.id = 'tbl-' + n + '-7';
        td7.style.paddingRight = '5px';
        td7.appendChild(document.createTextNode(addCommaSeparator(localTotSum)));

        tr.appendChild(td1);
        tr.appendChild(td2);
        tr.appendChild(td2_1);
        if ($("#cashier-user-permission").val() == 1 ||
                $("#finance-user-permission").val() == 1) {
            tr.appendChild(td3);
        }

        if ($("#registration-user-permission").val() == 1) {
            tr.appendChild(td5_1);
            tr.appendChild(td5);
        }
        if ($("#cashier-user-permission").val() == 1) {
            tr.appendChild(td6);
            tr.appendChild(td6_0_1);
            tr.appendChild(td6_1);

        }
        if ($("#cashier-user-permission").val() == 1 ||
                $("#finance-user-permission").val() == 1) {
            tr.appendChild(td7);
        }
        tbdyWeek.appendChild(tr);
        document.getElementById('list-table').appendChild(tbdyWeek);
        return {
            tr: tr,
            td1: td1,
            td2: td2,
            td3: td3,
            n: n,
            td4: td4,
            td5: td5,
            td5_1: td5_1,
            td6: td6,
            td6_0_1: td6_0_1,
            td6_1: td6_1,
            td7: td7
        };
    }
    function callback_custom_deserialize_popup_ServiceItem(data) {
        console.log(data);
        if(document.getElementById('list-table').rows.length<=2 || data.service_item_id==""
                || data.serviceitem_name=="" || data.service_item_id==undefined || data.serviceitem_name==undefined ||!$.isNumeric(data.service_item_id)){
            return;
        }
//        for (var index = 0; index < dataList.length; index++) {
            var isDouplicate=false;
            for(var w=0;w<tlbWrapper.length;w++) {
                if (tlbWrapper[w].shouldSave != false && tlbWrapper[w].serviceitem_id==data.service_item_id && tlbWrapper[w].quantityTxt!=0){
                    isDouplicate=true;
                    break;
                }
            }
            if(isDouplicate==true){
                alertify.error(' <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.financeRegistration.alert.duplicateServiceItem")%>');
                return;
            }
        <%--$.getJSON("${pageContext.request.contextPath}/clinic/basicInfo/financeRegistration/loadServiceItem/"+data.service_item_id+"/"+$("#insurance_type1").val(), function (fullDataServiceItem) {--%>
            document.getElementById('list-table').deleteRow(document.getElementById('list-table').rows.length - 1)

            var serviceItemDataItem = {};
            serviceItemDataItem.discountLocation = 1;
            serviceItemDataItem.doctorId = -1;
            serviceItemDataItem.doctorNameFam = "";
            serviceItemDataItem.financeRegistration_id = -1;
//            serviceItemDataItem.insuranceCost = fullDataServiceItem.cost;
            if(data.rvu_id!=undefined && data.rvu_id!=""){
                if($("#insurance_type1").val()==1){
                    serviceItemDataItem.insuranceCost=data.serviceitem_cost;
                }else{
                    serviceItemDataItem.insuranceCost=data.insuranceCost;
                }
            }else{
                serviceItemDataItem.insuranceCost = data.cost;
            }
            serviceItemDataItem.insurancePersent = data.insurancePercent;
            serviceItemDataItem.isPrimaryOperation = false;
            serviceItemDataItem.itemType = data.type;
            serviceItemDataItem.serviceItem_discountPercent = "0";
            serviceItemDataItem.service_id = $('#service_id').val();
            serviceItemDataItem.service_item_cost_group_id = data.service_item_cost_group_id;
            serviceItemDataItem.service_item_cost_group_bill_id = data.service_item_cost_group_bill_id;
            serviceItemDataItem.service_item_cost_group_patient_bill_id = data.service_item_cost_group_patient_bill_id;
            serviceItemDataItem.service_item_cost_group_detail_bill_id = data.service_item_cost_group_detail_bill_id;
            serviceItemDataItem.isNotShowInPatientBill = data.isNotShowInPatientBill;
            serviceItemDataItem.isNotShowInDetailBill = data.isNotShowInDetailBill;
            serviceItemDataItem.isNotShowInFishPrint = data.isNotShowInFishPrint;
            serviceItemDataItem.isShowAsTree = data.isShowAsTree;
            serviceItemDataItem.serviceitem_code = data.code;
            serviceItemDataItem.serviceitem_cost = data.serviceitem_cost;

            if($("#insurance_type1").val()==1 && data.rvu_id==undefined){
                serviceItemDataItem.serviceitem_cost = data.cost;
            }

            serviceItemDataItem.serviceitem_discountAmount = 0;
            serviceItemDataItem.serviceitem_id = data.service_item_id;
            serviceItemDataItem.serviceitem_name = data.serviceitem_name;

            serviceItemDataItem.insuranceAcceptablePrice = data.insuranceAcceptablePrice;
            serviceItemDataItem.franshiz = data.franshiz;
            serviceItemDataItem.difference = data.difference;
            if(data.quantity!=""){
                serviceItemDataItem.serviceitem_quantity = data.quantity;
//                serviceItemDataItem.serviceitem_cost_mul_unit = fullDataServiceItem.cost*data.quantity;
                if(data.rvu_id!=undefined && data.rvu_id!=""){
                    serviceItemDataItem.serviceitem_cost_mul_unit = data.cost;
                }else{
                    serviceItemDataItem.serviceitem_cost_mul_unit = data.cost*data.quantity;
                }
            }else{
                serviceItemDataItem.serviceitem_quantity = 1;
//                serviceItemDataItem.serviceitem_cost_mul_unit = fullDataServiceItem.cost;
                serviceItemDataItem.serviceitem_cost_mul_unit = data.cost;
            }
            serviceItemDataItem.insuranceItemType = data.insuranceItemType;
            serviceItemDataItem.isAnesthesiaService = data.isAnesthesiaService;
            serviceItemDataItem.rvu_id = data.rvu_id;
            serviceItemDataItem.professional_ka_id = data.professional_ka_id;
            serviceItemDataItem.professional_ka_price = data.professional_ka_price;
            serviceItemDataItem.professional_ka_total = data.professional_ka_total;
            serviceItemDataItem.professional_ka_price_acceptable_insurance = data.professional_ka_price_acceptable_insurance;
            serviceItemDataItem.professional_ka_total_acceptable_insurance = data.professional_ka_total_acceptable_insurance;
            serviceItemDataItem.professionalPercent = data.professionalComponent;
            serviceItemDataItem.technicalPercent = data.technicalComponent;

            var __ret = createFinanceRegistrationRow(serviceItemDataItem, sumTot, sumDiscountAmount, sumCost, sumIns, tbdyWeek,true);
            totalRowCount++;
            var tmpRowWrapper = __ret.tmpRowWrapper;
            sumTot = __ret.sumTot;
            sumDiscountAmount = __ret.sumDiscountAmount;
            var tr = __ret.tr;
            var td1 = __ret.td1;
            var td2 = __ret.td2;
            var td3 = __ret.td3;
            var baseAmount_input = __ret.baseAmount_input;
            sumCost = __ret.sumCost;
            var td4 = __ret.td4;
            sumIns = __ret.sumIns;
            var td5 = __ret.td5;
            var select_input = __ret.select_input;
            var td5_1 = __ret.td5_1;
            var qTxt_input = __ret.qTxt_input;
            var td6 = __ret.td6;
            var txt_input = __ret.txt_input;
            var td6_0_1 = __ret.td6_0_1;
            var discount_select_input = __ret.discount_select_input;
            var td6_1 = __ret.td6_1;
            var discountAmountTxt_input = __ret.discountAmountTxt_input;
            var td7 = __ret.td7;

            var __ret = sumRow();
            var tr = __ret.tr;
            var td1 = __ret.td1;
            var td2 = __ret.td2;
            var td3 = __ret.td3;
            var n = __ret.n;
            var td4 = __ret.td4;
            var td5 = __ret.td5;
            var td5_1 = __ret.td5_1;
            var td6 = __ret.td6;
            var td6_0_1 = __ret.td6_0_1;
            var td6_1 = __ret.td6_1;
            var td7 = __ret.td7;
            appendTextSearchListTable();
            reorderServiceItemRowNumber();

//        });
        return true;
//            var data = dataList;

//        }

    }

        function reorderServiceItemRowNumber(){
        $("#list-table")[0].rows[2].children[0].innerText

        if($("#list-table")[0]!=undefined){
            if($("#list-table")[0].rows!=undefined && $("#list-table")[0].rows.length>0){
                for(var i=1;i<$("#list-table")[0].rows.length-1;i++){
                    $("#list-table")[0].rows[i].children[0].innerText=i;
                    $("#list-table")[0].rows[i].children[0].innerText;
                    if (i % 2 == 0) {
                        $("#list-table")[0].rows[i].style.background="";
                    }else{
                        $("#list-table")[0].rows[i].style.background="ivory";
                    }
                }
            }

        }



    }

    function callback_popup_load_ServiceItem(){
        if ($("#finance-user-permission").val() != 1) {
            $("#cost_txt").hide();
            $('label[for="cost"]').hide();

            $("#group_bill_id").hide();
            $("#group_patient_bill_id").hide();
            $("#group_detail_bill_id").hide();
            $("#group_id").hide();
        }

    }


    function _griddd_onDelete(e){
        var areUShure = "<%=areUShure%>";
        var data = this.dataItem($(e.target).closest("tr"));
        alertify.confirm(areUShure, function (e) {
            if (e) {
                jQuery.ajax ({
                    url: basePath + "remove",
                    type: "POST",
                    data: JSON.stringify({id: data.id}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function(result){
                        if(result.state == "success"){
                            $("#grid").data("kendoGrid").dataSource.read();
                            alertify.success(result.message);
                        }else if(result.state == "error"){
                            for(var i=0; i<result.errors.length; i++){
                                alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                            }
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
        });
    }

    function _griddd_onEdit(e){
        var data = this.dataItem($(e.target).closest("tr"));
        bindToEntityByIdFormIdUrl(data.id,'RvuModifiedCodeApply','<%=request.getContextPath()%>'+'/clinic/basicInfo/rvuModifiedCodeApplyPopup/load/')
    }

    function _griddd_requestEnd(e){
        if(typeof(griddd_requestEnd_callback) == "function"){
            griddd_requestEnd_callback(e);
        }
    }
    
    $("#briefOperationReport-btn").click(function () {
        var tmp = {};
        tmp.patient_id = $('#patient_id').val();
        tmp.factor_id = $('#factor_id').val();
        jQuery.ajax({
            url: '<c:url value='/' />' + '/clinic/basicInfo/financeRegistration/' + "getBriefOperationReport",
            type: "POST",
            data: JSON.stringify(tmp),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.state == "success") {
                    var newWindow = window.open('', '', 'width=400, height=500'),
                            document1 = newWindow.document.open(),
                            pageContent =
                                    '<!DOCTYPE html>\n' +
                                    '<html>\n' +
                                    '<head>\n' +
                                    '<meta charset="utf-8" />\n' +
                                    '<title>BriefOperationReport</title>\n' +
                                    '</head>\n' +
                                    '<body>\n' + result.printMessage + '\n</body>\n</html>';
                    document1.write(pageContent);
                    document1.close();
                    newWindow.print();
                    createItemTable(-1, -1, -1);
                    createServiceTable();
                    drawPosTable();
                    $("#clinic-fnc-addToBasket").prop("disabled",true);
                } else {
                    for (var i = 0; i < result.errors.length; i++) {
                        if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                            alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                        } else {
                            alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                        }
                    }
                }
            },
            error: function (result) {
                if (result.status == 401) {
                    window.location.href = "";
                }
            }
        });
    });

    function makeConsumptionslip(){
        var url = "${pageContext.request.contextPath}/clinic/basicInfo/financeRegistration/saveConsumptionSlipItem/" + $('#factor_id').val();
        $.getJSON(url, function(result) {
            if (result.state == "success") {
                alertify.success(result.message)
            }
            console.log(result);
        });
    }

    function callback_select_element_doctorId(e){
        var url = "${pageContext.request.contextPath}/clinic/basicInfo/financeRegistration/loadAgentDoctorById/" + e;
        $.getJSON(url, function(result) {
            console.log(result);
            var insurance_type1=$("#insurance_type1").val();
            if(insurance_type1!=1){
                $("#serviceRequesterMedicalCouncilCode").val(result.medicalCouncilCode);
            }

        });
    }

    function callback_DataBound_coffer_id(e){
        if(e.sender.dataSource._data.length==1){
            $("#coffer_id_Comb").data("kendoComboBox").select(0);
            $("#coffer_id").val($("#coffer_id_Comb").data("kendoComboBox").value());
        }
    }

</script>
<style>
    .uk-modal-dialog{
        right:0px;
        margin-right: 0px;
        width: 100%;
        padding:0px;
        top: 5%;
    }
    .enteringFields .uk-width-1-10.left-align{
    	width: 12%;
   	    margin-right: 5px;
    }
    .enteringFields .uk-width-2-10{
    	width: 18%;
    	padding-right: 15px;
    }
</style>