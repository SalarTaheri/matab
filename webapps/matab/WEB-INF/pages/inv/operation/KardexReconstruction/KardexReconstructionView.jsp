<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader />

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:comboBoxAutoComplete name="inventoryId" styleClass="small" key="com.artonis.inv.reports.goodsKardex.inventory" comboLoaderUrl="combo/loadAllInventory"
				dataTextField="name" dataValueField="id" minLength="0" hasTemplate="false" />
			<base:comboBoxAutoComplete styleClass="small" name="goodsId" key="com.artonis.inv.reports.goodsKardex.goods" comboLoaderUrl="combo/loadAllGoods"
				dataTextField="nameAndCode" dataValueField="id" minLength="0" hasTemplate="true" templateComaSep="name,code"
				headerTemplateComaSep="com.artonis.inv.basicInfo.goods.name,com.artonis.inv.basicInfo.goods.code" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="small" name="fromDate" key="com.artonis.inv.reports.goodsKardex.fromDate" />
			<base:mDatePicker styleClass="small" name="toDate" key="com.artonis.inv.reports.goodsKardex.toDate" />
		</div>
	</form>
</div>
<base:my-grid-search noDeleteButton="true" >
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
	
	<base:my-grid-function name="viewGoodsKardex" functionClick="viewGoodsKardex" text="com.artonis.inv.reports.goodsKardex.view"/>
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
	
	function viewGoodsKardex(e){
		var data = this.dataItem($(e.target).closest("tr"));
		var fromDate = $("#fromDate").val().replace(/\//g, ':@:');
		var toDate = $("#toDate").val().replace(/\//g, ':@:');
		window.location = "${pageContext.request.contextPath}" + "/inv/reports/goodsKardex/searchFromKardexReconstruction/" +data.inventoryId+"/"+data.goodsId+"/"+
				data.documentSerial+"/-"+fromDate+"/-"+toDate;
		
	}
</script>
