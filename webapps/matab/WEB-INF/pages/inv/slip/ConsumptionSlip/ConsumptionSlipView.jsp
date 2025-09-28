<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader />

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="fromSerial" key="com.artonis.inv.operation.beginPeriodReceipt.fromSerial"/>
			<base:testBox styleClass="midsmall" name="toSerial" key="com.artonis.inv.operation.beginPeriodReceipt.toSerial"/>
			<base:testBox styleClass="midsmall" name="fromReference" key="com.artonis.inv.operation.beginPeriodReceipt.fromReference"/>
			<base:testBox styleClass="midsmall" name="toReference" key="com.artonis.inv.operation.beginPeriodReceipt.toReference"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="midsmall" name="fromDate" key="com.artonis.inv.operation.beginPeriodReceipt.fromDate"/>
			<base:mDatePicker styleClass="midsmall" name="toDate" key="com.artonis.inv.operation.beginPeriodReceipt.toDate"/>
			<base:comboBoxAutoComplete name="inventory_id" styleClass="midsmall" key="com.artonis.inv.operation.beginPeriodReceipt.inventory"
						   comboLoaderUrl="combo/loadAllInventory" dataTextField="name" dataValueField="id" minLength="0" iscomboLoaderUrlRelative="true"
						   hasTemplate="false" headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name" templateComaSep="name"/>
			<base:comboBoxAutoComplete styleClass="midsmall" name="exporter" key="com.artonis.inv.operation.beginPeriodReceipt.exporter"
						   comboLoaderUrl="combo/loadAllEmployee" dataTextField="fullName" dataValueField="id" minLength="0" templateComaSep="fullName"
						   hasTemplate="false" headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="state" styleClass="midsmall" key="com.artonis.inv.receipt.purchaseReceipt.state" comboLoaderUrl="combo/state"/>
		</div>
	</form>
</div>

<base:my-grid-search>
	<base:my-grid-column title="com.artonis.inv.slip.consumptionSlip.inventory" field="inventoryName" width="40px" />
	<base:my-grid-column title="com.artonis.inv.slip.consumptionSlip.reference" field="reference" width="25px" />
	<base:my-grid-column title="com.artonis.inv.slip.consumptionSlip.serial" field="serial" width="25px" />
	<base:my-grid-column title="com.artonis.inv.slip.consumptionSlip.date" field="date" width="30px" />
	<base:my-grid-column title="com.artonis.inv.slip.consumptionSlip.issuer" field="issuerName" width="30px" />
	<base:my-grid-column title="com.artonis.inv.slip.consumptionSlip.costCenter" field="costCenterName" width="30px" />
	<base:my-grid-column title="com.artonis.inv.slip.consumptionSlip.transferee" field="transfereeFullName" width="30px" />
	<base:my-grid-column title="com.artonis.inv.slip.consumptionSlip.state" field="stateName" width="30px" />
	<base:my-grid-column title="com.artonis.inv.slip.consumptionSlip.docNumber" field="docNumber" width="30px" />

	<base:my-grid-function text="global.crud.print" functionClick="printDocumentWithDetail"  name="documentWithDetailPrintBtn"/>

	<base:my-grid-search-operation name="sabt" key="com.artonis.inv.slip.consumptionSlip.sabt" style="width: 120px"/>
	<base:my-grid-search-operation name="managerConfirm" key="inv.operation.state.managerConfirm" style="width: 120px"/>
    <base:my-grid-search-operation name="bargasht" key="com.artonis.inv.slip.consumptionSlip.bargasht" style="width: 120px" checkButtonPermission="false"/>
</base:my-grid-search>

<base:footer />

<script type="text/javascript">
	function getSearchObject(){
		var temporaryReceiptVar = {};
		temporaryReceiptVar.fromSerial=$("#fromSerial").val();
		temporaryReceiptVar.toSerial=$("#toSerial").val();
		temporaryReceiptVar.fromReference=$("#fromReference").val();
		temporaryReceiptVar.toReference=$("#toReference").val();
		temporaryReceiptVar.fromDate=$("#fromDate").val();
		temporaryReceiptVar.toDate=$("#toDate").val();
		temporaryReceiptVar.inventoryId=$("#inventory_id").val();
		temporaryReceiptVar.issuer=$("#issuer").val();
		temporaryReceiptVar.state=$("#state").val();
		return temporaryReceiptVar;
	}

    function printDocumentWithDetail(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        var searchJsonString = {};
        searchJsonString.consumptionSlipId = data.id;
        searchJsonString = JSON.stringify(searchJsonString);
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
        var url = getBaseUrl() + "print/consumptionSlipDocumentItemPrintWrapper/" + searchJsonString;
        window.location = url;
    }
</script>

