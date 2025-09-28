<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

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
            <base:comboBox styleClass="midsmall" name="inventory_id2" key="com.artonis.inv.operation.beginPeriodReceipt.inventory" comboLoaderUrl="combo/loadAllInventory"/>
            <base:comboBox styleClass="midsmall" name="exporter2" key="com.artonis.inv.operation.beginPeriodReceipt.exporter" comboLoaderUrl="combo/loadAllEmployee"/>
        </div>
    </form>
</div>

<div style="margin-top: 15px">
    <base:my-grid-search isPopup="true" showMultipleDelete="false" showOperation="false" defaultReadUrl="null" >
        <base:my-grid-column title='com.artonis.inv.operation.temporaryReceipt.reference' field="reference" width="50px"/>
        <base:my-grid-column title='com.artonis.inv.operation.temporaryReceipt.serial' field="serial" width="50px"/>
        <base:my-grid-column title='com.artonis.inv.operation.temporaryReceipt.inventory_id' field="inventoryName" width="50px"/>
        <base:my-grid-column title='com.artonis.inv.operation.temporaryReceipt.date_' field="date_" width="50px"/>
        <base:my-grid-column title='com.artonis.inv.operation.temporaryReceipt.exporter' field="exporterFullName" width="50px"/>
        <base:my-grid-column title='com.artonis.inv.operation.temporaryReceipt.businessPartner_id' field="businessPartnerTitle" width="50px"/>
        <base:my-grid-column title='com.artonis.inv.operation.temporaryReceipt.state' field="stateStr" width="50px"/>
    </base:my-grid-search>
</div>

<base:footer/>

<script type="text/javascript">
    function getSearchObject() {
        var temporaryReceiptVar = {};
        temporaryReceiptVar.fromSerial = $("#fromSerial").val();
        temporaryReceiptVar.toSerial = $("#toSerial").val();
        temporaryReceiptVar.fromReference = $("#fromReference").val();
        temporaryReceiptVar.toReference = $("#toReference").val();
        temporaryReceiptVar.fromDate = $("#fromDate").val();
        temporaryReceiptVar.toDate = $("#toDate").val();
        temporaryReceiptVar.inventory_id = $("#inventory_id").val();
        temporaryReceiptVar.exporter = $("#exporter").val();
        return temporaryReceiptVar;
    }
</script>

<style>
    .my-popup-body {
        padding: 0px !important;
    }
    .uk-modal-dialog {
        right: 40% !important;
    }
</style>