<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader />
<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<%-- <div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="fromSerial" key="com.artonis.inv.operation.beginPeriodReceipt.fromSerial"/>
			<base:testBox styleClass="midsmall" name="toSerial"  key="com.artonis.inv.operation.beginPeriodReceipt.toSerial"/>
			<base:testBox styleClass="midsmall" name="fromReference" key="com.artonis.inv.operation.beginPeriodReceipt.fromReference"/>
			<base:testBox styleClass="midsmall" name="toReference"  key="com.artonis.inv.operation.beginPeriodReceipt.toReference"/>
		</div> --%>
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="midsmall" name="fromDate" key="com.artonis.inv.operation.beginPeriodReceipt.fromDate"/>
			<base:mDatePicker styleClass="midsmall" name="toDate" key="com.artonis.inv.operation.beginPeriodReceipt.toDate"/>
			<base:comboBoxAutoComplete name="originInventoryId" styleClass="midsmall" key="com.artonis.inv.operation.transferBetweenInventory.originInventory" comboLoaderUrl="combo/loadAllInventory"
									   dataTextField="name" dataValueField="id" minLength="0"
									   hasTemplate="false" headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name" templateComaSep="name" iscomboLoaderUrlRelative="true"/>
			<base:comboBoxAutoComplete name="destinationInventoryId" styleClass="midsmall" key="com.artonis.inv.operation.transferBetweenInventory.destinationInventory" comboLoaderUrl="combo/loadAllInventory"
									   dataTextField="name" dataValueField="id" minLength="0"
									   hasTemplate="false" headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name" templateComaSep="name" iscomboLoaderUrlRelative="true"/>

		</div>
		<div class="uk-grid uk-grid-preserve">

			<base:comboBoxAutoComplete styleClass="midsmall" name="issuerId"
									   key="com.artonis.inv.operation.beginPeriodReceipt.exporter"
									   comboLoaderUrl="combo/loadAllEmployee" dataTextField="fullName"
									   dataValueField="id" minLength="0"
									   hasTemplate="false"
									   headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name"
									   templateComaSep="fullName"/>
		</div>
	</form>
</div>

<base:my-grid-search>
	<base:my-grid-column title="com.artonis.inv.operation.transferBetweenInventory.originInventory" field="originInventoryName" width="50px" />
	<base:my-grid-column title="com.artonis.inv.operation.transferBetweenInventory.destinationInventory" field="destinationInventoryName" width="50px" />
	<base:my-grid-column title="com.artonis.inv.operation.transferBetweenInventory.date" field="date" width="50px" />
	<base:my-grid-column title="com.artonis.inv.operation.transferBetweenInventory.issuer" field="issuerName" width="50px" />
	<base:my-grid-column title="com.artonis.inv.operation.transferBetweenInventory.originInventoryState" field="originInventoryStateName" width="50px" />
	<base:my-grid-column title="com.artonis.inv.operation.transferBetweenInventory.destinationInventoryState" field="destinationInventoryStateName" width="50px" />
	<base:my-grid-column title="com.artonis.inv.operation.transferBetweenInventory.receiptDocNumber" field="receiptDocNumber" width="50px" />
	<base:my-grid-column title="com.artonis.inv.operation.transferBetweenInventory.slipDocNumber" field="slipDocNumber" width="50px" />

	<base:my-grid-function text="global.crud.print" functionClick="printDocumentWithDetail"  name="documentWithDetailPrintBtn"/>

	<base:my-grid-search-operation name="sabt" key="com.artonis.inv.operation.transferBetweenInventory.sabt" style="width: 120px"/>
	<base:my-grid-search-operation name="managerConfirm" key="inv.operation.state.managerConfirm" style="width: 120px"/>
    <base:my-grid-search-operation name="bargasht" key="com.artonis.inv.operation.transferBetweenInventory.bargasht" style="width: 120px" checkButtonPermission="false"/>
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
		temporaryReceiptVar.originInventoryId=$("#originInventoryId").val();
		temporaryReceiptVar.destinationInventoryId=$("#destinationInventoryId").val();
		temporaryReceiptVar.issuerId=$("#issuerId").val();
		return temporaryReceiptVar;
	}

    function printDocumentWithDetail(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        var searchJsonString = {};
        searchJsonString.transferBetweenInventoryId = data.id;
        searchJsonString = JSON.stringify(searchJsonString);
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
        var url = getBaseUrl() + "print/transferBetweenInventoryDocumentItemPrintWrapper/" + searchJsonString;
        window.location = url;
    }
</script>
