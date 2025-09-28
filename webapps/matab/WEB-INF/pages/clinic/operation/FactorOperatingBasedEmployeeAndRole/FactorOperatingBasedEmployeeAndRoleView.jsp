<%@ page import="com.artonis.core.base.core.Date" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
    Date curDate=new Date(System.currentTimeMillis());
    String curStringDate=curDate.toString();
%>

<base:pageHeader/>

<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 1;" >
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:comboBox styleClass="small" name="employeeId" key="com.artonis.clinic.operation.surgery.personel" comboLoaderUrl="combo/loadAllEmployee"/>
            <base:comboBox styleClass="small" name="surgeryRoleId" key="com.artonis.clinic.operation.surgery.surgeryRoleName" comboLoaderUrl="combo/loadAllSurgeryRole"/>
            <base:comboBox styleClass="small" name="serviceId" key="com.artonis.clinic.operation.surgery.service.name" comboLoaderUrl="combo/allService"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
        	<base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
        </div>
    </form>
</div>

<base:my-grid-search showOperation="false">
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.personel'  field="fullName" width="40"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.surgeryRoleName'  field="surgeryRoleName" width="40"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.service.name'  field="serviceName" width="40"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.date'  field="date" width="40"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.count'  field="count" width="40"/>
</base:my-grid-search>

<base:footer/>

<script type="text/javascript">
    $(document).ready(function() {
        resetForm();
    });
    function resetForm(){
        $("#fromDate").val("<%=curStringDate%>");
        $("#toDate").val("<%=curStringDate%>");
    }
    function getSearchObject(){
		var docVar = {};
		docVar.fromDate = $("#fromDate").val();
		docVar.toDate = $("#toDate").val();
		docVar.employeeId = $("#employeeId").val();
		docVar.surgeryRoleId = $("#surgeryRoleId").val();
		docVar.serviceId = $("#serviceId").val();
		return docVar;
	}
</script>