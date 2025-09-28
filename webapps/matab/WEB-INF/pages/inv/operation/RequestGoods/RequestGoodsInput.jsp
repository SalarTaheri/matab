<%@ page import="com.artonis.inv.operation.model.OperationConstValue" %>
<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<div class="body-header">
    <ul class="uk-breadcrumb uk-h3" id="breadcrumb">
        <li id="breadcrumb-main-section"><span>${pageTitle}</span>
        </li>
    </ul>
    <div id="header-toolbar">
        <div id="body-heade-save-div" style="display:none;">
            <base:buttonPermission key="global.crud.view" classNames="uk-button uk-button-success" id="breadcrumb-main-section-cancel" onClick="javascript:goToView()"/>
        </div>
    </div>
</div>

<input name="loadedId" type="hidden" id="loadedId"/>

<div class="uk-container uk-container-center my-uk-container">
    <form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id">
        <input type="hidden" id="state" name="state">
        <input type="hidden" id="exporterId" name="exporterId">

        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="verysmall" name="requestNumber" key="com.artonis.inv.operation.requestGoods.requestNumber" readOnly="true"/>
            <base:mDatePicker styleClass="verysmall" name="requestDate" key="com.artonis.inv.operation.requestGoods.requestDate"/>
            <base:testBox styleClass="verysmall" name="stateText" key="com.artonis.inv.operation.requestGoods.state" disabled="true"/>
            <base:testBox styleClass="verysmall" name="exporterName" key="com.artonis.inv.operation.requestGoods.exporterName" disabled="true"/>
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:comboBox name="fromInventoryId" key="com.artonis.inv.operation.requestGoods.fromInventory" comboLoaderUrl="combo/loadAllInventory" styleClass="verysmall"/>
            <base:comboBox name="applicator" key="com.artonis.inv.operation.requestGoods.selectRequest" comboLoaderUrl="combo/loadAllRequestGoodsApplicatorType" styleClass="verysmall"/>
            <div class="uk-grid uk-grid-preserve" id="costCenterDiv" style="display: none">
                <base:comboBox name="costCenterId" key="com.artonis.inv.operation.requestGoods.applicator.costCenterApplicator" comboLoaderUrl="combo/loadAllCostCenter" styleClass="verysmall"/>
            </div>
            <div class="uk-grid uk-grid-preserve" id="inventoryDiv" style="display: none; margin-top: 0px;">
                <base:comboBox name="inventoryId" key="com.artonis.inv.operation.requestGoods.applicator.inventoryApplicator" comboLoaderUrl="combo/loadAllInventory" styleClass="verysmall"/>
            </div>
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:textArea name="description" key="com.artonis.inv.operation.requestGoods.description" />
        </div>

        <div dir="ltr" align="center" style="margin-top: 10px;">
            <base:buttonPermission key="com.artonis.inv.operation.requestGoods.saveGoodsRequest" classNames="uk-button uk-button-success" id="saveGoodsRequestBtn"
                                   onClick="javascript:saveGoodsRequest()" style=""/>
        </div>
    </form>

    <base:itemForm titleKeys="com.artonis.inv.operation.RequestGoodsGoods" formItemTabViewJspFiles="RequestGoodsGoodsTabView.jsp"
                   formItemTabInputs="RequestGoodsGoodsTabInput" insertWithoutPopup="true" masterIdStr="requestGoodsId"/>
</div>

<script type="text/javascript">
    $(document).ready(function () {
    });

    function callback_deserialize(data){
        if ($.isNumeric(data.applicator)) {
            if (data.applicator == <%=OperationConstValue.RequestGoodsApplicatorTypeEnum.FROM_COST_CENTER_ID.getValue()%>) {
                $("#costCenterDiv").show();
            } else if (data.applicator == <%=OperationConstValue.RequestGoodsApplicatorTypeEnum.FROM_INVENTORY_ID.getValue()%>) {
                $("#inventoryDiv").show();
            }
        }
    }

    function callback_change_applicator(e) {
        if (typeof(e.sender._selectedValue) == "undefined") {
            return;
        }

        var applicator = $("#applicator_Comb").data("kendoComboBox").value();

        $("#costCenterDiv").hide();
        $("#inventoryDiv").hide();

        if (applicator == <%=OperationConstValue.RequestGoodsApplicatorTypeEnum.FROM_COST_CENTER_ID.getValue()%>) {
            $("#costCenterDiv").slideToggle();
            $("#costCenterId_Comb").data("kendoComboBox").value("");
            $("#costCenterId").val("");
        } else if (applicator == <%=OperationConstValue.RequestGoodsApplicatorTypeEnum.FROM_INVENTORY_ID.getValue()%>) {
            $("#inventoryDiv").slideToggle();
            $("#inventoryId_Comb").data("kendoComboBox").value("");
            $("#inventoryId").val("");
        }
    }

    function saveGoodsRequest() {
        var applicator = $("#applicator_Comb").data("kendoComboBox").value();
        if ($.isNumeric(applicator)) {
            if (!$.isNumeric($("#inventoryId_Comb").data("kendoComboBox").value()) && eval(applicator) == <%=OperationConstValue.RequestGoodsApplicatorTypeEnum.FROM_INVENTORY_ID.getValue()%>) {
                alertify.error($("label[for='inventoryId']").text() + ":  " + "<%=ResourceBoundleHolder.resourceBundle.getString("system.validation.constraints.NotNull.message")%>");
                return;
            } else if (!$.isNumeric($("#costCenterId_Comb").data("kendoComboBox").value()) && eval(applicator) == <%=OperationConstValue.RequestGoodsApplicatorTypeEnum.FROM_COST_CENTER_ID.getValue()%>) {
                alertify.error($("label[for='costCenterId']").text() + ":  " + "<%=ResourceBoundleHolder.resourceBundle.getString("system.validation.constraints.NotNull.message")%>");
                return;
            }
        }
        save();
    }

    function goToView() {
        window.location = "${pageContext.request.contextPath}" + "/inv/operation/requestGoods/";
    }
</script>

<style>
    .uk-grid > [class*='uk-width-'] {
        padding-right: 10px !important;
        min-width: 12% !important;
    }
    .my-uk-container {
        margin: 0px !important;
    }
</style>