<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
ResourceBundle resourceBundle = ResourceBoundleHolder.resourceBundle;
%>

<style>
.weekDay {
	padding: 0;
	width: 64px;
	height: 40px;
	text-align: center;
}
#weekDays {
	border: 1px gray solid;
	border-radius: 4px;
}
#calendar {
	width: 448px;
	display: none;
}
.cell,.disabledCell {
	display: inline-block;
	text-align: center;
	vertical-align: middle;
}
.cell {
	cursor: pointer;
	border: 1px gray solid;
	border-radius: 4px;
	margin: 2px;
	width: 58px;
	height: 53px;
	color: red;
}
.cellHeader {
	width: 100%;
	height: 40%;
	background-color: gray;
	color: white;
}
.hasAppointment {
	background-color: #00BBFF;
}
.disabledCell {
	width: 64px;
	height: 55px;
}
.todayCell {
	border-color: #1B7E28;
}
.todayCell .cellHeader {
	background-color: #1B7E28;
}
.hollydayCell {
	border-color: #CD2626;
}
.hollydayCell .cellHeader {
	background-color: #CD2626;
}
.cell:hover div,.cell:hover,.selected,.selected div {
	background-color: #ADADAD;
}
.cellDropHover {
    background-color: #ADADAD;
}
.monthButton {
	width: 64px;
	height: 64px;
	cursor: pointer;
}
#currentDateLabel {
	text-align: center;
	font-size: large !important;
}
#calendarDaysCells {
	padding: 10px 0 0 0;
}
#editArea {
	display: none;
}
fieldset {
	border: 1px gray solid;
	border-radius: 4px;
	padding: 0 10px 10px 10px;
	margin-right: 10px;
	display: inline;
}
legend {
	padding: 0 5px 0 5px;
}
.cellChanged {
	font-size: 20px !important;
}
td>span {
	padding: 0 !important;
}
#weekTemplates {
	min-width: 70%;
	display: none;
}
.weekTemplate {
    border: 1px solid gray;
    border-radius: 3px;
    margin-top: 15px;
    padding: 3px 0 3px 0;
    cursor: grab;
    cursor: -moz-grab;
    cursor: -webkit-grab;
    background-color: white;
}
.weekTemplate:hover {
    background-color: #D2E0E6;
}
.ui-draggable-dragging {
    cursor: grabbing;
    cursor: -moz-grabbing;
    cursor: -webkit-grabbing;
}
.doctorCombo {
	display: inline-block
}
span.k-timepicker{
	width: 90% !important;
}
</style>

<script src="<c:url value='/resources/jquery-ui-1.10.3.custom.min.js'/>"></script>
<script src="<c:url value='/resources/persian-date.js'/>"></script>

<base:dialogConfirm name="ignoreDepartmentChangesConfirm" key="com.artonis.clinic.appointment.doctorAppointmentCalendarOverview.ignoreDepartmentChangesConfirm"
                    yesFunction="ignoreDepartmentChangesConfirmYes" noFunction="ignoreDepartmentChangesConfirmNo" />

<base:dialogConfirm name="ignoreDoctorChangesConfirm" key="com.artonis.clinic.appointment.doctorAppointmentCalendarOverview.ignoreDoctorChangesConfirm"
                    yesFunction="ignoreDoctorChangesConfirmYes" noFunction="ignoreDoctorChangesConfirmNo" />

<table style="width: 100%; height: 100%">
	<tr style="height: 60px;">
		<td style="width: 30%">
			<base:comboBox styleClass="none" styledivLabel="display: inline-block" stylediv="display: inline-block" value="departmentComboId" name="departmentCombo" comboLoaderUrl="combo/loadAllDepartmentByUser" key="com.appointment.department" />
		</td>
		<td style="width: 45%">
			<base:comboBoxAutoComplete name="doctorCombo" styleClass="doctorCombo" key="com.appointment.doctor" comboLoaderUrl="combo/loadAllDoctor" styledivLabel="display: inline-block"
									   dataTextField="fullName" dataValueField="id" minLength="0" hasTemplate="false" iscomboLoaderUrlRelative="true"/>
		</td>
		<td style="width: 25%">
		</td>
	</tr>
	<tr>
		<td>
			<div id="editArea">
				<div id="timeInDayEditDiv">
					<fieldset style="padding: 10px;">
						<table id="timeInDayArea">
							<tr>
								<base:comboBox name="timeInDayList" key="com.artonis.clinic.appointment.doctroAppointmentCalendar.timeInDayList" styleClass="none"
											   comboLoaderUrl="combo/loadTimeInDayList/-1" styledivLabel="width: 30%; display: inline-block; text-align: right;"
											   stylediv="display: inline-block; width: 52%; padding-right: 35px;"/>
							</tr>
							<tr>
								<td>
									<%=resourceBundle.getString("calendar.fromTime")%>:
								</td>
								<td>
									<input type="text" id="timeInDayFromTime" />
								</td>
							</tr>
							<tr>
								<td>
									<%=resourceBundle.getString("calendar.toTime")%>:
								</td>
								<td>
									<input type="text" id="timeInDayToTime" />
								</td>
							</tr>
							<tr>
								<td>
									<%=resourceBundle.getString("calendar.capacity")%>:
								</td>
								<td>
									<input type="number" id="timeInDayCapacity" min="0" />
								</td>
							</tr>
							<tr>
								<td>
									<%=resourceBundle.getString("calendar.internetCapacity")%>:
								</td>
								<td>
									<input type="number" id="timeInDayInternetCapacity" min="0" />
								</td>
							</tr>
							<tr>
								<td style="padding-top: 10px;">
									<input class="uk-button uk-button-success" id="saveTimeInDayButton" type="button"
										   onclick="saveTimeInDayButtonClick()" value='<%=resourceBundle.getString("calendar.saveChanges")%>'/>
								</td>
								<td style="padding-top: 10px;">
									<button class="uk-button uk-button-danger timeInDayDeleteBtn"><%=resourceBundle.getString("global.delete")%></button>
								</td>
							</tr>
						</table>
					</fieldset>
				</div>
				<br/>
				<div id="periodDiv">
					<fieldset style="padding: 10px;">
						<table id="doctorAppointmentCalendarArea">
							<tr>
								<base:comboBox name="doctorAppointmentCalendarList" key="com.artonis.clinic.appointment.doctroAppointmentCalendar.doctroAppointmentCalendarList"
											   comboLoaderUrl="combo/loadDoctorAppointmentCalendarList/-1" styledivLabel="width: 30%; display: inline-block; text-align: right;"
											   stylediv="display: inline-block; width: 50%; padding-right: 35px;" styleClass="none"/>
							</tr>
							<tr>
								<td>
									<%=resourceBundle.getString("calendar.fromTime")%>:
								</td>
								<td>
									<input type="text" id="fromTime" />
								</td>
							</tr>
							<tr>
								<td>
									<%=resourceBundle.getString("calendar.toTime")%>:
								</td>
								<td>
									<input type="text" id="toTime" />
								</td>
							</tr>
							<tr>
								<td>
									<%=resourceBundle.getString("calendar.timeDistance")%>:
								</td>
								<td>
									<input type="number" id="timeDistance" min="0" />
								</td>
							</tr>
							<tr>
								<td>
									<%=resourceBundle.getString("calendar.capacity")%>:
								</td>
								<td>
									<input type="number" id="capacity" min="0" />
								</td>
							</tr>
							<tr>
								<td>
									<%=resourceBundle.getString("calendar.internetCapacity")%>:
								</td>
								<td>
									<input type="number" id="internetCapacity" min="0" />
								</td>
							</tr>
							<tr>
								<td style="padding-top: 10px;">
									<input class="uk-button uk-button-success" id="saveDoctorAppointmentCalendarButton" type="button"
										   onclick="saveDoctorAppointmentCalendarButton()" value='<%=resourceBundle.getString("calendar.saveChanges")%>'/>
								</td>
								<td style="padding-top: 10px;">
									<button class="uk-button uk-button-danger doctorAppointmentCalendarDeleteBtn"><%=resourceBundle.getString("global.delete")%></button>
									<button class="uk-button uk-button-danger doctorAppointmentCalendarDeleteAllItemBtn">
										<%=resourceBundle.getString("com.artonis.clinic.appointment.doctroAppointmentCalendar.deleteAllItem")%></button>
								</td>
							</tr>
						</table>
					</fieldset>
				</div>
            </div>
		</td>
		<td style="vertical-align: top; padding-right: 10%;">
			<table id="calendar">
				<tr>
					<td class="monthButton">
						<img onclick="nextMonthButtonClick()" title='<%=resourceBundle.getString("calendar.nextMonth")%>' src='<c:url value="/resources/images/black/arrow-right.png"/>' />
					</td>
					<td colspan="5" id="currentDateLabel">
					</td>
					<td class="monthButton">
						<img onclick="previousMonthButtonClick()" title='<%=resourceBundle.getString("calendar.previousMonth")%>' src='<c:url value="/resources/images/black/arrow-left.png"/>' />
					</td>
				</tr>
				<tr id="weekDays">
				</tr>
				<tr>
					<td id="calendarDaysCells" colspan="7">
						
					</td>
				</tr>
				<tr>
					<td colspan="7" style="padding-top: 10px">
						<input style="display: none;" class="uk-button uk-button-success"
							   id="saveButton" type="button" onclick="customFormSave()" value='<%=resourceBundle.getString("calendar.saveChanges")%>'/>
					</td>
				</tr>
			</table>
			<br/>
		</td>
		<td style="vertical-align: top; text-align: center;">
			<fieldset id="weekTemplates">
				<legend><%=resourceBundle.getString("com.artonis.clinic.appointment.doctorAppointmentCalendarOverview.weekTemplates")%></legend>
                <div id="weekTemplatesDiv"></div>
			</fieldset>
		</td>
	</tr>
</table>
<script>

// ****************************** Model Objects ******************************
<%
DateFormat dateFormat = new SimpleDateFormat("MMMM dd, yyyy");
Date date = new Date();
%>
var todayMiladi = new Date("<%=dateFormat.format(date)%>");
var todayShamsi = new persianDate(todayMiladi);
var currentCalendarDate = persianDate(todayShamsi);
var calendarDays = [];
var changes = [];
var doctorId;
var departmentId;
var selectedCellIndex;
var weekTemplates;
var dayTemplates;

var weekDayNames = ["<%=resourceBundle.getString("calendar.saturday")%>",
					"<%=resourceBundle.getString("calendar.sunday")%>",
					"<%=resourceBundle.getString("calendar.monday")%>",
					"<%=resourceBundle.getString("calendar.tuesday")%>",
					"<%=resourceBundle.getString("calendar.wednesday")%>",
					"<%=resourceBundle.getString("calendar.thursday")%>",
					"<%=resourceBundle.getString("calendar.friday")%>"];

var monthNames = ["<%=resourceBundle.getString("calendar.farvardin")%>",
				  "<%=resourceBundle.getString("calendar.ordibehesht")%>",
				  "<%=resourceBundle.getString("calendar.khordad")%>",
				  "<%=resourceBundle.getString("calendar.tir")%>",
				  "<%=resourceBundle.getString("calendar.mordad")%>",
				  "<%=resourceBundle.getString("calendar.shahrivar")%>",
				  "<%=resourceBundle.getString("calendar.mehr")%>",
				  "<%=resourceBundle.getString("calendar.aban")%>",
				  "<%=resourceBundle.getString("calendar.azar")%>",
				  "<%=resourceBundle.getString("calendar.dey")%>",
				  "<%=resourceBundle.getString("calendar.bahman")%>",
				  "<%=resourceBundle.getString("calendar.esfand")%>"];

// ****************************** View Events ******************************

function refreshCalendar(hideEditArea, selectedCell) {
	if (!(!!hideEditArea) && hideEditArea!=false){
		hideEditArea = true;
	}
	if (doctorId && doctorId > 0 && departmentId && departmentId > 0) {
		$("#calendar").show();
		//$("#weekTemplates").show();
	} else {
		$("#calendar").hide();
		$("#weekTemplates").hide();
		return;
	}
	if (hideEditArea) {
		$("#editArea").hide();
	}

	var fromDate = persianDate(currentCalendarDate).date(1);
	var toDate = persianDate(currentCalendarDate).date(currentCalendarDate.daysInMonth());
	
	fromDate.formatPersian = false;
	toDate.formatPersian = false;
	fromDate = fromDate.format("YYYY/MM/DD");
	toDate = toDate.format("YYYY/MM/DD");
	
	var data = {doctorId: doctorId, departmentId: departmentId, fromDate: fromDate, toDate: toDate};
	
	$.ajax({url: "<c:url value='/clinic/appointment/doctorAppointmentCalendarOverview/loadAllDoctorAppointmentCalendarsInRangeAndWeekTemplates' />",
            type: "POST",
            data: data,
            success: function (data){
				createCalendar(data, selectedCell)
			},
            error: function (result) {
                if (result.status == 401)
                    top.location.href = top.location.href;
            }
        });
}

function createDoctorAppointmentCalendars() {
	var result = [];
	for(var i = 0; i < 3; i++)
		result.push({id: "", fromTime: "", toTime: "", appPersionDate: "", timeDistance: "", capacity: "", internetCapacity: ""});
	return result;
}

function insertDoctorAppointmentCalendar(doctorAppointmentCalendars, doctorAppointmentCalendar) {
	for(var i = 0; i < 3; i++)
		if(!doctorAppointmentCalendars[i].fromTime) {
			copyDoctorAppointmentCalendar(doctorAppointmentCalendar, doctorAppointmentCalendars[i]);
			break;
		}
}

function copyDoctorAppointmentCalendar(from, to) {
	to.id = from.id;
	to.fromTime = from.fromTime;
	to.toTime = from.toTime;
	to.appPersionDate = from.appPersionDate;
	to.timeDistance = from.timeDistance;
	to.capacity = from.capacity;
	to.internetCapacity = from.internetCapacity;
}

function createCalendar(data, selectedCell) {

	var doctorAppointmentCalendars = data.doctorAppointmentCalendars;
	calendarDays = [];
	for (var i = 0; i < currentCalendarDate.daysInMonth(); i++) {
		calendarDays[i] = {date: persianDate(currentCalendarDate).date(i + 1), doctorAppointmentCalendars: createDoctorAppointmentCalendars()};
		for (var j = 0; j < doctorAppointmentCalendars.length; j++) {
			var doctorAppointmentCalendarDate = persianDate(doctorAppointmentCalendars[j].appPersionDate.split("/").map(Number));
			if(calendarDays[i].date.diff_floor(doctorAppointmentCalendarDate, "days") == 0)
				insertDoctorAppointmentCalendar(calendarDays[i].doctorAppointmentCalendars, doctorAppointmentCalendars[j]);
		}
	}

	$("#currentDateLabel").html(currentCalendarDate.format("MMMM YYYY"));
	
	var firstDayOfMonth = calendarDays[0].date.day();

	if (firstDayOfMonth == 0) //T.G.I.F.
		firstDayOfMonth = 7;
	
	$("#calendarDaysCells").html("");
	for (var i = 1; i < firstDayOfMonth; i++)
		$("#calendarDaysCells").append("<span class='disabledCell'>&nbsp;</span>");
    
	for (var i = 0; i < calendarDays.length; i++) {
		var cellClass = "cell";
		if (calendarDays[i].date.diff_floor(todayShamsi, "days") == 0)
			cellClass += " todayCell";
		else if ((calendarDays[i].date.day() % 7) == 0)
			cellClass += " hollydayCell";
		
		var cellBody = "";
		var changesIndex = searchChanges(calendarDays[i]);
		if(changesIndex != -1) {
			if (hasAppointment(changes[changesIndex].doctorAppointmentCalendars))
				cellClass += " hasAppointment";

			cellBody = "<span class='cellChanged'>*</span>";
		} else {
			if (hasAppointment(calendarDays[i].doctorAppointmentCalendars))
				cellClass += " hasAppointment";
		}
		
		$("#calendarDaysCells").append("<div id='cell" + i + "' calendarDayIndex='" + i + "' onclick='cellClick(this," + i + ")' class='" + cellClass
			+ "'><div class='cellHeader'>" + calendarDays[i].date.date().toString().toPersianDigit() + "</div>" + cellBody + "</div>");
	}

    weekTemplates = data.weekTemplates;
    dayTemplates = data.dayTemplates;

    $("#weekTemplatesDiv").html("");
    for (var i = 0; i < weekTemplates.length; i++)
        $("#weekTemplatesDiv").append("<div class='weekTemplate' weekTemplateId='" + weekTemplates[i].id + "'>" + weekTemplates[i].name + "</div>");

    $("#weekTemplatesDiv div").draggable({revert: "invalid", helper: myHelper});
    $(".cell").droppable({drop: handleDropEvent, hoverClass: "cellDropHover"});

	if (!!selectedCell || selectedCell == 0) {
		$("#calendarDaysCells div").removeClass("selected");
		$($("#cell"+selectedCell)[0]).addClass("selected");
		//
		reloadComboDoctorAppointmentCalendarList(calendarDays[selectedCell].doctorAppointmentCalendars);
		initDoctorAppointmentCalendarElement();
		reloadComboTimeInDayList(calendarDays[selectedCell].doctorAppointmentCalendars);
		initTimeInDayElement();
	}
}

function myHelper(event) {
    return $(event.target).clone().width($(".weekTemplate").width());
}

function handleDropEvent(event, ui) {
    var weekTemplateId = $(ui.draggable).attr("weekTemplateId");
    var calendarDayIndex = $(this).attr("calendarDayIndex");
    var date = calendarDays[calendarDayIndex].date;

    if (date.day() == 0 && date.date() != 1)
        date = date.subtract("days", 1);

    if (date.day() != 0) {
        if (date.startOf("week").diff(date.startOf("month"), "days") < 0)
            date = date.startOf("month");
        else
            date = date.startOf("week").add("days", 1);
    }

    do {
        var day = date.day();
        if (day == 0) //T.G.I.F.
            day = 7;

        var dayTemplate = searchDayTemplates(weekTemplateId, day);
        if(dayTemplate != null) {
            var doctorAppointmentCalendar = calendarDays[date.date() - 1].doctorAppointmentCalendars[0];
            doctorAppointmentCalendar.fromTime = dayTemplate.fromTime;
            doctorAppointmentCalendar.toTime = dayTemplate.toTime;
            doctorAppointmentCalendar.timeDistance = dayTemplate.timeDistance;
            doctorAppointmentCalendar.capacity = dayTemplate.capacity;
            doctorAppointmentCalendar.internetCapacity = dayTemplate.internetCapacity;

            calendarDayChanged(date.date() - 1);
        }

        date = date.add("days", 1);
        if(date.day() == 1 || date.date() == 1) {
            break;
        }
    } while(true);
}

function hasAppointment(doctorAppointmentCalendars) {
	for(var i = 0; i < 3; i++)
		if(doctorAppointmentCalendars[i].fromTime != "")
			return true;

	return false;
}

function callback_change_departmentCombo() {
    if (changes.length != 0) {
        $("#ignoreDepartmentChangesConfirm").data("contents", "").dialog("open");
    } else {
        ignoreDepartmentChangesConfirmYes();
    }
}

function ignoreDepartmentChangesConfirmYes() {
    departmentId = Number($("#departmentCombo_Comb").data("kendoComboBox").value());
    changes = [];
	refreshCalendar();
}

function ignoreDepartmentChangesConfirmNo() {
    $("#departmentCombo_Comb").data("kendoComboBox").value(departmentId);
}

function callback_change_doctorCombo() {
    if (changes.length != 0) {
        $("#ignoreDoctorChangesConfirm").data("contents", "").dialog("open");
    } else {
        ignoreDoctorChangesConfirmYes();
    }
}

function ignoreDoctorChangesConfirmYes() {
    doctorId = Number($("#doctorCombo_Comb").data("kendoComboBox").value());
    changes = [];
    refreshCalendar();
}

function ignoreDoctorChangesConfirmNo() {
    $("#doctorCombo_Comb").data("kendoComboBox").value(doctorId);
}

function nextMonthButtonClick() {
	currentCalendarDate = currentCalendarDate.add("months", 1);
	refreshCalendar();
}

function previousMonthButtonClick() {
	currentCalendarDate = currentCalendarDate.subtract("months", 1);
	refreshCalendar();
}

function validate() {
	var message = "";

	for (var i = 1; i <= 3; i++) {
		if(!$("#period" + i + "Checkbox").prop("checked")) {

			if(!$("#fromTime" + i).data("kendoTimePicker").value())
				message += '<%=resourceBundle.getString("calendar.fromTimeIsEmpty")%>' + "\n";

			if(!$("#toTime" + i).data("kendoTimePicker").value())
				message += '<%=resourceBundle.getString("calendar.toTimeIsEmpty")%>' + "\n";

			if(!$("#timeDistance" + i).data("kendoNumericTextBox").value())
				message += '<%=resourceBundle.getString("calendar.timeDistanceTimeIsEmpty")%>' + "\n";

			if(!$("#capacity" + i).data("kendoNumericTextBox").value())
				message += '<%=resourceBundle.getString("calendar.capacityTimeIsEmpty")%>' + "\n";

//			if(!$("#internetCapacity" + i).data("kendoNumericTextBox").value())
				<%--message += '<%=resourceBundle.getString("calendar.intetnetCapacityTimeIsEmpty")%>' + "\n";--%>
		}
	}

	if(!!message) {
		alert(message);
		return false;
	}
	return true;
}

function cellClick(div, calendarDaysIndex) {
	selectedCellIndex = calendarDaysIndex;
	
	$("#calendarDaysCells div").removeClass("selected");
	$(div).addClass("selected");
	
	var doctorAppointmentCalendars = calendarDays[calendarDaysIndex].doctorAppointmentCalendars;

	initDoctorAppointmentCalendarElement();

	reloadComboDoctorAppointmentCalendarList(doctorAppointmentCalendars);

	reloadComboTimeInDayList(doctorAppointmentCalendars);

	initTimeInDayElement();

	$("#editArea").show();
}

function reloadComboDoctorAppointmentCalendarList(doctorAppointmentCalendars){
	var id = "-1";
	if (doctorAppointmentCalendars != null && !!doctorAppointmentCalendars[0] && doctorAppointmentCalendars[0].id.length > 0) {
		id = doctorAppointmentCalendars[0].id;
	}
	var combo = $("#doctorAppointmentCalendarList_Comb").data("kendoComboBox");
	combo.value("");
	var url = combo.dataSource.transport.options.read.url;
	url = url.substring(0, Number(url.lastIndexOf("/")));
	combo.dataSource.data({});
	combo.dataSource.transport.options.read.url = url + "/" + id;
	combo.dataSource.read();
}

function initDoctorAppointmentCalendarElement(){
	$("#fromTime").kendoTimePicker({format: "HH:mm", interval: 30, change: cellChanged}).data("kendoTimePicker").value("");
	$("#toTime").kendoTimePicker({format: "HH:mm", interval: 30, change: cellChanged}).data("kendoTimePicker").value("");
	$("#timeDistance").kendoNumericTextBox({change: cellChanged, format: "n0"}).data("kendoNumericTextBox").value("");
	$("#capacity").kendoNumericTextBox({change: cellChanged, format: "n0"}).data("kendoNumericTextBox").value("");
	$("#internetCapacity").kendoNumericTextBox({change: cellChanged, format: "n0"}).data("kendoNumericTextBox").value("");
}

function reloadComboTimeInDayList(doctorAppointmentCalendars){
	var id = "-1";
	if (doctorAppointmentCalendars != null && !!doctorAppointmentCalendars[0] && doctorAppointmentCalendars[0].id.length > 0) {
		id = doctorAppointmentCalendars[0].id;
	}
	var combo = $("#timeInDayList_Comb").data("kendoComboBox");
	combo.value("");
	$("#timeInDayList").val('');
	var url = combo.dataSource.transport.options.read.url;
	url = url.substring(0, Number(url.lastIndexOf("/")));
	combo.dataSource.data({});
	combo.dataSource.transport.options.read.url = url + "/" + id;
	combo.dataSource.read();
}

function periodCheckboxChanged(index, e) {
	if($("#period" + index + "Checkbox").prop("checked")) {
		$("#fromTime" + index).data("kendoTimePicker").value("");
		$("#toTime" + index).data("kendoTimePicker").value("");
		$("#timeDistance" + index).data("kendoNumericTextBox").value("");
		$("#capacity" + index).data("kendoNumericTextBox").value("");
		$("#internetCapacity" + index).data("kendoNumericTextBox").value("");

		$("#fromTime" + index).data("kendoTimePicker").enable(false);
		$("#toTime" + index).data("kendoTimePicker").enable(false);
		$("#timeDistance" + index).data("kendoNumericTextBox").enable(false);
		$("#capacity" + index).data("kendoNumericTextBox").enable(false);
		$("#internetCapacity" + index).data("kendoNumericTextBox").enable(false);
	} else {
		$("#fromTime" + index).data("kendoTimePicker").enable(true);
		$("#toTime" + index).data("kendoTimePicker").enable(true);
		$("#timeDistance" + index).data("kendoNumericTextBox").enable(true);
		$("#capacity" + index).data("kendoNumericTextBox").enable(true);
		$("#internetCapacity" + index).data("kendoNumericTextBox").enable(true);
	}
	
	if (typeof e != "undefined")
		cellChanged();
}

function cellChanged() {
	/*for (var i = 1; i <= 3; i++) {
		var doctorAppointmentCalendar = calendarDays[selectedCellIndex].doctorAppointmentCalendars[i - 1];
		doctorAppointmentCalendar.fromTime = $("#fromTime" + i).data("kendoTimePicker").value();
		doctorAppointmentCalendar.toTime = $("#toTime" + i).data("kendoTimePicker").value();
		doctorAppointmentCalendar.timeDistance = $("#timeDistance" + i).data("kendoNumericTextBox").value();
		doctorAppointmentCalendar.capacity = $("#capacity" + i).data("kendoNumericTextBox").value();
		doctorAppointmentCalendar.internetCapacity = $("#internetCapacity" + i).data("kendoNumericTextBox").value();
	}

    calendarDayChanged(selectedCellIndex);*/
}

function calendarDayChanged(cellIndex) {
    if(hasAppointment(calendarDays[cellIndex].doctorAppointmentCalendars))
        $("#cell" + cellIndex).addClass("hasAppointment");
    else
        $("#cell" + cellIndex).removeClass("hasAppointment");

    var index = searchChanges(calendarDays[cellIndex]);
    if(index == -1)
        changes.push(calendarDays[cellIndex]);
    else
        changes[index] = calendarDays[cellIndex];

    $("#cell" + cellIndex + " .cellChanged").remove();
    $("<span class='cellChanged'>*</span>").insertAfter($("#cell" + cellIndex + " .cellHeader"));
}

function searchChanges(calendarDay) {
	for (var i = 0; i < changes.length; i++)
		if(changes[i].date.diff_floor(calendarDay.date, "days") == 0)
			return i;

	return -1;
}

function searchDayTemplates(weekTemplateId, dayOfWeek) {
    for (var i = 0; i < dayTemplates.length; i++)
        if (dayTemplates[i].weekTemplateId == weekTemplateId && dayTemplates[i].dayNumber == dayOfWeek)
            return dayTemplates[i];

    return null;
}

function customFormSave() {
	if(!validate())
		return;

	var data = new Array();
	for (var i = 0; i < changes.length; i++) {
		for (var j = 0; j < changes[i].doctorAppointmentCalendars.length; j++) {
			if(!!changes[i].doctorAppointmentCalendars[j].fromTime || !!changes[i].doctorAppointmentCalendars[j].id) {
				var object = new Object();
				object.id = changes[i].doctorAppointmentCalendars[j].id;
				object.doctorId = doctorId;
				object.departmentId = departmentId;
				changes[i].date.formatPersian = false;
				object.appPersionDate = changes[i].date.format("YYYY/MM/DD");
				var date = changes[i].date.toDate();
				object.appDate = date.getFullYear() + "-" + twoDigit(date.getMonth() + 1) + "-" + twoDigit(date.getDate());
				object.longDate = changes[i].date.valueOf();
				
				if(!!changes[i].doctorAppointmentCalendars[j].fromTime) {
					object.capacity = changes[i].doctorAppointmentCalendars[j].capacity;
					object.internetCapacity = changes[i].doctorAppointmentCalendars[j].internetCapacity;
					object.timeDistance = changes[i].doctorAppointmentCalendars[j].timeDistance;
					var fromTime = changes[i].doctorAppointmentCalendars[j].fromTime;
					var toTime = changes[i].doctorAppointmentCalendars[j].toTime;
                    if (typeof fromTime == "string")
                        object.fromTime = fromTime;
                    else
                        object.fromTime = twoDigit(fromTime.getHours()) + ":" + twoDigit(fromTime.getMinutes());

                    if (typeof toTime == "string")
                        object.toTime = toTime;
                    else
                        object.toTime = twoDigit(toTime.getHours()) + ":" + twoDigit(toTime.getMinutes());
				}
				data.push(object);
			}
		}
	}
	
	$.ajax({url: "<c:url value='/clinic/appointment/doctorAppointmentCalendarOverview/save' />",
            type: "POST",
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
            	if (result.state == "error") {
            		alertify.error(result.errors);
            	} else if (result.state == "success") {
                	alertify.success(result.message);
					changes = [];
            		refreshCalendar();
                }else if (result.state == "emptyList"){
				}
            },
            error: function (result) {
                if (result.status == 401)
                    top.location.href = top.location.href;
            }
        });

}

function twoDigit(digit) {
	return (digit < 10 ? "0" + digit : digit);
}

$(document).ready(function() {
	for (var i = 0; i < weekDayNames.length; i++) {
		$("#weekDays").append("<td class='weekDay'>" + weekDayNames[i] + "</td>");
	}
	//
	initTimeInDayElement();
	//
});

function initTimeInDayElement() {
	$("input[name='timeInDayList_Comb_input']").attr("disabled","disabled").css("background-color", "gainsboro");
	$("#timeInDayFromTime").kendoTimePicker({format: "HH:mm", interval: 5, change: function(e){changeTimeInDayElement(e)}});
	$("#timeInDayToTime").kendoTimePicker({format: "HH:mm", interval: 5, change: function(e){changeTimeInDayElement(e)}});
	$("#timeInDayCapacity").kendoNumericTextBox({format: "n0", change: function(e){changeTimeInDayElement(e)}, spin: function(e){changeTimeInDayElement(e)}});
	$("#timeInDayInternetCapacity").kendoNumericTextBox({format: "n0", change: function(e){changeTimeInDayElement(e)}, spin: function(e){changeTimeInDayElement(e)}});
	//
	$("#timeInDayFromTime").data("kendoTimePicker").value("");
	$("#timeInDayToTime").data("kendoTimePicker").value("");
	$("#timeInDayCapacity").data("kendoNumericTextBox").value("");
	$("#timeInDayInternetCapacity").data("kendoNumericTextBox").value("");
	//
	changeTimeInDayFlag = false;
}

function changeTimeInDayElement(e){
	changeTimeInDayFlag = true;
}

function callback_change_timeInDayList(e){
	fetchAndPushTimeInDay(e.sender._old);
}

function fetchAndPushTimeInDay(timeInDayId){
	$.ajax({
		url: "<c:url value='/clinic/appointment/doctorAppointmentCalendarOverview/loadTimeInDay/' />" + timeInDayId,
		type: "GET",
		dataType: "json",
		success: function (result) {
			$("#timeInDayFromTime").data("kendoTimePicker").value(result.startTime);
			$("#timeInDayToTime").data("kendoTimePicker").value(result.endTime);
			$("#timeInDayCapacity").data("kendoNumericTextBox").value(result.reminder);
			$("#timeInDayInternetCapacity").data("kendoNumericTextBox").value(result.internetReminder);
			//
			changeTimeInDayFlag = false;
		}
	});
}

$(".timeInDayDeleteBtn").click(function(){
	var id = $("#timeInDayList").val();

	if (id == ""){
		alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("global.error.noRowsSelected")%>");
		return;
	}

	var areUShure = "<%=ResourceBoundleHolder.resourceBundle.getString("action.alert.areYouSure.delete")%>";
	alertify.confirm(areUShure, function (e) {
		if (e) {
			jQuery.ajax({
				url: "<c:url value='/clinic/appointment/doctorAppointmentCalendarOverview/deleteTimeInDay/'/>" + id,
				type: "GET",
				dataType: "json",
				success: function (result) {
					if (result.state == "success") {
						alertify.success(result.message);
						resetTimeInDayList();
					} else if (result.state == "error") {
						alertify.error(result.message);
					}
				},
				error: function (result) {
					alertify.error("Something is not good! O_o");
				}
			});
		}
	});
});

function resetTimeInDayList(){
	var combo = $("#timeInDayList_Comb").data("kendoComboBox");
	combo.dataSource.data({});
	combo.dataSource.read();
	$("#timeInDayList").val('');
	$("#timeInDayFromTime").data("kendoTimePicker").value("");
	$("#timeInDayToTime").data("kendoTimePicker").value("");
	$("#timeInDayCapacity").data("kendoNumericTextBox").value("");
	$("#timeInDayInternetCapacity").data("kendoNumericTextBox").value("");
	$("input[name='timeInDayList_Comb_input']").val("");
	changeTimeInDayFlag = false;
}

function callback_DataBound_timeInDayList(e){
	$("input[name='timeInDayList_Comb_input']").val("");
	$("#timeInDayList_Comb").data("kendoComboBox").value("");
}

function callback_before_select_timeInDayList(e){
	if (changeTimeInDayFlag) {
		e.preventDefault();
		var combo = $("#timeInDayList_Comb").data("kendoComboBox");
		var old = e.sender.value();
		var select = combo.dataItem(e.item.index()).ComboID;
		var areUShure = "<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.doctroAppointmentCalendar.timeInDayListChangedAlert")%>";
		alertify.confirm(areUShure, function(ea) {
			if (ea) {
				combo.value(select);
				fetchAndPushTimeInDay(select);
			}
			return false;
		});
		return false;
	}
}

function saveTimeInDay(){
	var timeInDayId = $("#timeInDayList").val();

	if(timeInDayId == ""){
		alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("global.error.noRowsSelected")%>");
		return;
	}

	changeTimeInDayFlag = false;

	var timeInDayFromTime = $("#timeInDayFromTime").val();
	var timeInDayToTime = $("#timeInDayToTime").val();
	var timeInDayCapacity = $("#timeInDayCapacity").data("kendoNumericTextBox").value();
	var timeInDayInternetCapacity = $("#timeInDayInternetCapacity").data("kendoNumericTextBox").value();

	var data = {};
	data.id = timeInDayId;
	data.startTime = timeInDayFromTime;
	data.endTime = timeInDayToTime;
	data.reminder = timeInDayCapacity;
	data.internetReminder = timeInDayInternetCapacity;

	$.ajax({
		url: "<c:url value='/clinic/appointment/doctorAppointmentCalendarOverview/saveTimeInDay'/>",
		type: "POST",
		data: JSON.stringify(data),
		dataType: "json",
		contentType: "application/json; charset=utf-8",
		success: function (result) {
			if (result.state == "error") {
				if(result.errors==undefined){
					alertify.error(result.message);
				}else{
					for(var i=0; i<result.errors.length; i++){
						if($("label[for='"+ result.errors[i].Field + "']").text().length>0){
							alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
						}else{
							alertify.error( result.errors[i].Field + ":  " +  result.errors[i].Message);
						}
					}
				}

			} else if (result.state == "success") {
				if (result.message != undefined) {
					alertify.success(result.message);
				}
				resetTimeInDayList();
			}
		}
	});
}

//
var changeTimeInDayFlag = false;
//

function callback_change_doctorAppointmentCalendarList(e){
	if (e.sender._old == "" || !!e.sender._old == false) {
		return;
	}
	$.ajax({
		url: "<c:url value='/clinic/appointment/doctorAppointmentCalendarOverview/loadDoctorAppointmentCalendar/' />" + e.sender._old,
		type: "GET",
		dataType: "json",
		success: function (result) {
			$("#fromTime").data("kendoTimePicker").value(result.fromTime);
			$("#toTime").data("kendoTimePicker").value(result.toTime);
			$("#timeDistance").data("kendoNumericTextBox").value(result.timeDistance);
			$("#capacity").data("kendoNumericTextBox").value(result.capacity);
			$("#internetCapacity").data("kendoNumericTextBox").value(result.internetCapacity);
		}
	});
}

function saveDoctorAppointmentCalendarButton(){
	var data = {};
	var combo = $("#doctorAppointmentCalendarList_Comb").data("kendoComboBox");
	data.id = combo.value();
	data.fromTime = $("#fromTime").val();
	data.toTime = $("#toTime").val();
	data.timeDistance = $("#timeDistance").data("kendoNumericTextBox").value();
	data.capacity = $("#capacity").data("kendoNumericTextBox").value();
	data.internetCapacity = $("#internetCapacity").data("kendoNumericTextBox").value();
	data.doctorId = doctorId;
	data.departmentId = departmentId;
	var date = calendarDays[selectedCellIndex].date;
	date.formatPersian = false;
	data.appPersionDate = date.format("YYYY/MM/DD");
	data.appDate = date.gDate.getFullYear() + "-" + twoDigit(date.gDate.getMonth() + 1) + "-" + twoDigit(date.gDate.getDate());
	data.longDate = date.valueOf();
	//
	if (data.timeDistance == undefined || data.timeDistance == '' || data.timeDistance < 1) {
        alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.doctorAppointmentCalendarOverview.error.timeDistanceDoesntValid")%>');
	    return;
	}
	//
	$.ajax({
		url: "<c:url value='/clinic/appointment/doctorAppointmentCalendarOverview/saveDoctorAppointmentCalendar'/>",
		type: "POST",
		data: JSON.stringify(data),
		dataType: "json",
		contentType: "application/json; charset=utf-8",
		success: function (result) {
			if (result.state == "error") {
				alertify.error(result.errors);
			} else if (result.state == "success") {
				alertify.success(result.message);
				refreshCalendar(false, selectedCellIndex);
			}
		}
	});
}

function saveTimeInDayButtonClick(){
	saveTimeInDay();
}

$("#timeInDayCapacity").keyup(function(){
	changeTimeInDayElement();
});

$("#timeInDayInternetCapacity").keyup(function(){
	changeTimeInDayElement();
});

$(".doctorAppointmentCalendarDeleteBtn").click(function(){
	var combo = $("#doctorAppointmentCalendarList_Comb").data("kendoComboBox");
	var id = combo.value();

	if (id == ""){
		alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("global.error.noRowsSelected")%>");
		return;
	}

	var areUShure = "<%=ResourceBoundleHolder.resourceBundle.getString("action.alert.areYouSure.delete")%>";
	alertify.confirm(areUShure, function (e) {
		if (e) {
			jQuery.ajax({
				url: "<c:url value='/clinic/appointment/doctorAppointmentCalendarOverview/deleteDoctorAppointmentCalendar/'/>" + id,
				type: "GET",
				dataType: "json",
				success: function (result) {
					if (result.state == "success") {
						alertify.success(result.message);
						refreshCalendar(false, selectedCellIndex);
					} else if (result.state == "error") {
						alertify.error(result.message);
					}
				},
				error: function (result) {
					alertify.error("Something is not good! O_o");
				}
			});
		}
	});
});

$(".doctorAppointmentCalendarDeleteAllItemBtn").click(function(){
	var areUShure = "<%=ResourceBoundleHolder.resourceBundle.getString("action.alert.areYouSure.delete")%>";
	alertify.confirm(areUShure, function (e) {
		if (e) {
			var data = {};
			data.doctorId = doctorId;
			data.departmentId = departmentId;
			var date = calendarDays[selectedCellIndex].date;
			date.formatPersian = false;
			data.appPersionDate = date.format("YYYY/MM/DD");
			data.appDate = date.gDate.getFullYear() + "-" + twoDigit(date.gDate.getMonth() + 1) + "-" + twoDigit(date.gDate.getDate());
			//
			jQuery.ajax({
				url: "<c:url value='/clinic/appointment/doctorAppointmentCalendarOverview/deleteAllDoctorAppointmentCalendar'/>" ,
				type: "POST",
				data: JSON.stringify(data),
				dataType: "json",
				contentType: "application/json; charset=utf-8",
				success: function (result) {
					if (result.state == "success") {
						alertify.success(result.message);
						refreshCalendar(false, selectedCellIndex);
					} else if (result.state == "error") {
						alertify.error(result.message);
					}
				},
				error: function (result) {
					alertify.error("Something is not good! O_o");
				}
			});
		}
	});
});
</script>
