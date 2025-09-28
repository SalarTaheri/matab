<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=ResourceBoundleHolder.resourceBundle.getString("pursal.purchaseInvoice")%></span></li>
	</ul>
	<div id="header-toolbar" align="right">
		<base:buttonPermission key="global.crud.cancel" classNames="uk-button uk-button-danger" id="purchaseInvoice-view-btn" onClick="javascript:goToView()"/>
		<base:buttonPermission key="global.crud.print" classNames="uk-button uk-button-success" id="documentWithDetailPrintBtn" onClick="javascript:printDocumentWithDetail()"/>
		<base:buttonPermission key="global.crud.view" classNames="uk-button uk-button-success" id="purchaseInvoice-gotoView" onClick="javascript:goToView()"/>
	</div>
</div>

<input name="loadedId" type="hidden" id="loadedId" />

<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="state" name="state" >
		<input type="hidden" id="registererId" name="registererId" >
		<input type="hidden" id="financeYearId" name="financeYearId" >
		
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="serial" key="pursal.purchaseInvoice.serial" type="number"/>
			<base:mDatePicker styleClass="small" name="date_" key="pursal.purchaseInvoice.date"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
				<base:testBox styleClass="small" name="registererName" key="pursal.purchaseInvoice.registerer" disabled="true" />
				<base:testBox styleClass="small" name="stateText" key="pursal.purchaseInvoice.state" disabled="true"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			 <base:comboBoxAutoComplete styleClass="small" name="businessPartnerId" key="pursal.purchaseInvoice.businessPartner"
					   comboLoaderUrl="combo/loadAllBusinessPartner" dataTextField="nameAndFamily" dataValueField="id" minLength="0" templateComaSep="nameAndFamily"
						iscomboLoaderUrlRelative="true" hasTemplate="false" headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name"/>
		</div>
		
		 <div class="uk-grid uk-grid-preserve">
            <base:textArea name="description" divWidthVal="50%" key="pursal.purchaseInvoice.desc_" height="40" width="650" />
        </div>

	    <div align="center" style="padding-top: 10px">
	    	<base:buttonPermission key="pursal.purchaseInvoice.save" classNames="uk-button uk-button-success" onClick="javascript:savePurchaseInvoice();" style="background-color: rgb(175,214,101);" id="savePurchaseInvoiceBtn"/>
		</div>
	</form>

	<base:itemForm titleKeys="com.artonis.inv.receipt.purchaseReceiptGoods"
					masterIdStr="purchaseInvoice_id" insertWithoutPopup="true"
					formItemTabViewJspFiles="PurchaseInvoiceItemTabView.jsp"
					formItemTabInputs="PurchaseInvoiceItemTabInput"/>
</div>

<script type="text/javascript">
    function savePurchaseInvoice() {
        save();
    }

    function goToView() {
        window.location = "${pageContext.request.contextPath}" + "/pursal/purchase/purchaseInvoice/";
    }

    function changePurchaseInvoiceState(newState) {
        if ($("#id").val() != null && $("#id").val() > 0) {
            var purchaseInvoice = {};
            purchaseInvoice.id = $("#id").val();
            purchaseInvoice.state = newState;
            $.ajax({
                url: '${pageContext.request.contextPath}' + '/pursal/purchase/purchaseInvoice/changePurchaseInvoiceState',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(purchaseInvoice),
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
                        $('#stateText').val(data.newStateText);
                    }
                },
                error: function (e) {
                    alert('Error: ' + e.responseText);
                }
            });
        } else {
            alert(":\ ابتدا فاکتور  را ذخیره کنید");
        }
    }

    function callback_save_success () {
        $("#payablePrice_txt").attr("disabled", "disabled");
	}

    function printDocumentWithDetail(){
        if (!$.isNumeric($('#id').val())) {
            alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("inv.operation.print.error.couldNotGenerateReportInNewMode")%>');
            return;
		}
        var searchJsonString = {};
        searchJsonString.purchaseInvoice_id = $('#id').val();
        searchJsonString = JSON.stringify(searchJsonString);
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
        var url = getBaseUrl() + "print/purchaseDocumentItemPrintWrapper/" + searchJsonString;
        window.location = url;
    }
</script>