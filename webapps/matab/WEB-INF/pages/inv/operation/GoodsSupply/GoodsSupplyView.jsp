<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<base:pageHeader />

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve" style="margin-bottom: 10px;">
			<base:comboBox styleClass="small" name="financeyearId" key="com.artonis.inv.operation.goodsSupply.financeyearName" value="financeYearName" 
					comboLoaderUrl="combo/loadAllFinanceYear"/>
			<base:comboBoxAutoComplete name="inventoryId" styleClass="small" key="com.artonis.inv.operation.goodsSupply.inventoryName"
					comboLoaderUrl="combo/loadAllInventory" dataTextField="name" dataValueField="id" minLength="0" hasTemplate="false" iscomboLoaderUrlRelative="true"/>
			<base:comboBoxAutoComplete styleClass="small" name="goodsId" key="com.artonis.inv.operation.goodsSupply.goodsName" comboLoaderUrl="combo/loadAllGoods"
			 		iscomboLoaderUrlRelative="true"	dataTextField="nameAndCode" dataValueField="id" minLength="0" hasTemplate="true" templateComaSep="name,code"
					headerTemplateComaSep="com.artonis.inv.operation.goodsSupply.goodsName,com.artonis.inv.operation.goodsSupply.goodsCode" />
		</div>
		<base:my-grid-search showOperation="false">
			<base:my-grid-column title='com.artonis.inv.operation.goodsSupply.financeyearName' field="financeyearName" width="30px" />
			<base:my-grid-column title='com.artonis.inv.operation.goodsSupply.inventoryName' field="inventoryName" width="50px" />
			<base:my-grid-column title='com.artonis.inv.operation.goodsSupply.inventoryCode' field="inventoryCode" width="30px" />
			<base:my-grid-column title='com.artonis.inv.operation.goodsSupply.goodsName' field="goodsName" width="80px" />
			<base:my-grid-column title='com.artonis.inv.operation.goodsSupply.goodsCode' field="goodsCode" width="30px" />
			<base:my-grid-column title='com.artonis.inv.operation.goodsSupply.basemeasureUnitName' field="basemeasureUnitName" width="50px" />
			<base:my-grid-column title='com.artonis.inv.operation.goodsSupply.remaining' field="remaining" width="40px" />
			<base:my-grid-column title='com.artonis.inv.operation.goodsSupply.orderAmount' field="orderAmount" width="50px" />

			<base:my-grid-schema-field name="remaining" type="long" />
			<base:my-grid-schema-field name="orderAmount" type="long" />
		</base:my-grid-search>
	</form>
</div>

<base:footer />

<script type="text/javascript">

	function getSearchObject() {
		var searchObject = {};
		searchObject.financeyearId = $("#financeyearId").val();
		searchObject.goodsId = $("#goodsId").val();
		searchObject.inventoryId = $("#inventoryId").val();
		return searchObject;
	}
	
	function callback_DataBound_financeyearId(e){
		$.ajax({
			url: getBaseUrl() + "getActiveFinanceYear",
			contentType: "application/json; charset=utf-8",
			dataType: 'json',
			type: 'GET',
			success: function (data, success, xhr) {
				if(data != null){
					$("#financeyearId_Comb").data("kendoComboBox").value(data.id);
					$("#financeyearId").val(data.id);
				}
			},
			error: function (e) {
				console.log('Error: ' + e.responseText);
			}
		});
	}
	
</script>

