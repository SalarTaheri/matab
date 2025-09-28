<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section">
			<span>${pageTitle}</span>
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
			<base:testBox styleClass="small" value="com.artonis.inv.slip.salesSlip" name="documentType" disabled="true" dataIgnore="true"
								key="com.artonis.inv.slip.salesSlip.documentType" />
			<base:testBox styleClass="small" name="reference" key="com.artonis.inv.slip.salesSlip.reference" readOnly="true" />
			<base:testBox styleClass="small" name="serial" key="com.artonis.inv.slip.salesSlip.serial" type="number"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="stateName" disabled="true" key="com.artonis.inv.slip.salesSlip.state" />
			<base:comboBoxAutoComplete name="inventoryId" styleClass="small" key="com.artonis.inv.slip.salesSlip.inventory" comboLoaderUrl="combo/loadAllInventory"
							dataTextField="name" dataValueField="id" minLength="0" hasTemplate="false" iscomboLoaderUrlRelative="true" />
			<base:mDatePicker styleClass="small" name="date" key="com.artonis.inv.slip.salesSlip.date" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="issuerName" disabled="true" dataIgnore="true" key="com.artonis.inv.slip.salesSlip.issuer" />
			<base:comboBoxAutoComplete styleClass="small" name="businessPartnerId" key="com.artonis.inv.slip.salesSlip.businessPartner" minLength="0"
							   comboLoaderUrl="combo/loadAllBusinessPartner" dataTextField="nameAndFamily" dataValueField="id" iscomboLoaderUrlRelative="true"
							   hasTemplate="false" headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name" templateComaSep="nameAndFamily"/>
		</div>
		<div dir="ltr" align="center" style="padding-top: 15px;">
			<base:buttonPermission key="com.artonis.inv.slip.salesSlip.save" id="saveSalesSlipButton" classNames="uk-button uk-button-success" onClick="saveSalesSlip()" />
		</div>
	</form>

	<base:itemForm titleKeys="com.artonis.inv.slip.salesSlip.goods" formItemTabViewJspFiles="SalesSlipGoodsItemTabView.jsp" masterIdStr="salesSlipId"
						formItemTabInputs="SalesSlipGoodsItemTabInput" insertWithoutPopup="true"  />
</div>

<script>
	function saveSalesSlip() {
		saveFormUrl('mainForm', '<c:url value='/' />' + '/inv/slip/salesSlip/save', false);
	}

    function doAfterSave_mainForm() {
        var urlGrid = $("#SalesSlipGoodsItem").data("kendoGrid").dataSource.transport.options.read.url;
        var indexnumber = urlGrid.valueOf().lastIndexOf("/");
        var subUrlGrid = urlGrid.valueOf().substring(0, indexnumber);
        urlGrid = subUrlGrid.valueOf() + "/" + $("#loadedId").val();
        $("#SalesSlipGoodsItem").data("kendoGrid").dataSource.transport.options.read.url = urlGrid;
        $("#SalesSlipGoodsItem").data("kendoGrid").dataSource.read();
    }

    function callback_save_success(data) {
        $("#reference").val(data.reference);
        $("#serial").val(data.serial);
    }

    function callback_change_inventoryId(this_, e) {
        var url = '${pageContext.request.contextPath}' + '/inv/slip/salesSlip/loadReferenceAndSerial/' + $("#inventoryId_Comb").data("kendoComboBox")._selectedValue;
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
        searchJsonString.salesSlipId = $('#id').val();
        searchJsonString = JSON.stringify(searchJsonString);
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
        var url = getBaseUrl() + "print/salesSlipDocumentItemPrintWrapper/" + searchJsonString;
        window.location.href = url;
    }

    function goToView() {
        window.location = "${pageContext.request.contextPath}" + "/inv/slip/salesSlip/";
    }
</script>