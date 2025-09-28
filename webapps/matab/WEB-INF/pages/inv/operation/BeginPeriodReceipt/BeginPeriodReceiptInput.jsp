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
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
		<base:buttonPermission key="global.crud.cancel" classNames="uk-button uk-button-danger" id="breadcrumb-main-section-cancel" onClick="javascript:goToView()"/>
		<base:buttonPermission key="global.crud.print" classNames="uk-button uk-button-success" id="documentWithDetailPrintBtn" onClick="javascript:printDocumentWithDetail()"/>
	</div>
</div>
   <input name="loadedId" type="hidden" id="loadedId" />

<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
	
	 	<input type="hidden" id="finanaceYear_id" name="finanaceYear_id" >
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="state" name="state" >
		<input type="hidden" id="exporter" name="exporter" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="docType" disabled="true" dataIgnore="true" key="com.artonis.inv.operation.beginPeriodReceipt.documentType"/>
			<base:testBox styleClass="small" name="stateStr" disabled="true" key="com.artonis.inv.operation.beginPeriodReceipt.state"/>
			<base:mDatePicker styleClass="small" name="date_" key="com.artonis.inv.operation.beginPeriodReceipt.date_"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBoxAutoComplete name="inventory_id" styleClass="small" key="com.artonis.inv.operation.beginPeriodReceipt.inventory" comboLoaderUrl="combo/loadAllInventory"
									   dataTextField="name" dataValueField="id" minLength="0" hasTemplate="false" iscomboLoaderUrlRelative="true"/>
			<base:testBox styleClass="small" name="reference" readOnly="true" key="com.artonis.inv.receipt.purchaseReceipt.reference"/>
			<base:testBox styleClass="small" name="serial" key="com.artonis.inv.operation.beginPeriodReceipt.serial" type="number"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<%--<base:comboBoxAutoComplete styleClass="small" name="exporter" iscomboLoaderUrlRelative="true" key="com.artonis.inv.operation.beginPeriodReceipt.exporter"--%>
								   <%--comboLoaderUrl="combo/loadAllEmployee" dataTextField="fullName" dataValueField="id" minLength="0" hasTemplate="false" />--%>
				<base:testBox styleClass="small"  name="exporterFullName" disabled="true" dataIgnore="true" key="com.artonis.inv.operation.beginPeriodReceipt.exporter"/>
	    </div>
	    <div class="uk-grid uk-grid-preserve">
	    </div>
	   <div dir="ltr" align="center" style="">
		    <base:buttonPermission key="com.artonis.inv.operation.beginPeriodReceipt.save" classNames="uk-button uk-button-success" id="saveBeginPeriodReceiptBtn" onClick="javascript:saveBeginPeriodReceipt()" style="background-color: rgb(175,214,101);width: 15%;"/>
	   </div>
	</form>

	<base:itemForm insertWithoutPopup="true" formItemTabInputs="BeginPeriodReceiptGoodsItemTabInput" masterIdStr="beginPeriodReceipt_id"
				   titleKeys="com.artonis.inv.operation.beginPeriodReceiptGoods.goods" formItemTabViewJspFiles="BeginPeriodReceiptGoodsItemTabView.jsp"/>
</div>

<script type="text/javascript">

    $(document).ready(function () {
        $("#docType").css('background-color', 'rgb(206, 215, 235)');
        $("#stateStr").css('background-color', 'rgb(206, 215, 235)');
        $("#goodsCode").css('background-color', 'rgb(206, 215, 235)');
        $("#reference").css('background-color', 'rgb(206, 215, 235)')
        $("#measureUnit").css('background-color', 'rgb(206, 215, 235)');
        $("#subMeasureUnit").css('background-color', 'rgb(206, 215, 235)');
    });

    function saveBeginPeriodReceipt() {
        save();
    }

    function goToView() {
        window.location = "${pageContext.request.contextPath}" + "/inv/operation/beginPeriodReceipt/";
    }

    function changeBeginPeriodReceiptState(newState) {
        if ($("#id").val() != null && $("#id").val() > 0) {
            var paymentBill = {};
            paymentBill.id = $("#id").val();
            paymentBill.state = newState;
            $.ajax({
                url: '${pageContext.request.contextPath}' + '/inv/operation/beginPeriodReceipt/changeBeginPeriodReceiptState',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(paymentBill),
                dataType: 'json',
                type: 'POST',
                success: function (data, success, xhr) {
                    if (data.state == "error") {
                        for (var i = 0; i < data.errors.length; i++) {
                            if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
                                alertify.error($("label[for='" + data.errors[i].Field + "']").text() + "  " + data.errors[i].Message);
                            } else {
                                alertify.error(data.errors[i].Field + "  " + data.errors[i].Message);
                            }
                        }
                    } else {
                        $('#state').val(data.newStateValue);
                        $('#stateStr').val(data.newStateText);
                    }
                },
                error: function (e) {
                    alert('Error: ' + e.responseText);
                }
            });
        } else {
            alert(":\ ابتدا قبض را ذخیره کنید");
        }
    }

    function callback_save_success(data) {
        $("#reference").val(data.reference);
        $("#serial").val(data.serial);
    }

    function callback_change_inventory_id(this_, e) {
        var url = getBaseUrl() + "loadReferenceAndSerial/" + $("#inventory_id_Comb").data("kendoComboBox")._selectedValue;
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
        searchJsonString.beginPeriodReceipt_id = $('#id').val();
        searchJsonString = JSON.stringify(searchJsonString);
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
        var url = getBaseUrl() + "print/beginPeriodReceiptDocumentItemPrintWrapper/" + searchJsonString;
        window.location.href = url;
    }
</script>
