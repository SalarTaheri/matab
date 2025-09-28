<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader />

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
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

<base:my-grid-search noDeleteButton="true" defaultReadUrlIsRelative="true" showOperation="false">
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.inventoryName" field="inventoryName" width="50px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.documentName" field="documentName" width="50px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.documentReference" field="documentReference" width="20px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.documentSerial" field="documentSerial" width="20px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.documentDate" field="documentDate" width="30px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.goodsName" field="goodsName" width="50px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.incomingGoodsAmount" field="incomingGoodsAmount" width="40px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.incomingRateText" field="incomingRateText" width="40px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.incomingPrice" field="incomingPrice" width="40px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.outgoingGoodsAmount" field="outgoingGoodsAmount" width="40px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.outgoingRateText" field="outgoingRateText" width="40px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.outgoingPrice" field="outgoingPrice" width="40px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.goodsAmountRemaining" field="goodsAmountRemaining" width="40px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.calculatedGoodsRate" field="calculatedGoodsRateText" width="40px" />
	<base:my-grid-column title="com.artonis.inv.reports.rialiKardex.sumPrice" field="sumPrice" width="40px" />
</base:my-grid-search>

<base:footer />

<script type="text/javascript">

    function getSearchObject() {
        var searchObject = {};
        searchObject.goodsId = $("#goodsId").val();
        searchObject.inventoryId = $("#inventoryId").val();
        searchObject.fromDate = $("#fromDate").val();
        searchObject.toDate = $("#toDate").val();
        return searchObject;
    }

    function do_before_search_callback() {
        if ($("#goodsId").val() == "" || $("#inventoryId").val() == "") {
            alertify.error("فیلد های نام انبار و نام کالا باید مقداردهی شود");
            return "false";
        }
        return "true";
    }

</script>
