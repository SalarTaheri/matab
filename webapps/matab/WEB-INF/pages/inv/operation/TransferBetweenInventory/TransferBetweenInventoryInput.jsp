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
		<input type="hidden" id="originInventoryState" name="originInventoryState" />
		<input type="hidden" id="destinationInventoryState" name="destinationInventoryState" />
		<input type="hidden" id="issuerId" name="issuerId" />

		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" value="com.artonis.inv.operation.transferBetweenInventory" name="documentType" disabled="true" dataIgnore="true"
				key="com.artonis.inv.operation.transferBetweenInventory.documentType" />
			<base:mDatePicker styleClass="small" name="date" key="com.artonis.inv.operation.transferBetweenInventory.date" />
			<base:testBox styleClass="small" name="issuerName" disabled="true" dataIgnore="true" key="com.artonis.inv.operation.transferBetweenInventory.issuer" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBoxAutoComplete name="originInventoryId" styleClass="small" key="com.artonis.inv.operation.transferBetweenInventory.originInventory" comboLoaderUrl="combo/loadAllInventory"
									   dataTextField="name" dataValueField="id" minLength="0" hasTemplate="false" iscomboLoaderUrlRelative="true" />
			<base:comboBoxAutoComplete name="destinationInventoryId" styleClass="small" key="com.artonis.inv.operation.transferBetweenInventory.destinationInventory" comboLoaderUrl="combo/loadAllInventory"
									   dataTextField="name" dataValueField="id" minLength="0" hasTemplate="false" iscomboLoaderUrlRelative="true" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="originInventoryReference" key="com.artonis.inv.operation.transferBetweenInventory.originInventoryReference" readOnly="true" />
			<base:testBox styleClass="small" name="destinationInventoryReference" key="com.artonis.inv.operation.transferBetweenInventory.destinationInventoryReference" readOnly="true" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="originInventorySerial" key="com.artonis.inv.operation.transferBetweenInventory.originInventorySerial" type="number"/>
			<base:testBox styleClass="small" name="destinationInventorySerial" key="com.artonis.inv.operation.transferBetweenInventory.destinationInventorySerial" type="number"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="originInventoryStateName" disabled="true" key="com.artonis.inv.operation.transferBetweenInventory.originInventoryState" />
			<base:testBox styleClass="small" name="destinationInventoryStateName" disabled="true" key="com.artonis.inv.operation.transferBetweenInventory.destinationInventoryState" />
		</div>
		<div dir="ltr" align="center" style="margin-top: 15px;">
			<base:buttonPermission key="com.artonis.inv.operation.transferBetweenInventory.save" id="saveTransferBetweenInventoryButton" classNames="uk-button uk-button-success" onClick="saveTransferBetweenInventory()" />
		</div>
	</form>
	<base:itemForm titleKeys="com.artonis.inv.operation.transferBetweenInventory.goods" formItemTabViewJspFiles="TransferBetweenInventoryGoodsItemTabView.jsp"
					formItemTabInputs="TransferBetweenInventoryGoodsItemTabInput" insertWithoutPopup="true" masterIdStr="transferBetweenInventoryId" />
</div>
<script>
	function saveTransferBetweenInventory() {
		saveFormUrl('mainForm', '<c:url value='/' />' + '/inv/operation/transferBetweenInventory/save', false);
	}

	function callback_save_success(data){
		$("#originInventoryReference").val(data.rs.originInventoryReference);
		$("#originInventorySerial").val(data.rs.originInventorySerial);
		$("#destinationInventoryReference").val(data.rs.destinationInventoryReference);
		$("#destinationInventorySerial").val(data.rs.destinationInventorySerial);
	}

    function callback_change_originInventoryId(this_, e) {
        var url = getBaseUrl() + "loadOriginInventoryReferenceAndSerial/" + $("#originInventoryId_Comb").data("kendoComboBox")._selectedValue;
        $.getJSON(url, function (data) {
            if (data.state == "success") {
                $("#originInventoryReference").val(data.reference);
                $("#originInventorySerial").val(data.serial);
                setNumericTextValue();
            }
        });
    }

    function callback_change_destinationInventoryId(this_, e) {
        var url = getBaseUrl() + "loadDestinationInventoryReferenceAndSerial/" + $("#destinationInventoryId_Comb").data("kendoComboBox")._selectedValue;
        $.getJSON(url, function (data) {
            if (data.state == "success") {
                $("#destinationInventoryReference").val(data.reference);
                $("#destinationInventorySerial").val(data.serial);
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
        searchJsonString.transferBetweenInventoryId = $('#id').val();
        searchJsonString = JSON.stringify(searchJsonString);
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
        var url = getBaseUrl() + "print/transferBetweenInventoryDocumentItemPrintWrapper/" + searchJsonString;
        window.location.href = url;
    }

    function goToView() {
        window.location = "${pageContext.request.contextPath}" + "/inv/operation/transferBetweenInventory/";
    }
</script>