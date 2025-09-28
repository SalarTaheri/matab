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

<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">

		<input type="hidden" id="id" name="id">
		<input type="hidden" id="exporter" name="exporter">
		<input type="hidden" id="financeYear_id" name="financeYear_id">
		<input type="hidden" id="state" name="state">
		<input type="hidden" id="referenceId" name="referenceId">
		<input type="hidden" id="date" name="date">

		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="docType" disabled="true" dataIgnore="true" key="com.artonis.inv.operation.beginPeriodReceipt.documentType"/>
			<base:testBox styleClass="small" name="stateStr" disabled="true" key="com.artonis.inv.receipt.purchaseReceipt.state"/>
			<base:mDatePicker styleClass="small" name="date_" key="com.artonis.inv.receipt.purchaseReceipt.date_"/>

		</div>

		<div class="uk-grid uk-grid-preserve">
			<base:comboBoxAutoComplete name="inventory_id" styleClass="small" key="com.artonis.inv.receipt.purchaseReceipt.inventory_id" dataTextField="name"
						comboLoaderUrl="combo/loadAllInventory" dataValueField="id" minLength="0" hasTemplate="false" iscomboLoaderUrlRelative="true"/>
			<base:testBox styleClass="small" name="reference" readOnly="true" key="com.artonis.inv.receipt.purchaseReceipt.reference"/>
			<base:testBox styleClass="small" name="serial" key="com.artonis.inv.receipt.purchaseReceipt.serial" type="number"/>
		</div>

		<div class="uk-grid uk-grid-preserve">
			<base:comboBox comboLoaderUrl="combo/loadAllRefrenceToPurchaseReceipt" styleClass="small" name="referenceType" key="com.artonis.inv.receipt.purchaseReceipt.ref"/>
			<base:testBox styleClass="small" name="referenceSerial" key="com.artonis.inv.receipt.purchaseReceipt.referenceSerial"/>
			<base:selectorPopup formPopup="PurchaseInvoice" styledivLabel="width:inherit" disableBackground="true" isPassingFormpopupIdOnSave="true"
								popupUrl="/pursal/purchase/purchaseInvoicePopup/"/>
		</div>

		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="exporterName" disabled="true" dataIgnore="true" key="com.artonis.inv.operation.beginPeriodReceipt.exporter"/>
			<base:comboBoxAutoComplete styleClass="small" name="businessPartner_id" key="com.artonis.inv.receipt.purchaseReceipt.businessPartner_id" minLength="0"
							   comboLoaderUrl="combo/loadAllBusinessPartner" dataTextField="nameAndFamily" dataValueField="id" iscomboLoaderUrlRelative="true"
							   hasTemplate="false" headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name" templateComaSep="nameAndFamily" pageSize="100"/>
		</div>

		<div dir="ltr" align="center" style="margin-top: 10px;">
			<base:buttonPermission key="com.artonis.inv.receipt.purchaseReceipt.save" classNames="uk-button uk-button-success" id="savePurchaseReceiptBtn"
								   onClick="javascript:savePurchaseReceipt()" style="background-color: rgb(175,214,101);width: 10%;"/>
		</div>
	</form>

	<base:itemForm insertWithoutPopup="true" masterIdStr="purchaseReceipt_id" titleKeys="com.artonis.inv.receipt.purchaseReceiptGoods"
				   formItemTabInputs="PurchaseReceiptGoodsItemTabInput" formItemTabViewJspFiles="PurchaseReceiptGoodsItemTabView.jsp"></base:itemForm>
</div>


<script type="text/javascript">
    $(document).ready(function () {
        $("#docType").css('background-color', 'rgb(206, 215, 235)');
        $("#stateStr").css('background-color', 'rgb(206, 215, 235)');
        $("#goodsCode").css('background-color', 'rgb(206, 215, 235)');
        $("#reference").css('background-color', 'rgb(206, 215, 235)');
        $("#receiptNumber").css('background-color', 'rgb(206, 215, 235)');
        $("#measureUnit").css('background-color', 'rgb(206, 215, 235)');
        $("#subMeasureUnit").css('background-color', 'rgb(206, 215, 235)');
        $("#hasTax").hide();
    });

    function savePurchaseReceipt() {
        saveFormUrl('mainForm', '<c:url value='/' />' + '/inv/receipt/purchaseReceipt/save', false);
    }

    function bindBusinessPartner() {
        var serial = $("#referenceSerial").val();
        var date = $("#date").val();
        date=date.replace(/\//g, ':@:');
        if ($.isNumeric(serial)) {
            var url = '${pageContext.request.contextPath}' + '/inv/receipt/purchaseReceipt/getPurchaseInvoiceBusinessPartner/' + serial+'/'+date;
            $.getJSON(url, function (data) {
                if (data.state == "success") {
                    if (data.businessPartnerId > 0) {
                        $("#businessPartner_id_Comb").data("kendoComboBox").dataSource.read();
                        $("#businessPartner_id_Comb").data("kendoComboBox").value(data.businessPartnerId);
                        $("#businessPartner_id").val(data.businessPartnerId);
                    }
                }
            });
        }
    }

    function callback_change_referenceType(e) {
        showHideRefrenceSerial();
    }

   	function goToView() {
        window.location = "${pageContext.request.contextPath}" + "/inv/receipt/purchaseReceipt/";
    }

    function callback_deserialize(data) {
        showHideRefrenceSerial();
    }

    function callback_save_success(data) {
        $("#reference").val(data.reference);
        $("#serial").val(data.serial);
        //
        $("#sumStr_txt").attr("disabled", "disabled");
    }

    function callback_change_inventory_id(this_, e) {
        var url = '${pageContext.request.contextPath}' + "/inv/receipt/purchaseReceipt/loadReferenceAndSerial/" + $("#inventory_id_Comb").data("kendoComboBox")._selectedValue;
        $.getJSON(url, function (data) {
            if (data.state == "success") {
                $("#reference").val(data.reference);
                $("#serial").val(data.serial);
                setNumericTextValue();
            }
        });
    }

    function showHideRefrenceSerial() {
        var referenceType = $("#referenceType_Comb").data("kendoComboBox")._selectedValue;
        if (referenceType == undefined || referenceType == 'undefined')
            referenceType = document.getElementsByName('referenceType')[0].value;
        if (referenceType == 0) {
            $("#referenceSerial_lbl_txt").hide();
            $("#referenceSerial").hide();
            $("#PurchaseInvoice_popup_button").hide()
        }
        else {
            $("#referenceSerial_lbl_txt").show();
            $("#referenceSerial").show();
            $("#PurchaseInvoice_popup_button").show()
        }
    }

    function doAfterSave_mainForm() {
        var urlGrid = $("#PurchaseReceiptGoodsItem").data("kendoGrid").dataSource.transport.options.read.url;
        var indexnumber = urlGrid.valueOf().lastIndexOf("/");
        var subUrlGrid = urlGrid.valueOf().substring(0, indexnumber);
        urlGrid = subUrlGrid.valueOf() + "/" + $("#loadedId").val();
        $("#PurchaseReceiptGoodsItem").data("kendoGrid").dataSource.transport.options.read.url = urlGrid;
        $("#PurchaseReceiptGoodsItem").data("kendoGrid").dataSource.read();
    }

    function callback_custom_deserialize_popup_PurchaseInvoice(data) {
        $("#referenceSerial").val(data.referenceSerial);
        $("#referenceId").val(data.referenceId);
        $("#date").val(data.date);
        //
        bindBusinessPartner();
    }

    function printDocumentWithDetail(){
        if (!$.isNumeric($('#id').val())) {
            alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("inv.operation.print.error.couldNotGenerateReportInNewMode")%>');
            return;
        }
        var searchJsonString = {};
        searchJsonString.purchaseReceipt_id = $('#id').val();
        searchJsonString = JSON.stringify(searchJsonString);
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
        var url = getBaseUrl() + "print/purchaseReceiptDocumentItemPrintWrapper/" + searchJsonString;
        window.location.href = url;
    }
</script>
