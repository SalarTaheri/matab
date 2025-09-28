<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader6button pageTitle="com.artonis.inv.operation.beginPeriodReceipt.view"/>
<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="fromSerial" key="com.artonis.inv.operation.beginPeriodReceipt.fromSerial"/>
			<base:testBox styleClass="midsmall" name="toSerial"  key="com.artonis.inv.operation.beginPeriodReceipt.toSerial"/>
		    <base:testBox styleClass="midsmall" name="fromReference" key="com.artonis.inv.operation.beginPeriodReceipt.fromReference"/>
			<base:testBox styleClass="midsmall" name="toReference"  key="com.artonis.inv.operation.beginPeriodReceipt.toReference"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="midsmall" name="fromDate" key="com.artonis.inv.operation.beginPeriodReceipt.fromDate"/>
		    <base:mDatePicker styleClass="midsmall" name="toDate" key="com.artonis.inv.operation.beginPeriodReceipt.toDate"/>
		    <base:comboBoxAutoComplete name="inventory_id" styleClass="midsmall" key="com.artonis.inv.operation.beginPeriodReceipt.inventory" comboLoaderUrl="combo/loadAllInventory"
                                       dataTextField="name" dataValueField="id" minLength="0" iscomboLoaderUrlRelative="true"/>
	       <base:comboBoxAutoComplete styleClass="midsmall" name="exporter"
                                       key="com.artonis.inv.operation.beginPeriodReceipt.exporter"
                                       comboLoaderUrl="combo/loadAllEmployee" dataTextField="fullName"
                                       dataValueField="id" minLength="0"
                                       hasTemplate="false"
                                       headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name"
                                       templateComaSep="fullName"/>
	   </div>

	<base:my-grid-search>
		<base:my-grid-column title='com.artonis.inv.operation.beginPeriodReceipt.inventory'  field="inventoryName" width="50px"/>
		<base:my-grid-column title='com.artonis.inv.operation.beginPeriodReceipt.reference'  field="reference" width="50px"/>
		<base:my-grid-column title='com.artonis.inv.operation.beginPeriodReceipt.serial'  field="serial" width="50px"/>
		<base:my-grid-column title='com.artonis.inv.operation.beginPeriodReceipt.date_'  field="date_" width="50px"/>
		<base:my-grid-column title='com.artonis.inv.operation.beginPeriodReceipt.exporter'  field="exporterFullName" width="50px"/>
		<base:my-grid-column title='com.artonis.inv.operation.beginPeriodReceipt.state'  field="stateStr" width="50px"/>

		<base:my-grid-function text="global.crud.print" functionClick="printDocumentWithDetail"  name="documentWithDetailPrintBtn"/>

	    <base:my-grid-search-operation name="register" key="inv.operation.state.register" style="width: 120px"/>
	    <base:my-grid-search-operation name="managerConfirm" key="inv.operation.state.managerConfirm" style="width: 120px"/>
	    <%--<base:my-grid-search-operation name="pricing" key="inv.operation.state.pricing" style="width: 120px"/>--%>
		<base:my-grid-search-operation name="back" key="inv.operation.state.back" style="width: 120px" checkButtonPermission="false"/>
	</base:my-grid-search>

  </form>
</div>

<base:footer/>

<script type="text/javascript">
    function getSearchObject() {
        var beginPeriodReceiptVar = {};
        beginPeriodReceiptVar.fromSerial = $("#fromSerial").val();
        beginPeriodReceiptVar.toSerial = $("#toSerial").val();
        beginPeriodReceiptVar.fromReference = $("#fromReference").val();
        beginPeriodReceiptVar.toReference = $("#toReference").val();
        beginPeriodReceiptVar.fromDate = $("#fromDate").val();
        beginPeriodReceiptVar.toDate = $("#toDate").val();
        beginPeriodReceiptVar.inventory_id = $("#inventory_id").val();
        beginPeriodReceiptVar.exporter = $("#exporter").val();
        return beginPeriodReceiptVar;
    }

    function printDocumentWithDetail(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        var searchJsonString = {};
        searchJsonString.beginPeriodReceipt_id = data.id;
        searchJsonString = JSON.stringify(searchJsonString);
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
        var url = getBaseUrl() + "print/beginPeriodReceiptDocumentItemPrintWrapper/" + searchJsonString;
        window.location = url;
    }
</script>