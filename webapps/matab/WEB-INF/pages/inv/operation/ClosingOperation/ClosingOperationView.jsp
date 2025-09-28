<%@page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader />

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:comboBoxAutoComplete name="inventoryId" key="com.artonis.inv.operation.goodsPricing.inventoryName" comboLoaderUrl="combo/loadAllInventory"
									   dataTextField="name" dataValueField="id" minLength="0" hasTemplate="false" iscomboLoaderUrlRelative="true" styleClass="small"/>
			<base:comboBox styleClass="small" name="financeyear_id"
						   key="com.artonis.inv.operation.goodsSupply.financeyear_name"  comboLoaderUrl="combo/loadAllFinanceYear"/>
		</div>
	</form>


</div>

<base:my-grid-search showOperation="false">
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.inventoryName" field="inventoryName" width="50px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.documentName" field="documentName" width="50px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.documentReference" field="documentReference" width="20px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.documentSerial" field="documentSerial" width="20px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.documentDate" field="documentDate" width="30px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.goodsName" field="goodsName" width="50px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.goodsAmountRemaining" field="goodsAmountRemaining" width="40px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.calculatedGoodsRate" field="calculatedGoodsRateText" width="40px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.sumPrice" field="sumPrice" width="40px" />
</base:my-grid-search>

<div align="center" style="padding-top: 1px">
	<%if(GlobalVariable.getButtonContainer("011002013","startClosingSlip")){ %>
	<button class="uk-button uk-button-success" type="button" onclick="javascript:startClosingSlip()" id="startClosingSlipBtn">
		<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.slip.closingOperation.startClosingSlip")%>
	</button>
	<%} %>
	<%--<%if(GlobalVariable.getButtonContainer("011002010","backGoodsPricingBtn")){ %>
		<button class="uk-button uk-button-success" type="button" onclick="javascript:backGoodsPricingCalc()" id="backGoodsPricingBtn">
			<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.operation.backGoodsPricing")%>
		</button>
	<%} %>--%>
</div>

<div class="uk-grid uk-grid-preserve" style="padding-top: 20px;" >
	<base:my-grid name="closingSlipGrid" transportReadUrl="${basePath}/grid-read-closingSlip" showOperation="true" showToolbar="false" groupable="false">
		<base:my-grid-column title="com.artonis.inv.slip.closingSlip.inventory" field="inventoryName" width="40px" />
		<base:my-grid-column title="com.artonis.inv.slip.closingSlip.financeYear" field="financeYearName" width="40px" />
		<base:my-grid-column title="com.artonis.inv.slip.closingSlip.reference" field="reference" width="25px" />
		<base:my-grid-column title="com.artonis.inv.slip.closingSlip.serial" field="serial" width="25px" />
		<base:my-grid-column title="com.artonis.inv.slip.closingSlip.date" field="date" width="30px" />
		<base:my-grid-column title="com.artonis.inv.slip.closingSlip.state" field="stateName" width="30px" />
		<base:my-grid-column title="com.artonis.inv.slip.closingSlip.beginPeriodReceiptReference" field="beginPeriodReceiptReference" width="30px" />
		<base:my-grid-column title="com.artonis.inv.slip.closingSlip.beginPeriodReceiptSerial" field="beginPeriodReceiptSerial" width="30px" />

		<base:my-grid-function text="com.artonis.inv.slip.closingSlip.beginPeriodReceiptCreation" functionClick="beginPeriodReceipt_creation"  name="beginPeriodReceiptCreation"/>
	</base:my-grid>
</div>

<base:formPopupInGrid  styledivLabel="text-align: right" formPopup="beginPeriodReceipt" disableBackground="true" disableSaveWithoutCloseButton="true"
					   popupUrl="/inv/operation/createBeginPeriodReceiptPopUp/" />

<base:footer />

<script type="text/javascript">
    function getSearchObject() {
        var searchObject = {};
        searchObject.inventoryId = $("#inventoryId").val();
        searchObject.financeyear_id = $("#financeyear_id").val();
        return searchObject;
    }

    function startClosingSlip() {
        if ($("#inventoryId").val() == "" || $("#financeyear_id").val() == "") {
            alertify.error('اطلاعات را کامل وارد کنید');
            return;
        }
        //
        $("#startClosingSlipBtn").attr('disabled','disabled');

		//
        $.ajax({
            url: "${pageContext.request.contextPath}" + "/inv/operation/ClosingOperation/startClosingSlip",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(getSearchObject()),
            dataType: 'json',
            type: 'POST',
            success: function (data, success, xhr) {
                if (data.state == "error") {
                    alertify.error(data.message);
                } else {
                    var kendoGrid = $("#closingSlipGrid").data("kendoGrid");
                    kendoGrid.dataSource.read({
                        filter: {
                            logic: "and",
                            filters: [
                                {field: "inventoryId", operator: "eq", value: $("#inventoryId").val()},
                                {field: "financeYearId", operator: "eq", value: $("#financeyear_id").val()}
                            ]
                        }
                    });
                    alertify.success(data.message);
                }
                //
                $("#startClosingSlipBtn").removeAttr('disabled');

            },
            error: function (e) {
                alert('Error: ' + e.responseText);
                $("#startClosingSlipBtn").removeAttr('disabled');
            }
        });
    }


    function beginPeriodReceipt_creation(e){
        var selectGrid = $("#closingSlipGrid").data("kendoGrid");
        var row = selectGrid.dataItem($(e.target).closest("tr"));
        _beginPeriodReceipt_popup(e,row);
    }

    function beginPeriodReceipt_beforeCallPopupUrl(e,popUpUrl,rowData){
        return popUpUrl+rowData.id;
	}

	function callback_custom_deserialize_popup_beginPeriodReceipt(e){
        console.log(e);

        $.ajax({
            url: "${pageContext.request.contextPath}" + "/inv/operation/ClosingOperation/creatingBeginPeriodReceipt",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(e),
            dataType: 'json',
            type: 'POST',
            success: function (data, success, xhr) {
                if (data.state == "error") {
                    alertify.error(data.message);
                } else {
                    var kendoGrid = $("#closingSlipGrid").data("kendoGrid");
                    kendoGrid.dataSource.read();
                    alertify.success(data.message);
                }
                //
            },
            error: function (e) {
                alert('Error: ' + e.responseText);
            }
        });

	}

    $(document).ready(function () {
        // var grid = $("#searchGrid").data("kendoGrid");
        // grid.selectable.destroy();
    });
</script>
