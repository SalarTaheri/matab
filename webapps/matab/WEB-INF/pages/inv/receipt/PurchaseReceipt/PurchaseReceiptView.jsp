<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader title="com.artonis.inv.receipt.purchaseReceipt.view"/>

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
									   comboLoaderUrl="combo/loadAllInventory" dataTextField="name" dataValueField="id" minLength="0"
									   hasTemplate="false" headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name" templateComaSep="name"
									   iscomboLoaderUrlRelative="true"/>
			<base:comboBoxAutoComplete styleClass="midsmall" name="exporter" key="com.artonis.inv.operation.beginPeriodReceipt.exporter"
									   comboLoaderUrl="combo/loadAllEmployee" dataTextField="fullName" dataValueField="id" minLength="0" hasTemplate="false"
									   headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name" templateComaSep="fullName"/>
		</div>

		<div class="uk-grid uk-grid-preserve">
			<base:comboBoxAutoComplete styleClass="midsmall" name="businessPartner_id" key="com.artonis.inv.receipt.purchaseReceipt.businessPartner_id"
									   comboLoaderUrl="combo/loadAllBusinessPartner" dataTextField="nameAndFamily" dataValueField="id" minLength="0"
									   hasTemplate="false" headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name" templateComaSep="nameAndFamily"/>
			<base:comboBox name="state" styleClass="midsmall" key="com.artonis.inv.receipt.purchaseReceipt.state" comboLoaderUrl="combo/state"/>
		</div>
	
	<div style="padding-top: 10px">
		<base:my-grid-search operationColumnwidth="50px">
			<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceipt.inventory_id'  field="inventoryName" width="40px"/>
			<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceipt.reference'  field="reference" width="15px"/>
			<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceipt.serial'  field="serial" width="15px"/>
			<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceipt.date_'  field="date_" width="20px"/>
			<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceipt.exporter'  field="exporterName" width="25px"/>
			<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceipt.businessPartner_id'  field="businessPartnerName" width="25px"/>
			<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceipt.state'  field="stateStr" width="25px"/>
			<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceipt.docNumber'  field="docNumber" width="20px"/>

			<base:my-grid-function text="global.crud.print" functionClick="printDocumentWithDetail"  name="documentWithDetailPrintBtn"/>

			<base:my-grid-search-operation name="sabt" key="inv.operation.requestGoods.state.sabt" style="width: 120px"/>
			<base:my-grid-search-operation name="managerConfirm" key="inv.operation.state.managerConfirm" style="width: 120px"/>
			<%--<base:my-grid-search-operation name="pricing" key="inv.operation.state.pricing" style="width: 120px"/>--%>
			<base:my-grid-search-operation name="bargasht" key="inv.operation.state.back" style="width: 120px" checkButtonPermission="false"/>
		</base:my-grid-search>
	</div>
</form>
</div>

<base:footer/>

<script type="text/javascript">
    function getSearchObject() {
        var purchaseReceiptVar = {};
        purchaseReceiptVar.fromSerial = $("#fromSerial").val();
        purchaseReceiptVar.toSerial = $("#toSerial").val();
        purchaseReceiptVar.fromReference = $("#fromReference").val();
        purchaseReceiptVar.toReference = $("#toReference").val();
        purchaseReceiptVar.fromDate = $("#fromDate").val();
        purchaseReceiptVar.toDate = $("#toDate").val();
        purchaseReceiptVar.inventory_id = $("#inventory_id").val();
        purchaseReceiptVar.exporter = $("#exporter").val();
        purchaseReceiptVar.businessPartner_id = $("#businessPartner_id").val();
        purchaseReceiptVar.state = $("#state").val();
        return purchaseReceiptVar;
    }

    function printDocumentWithDetail(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        var searchJsonString = {};
        searchJsonString.purchaseReceipt_id = data.id;
        searchJsonString = JSON.stringify(searchJsonString);
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
        var url = getBaseUrl() + "print/purchaseReceiptDocumentItemPrintWrapper/" + searchJsonString;
        window.location = url;
    }
</script>
