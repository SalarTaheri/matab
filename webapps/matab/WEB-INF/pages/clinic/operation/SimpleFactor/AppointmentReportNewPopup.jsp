<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<div align="right">
<div id="appointmentFormAccordion" style="border: 1">
    <h3 id="appointmentSearchTab" style="	margin-bottom: 5px;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(29%,rgba(212,225,241,1)), color-stop(33%,rgba(201,218,238,1)), color-stop(100%,rgba(228,240,253,1)));
	/* color: #ffffff; */
	/* text-shadow: none; */
	border-width: thin;
	border-color: cornflowerblue;
	text-align: -webkit-center;
	font-weight: bold;">جستجوی پیشرفته</h3>
    <div id="appointmentSearch_back">
        <div  class="uk-container uk-container-center my-uk-container" style="margin-top: 5px;margin-bottom: 5px;padding-top: 5px;padding-bottom: 5px;">
            <form class="uk-form" id="popupForm">
                <div class="uk-grid uk-grid-preserve">
                    <base:testBox name="appointmentNameAndFam" key="com.artonis.clinic.appointment.appointmentNameAndFam" styleClass="normal"/>
                    <base:comboBox name="doctorName" comboLoaderUrl="combo/loadAllDoctor" key="com.artonis.clinic.appointment.doctorName" styleClass="normal"/>
                    
                </div>

                <div class="uk-grid uk-grid-preserve" style=" display: none; ">
                    <base:testBox name="service" key="com.artonis.clinic.appointment.service" styleClass="normal"/>
                    <base:testBox name="time" key="com.artonis.clinic.appointment.time" styleClass="normal"/>
                </div>
            </form>
        </div>
	    <div align="center" style="padding-top: 1px">
			<button class="uk-button uk-button-success" type="button" onclick="javascript:popupSearch()" id="mySearchBtn">
				<%=ResourceBoundleHolder.resourceBundle.getString("global.search")%>
			</button>
			<button class="uk-button uk-button-success" type="button" onclick="javascript:popupClearAndSearch()" id="myClearAndSearchBtn">
				<%=ResourceBoundleHolder.resourceBundle.getString("global.clearAndSearch")%>
			</button>
		</div>
    </div>
</div>

<base:mehrSys-grid-mongo name="grid_popup" transportReadUrl="${basePath}/grid-read" selectable="single" onDoubleSelectRowEvent="selectAppointmentReportRowEventCallBack">
    <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.nameAndFam'  field="nameAndFam" width="100px"/>
    <%--<base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.date'  field="appPersionDate" width="80px"/>--%>
    <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.cellPhone'  field="cellPhone" width="80px"/>
    <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.tel'  field="phone" width="80px"/>
    <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.time'  field="timeStr" width="50px"/>
    <%--<base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.turn'  field="turn" width="50px"/>--%>
    <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.actionListNames'  field="actionListNames" width="80px"/>
    <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.doctorName'  field="doctorName" width="80px"/>
    <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.description'  field="description" width="60px"/>
    <base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.state'  field="stateTxt" width="50px"/>
    
    <base:my-grid-function text="com.artonis.clinic.appointment.appointmentReport.register" functionClick="grid_onAppointmentRptBtnRegister" name="appointmentRpt-btn-register" />
    <base:my-grid-function text="com.artonis.clinic.appointment.appointmentReport.log" functionClick="grid_onAppointmentRptBtnLog" name="appointmentRpt-btn-log" />
</base:mehrSys-grid-mongo>

<base:footer/>
</div>

<style>
	.uk-modal-dialog{
		padding-top: 2px;
		padding-bottom: 5px;
/* 		top: 3%;
        margin-left: 0px !important;
        margin-right: 0px; */
        position: fixed;
        right: 42%;
	}
	.appointmentSearch_back{
		padding-right: 5px;
		padding-left: 5px;
		padding-top: 5px;
		padding-bottom: 5px;
		
	}
	.my-popup-title{
		display: none;
		
	}
	.my-popup-body{
		padding-top: 5px;
		padding-bottom: 5px;
		padding-right: 5px;
		padding-left: 5px;
	}
	.my-uk-container{
		margin-top: 5px;
		margin-bottom: 5px;
		padding-top: 5px;
		padding-bottom: 5px;
		margin-right: 0px;
		margin-left: 0px;
		padding-right: 2px;
		padding-left: 2px;
	}
	#appointmentSearch_back{
		padding-right: 5px;
		padding-left: 5px;
		padding-top: 0px;
		padding-bottom: 5px;
	}
	#appointmentSearchTab{
		padding-bottom: 2px;
		padding-left: 5px;
		padding-right: 5px;
		padding-top: 2px;
	}
</style>

<script>
	$("#appointmentNameAndFam").change(function(e) {
            popupSearch();
	});
	/*function grid_onAppointmentRptBtnRegister(e){
	     //var data = this.dataItem($(e.target).closest("tr"));
	     //window.location = "${pageContext.request.contextPath}"+"/clinic/basicInfo/financeRegistration/create/" + data.id;
	}*/
	
	function grid_onAppointmentRptBtnLog(e){
	     //var data = this.dataItem($(e.target).closest("tr"));
	     //window.location = "${pageContext.request.contextPath}"+"/clinic/basicInfo/financeRegistration/create/" + data.id;
	}
	
	var icons = {
        header: "ui-icon-circle-arrow-e",
        activeHeader: "ui-icon-circle-arrow-s"
    };
	$( "#appointmentFormAccordion" ).accordion({
        icon:icons,
        heightStyle: "content",
        collapsible: true,
        active:0
    });
/////////////////////////////////////////////////////////////////////////
function popupSearch(){
	var searchJsonString = "{}";
   	searchJsonString = JSON.stringify(getPopupSearchObject());
   	searchJsonString = searchJsonString.replace(/\//g, ':@:');
	var urlGrid = getBaseUrl() + "search/popupSearch/grid-read/" + searchJsonString;
	$("#grid_popup").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
	$("#grid_popup").data("kendoGrid").dataSource.page(1);
}
function popupClearAndSearch(){
	document.forms["popupForm"].reset();
	$("#popupForm :input").val("");
    var urlGrid = getBaseUrl() + "popup/appointmentReportNew/grid-read";
    $("#grid_popup").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
    $("#grid_popup").data("kendoGrid").dataSource.page(1);
}
function getPopupSearchObject(){
    var appVar = {};
    appVar.nameAndFam=$("#appointmentNameAndFam").val();
    appVar.tdTime=$("#time").val();
    appVar.actionListNames=$("#service").val();
    appVar.doctorId=$("#doctorName").val();
    return appVar;
}

function callback_change_doctorName(e){
	popupSearch();
}
/////////////////////////////////////////////////////////////////////////
</script>