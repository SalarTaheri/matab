<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.cancel" classNames="uk-button uk-button-danger" id="breadcrumb-main-section-cancel" onClick="javascript:goToView()"/>
		<base:buttonPermission key="global.crud.print" classNames="uk-button uk-button-success" id="documentWithDetailPrintBtn" onClick="javascript:printDocumentWithDetail()"/>
	</div>
</div>

<input name="loadedId" type="hidden" id="loadedId" />

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" />
		<input type="hidden" id="state" name="state" />
		<input type="hidden" id="issuer" name="issuer" />

		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" value="com.artonis.inv.slip.consumptionSlip" name="documentType" disabled="true" dataIgnore="true"
				key="com.artonis.inv.slip.consumptionSlip.documentType" />
			<base:testBox styleClass="small" name="stateName" disabled="true" key="com.artonis.inv.slip.consumptionSlip.state" />
			<base:mDatePicker styleClass="small" name="date" key="com.artonis.inv.slip.consumptionSlip.date" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBoxAutoComplete name="inventoryId" styleClass="small" key="com.artonis.inv.slip.consumptionSlip.inventory" comboLoaderUrl="combo/loadAllInventory"
				dataTextField="name" dataValueField="id" minLength="0" hasTemplate="false" iscomboLoaderUrlRelative="true" />
			<base:testBox styleClass="small" name="reference" key="com.artonis.inv.slip.consumptionSlip.reference" readOnly="true" />
			<base:testBox styleClass="small" name="serial" key="com.artonis.inv.slip.consumptionSlip.serial" type="number"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="issuerName" disabled="true" dataIgnore="true" key="com.artonis.inv.slip.consumptionSlip.issuer" />
			<base:comboBox name="costCenterId" key="com.artonis.inv.slip.consumptionSlip.costCenter" comboLoaderUrl="combo/loadAllCostCenter" styleClass="small" />
			<base:comboBoxAutoComplete styleClass="small" name="transfereeId" key="com.artonis.inv.slip.consumptionSlip.transferee" comboLoaderUrl="combo/loadAllEmployee"
							   dataTextField="fullName" dataValueField="id" minLength="0" hasTemplate="false" iscomboLoaderUrlRelative="true" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea name="description" key="system.description" height="50px;"/>
		</div>
		<div dir="ltr" align="center" style="padding-top: 15px;">
			<base:buttonPermission key="com.artonis.inv.slip.consumptionSlip.save" id="saveConsumptionSlipButton" classNames="uk-button uk-button-success" onClick="saveConsumptionSlip()" />
		</div>
	</form>

	<base:itemForm titleKeys="com.artonis.inv.slip.consumptionSlip.goods" formItemTabViewJspFiles="ConsumptionSlipGoodsItemTabView.jsp"
						formItemTabInputs="ConsumptionSlipGoodsItemTabInput" insertWithoutPopup="true" masterIdStr="consumptionSlipId" />
</div>

<script>
    function saveConsumptionSlip() {
        save();
    }

    function doAfterSave_mainForm() {
        var urlGrid = $("#ConsumptionSlipGoodsItem").data("kendoGrid").dataSource.transport.options.read.url;
        var indexnumber = urlGrid.valueOf().lastIndexOf("/");
        var subUrlGrid = urlGrid.valueOf().substring(0, indexnumber);
        urlGrid = subUrlGrid.valueOf() + "/" + $("#loadedId").val();
        $("#ConsumptionSlipGoodsItem").data("kendoGrid").dataSource.transport.options.read.url = urlGrid;
        $("#ConsumptionSlipGoodsItem").data("kendoGrid").dataSource.read();
    }

	function callback_save_success(data) {
        $("#reference").val(data.reference);
        $("#serial").val(data.serial);
    }

    function callback_change_inventoryId(this_, e) {
        var url = '${pageContext.request.contextPath}' + '/inv/slip/consumptionSlip/loadReferenceAndSerial/' + $("#inventoryId_Comb").data("kendoComboBox")._selectedValue;
        $.getJSON(url, function (data) {
            if (data.state == "success") {
                $("#reference").val(data.reference);
                $("#serial").val(data.serial);
                setNumericTextValue();
            }
        });
    }

    function printDocumentWithDetail(){
        if (!$.isNumeric($('#id').val())) {
            alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("inv.operation.print.error.couldNotGenerateReportInNewMode")%>');
            return;
        }
        var searchJsonString = {};
        searchJsonString.consumptionSlipId = $('#id').val();
        searchJsonString = JSON.stringify(searchJsonString);
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
        var url = getBaseUrl() + "print/consumptionSlipDocumentItemPrintWrapper/" + searchJsonString;
        window.location.href = url;
    }

    function goToView() {
        window.location = "${pageContext.request.contextPath}" + "/inv/slip/consumptionSlip/";
    }
</script>