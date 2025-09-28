<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<script src="<c:url value='/resources/canvasjsChart/canvasjs.min.js'/>"></script>

<div class="body-header" style="padding: 0px 15px 0px 0px !important">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb" style="margin: 0px;">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
</div>

<div>
	<div style="display: flex; padding-top: 5px; min-height: 300px;">
	
		<div style="width: 70%;">
			<base:button key="global.crud.new" styleClass="null" id="reloadPageBtn" stylediv="text-align: right; padding-right: 10px;"/>
			<form class="uk-form" >
				<div class="uk-grid uk-grid-preserve" style="padding-top: 110px; padding-right: 5%;">
					<input type="hidden" id="editedSliceId" />
					<base:testBoxNumericEx styleClass="verysmall" name="time" key="com.artonis.clinic.appointment.hourTemplate.time" />
					<base:testBoxNumericEx styleClass="verysmall" name="telephonyTurn" key="com.artonis.clinic.appointment.hourTemplate.telephonyTurn"/>
					<base:testBoxNumericEx styleClass="verysmall" name="internetTurn" key="com.artonis.clinic.appointment.hourTemplate.internetTurn"/>
					<base:button id="addTimePartBtn" styleClass="null" key="com.artonis.clinic.appointment.hourTemplate.addTimePart"/>
				</div>
			</form>	
		</div>
		
		<div style="display: flex; width: 30%;">
			<div id="chartContainer" />
		</div>
	
	</div>
</div>

<div class="savePartDiv">
	<form class="uk-form" >
		<div class="uk-grid uk-grid-preserve" >
			<input type="hidden" id="loadedId" />
			<base:testBox styleClass="small" name="name" key="com.artonis.clinic.appointment.hourTemplate.name" />
			<base:testBox styleClass="small" name="code" key="com.artonis.clinic.appointment.hourTemplate.code"/>
			<base:button id="saveBtn" styleClass="null" key="com.artonis.clinic.appointment.hourTemplate.save"/>
		</div>
	</form>	
</div>

<div>
	<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single" exportToExcellEnable="false" groupable="false" showToolbar="false" pageSize="3">
		<base:my-grid-column title='com.artonis.clinic.appointment.hourTemplate.name' field="name" width="50px"/>
		<base:my-grid-column title='com.artonis.clinic.appointment.hourTemplate.code' field="code" width="50px"/>
	</base:my-grid>
</div>

<script type="text/javascript">
	var dps = [];
	var chart;
	var chartSliceInEdit;

	function makePie() {
		chart = new CanvasJS.Chart("chartContainer",
		{
			colorSet: "myColorSet",
			backgroundColor: "",
			data: [
			{
				type: "pie",
				dataPoints: dps,
				startAngle:  270,
				click: onClick,
				toolTipContent: '<%=ResourceBoundleHolder.resourceBundle.getString("com.appointment.time")%> : {time} <%=ResourceBoundleHolder.resourceBundle.getString("global.minute")%>' 
					+ '<br/>' + '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.hourTemplate.internetTurn")%> : {internetTurn}'
					+ '<br/>' + '<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.hourTemplate.telephonyTurn")%> : {telephonyTurn}'
			}
			],
		 	width: 300,
		 	height: 300,
		 	animationEnabled: true,
		 	animationDuration: 500
		});
		
		for (var i=0 ; i<chart.options.data[0].dataPoints.length ; i++) {
			chart.options.data[0].dataPoints[i].exploded = false;			
		}
		
		chart.render();
		
		chartSliceInEdit = false;
	}
	
	function onClick(e) {
		if (e.dataPoint.id == -1) {
			alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.hourTemplate.error.notAssignedArea")%>');
			e.dataPoint.exploded = false;
			return;
		}
		if (e.dataPoint.time == 60) {
			e.dataPoint.exploded = false;
		}
		<%--
		if (e.dataPoint.id == $("#editedSliceId").val()) {
			e.dataPoint.exploded = true;
		}
 		if (chartSliceInEdit == true && e.dataPoint.id != $("#editedSliceId").val()) {
			alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.hourTemplate.error.firstSaveOtherChanges")%>');
			e.dataPoint.exploded = false;
			return;
		} 
		--%>
		chartSliceInEdit = true;
		$("#editedSliceId").val(e.dataPoint.id);
		$("#time").val(e.dataPoint.time);
		$("#internetTurn").val(e.dataPoint.internetTurn);
		$("#telephonyTurn").val(e.dataPoint.telephonyTurn);
		setNumericTextValue();
	}
	
	function initPie(){
		dps.push({y: 60, internetTurn: 0, telephonyTurn: 0, id: -1, time: 60});
		
		$("#time").val(60);
		$("#internetTurn").val(0);
		$("#telephonyTurn").val(0);
		setNumericTextValue();
		
		CanvasJS.addColorSet("myColorSet",["#ffffff"]);
		makePie();
	} 
	
	$(document).ready(function(){
		$("#addTimePartBtn").removeClass("uk-button-success").addClass("uk-button-primary");
		//
		initPie();		
	});
	
	$("#addTimePartBtn").click(function(){
		var editedSliceId = $("#editedSliceId").val();
		var time = eval($("#time").val());
		var internetTurnVal = $("#internetTurn").val();
		var telephonyTurnVal = $("#telephonyTurn").val();
		
		addTimePart(editedSliceId, time, internetTurnVal, telephonyTurnVal, true);
	});
	
	function addTimePart(editedSliceId, time, internetTurnVal, telephonyTurnVal, renderPie) {
		if ($.isNumeric(time) == false || $.isNumeric(internetTurnVal) == false || $.isNumeric(telephonyTurnVal) == false) {
			alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.hourTemplate.error.fieldsValuesNotValid")%>');
			return;
		}
		if (time < 1) {
			alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.hourTemplate.error.timeMustBeLongerThenZero")%>');
			return;
		}
		
		var dpsTmp = dps.slice();
		
		if (chartSliceInEdit == true) {
			dpsTmp.forEach(function(val){
				if (val.id == editedSliceId) {
					val.y = time;
					val.internetTurn = internetTurnVal;
					val.telephonyTurn = telephonyTurnVal;
					val.time = time;
				}
	        })			
		}
		
		var sum = 0;
		for (var i=0; i < dpsTmp.length-1; i++) { 
			sum = eval(sum) + eval(dpsTmp[i].time);
		}
		
		if ((chartSliceInEdit == true && sum > 60) || (chartSliceInEdit == false && eval(sum + time) > 60)) {
			alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.hourTemplate.error.hourTemplateOverlap")%>');
			return;
		}

		if (chartSliceInEdit == false && sum == 60){
			alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.hourTemplate.error.hourTemplateIsFull")%>');
			return;
		}
		
		for(var i=1; i <= dpsTmp.length; i++){
			dps.shift();
		}
		
		for(var i=0; i < dpsTmp.length-1; i++){
			dps.push(dpsTmp[i]);
		}
		
		var remainder; 
		if (chartSliceInEdit == false){
			//add new
			dps.push({y: time , internetTurn: internetTurnVal , telephonyTurn: telephonyTurnVal , id: dps.length+1 , time: time});
			remainder = 60 - (sum + time);
		}else{
			remainder = 60 - sum;
		}
		
		dps.push({y: remainder , internetTurn: 0 , telephonyTurn: 0 , id: -1 , time: remainder});
		
		var myColorSet = [];
		for (var i=1 ; i<dps.length ; i++) {
			if (i % 4 == 0) {
				myColorSet.push("#1a8cff");
			}else if (i % 4 == 1){
				myColorSet.push("#E7C206");
			}else if (i % 4 == 2){
				myColorSet.push("#cc0000");
			}else {
				myColorSet.push("#009900");
			}
		}
		if (myColorSet.length > 1 && remainder < 1 && myColorSet[myColorSet.length-1] == myColorSet[0]) {
			myColorSet[myColorSet.length-1] = "#8b1b8c";
		}
		myColorSet.push("#ffffff");
		
		CanvasJS.addColorSet("myColorSet", myColorSet);
		
		if (renderPie == true) {
			makePie();			
		}
		
		//reset
		$("#editedSliceId").val("");
		$("#time").val(remainder);
		$("#internetTurn").val(0);
		$("#telephonyTurn").val(0);
		setNumericTextValue();
	} 
	
	$("#reloadPageBtn").click(function(){
		window.location = getBaseUrl();
	});
	
	$("#saveBtn").click(function(){
		if ($("#name").val() == "") {
			alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.hourTemplate.error.fillName")%>');
			return;
		}
		if (dps.length < 2) {
			alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.hourTemplate.error.fillTime")%>');
			return;
		}
		
		var data = {};
		data.id = $("#loadedId").val();
		data.name = $("#name").val();
		data.code = $("#code").val();
		data.hourTemplateTimeList = dps;
		
		$.ajax({
			url: "<c:url value='/clinic/appointment/hourTemplate/save' />",
            type: "POST",
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
            	if (result.state == "error") {
            		alertify.error(result.errors);
            	} else if (result.state == "success") {
                	alertify.success(result.message);
                	$("#reloadPageBtn").click();
                }
            },
            error: function (result) {
                if (result.status == 401)
                    top.location.href = top.location.href;
            }
        });
		
	});
	
	function grid_grid_custom_onEdit(data){
		$("#loadedId").val(data.id);
		$("#name").val(data.name);
		$("#code").val(data.code);
		//
		var requestUrl = "${pageContext.request.contextPath}" + "/clinic/appointment/hourTemplate/getTimes/" + data.id;
		$.getJSON(requestUrl, function (result) {
			if (result.state == "success") {
				if (result.timeList != null && result.timeList != undefined && result.timeList.length > 0) {
					chartSliceInEdit = false;
					var len = dps.length;
					for(var i=1; i <= len; i++){
						dps.shift();
					}
					dps.push({y: 60, internetTurn: 0, telephonyTurn: 0, id: -1, time: 60});
					for(var i=0; i<result.timeList.length; i++){
						var editedSliceId = null;
						var time = result.timeList[i].time;
						var internetTurnVal = result.timeList[i].internetTurn;
						var telephonyTurnVal = result.timeList[i].telephonyTurn;
						var renderPie = false;
						if (i == result.timeList.length-1) {
							renderPie = true;
						}
						addTimePart(editedSliceId, time, internetTurnVal, telephonyTurnVal, renderPie);
					}
				}
			}
		});
		//
	}
	
</script>

<style>
.canvasjs-chart-credit{
	display: none;
}
.canvasjs-chart-tooltip{
	left: 0px !important;
}
.uk-width-1-10 {
    width: 12%;
}
.uk-width-1-10 input[type='text']{
	text-align: center;
}
.uk-grid > [class*='uk-width-'] {
    padding-right: 5px;
}
.canvasjs-chart-canvas{
    background-image: url(<c:url value='/resources/images/clock1.png' />);
	background-repeat: no-repeat;
    background-position: center center; 
}
.savePartDiv{
	background: -webkit-gradient(linear, left top, left bottom, color-stop(29%,rgba(212,225,241,1)), color-stop(33%,rgba(201,218,238,1)), color-stop(100%,rgba(228,240,253,1)));
	padding: 25px;
	margin-top: 10px;
	border-bottom: 1px solid #cacaca;
	border-top: 1px solid #cacaca;
}
</style>