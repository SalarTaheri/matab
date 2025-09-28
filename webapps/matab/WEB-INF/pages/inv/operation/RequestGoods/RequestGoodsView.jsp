<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@ page import="com.artonis.inv.core.model.ConstValue" %>
<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageHeader title="com.artonis.inv.operation.requestGoods.view"/>

<div class="uk-container uk-container-center my-uk-container">
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="verySmall" name="fromRequestNumber" key="com.artonis.inv.operation.requestGoods.fromRequestNumber" type="number"/>
            <base:testBox styleClass="verySmall" name="toRequestNumber" key="com.artonis.inv.operation.requestGoods.toRequestNumber" type="number"/>
            <base:mDatePicker styleClass="verySmall" name="fromRequestDate" key="com.artonis.inv.operation.requestGoods.fromRequestDate"/>
            <base:mDatePicker styleClass="verySmall" name="toRequestDate" key="com.artonis.inv.operation.requestGoods.toRequestDate"/>
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:comboBox name="state" key="com.artonis.inv.operation.requestGoods.state" comboLoaderUrl="combo/loadAllRequestGoodsState" styleClass="small"/>
            <base:comboBoxAutoComplete name="exporterId" key="com.artonis.inv.operation.requestGoods.exporterName" comboLoaderUrl="combo/loadAllExporter"
                                       dataTextField="fullName" dataValueField="id" styleClass="small" iscomboLoaderUrlRelative="true" minLength="0"/>
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:comboBox name="fromInventoryId" key="com.artonis.inv.operation.requestGoods.fromInventory" comboLoaderUrl="combo/loadAllInventory" styleClass="small"/>
            <base:comboBox name="applicator" key="com.artonis.inv.operation.requestGoods.selectRequest" comboLoaderUrl="combo/loadAllRequestGoodsApplicatorType" styleClass="small"/>
        </div>

<%--        <div class="uk-grid uk-grid-preserve">
            <base:comboBox name="deliverConsumptionSlipState" key="com.artonis.inv.operation.requestGoods.deliverConsumptionSlipState"
                           comboLoaderUrl="combo/loadAllDeliverNotDeliverConsumptionSlip" styleClass="small" selectIndex="0"/>
            <base:comboBox name="deliverTransferBetweenInventoryState" key="com.artonis.inv.operation.requestGoods.deliverTransferBetweenInventoryState"
                           comboLoaderUrl="combo/loadAllDeliverNotDeliverTransferBetweenInventory" styleClass="small" selectIndex="0"/>
        </div>--%>

        <div style="padding-top: 15px;">
            <base:my-grid-search >
                <base:my-grid-column title='com.artonis.inv.operation.requestGoods.requestNumber' field="requestNumber" width="40px"/>
                <base:my-grid-column title='com.artonis.inv.operation.requestGoods.requestDate' field="requestDate" width="40px"/>
                <base:my-grid-column title='com.artonis.inv.operation.requestGoods.state' field="stateText" width="40px"/>
                <base:my-grid-column title='com.artonis.inv.operation.requestGoods.fromInventory' field="fromInventoryName" width="50px"/>
                <base:my-grid-column title='com.artonis.inv.operation.requestGoods.exporterName' field="exporterName" width="50px"/>
                <base:my-grid-column title='com.artonis.inv.operation.requestGoods.selectRequest' field="applicatorText" width="50px"/>
                <base:my-grid-column title='com.artonis.inv.operation.requestGoods.applicator.costCenterApplicator' field="costCenterName" width="60px"/>
                <base:my-grid-column title='com.artonis.inv.operation.requestGoods.applicator.inventoryApplicator' field="inventoryName" width="50px"/>
                <base:my-grid-column title='com.artonis.inv.operation.requestGoods.description' field="description" width="50px"/>

                <base:my-grid-function text="com.artonis.inv.operation.requestGoods.delivering" functionClick="searchGrid_onDetail" name="deliveringDocumentSlip"/>

                <base:my-grid-search-operation name="rad_darkhast" key="inv.operation.requestGoods.state.rad_darkhast"/>
                <base:my-grid-search-operation name="bargasht_rad_darkhast" key="inv.operation.requestGoods.operation.bargasht"/>
            </base:my-grid-search>
        </div>
    </form>

</div>

<base:footer/>

<script type="text/javascript">
    $("#printBtn").hide();
    $(document).ready(function(){
        $("#printBtn").hide();
    });

    function getSearchObject() {
        var goodsRequest = {};
        goodsRequest.fromRequestNumber = $("#fromRequestNumber").val();
        goodsRequest.toRequestNumber = $("#toRequestNumber").val();
        goodsRequest.fromRequestDate = $("#fromRequestDate").val();
        goodsRequest.toRequestDate = $("#toRequestDate").val();
        goodsRequest.state = $("#state").val();
        goodsRequest.exporterId = $("#exporterId").val();
        goodsRequest.fromInventoryId = $("#fromInventoryId").val();
        goodsRequest.applicator = $("#applicator").val();
        return goodsRequest;
    }

    function searchGrid_onDetail(e) {
        var rowData = this.dataItem($(e.target).closest("tr"));
        $.getJSON("<c:url value='/' />" + "/inv/operation/requestGoods/createInventoryDocument/" + rowData.id, function(result) {
            if (result.state == "success") {
                alertify.success(result.message);
                $("#searchGrid").data("kendoGrid").dataSource.read();
            } else if (result.state == "error") {
                alertify.error(result.message);
            }
        });
    }

    function searchGrid_onDataBound_callback(){
        $(".k-grid-edit").text('<%=ResourceBoundleHolder.resourceBundle.getString("inv.operation.requestGoods.editOrCheck")%>');
        $(".k-grid-edit").removeClass("uk-button-success").addClass("uk-button-primary");
    }

</script>

<style>
    .k-grid .k-button, .k-edit-form-container .k-button {
        margin: 1px .2em !important;
    }
</style>