<%@page import="com.artonis.hrm.core.service.util.HrmCoreServiceUtil"%>
<%@ page import="com.artonis.core.base.core.Date" %>
<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
    Date curDate=new Date(System.currentTimeMillis());
    String curStringDate=curDate.toString();
    boolean isEmployeeDoctor = HrmCoreServiceUtil.isEmployeeWorkingGroupDoctor(GlobalVariable.getEmployee().getWorkingGroup());
    Long employeeId = GlobalVariable.getEmployee().getId();
    String gridUrl = new UrlPathHelper().getOriginatingRequestUri(request);
    gridUrl += "/search/defaultSearch/grid-read";
%>
<base:pageHeaderTitle/>
<div style="display:inline;" id="modal-detail"></div>
<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:testBox name="appointmentNameAndFam" key="com.artonis.clinic.appointment.appointmentNameAndFam" styleClass="small"/>
            <base:comboBox name="doctorName" comboLoaderUrl="combo/loadAllDoctor" key="com.artonis.clinic.appointment.doctorName" styleClass="small"/>
            <base:comboBox name="stateOnDay" comboLoaderUrl="combo/loadAllAppointmentDayState"
                           key="com.artonis.clinic.appointment.state.day" styleClass="small" />
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
            <%--<base:comboBox name="state" comboLoaderUrl="combo/loadAllState" key="com.artonis.clinic.appointment.state" styleClass="small" selectIndex="0"/>--%>
            <base:multiSelect serverFilter="true" name="state_values" styleClass="small"
                              multiSelectLoaderUrl="combo/loadAllState" key="com.artonis.clinic.appointment.state" />
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:comboBox styleClass="small" name="department_id" comboLoaderUrl="combo/loadDepartment" key="com.artonis.clinic.operation.department"/>
            <base:comboBox name="registerUser"  key="com.artonis.clinic.appointment.appointmentReport.registerUser"
                           comboLoaderUrl="combo/loadAllEmployee" styleClass="small"/>
            <base:multiSelect name="groupIds" styleClass="small" multiSelectLoaderUrl="combo/loadGroup" serverFilter="true"
                              key="com.artonis.clinic.appointment.appointmentReport.group"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:multiSelect name="serviceIds" styleClass="small" multiSelectLoaderUrl="combo/loadAllService" serverFilter="true"
                              key="com.artonis.clinic.appointment.appointmentReport.service"/>
            <base:testBox name="description" key="com.artonis.clinic.appointment.appointmentReport.description" styleClass="small"/>
            <base:checkbox name="notContaindescription" key="com.artonis.clinic.appointment.appointmentReport.notContaindescription" styleClass="small"/>
        </div>

    </form>
</div>
<div align="center">
	<div align="center" style="display: inline-flex;">
		<base:searchButton defaultReadUrl="<%=gridUrl%>" defaultReadUrlIsRelative="false"/>
	    <base:buttonPermission key="com.artonis.clinic.appointment.appointmentReport.checkSMS" classNames="uk-button uk-button-success"
	    	onClick="checkSMS()" id="btn_call_check_sms" style="margin-right: 5px;" />	
	</div>
</div>
<div class="uk-container uk-container-center my-uk-container" >

    <base:my-grid name="statisticGrid" transportReadUrl="${basePath}/grid-read-statistic" showOperation="false" showToolbar="false">
    	<base:my-grid-column title='com.artonis.clinic.appointment.doctorName' field="doctorName" width="20px"/>
    	<base:my-grid-column title='com.artonis.clinic.appointment.state' field="stateTxt" width="20px"/>
    	<base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.service' field="actionListIds_converted_text" width="20px"/>
    	<base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.count' field="count"  width="10px"/>
    </base:my-grid>

    <base:my-grid-search  showMultipleDelete="false" showOperation="false"  isAccordionable="true">
        <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.nameAndFam'  field="nameAndFam" width="100px"/>
        <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.fileNumber'  field="fileNumber" width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.date'  field="appPersionDate" width="50px"/>
        <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.registerUser'  field="registerUser" width="40px"/>
        <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.cellPhone'  field="cellPhone" width="50px"/>
        <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.tel'  field="phone" width="40px"/>
        <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.time'  field="timeStr" width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.patientRegistered'  field="patientRegistered" width="60px"/>
        <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.turn'  field="turn" width="40px"/>
        <%-- <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.turn'  field="order" width="40px"/> --%>
        <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.actionListNames'  field="actionListNames" width="80px"/>
        <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.doctorName'  field="doctorName" width="40px"/>
        <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.description'  field="description" width="60px"/>
        <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.state'  field="stateTxt" width="50px"/>
        <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.sendSmsStatus'  field="sendSmsStatusStr" width="50px"/>
        <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.reportSmsStatus'  field="reportSmsStatusStr" width="50px"/>
        <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.smsMsgId'  field="smsMsgId" width="50px"/>
    </base:my-grid-search>
</div>
<base:footer/>

<script type="text/javascript">
    $(document).ready(function() {
    	$('#statisticGrid .k-grouping-header').remove();
    	//---------------
        var isEmployeeDoctor=<%=isEmployeeDoctor%>;
        var employeeId=<%=employeeId%>;
        if(isEmployeeDoctor==true){
            $("#doctorName").val(employeeId);
            $("#doctorName_Comb").data("kendoComboBox").value(employeeId);
            $("#doctorName_Comb").data("kendoComboBox").enable(false);;
            $("#clearAndSearchBtn").remove();
            $("#printBtn").remove();
        }
        resetForm();
    });

    function resetForm(){
        $("#fromDate").val("<%=curStringDate%>");
        $("#toDate").val("<%=curStringDate%>");
    }
    
    function getSearchObject(){
        var appVar = {};
        appVar.fromDate=$("#fromDate").val();
        appVar.toDate=$("#toDate").val();
        appVar.nameAndFam=$("#appointmentNameAndFam").val();
        appVar.description=$("#description").val();
        appVar.notContaindescription=$("#notContaindescription").is(":checked");
        appVar.tdTime=$("#time").val();
        appVar.actionListNames=$("#service").val();
        appVar.doctorId=$("#doctorName").val();
        appVar.doctorId_txt=$("#doctorName_Comb").data("kendoComboBox").text();
        appVar.stateOnDay=$("#stateOnDay").val();
        appVar.stateOnDay_txt=$("#stateOnDay_Comb").data("kendoComboBox").text();
        appVar.state=$("#state").val();
        appVar.departmentId=$("#department_id").val();
        appVar.departmentId_txt=$("#department_id_Comb").data("kendoComboBox").text();

        appVar.state_values=$("#state_values_multiSelect").val();

        var stateDataItems=$("#state_values_multiSelect").data("kendoMultiSelect")._dataItems;
        if(stateDataItems!=undefined &&stateDataItems.length>0){
            var state_valueText='';
            for(var j=0;j<stateDataItems.length;j++){
                state_valueText+=stateDataItems[j].ComboCaption+' , ';
            }
            appVar.state_text=state_valueText.substring(0,state_valueText.length-3);
        }

        var groupIdsItems=$("#groupIds_multiSelect").data("kendoMultiSelect")._dataItems;
        if(groupIdsItems!=undefined &&groupIdsItems.length>0){
            var groupId_valueText='';
            for(var j=0;j<groupIdsItems.length;j++){
                groupId_valueText+=groupIdsItems[j].ComboCaption+' , ';
            }
            appVar.groupId_text=groupId_valueText.substring(0,groupId_valueText.length-3);
        }

        var serviceIdsItems=$("#serviceIds_multiSelect").data("kendoMultiSelect")._dataItems;
        if(serviceIdsItems!=undefined &&serviceIdsItems.length>0){
            var serviceId_valueText='';
            for(var j=0;j<serviceIdsItems.length;j++){
                serviceId_valueText+=serviceIdsItems[j].ComboCaption+' , ';
            }
            appVar.serviceId_text=serviceId_valueText.substring(0,serviceId_valueText.length-3);
        }

        appVar.registerUser=$("#registerUser_Comb").data("kendoComboBox").text();
        
        var getOptionArray = function(options){
        	var arr = [];
        	for(var i=0;i<options.length;i++){
            	arr[i]=options[i].value;
            }
        	return arr;
        };
        
		appVar.serviceIds = getOptionArray($("#serviceIds_multiSelect[data-role='multiselect']")[0].selectedOptions);
		appVar.groupIds = getOptionArray($("#groupIds_multiSelect[data-role='multiselect']")[0].selectedOptions);

        return appVar;
    }
    
    function doAfterClearAndSearch(){
        $("#stateOnDay_Comb").data("kendoComboBox").select(1);
        $("#stateOnDay").val(2);
    }
    
    function doAfterSearch(str){
        var urlGrid = getBaseUrl() + "grid-read-statistic/" + str;
        $("#statisticGrid").data("kendoGrid").dataSource.transport.options.read.url = urlGrid;
        $("#statisticGrid").data("kendoGrid").dataSource.page(1);
    }
    
    function checkSMS(){
    	var searchJsonString = JSON.stringify(getSearchObject());
    	searchJsonString = searchJsonString.replace(/\//g, ':@:');
		$.getJSON("<c:url value='/' />" + "clinic/appointment/appointmentReport/checkSMS/" + searchJsonString , function(data) {
			alertify.success(data.state);
		}).fail(function(failur) {
			alert('Error');
			console.log(failur);
		});
    }
</script>