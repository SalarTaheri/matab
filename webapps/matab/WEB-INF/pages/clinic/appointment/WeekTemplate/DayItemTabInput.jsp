<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="uk-container uk-container-center my-uk-container" style="margin-top: 0px;">
	<form class="uk-form2-partition">
		<div class="p-q-radio uk-form-controls" style="">
			<span style="padding-left: 25px;">
				<%=ResourceBoundleHolder.resourceBundle.getString("com.clinic.appointment.weekTemplate.itemFillingType")%>:
			</span>
			<label class="p-q-label uk-form-label" style="width:50px">
				<%=ResourceBoundleHolder.resourceBundle.getString("com.clinic.appointment.weekTemplate.itemFillingType.custom")%>
				<input type="radio" class="p-q-radio" name="itemFillingType" value="1" onclick="handleClick(this)" />
			</label>
			<label class="p-q-label uk-form-label" style="width:50px; padding-right: 40px">
				<%=ResourceBoundleHolder.resourceBundle.getString("com.clinic.appointment.weekTemplate.itemFillingType.byHourTemplate")%>
				<input type="radio" class="p-q-radio" name="itemFillingType" value="2" onclick="handleClick(this)" />
			</label>
		</div>
	</form>
</div>

<div class="uk-container uk-container-center my-uk-container customFillingDiv" style="display: none">
	<form class="uk-form2-DayItem">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="dayNumber" key="com.artonis.clinic.appointment.weekTemplate.daysWeek" comboLoaderUrl="combo/loadAllDays" styleClass="small" />
			<base:timePicker name="fromTime" key="com.artonis.clinic.appointment.appointmentConfig.startTime" styleClass="small" interval="15"/>
			<base:timePicker name="toTime" key="com.artonis.clinic.appointment.appointmentConfig.endTime" styleClass="small" interval="15"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumeric name="timeDistance" key="com.artonis.clinic.appointment.appointmentConfig.periodTime" styleClass="small" />
			<base:testBoxNumeric name="capacity" key="com.artonis.clinic.appointment.weekTemplate.capacity" styleClass="small" />
			<base:testBoxNumeric name="internetCapacity" key="com.artonis.clinic.appointment.weekTemplate.internetCapacity" styleClass="small" />
		</div>
	</form>
</div>

<div class="uk-container uk-container-center my-uk-container hourTemplateFillingDiv" style="display: none">
	<form class="uk-form2-WeekTemplateHourTemplateItem">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:multiSelect serverFilter="true" name="hourTemplateDayNumber" styleClass="small" multiSelectLoaderUrl="combo/loadAllDays"
							  key="com.artonis.clinic.appointment.weekTemplate.daysWeek" />
			<base:timePicker name="hourTemplateFromTime" key="com.artonis.clinic.appointment.appointmentConfig.startTime" styleClass="small" interval="60"/>
			<base:timePicker name="hourTemplateToTime" key="com.artonis.clinic.appointment.appointmentConfig.endTime" styleClass="small" interval="60"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="hourTemplateId" key="com.clinic.appointment.weekTemplate.hourTemplate" comboLoaderUrl="combo/loadAllHourTemplate" styleClass="small" />
		</div>
	</form>
</div>

<div align="center" style="padding-top: 10px; display: none;" id="hourTemplate_saveAndResetBtnDiv">
	<button class="uk-button uk-button-success" id="hourTemplateSaveBtn" > <%=ResourceBoundleHolder.resourceBundle.getString("global.crud.save")%> </button>
	<button class="uk-button uk-button-success" id="hourTemplateNewBtn" > <%=ResourceBoundleHolder.resourceBundle.getString("global.crud.new")%> </button>
</div>

<script type="application/javascript">
	function handleClick(myRadio) {
		if (myRadio.value == 1) {
			showCustomFillingDiv();
		} else if (myRadio.value == 2) {
			showHourTemplateFillingDiv();
		}
	}

	function showCustomFillingDiv(){
		$("div .customFillingDiv").show();
		$("#DayItem_saveAndResetBtnDiv").show();
		$("div .hourTemplateFillingDiv").hide();
		$("#hourTemplate_saveAndResetBtnDiv").hide();
	}

	function showHourTemplateFillingDiv(){
		$("div .hourTemplateFillingDiv").show();
		$("div .customFillingDiv").hide();
		$("#DayItem_saveAndResetBtnDiv").hide();
		$("#hourTemplate_saveAndResetBtnDiv").show();
	}

	$("#hourTemplateNewBtn").click(function(){
		$(".uk-form2-WeekTemplateHourTemplateItem")[0].reset();
		$(".uk-form2-WeekTemplateHourTemplateItem").find(":input").val('');
	});

	var getOptionArray = function(options){
		var arr = [];
		for(var i=0;i<options.length;i++){
			arr[i]=options[i].value;
		}
		return arr;
	};

	$("#hourTemplateSaveBtn").click(function(){
		$("#body-table").block({ message: '<div><img  style="padding: 5px;" src="<c:url value='/resources/images/loader.gif'/>" /> لطفا  تا تکمیل فرآیند ثبت صبور باشید ...</div>'});

		var	tmp = {};
		tmp["weekTemplateId"] = $("#id").val();
		tmp["dayNumbers"] = getOptionArray($("#hourTemplateDayNumber_multiSelect")[0].selectedOptions);
		tmp["fromTime"] = document.getElementById("hourTemplateFromTime").value;
		tmp["toTime"] = document.getElementById("hourTemplateToTime").value;
		tmp["hourTemplateId"] = document.getElementById("hourTemplateId").value;

		jQuery.ajax({
			url: "${pageContext.request.contextPath}" + "/clinic/appointment/weekTemplate/saveWeekTemplateHourTemplateItem",
			type: "POST",
			data: JSON.stringify(tmp),
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			success: function (result) {
				$("#body-table").unblock();
				//
				if (result.state == "error") {
					for (var i = 0; i < result.errors.length; i++) {
						alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
					}
				}
				if (result.state == "success") {
					alertify.success(result.message);
					//
					var urlGrid=$("#DayItem").data("kendoGrid").dataSource.transport.options.read.url;
					var indexnumber=urlGrid.valueOf().lastIndexOf("/");
					var subUrlGrid=urlGrid.valueOf().substring(0,indexnumber);
					urlGrid=subUrlGrid.valueOf()+"/"+ $("#id").val();
					$("#DayItem").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
					$("#DayItem").data("kendoGrid").dataSource.read();
					//
					$("#hourTemplateNewBtn").click();
				}
			}
		});
	});

	function _DayItem_beforeEdit(e,data){
		showCustomFillingDiv();
		document.getElementsByName("itemFillingType")[0].checked = true;
	}

	function callback_validation_before_save_DayItem(){
	    if ($("#timeDistance").val() == undefined || $("#timeDistance").val() == '' || $("#timeDistance").val() < 1) {
            alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.doctorAppointmentCalendarOverview.error.timeDistanceDoesntValid")%>');
	        return false;
		}
		return true;
	}
</script>

<style>
#DayItem_saveAndResetBtnDiv{
	display: none;
}
</style>