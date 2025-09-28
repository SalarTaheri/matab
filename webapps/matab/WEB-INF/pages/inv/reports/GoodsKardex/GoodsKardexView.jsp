<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader />

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="financeYearId" key="com.artonis.inv.reports.goodsKardex.financeYear" value="financeYearName" comboLoaderUrl="combo/loadAllFinanceYear"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBoxAutoComplete name="inventoryId" styleClass="small" key="com.artonis.inv.reports.goodsKardex.inventory" comboLoaderUrl="combo/loadAllInventory"
				dataTextField="name" dataValueField="id" minLength="0" hasTemplate="false" iscomboLoaderUrlRelative="true"/>
			<base:comboBoxAutoComplete styleClass="small" name="goodsId" key="com.artonis.inv.reports.goodsKardex.goods" comboLoaderUrl="combo/loadAllGoods"
			 	iscomboLoaderUrlRelative="true"	dataTextField="nameAndCode" dataValueField="id" minLength="0" hasTemplate="true" templateComaSep="name,code"
				headerTemplateComaSep="com.artonis.inv.basicInfo.goods.name,com.artonis.inv.basicInfo.goods.code" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="small" name="fromDate" key="com.artonis.inv.reports.goodsKardex.fromDate" />
			<base:mDatePicker styleClass="small" name="toDate" key="com.artonis.inv.reports.goodsKardex.toDate" />
		</div>
	</form>
</div>

<base:my-grid-search noDeleteButton="true" defaultReadUrlIsRelative="true">
	<base:my-grid-column title="com.artonis.inv.reports.goodsKardex.documentName" field="documentName" width="50px" />
	<base:my-grid-column title="com.artonis.inv.reports.goodsKardex.documentDate" field="documentDate" width="50px" />
	<base:my-grid-column title="com.artonis.inv.reports.goodsKardex.documentSerial" field="documentSerial" width="50px" />
	<base:my-grid-column title="com.artonis.inv.reports.goodsKardex.incomingAmount" field="incomingAmount" width="50px" />
	<base:my-grid-column title="com.artonis.inv.reports.goodsKardex.outgoingAmount" field="outgoingAmount" width="50px" />
	<base:my-grid-column title="com.artonis.inv.reports.goodsKardex.remaining" field="remaining" width="50px" />

	<base:my-grid-schema-field name="documentName" type="string" />
	<base:my-grid-schema-field name="documentDate" type="string" />
	<base:my-grid-schema-field name="documentSerial" type="string" />
	<base:my-grid-schema-field name="incomingAmount" type="long" />
	<base:my-grid-schema-field name="outgoingAmount" type="long" />
	<base:my-grid-schema-field name="remaining" type="long" />
	
	<base:my-grid-function name="viewDocumentOperation" functionClick="viewDocumentOperation" text="com.artonis.inv.reports.goodsKardex.operation.viewDocument"/>
</base:my-grid-search>
<base:footer />

<script type="text/javascript">

    function getSearchObject() {
        var searchObject = {};
        searchObject.financeYearId = $("#financeYearId").val();
        searchObject.goodsId = $("#goodsId").val();
        searchObject.inventoryId = $("#inventoryId").val();
        searchObject.fromDate = $("#fromDate").val();
        searchObject.toDate = $("#toDate").val();
        return searchObject;
    }

    function do_before_search_callback() {
        if ($("#financeYearId").val() == "") {
            alertify.error("فیلد سال مالی باید مقداردهی شود");
            return "false";
        }
        if ($("#goodsId").val() == "" || $("#inventoryId").val() == "") {
            alertify.error("فیلد های نام انبار و نام کالا باید مقداردهی شود");
            return "false";
        }
        return "true";
    }

    function viewDocumentOperation(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        var url;
        if (data.pageSystemCode == "011004003005") {
            url = "/inv/slip/consumptionSlip/editByDocumentId/" + data.documentId;
        } else if (data.pageSystemCode == "011003002001001") {
            url = "/inv/receipt/purchaseReceipt/editByDocumentId/" + data.documentId;
        } else if (data.pageSystemCode == "011002006") {
            url = "/inv/operation/transferBetweenInventory/editByDocumentId/" + data.documentId;
        } else if (data.pageSystemCode == "011003003002") {
            url = "/inv/operation/beginPeriodReceipt/editByDocumentId/" + data.documentId;
        } else if (data.pageSystemCode == "011004001") {
            url = "/inv/slip/salesSlip/editByDocumentId/" + data.documentId;
        }
        window.location = "${pageContext.request.contextPath}" + url;
    }

    $(document).ready(function () {
        var combobox = $("#inventoryId_Comb").data("kendoComboBox");
        combobox.dataSource.read();
        combobox.refresh();
        combobox = $("#goodsId_Comb").data("kendoComboBox");
        combobox.dataSource.read();
        combobox.refresh();
        if ("${commingFromKR}" == "true") {
            $("#inventoryId_Comb").data("kendoComboBox").value("${inventoryId}");
            $("#goodsId_Comb").data("kendoComboBox").value("${goodsId}");
            $("#inventoryId").val("${inventoryId}");
            $("#goodsId").val("${goodsId}");
            $("#fromDate").val("${fromDate2}");
            $("#toDate").val("${toDate2}");
            search();
        }
    });

    function callback_DataBound_financeYearId(e) {
        $.ajax({
            url: getBaseUrl() + "getActiveFinanceYear",
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            type: 'GET',
            success: function (data) {
                if (data != null) {
                    $("#financeYearId_Comb").data("kendoComboBox").value(data.activeFinanceYearId);
                    $("#financeYearId").val(data.activeFinanceYearId);
                }
            },
            error: function (e) {
                console.log('Error: ' + e.responseText);
            }
        });
    }
</script>
