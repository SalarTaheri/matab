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
	boolean isDoctor=GlobalVariable.getButtonContainer(menuSysCode,"doctor-user-permission");
	boolean isRegistration=GlobalVariable.getButtonContainer(menuSysCode,"registration-user-permission");
    if(GlobalVariable.getButtonContainer(menuSysCode,"registration-user-permission")&&GlobalVariable.getButtonContainer(menuSysCode,"doctor-user-permission")){
		gridUrl = basePath + "/grid-read/1/1";    
    }else if(GlobalVariable.getButtonContainer(menuSysCode,"registration-user-permission")){
    	gridUrl = basePath + "/grid-read/1/0";
    }else if(GlobalVariable.getButtonContainer(menuSysCode,"doctor-user-permission")){
    	gridUrl = basePath + "/grid-read/0/1";
    }
    
    int currentYear = new DateUtil().getIranianYear();
    Date curDate=new Date(System.currentTimeMillis());
    String curStringDate=curDate.toString();
%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
		<%--<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="newPatientWithReturn"/>--%>
	</div>
</div>
<%if(GlobalVariable.getButtonContainer(menuSysCode,"registration-user-permission")&&GlobalVariable.getButtonContainer(menuSysCode,"doctor-user-permission")){ %>
<div class="uk-container uk-container-center my-uk-container" >
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
	    	<base:hasPermission id="doctor-user-permission"/>
            <div class="uk-grid uk-grid-preserve" align="center" >
            	<label id="appName" ></label>
            </div>
            <div class="uk-grid uk-grid-preserve" id="nameAndFamDiv">
            	<base:comboBoxAutoComplete name="nameAndFam" styleClass="nameAndFamClass" key="com.appointment.nameAndFamily" comboLoaderUrl="/combo/loadPatinent"
                    dataTextField="searchField" dataValueField="id" minLength="3" hasTemplate="true" iscomboLoaderUrlRelative="true"
                    templateComaSep="fullName,fathername,cellphon,birthYearText,filenumber"
                    headerTemplateComaSep="com.appointment.nameAndFamily,clinic.patient.fatherName,clinic.patient.cellPhone,clinic.patient.birthYear,clinic.patient.fileNumber" />
            </div>
            <div class="uk-grid uk-grid-preserve" style="padding-right: 30%">
                <base:buttonPopupForSelectingGrid formPopup="patientrPopup" key="com.artonis.clinic.operation.factor.patientSearch" popUrl="popup/patientrView"
                	 isRelative="true" gridName="grid"  onSelectRowEvent="selectRowEventCallBack"  style=" width: 150px"/>
                <base:buttonPermission key="com.artonis.clinic.operation.factor.patientAdd" classNames="uk-button uk-button-success" id="newPatientWithReturn" style=" width: 150px"/>
                <base:buttonPermission key="com.artonis.clinic.operation.factor.patientEdit" classNames="uk-button uk-button-success" id="editPatientWithReturn" style=" width: 150px"/>

                <base:buttonPopupForSelectingGrid formPopup="appointmentReportNew" key="com.artonis.clinic.operation.factor.appointmentReport" popUrl="popup/appointmentReportNew" 
						gridName="grid_popup" onSelectRowEvent="appointmentReportSelectRowEventCallBack" isRelative="true" style=" width: 150px"/>

            </div>
            <div class="uk-grid uk-grid-preserve">
                <base:comboBox styleClass="small" name="department_id" comboLoaderUrl="combo/loadDepartment" key="com.artonis.clinic.operation.department"/>
            </div>
            <div class="uk-grid uk-grid-preserve">

	                    <input type="hidden" id="patientId">

                <div class="uk-width-1-10 left-align">
                    <base:simpleLabel name="fileNumber" key="com.appointment.fileNumber"/>
                </div>

                <div class="uk-width-1-10">
                    <input disabled="disabled" type="text" name="fileNumber" id="fileNumber"
                           class="text ui-widget-content ui-corner-all textBoxBackground"
                           style=" width: 100%; height: 25px">
                </div>

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
                <base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-primary" id="saveRegisterBtn" style="width:15%;"/>
            </div>
	        
	    </form>
	</div>
<%}  %>
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
                <%--<base:comboBox name="doctor_id" value="doctorName" key="his.patient.doctorName" comboLoaderUrl="combo/loadAllDoctor" styleClass="small"/>--%>
                <base:testBox name="searchPatientFullName" key="clinic.patient.name" styleClass="small"/>
                <base:testBox name="patientFileNumber" key="clinic.patient.fileNumber" styleClass="small"/>
                <base:comboBox name="sendToCash"  key="com.artonis.clinic.operation.factor.sendToCash" comboLoaderUrl="combo/allSendToCashState" styleClass="small"/>
                <%--<base:comboBox name="state" value="state" key="com.artonis.clinic.basicInfo.operation.status" comboLoaderUrl="combo/loadState" styleClass="small"/>--%>
            </div>

            <div class="uk-grid uk-grid-preserve">
            <%--<base:comboBox styleClass="small" name="cashType" key="his.patient.cashType" comboLoaderUrl="combo/allCashTypeWithSendByDoctor"/>--%>
                <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
                <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
                <base:comboBox name="financeReg"  key="com.artonis.clinic.operation.factor.financeReg" comboLoaderUrl="combo/allFinanceRegState" styleClass="small"/>
            </div>
            <div class="uk-grid uk-grid-preserve">
                <base:comboBox styleClass="small" name="type" key="com.artonis.clinic.operation.factor.type" comboLoaderUrl="combo/allType"/>
                <base:comboBox name="department_id_forsearch" styleClass="small" comboLoaderUrl="combo/loadDepartment" key="com.artonis.clinic.operation.department"/>
                <base:comboBox name="visitState" styleClass="small" comboLoaderUrl="combo/allVisitState" key="com.artonis.clinic.basicInfo.financeRegistration.visitState"/>
			</div>
            <div class="uk-grid uk-grid-preserve">
				<base:comboBox styleClass="small" name="posCMB" key="com.artonis.clinic.basicInfo.financeRegistration.paymentType" comboLoaderUrl="combo/loadAllPos"/>
				<base:comboBox name="doctor_id" key="com.artonis.clinic.basicInfo.employeeContract.doctor_id" comboLoaderUrl="combo/loadAllDoctor" styleClass="small" />
				<base:comboBox name="factorPaymentPrint" key="com.artonis.clinic.basicInfo.financeRegistration.factorPrint" comboLoaderUrl="combo/AllFactorPaymentPrintState" styleClass="small" />
            </div>
            <div class="uk-grid uk-grid-preserve">
				<base:comboBox styleClass="small" name="financeRegistrationPrint" key="com.artonis.clinic.basicInfo.financeRegistration.financeRegistrationPrint" comboLoaderUrl="combo/AllFactorPaymentPrintState"/>

            </div>
        </form>
    </div>

    <base:searchButton defaultReadUrl="<%=gridUrl%>" defaultReadUrlIsRelative="false"/>
    </div>
</div>
<%if(GlobalVariable.getButtonContainer(menuSysCode,"registration-user-permission") && GlobalVariable.getButtonContainer(menuSysCode,"doctor-user-permission")){ %>
	<base:my-grid-search defaultReadUrl="<%=gridUrl%>" defaultReadUrlIsRelative="false" isAccordionable="true" refreshButton="true">
	    <base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fileNumber'  field="patientFileNumber" width="15px"/>
	    <base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fullName'  field="patientFullName" width="19px"/>
		<base:my-grid-column title='com.artonis.clinic.operation.factor.date'  field="registerationDate" width="13px"/>
		<base:my-grid-column title='com.artonis.clinic.research.registration.departmentNameList'  field="departmentList" width="20px"/>
	
	    <base:my-grid-schema-field name="financeRegText" type="string"/>
	    <base:my-grid-schema-field name="date" type="string"/>
	    
		<base:my-grid-function text="clinic.research.survey" functionClick="grid_onSurvey" name="survey" />
		<base:my-grid-function text="clinic.patient.release" functionClick="grid_release" name="releaseFactor" />
		<base:my-grid-function text="clinic.patient.print" functionClick="grid_filePrint" name="filePrint" />
		<base:my-grid-function text="action.delete" functionClick="grid_deleteRecord" name="deleteRecord"  styleClass="uk-button-danger"/>
	</base:my-grid-search>
<% }else if(GlobalVariable.getButtonContainer(menuSysCode,"doctor-user-permission")){ %>
	<base:my-grid-search defaultReadUrl="<%=gridUrl%>" defaultReadUrlIsRelative="false" isAccordionable="true" refreshButton="true">
	    <base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fileNumber'  field="patientFileNumber" width="15px"/>
	    <base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fullName'  field="patientFullName" width="19px"/>
		<base:my-grid-column title='com.artonis.clinic.operation.factor.date'  field="registerationDate" width="13px"/>
		<base:my-grid-column title='com.artonis.clinic.research.registration.departmentNameList'  field="departmentList" width="20px"/>
	
	    <base:my-grid-schema-field name="financeRegText" type="string"/>
	    <base:my-grid-schema-field name="date" type="string"/>
	    
		<base:my-grid-function text="clinic.research.survey" functionClick="grid_onSurvey" name="survey" />
		<base:my-grid-function text="clinic.patient.release" functionClick="grid_release" name="releaseFactor" />
		<base:my-grid-function text="clinic.patient.print" functionClick="grid_filePrint" name="filePrint" />
		<base:my-grid-function text="action.delete" functionClick="grid_deleteRecord" name="deleteRecord"  styleClass="uk-button-danger"/>
	</base:my-grid-search>
<% }else if(GlobalVariable.getButtonContainer(menuSysCode,"registration-user-permission")){ %>
	<base:my-grid-search defaultReadUrl="<%=gridUrl%>" defaultReadUrlIsRelative="false" isAccordionable="true" refreshButton="true">
	    <base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fileNumber'  field="patientFileNumber" width="15px"/>
	    <base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fullName'  field="patientFullName" width="19px"/>
		<base:my-grid-column title='com.artonis.clinic.operation.factor.date'  field="registerationDate" width="13px"/>
		<base:my-grid-column title='com.artonis.clinic.research.registration.departmentNameList'  field="departmentList" width="20px"/>
	
	    <base:my-grid-schema-field name="financeRegText" type="string"/>
	    <base:my-grid-schema-field name="date" type="string"/>
	    
		<base:my-grid-function text="clinic.patient.release" functionClick="grid_release" name="releaseFactor" />
		<base:my-grid-function text="clinic.patient.print" functionClick="grid_filePrint" name="filePrint" />
		<base:my-grid-function text="action.delete" functionClick="grid_deleteRecord" name="deleteRecord"  styleClass="uk-button-danger"/>
	</base:my-grid-search>
<%} %>

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
    $('#patientId').val(e[0].id);
    $('#phone').val(e[0].tel1);
    $('#cellPhone').val(e[0].cellphon);
    $('#age').val(e[0].age);
    ///
//    $('#nameAndFam_Comb').data('kendoComboBox').value(e[0].id);
	var ppb = $("#nameAndFam_Comb").data("kendoComboBox");
//	ppb.dataSource.filter({ logic: 'and', filters: [{ field: "searchField", operator: "contains", value: e[0].filenumber }]});
	ppb.dataSource.filter({ logic: 'and', filters: [{ field: "id", operator: "equal", value: e[0].id }]});
//	ppb.dataSource.read();
	ppb.value(e[0].id);
    ///
    modal.hide();
}

function getSearchObject(){
    var docVar = {};
    docVar.fromDate=$("#fromDate").val();
    docVar.toDate=$("#toDate").val();
    docVar.searchPatientFullName=$("#searchPatientFullName").val();
    docVar.patientFileNumber=$("#patientFileNumber").val();
    docVar.sendToCash=$("#sendToCash").val();
    docVar.financeReg=$("#financeReg").val();
    docVar.type=$("#type").val();
    docVar.department_id_forsearch=$("#department_id_forsearch").val();
    docVar.visitState=$("#visitState").val();
    docVar.doctor_id=$("#doctor_id").val();
    docVar.posCMB=$("#posCMB").val();
    docVar.factorPaymentPrint=$("#factorPaymentPrint").val();
    docVar.financeRegistrationPrint=$("#financeRegistrationPrint").val();
    return docVar;
}
$("#saveRegisterBtn").click(function(){
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

function grid_filePrint(e){
     var data = this.dataItem($(e.target).closest("tr"));
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

function grid_onSurvey(e){
     var data = this.dataItem($(e.target).closest("tr"));
     window.location = "${pageContext.request.contextPath}"+"/clinic/research/survey/" + data.patient_id;
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
				if(<%=(isDoctor && isRegistration)|| isRegistration%>){
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

function grid_deleteRecord(e){
	var data = this.dataItem($(e.target).closest("tr"));
	initRemoveDepartmentDialog(data.id);    
}
$("#newPatientWithReturn").click(function(){
	//window.location = "${pageContext.request.contextPath}"+"/clinic/patientr/patientr/createNewPatientWithReturnToFactor";
	window.location = "${pageContext.request.contextPath}"+"/clinic/patientr/patientr/createNewPatientWithReturnToFactor/"+$("#h_appointmentId").val();
});
$("#editPatientWithReturn").click(function(){
	window.location = "${pageContext.request.contextPath}"+"/clinic/patientr/patientr/editWP/patientId="+$("#nameAndFam_Comb").data("kendoComboBox").value()+",appointmentId="+$("#h_appointmentId").val();
});
$(document).ready(function(){
	$(".nameAndFamClass").find(".k-combobox").css("width","85%").css("padding-right","1%");
    resetForm();
	$("#patientId").val('${patientId}');
	
	
	$('#department_id_Comb').data('kendoComboBox').value('${user_department_id}');
	
	
	$('#nameAndFam_Comb').data('kendoComboBox').value('${patientId}');
	$("#fileNumber").val('${fileNumber}');
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
});
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

function removeFactorDepartmentAction(factorDepartment_id,factor_id){
     var tmp={}
     tmp.factorDepartment_id=factorDepartment_id;
     tmp.factor_id=factor_id;
     
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
									removeFactorDepartmentAction(qTxtEleId[5],qTxtEleId[6]);
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
</script>
<style>
.mouseOverCursor {
     cursor: pointer;
}
th{
	text-align: right;
}
.th-lable{
	/*text-align: left;*/
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
	/* color: #ffffff; */
	/* text-shadow: none; */
	border-width: thin;
	border-color: cornflowerblue;
	color: black;
	text-align: -webkit-center;
	font-weight: bold;
}
/* .ui-accordion-content, .ui-helper-reset, .ui-widget-content, .ui-corner-bottom, .ui-accordion-content-active{
	padding-top: 5px;
	padding-bottom: 5px;
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(rgb(242, 245, 246)), color-stop(0.37, rgb(227, 234, 237)), to(rgb(200, 215, 220)));
}	 */
#search_back{
	padding-top: 5px;
	padding-bottom: 5px;
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(rgb(242, 245, 246)), color-stop(0.37, rgb(227, 234, 237)), to(rgb(200, 215, 220)));
}
</style>