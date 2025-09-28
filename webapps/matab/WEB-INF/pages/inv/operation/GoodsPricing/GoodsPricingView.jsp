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
			<base:mDatePicker styleClass="small" name="fromDate" key="com.artonis.inv.operation.goodsPricing.fromDate" />
			<base:mDatePicker styleClass="small" name="toDate" key="com.artonis.inv.operation.goodsPricing.toDate" />
		</div>
	</form>
</div>

<base:my-grid-search showOperation="false">
	<base:my-grid-column title="com.artonis.inv.operation.goodsPricing.documentName" field="documentName" width="50px" />
	<base:my-grid-column title="com.artonis.inv.operation.goodsPricing.documentDate" field="documentDate" width="50px" />
	<base:my-grid-column title="com.artonis.inv.operation.goodsPricing.documentSerial" field="documentSerial" width="50px" />
	<base:my-grid-column title="com.artonis.inv.operation.goodsPricing.documentReference" field="documentReference" width="50px" />
	<base:my-grid-column title="com.artonis.inv.operation.goodsPricing.goodsName" field="goodsName" width="50px" />
	<base:my-grid-column title="com.artonis.inv.operation.goodsPricing.goodsCategoryName" field="goodsCategoryName" width="50px" />
</base:my-grid-search>

<div align="center" style="padding-top: 1px">
	<%if(GlobalVariable.getButtonContainer("011002010","startGoodsPricingBtn")){ %>
	<button class="uk-button uk-button-success" type="button" onclick="javascript:startGoodsPricingCalc()" id="startGoodsPricingBtn">
		<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.operation.goodsPricing")%>
	</button>
	<%} %>
	<%if(GlobalVariable.getButtonContainer("011002010","backGoodsPricingBtn")){ %>
		<button class="uk-button uk-button-success" type="button" onclick="javascript:backGoodsPricingCalc()" id="backGoodsPricingBtn">
			<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.operation.backGoodsPricing")%>
		</button>
	<%} %>
</div>

<div class="uk-grid uk-grid-preserve" style="padding-top: 20px;" >
	<base:my-grid name="goodsPricingGrid" transportReadUrl="${basePath}/grid-read-goodsPricingGrid" showOperation="false" showToolbar="false" groupable="false">
		<base:my-grid-column title='com.artonis.inv.operation.goodsPricing.documentDate' field="documentDate" width="50px"/>
		<base:my-grid-column title='com.artonis.inv.operation.goodsPricing.documentName' field="documentName" width="50px"/>
		<base:my-grid-column title='com.artonis.inv.operation.goodsPricing.documentSerial' field="documentSerial" width="50px"/>
		<base:my-grid-column title='com.artonis.inv.operation.goodsPricing.documentReference' field="documentReference" width="50px"/>
		<base:my-grid-column title='com.artonis.inv.operation.goodsPricing.dateInMiliSec_dateForm' field="dateInMilliSec_DateForm" width="50px"/>
		<base:my-grid-column title='com.artonis.inv.operation.goodsPricing.inventoryName' field="inventoryName" width="50px"/>
		<base:my-grid-column title='com.artonis.inv.operation.goodsPricing.goodsName' field="goodsName" width="50px"/>
		<base:my-grid-column title='com.artonis.inv.operation.goodsPricing.rate' field="rateText" width="50px"/>
	</base:my-grid>
</div>

<base:footer />

<script type="text/javascript">
    function getSearchObject() {
        var searchObject = {};
        searchObject.inventoryId = $("#inventoryId").val();
        searchObject.fromDate = $("#fromDate").val();
        searchObject.toDate = $("#toDate").val();
        return searchObject;
    }

    function startGoodsPricingCalc() {
        if ($("#inventoryId").val() == "" || $("#fromDate").val() == "" || $("#toDate").val() == "") {
            alertify.error('اطلاعات را کامل وارد کنید');
            return;
        }
        //
        $("#startGoodsPricingBtn").attr('disabled','disabled');
        $("#backGoodsPricingBtn").attr('disabled','disabled');
		//
        $.ajax({
            url: "${pageContext.request.contextPath}" + "/inv/operation/GoodsPricing/startGoodsPricingCalculation",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(getSearchObject()),
            dataType: 'json',
            type: 'POST',
            success: function (data, success, xhr) {
                if (data.state == "error") {
                    alertify.error(data.message);
                } else {
                    var kendoGrid = $("#goodsPricingGrid").data("kendoGrid");
                    kendoGrid.dataSource.read({
                        filter: {
                            logic: "and",
                            filters: [
                                {field: "inventoryId", operator: "eq", value: $("#inventoryId").val()},
                                {field: "documentDate", operator: "lte", value: $("#toDate").val()},
                                {field: "documentDate", operator: "gte", value: $("#fromDate").val()}
                            ]
                        }
                    });
                    alertify.success(data.message);
                }
                //
                $("#startGoodsPricingBtn").removeAttr('disabled');
                $("#backGoodsPricingBtn").removeAttr('disabled');
            },
            error: function (e) {
                alert('Error: ' + e.responseText);
                $("#startGoodsPricingBtn").removeAttr('disabled');
                $("#backGoodsPricingBtn").removeAttr('disabled');
            }
        });
    }

    function backGoodsPricingCalc() {
        if ($("#inventoryId").val() == "" || $("#fromDate").val() == "" || $("#toDate").val() == "") {
            alertify.error('اطلاعات را کامل وارد کنید');
            return;
        }
        //
        $("#startGoodsPricingBtn").attr('disabled','disabled');
        $("#backGoodsPricingBtn").attr('disabled','disabled');
        //
        $.ajax({
            url: "${pageContext.request.contextPath}" + "/inv/operation/GoodsPricing/backGoodsPricingCalculation",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(getSearchObject()),
            dataType: 'json',
            type: 'POST',
            success: function (data, success, xhr) {
                if (data.state == "error") {
                    alertify.error(data.message);
                } else {
                    var kendoGrid = $("#goodsPricingGrid").data("kendoGrid");
                    kendoGrid.dataSource.read({
                        filter: {
                            logic: "and",
                            filters: [
                                {field: "inventoryId", operator: "eq", value: $("#inventoryId").val()},
                                {field: "documentDate", operator: "lte", value: $("#toDate").val()},
                                {field: "documentDate", operator: "gte", value: $("#fromDate").val()}
                            ]
                        }
                    });
                    alertify.success(data.message);
                }
                //
                $("#startGoodsPricingBtn").removeAttr('disabled');
                $("#backGoodsPricingBtn").removeAttr('disabled');
            },
            error: function (e) {
                alert('Error: ' + e.responseText);
                $("#startGoodsPricingBtn").removeAttr('disabled');
                $("#backGoodsPricingBtn").removeAttr('disabled');
            }
        });
    }

    $(document).ready(function () {
        var grid = $("#searchGrid").data("kendoGrid");
        grid.selectable.destroy();
    });
</script>
