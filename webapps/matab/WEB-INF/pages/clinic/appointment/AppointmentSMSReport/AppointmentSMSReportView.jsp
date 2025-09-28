<%@page import="com.artonis.hrm.core.service.util.HrmCoreServiceUtil"%>
<%@ page import="com.artonis.core.base.core.Date"%>
<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@ page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	Date curDate = new Date(System.currentTimeMillis());
	String curStringDate = curDate.toString();
	String gridUrl = new UrlPathHelper().getOriginatingRequestUri(request);
	gridUrl += "/search/defaultSearch/grid-read";
%>

<base:pageHeaderTitle />

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small" />
			<base:mDatePicker name="toDate" key="global.toDate" styleClass="small" />
			<base:multiSelect serverFilter="true" name="smsStatus_values" styleClass="small"
					multiSelectLoaderUrl="combo/loadAllStatus" key="com.artonis.clinic.appointment.appointmentReport.sendSmsStatus" />
		</div>
	</form>
</div>

<base:searchButton defaultReadUrl="<%=gridUrl%>" defaultReadUrlIsRelative="false" />

<div style="margin-top: 10px;">
	<base:my-grid name="statisticGrid" transportReadUrl="${basePath}/grid-read-statistic" showOperation="false" showToolbar="false">
		<base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.sendSmsStatus' field="sendSmsStatusStr" width="80px"/>
		<base:my-grid-column title='com.artonis.clinic.appointment.appointmentReport.count' field="count"  width="120px"/>
	</base:my-grid>
</div>

<base:footer />

<script type="text/javascript">
    $(document).ready(function() {
    	$('#statisticGrid .k-grouping-header').remove();
    	resetForm();
    });

    function resetForm(){
        $("#fromDate").val("<%=curStringDate%>");
        $("#toDate").val("<%=curStringDate%>");
	}

	function getSearchObject() {
		var appVar = {};
		appVar.fromDate = $("#fromDate").val();
		appVar.toDate = $("#toDate").val();
		appVar.smsStatus_values = $("#smsStatus_values_multiSelect").val();
		return appVar;
	}

	function search(){
    	var searchJsonString = "{}";
       	searchJsonString = JSON.stringify(getSearchObject());
       	searchJsonString = searchJsonString.replace(/\//g, ':@:');
        var urlGrid = getBaseUrl() + "grid-read-statistic/" + searchJsonString;
        $("#statisticGrid").data("kendoGrid").dataSource.transport.options.read.url = urlGrid;
        $("#statisticGrid").data("kendoGrid").dataSource.page(1);
    }

	function clearAndSearch(){
		document.forms[0].reset();
		$(':input').val('');
		resetForm();
		search();
	}
</script>