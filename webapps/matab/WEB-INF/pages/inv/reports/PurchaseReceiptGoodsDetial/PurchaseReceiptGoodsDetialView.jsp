<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>
<div class="uk-container uk-container-center my-uk-container" >
<form class="uk-form" id="mainForm">
	<div class="uk-grid uk-grid-preserve">
		<base:testBox styleClass="midsmall" name="fromSerial" key="com.artonis.inv.operation.beginPeriodReceipt.fromSerial"/>
		<base:testBox styleClass="midsmall" name="toSerial"  key="com.artonis.inv.operation.beginPeriodReceipt.toSerial"/>
	    <base:testBox styleClass="midsmall" name="fromReference" key="com.artonis.inv.operation.beginPeriodReceipt.fromReference"/>
		<base:testBox styleClass="midsmall" name="toReference"  key="com.artonis.inv.operation.beginPeriodReceipt.toReference"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:mDatePicker styleClass="midsmall" name="fromDate" key="com.artonis.inv.operation.beginPeriodReceipt.fromDate"/>
	    <base:mDatePicker styleClass="midsmall" name="toDate" key="com.artonis.inv.operation.beginPeriodReceipt.toDate"/>
	    <base:testBoxNumericEx styleClass="midsmall" name="fromAmount" key="com.artonis.inv.operation.beginPeriodReceipt.fromAmount"/>
		<base:testBoxNumericEx styleClass="midsmall" name="toAmount"  key="com.artonis.inv.operation.beginPeriodReceipt.toAmount"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:comboBoxAutoComplete name="inventory_id" styleClass="midsmall" key="com.artonis.inv.operation.beginPeriodReceipt.inventory"
				comboLoaderUrl="combo/loadAllInventory" dataTextField="name" dataValueField="id" minLength="0" hasTemplate="false"
				headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name" templateComaSep="name" iscomboLoaderUrlRelative="true" />
		<base:comboBoxAutoComplete name="goods_id" key="com.artonis.inv.basicInfo.inventoryGoods.goods_id"  minLength="0"
				comboLoaderUrl="combo/loadAllGoods" dataTextField="nameAndCode" dataValueField="id" styleClass="midsmall" templateComaSep="name,code" />
		<base:cascadeComboBox cascadeCombo="goods_id" styleClass="midsmall" name="measureUnit_id" key="com.artonis.inv.receipt.purchaseReceipt.measureUnit"
				comboLoaderUrl="combo/loadAllMeasureUnitsByGoodsId"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="midsmall" name="fromRate" key="com.artonis.inv.report.PurchaseReceiptGoodsDetialView.fromRate"/>
	    <base:testBoxNumericEx styleClass="midsmall" name="toRate" key="com.artonis.inv.report.PurchaseReceiptGoodsDetialView.toRate"/>
		<base:testBoxNumericEx styleClass="midsmall" name="fromSum" key="com.artonis.inv.report.PurchaseReceiptGoodsDetialView.fromSum"/>
	    <base:testBoxNumericEx styleClass="midsmall" name="toSum" key="com.artonis.inv.report.PurchaseReceiptGoodsDetialView.toSum"/>
	</div>
	<br/>
	<base:my-grid-search showOperation="false" >
		<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceipt.reference'  field="reference" width="15px"/>
		<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceipt.serial'  field="serial" width="15px"/>
		<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceipt.inventory_id'  field="inventoryName" width="25px"/>
		<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceipt.date_'  field="date_" width="20px"/>
		<base:my-grid-column title='com.artonis.inv.basicInfo.inventoryGoods.goods_id'  field="goodsName" width="45px"/>
		<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptGoods.goodsAmount'  field="goodsAmount" width="20px"/>
		<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceipt.measureUnit'  field="measureUnit" width="25px"/>
		<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptGoods.rate'  field="rate" width="25px"/>
		<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptGoods.sum'  field="sum" width="25px"/>
	</base:my-grid-search>
</form>
</div>
<base:footer/>
<script type="text/javascript">
function getSearchObject(){
	var jsobj = {};
	jsobj.fromSerial=$("#fromSerial").val();
	jsobj.toSerial=$("#toSerial").val();
	jsobj.fromReference=$("#fromReference").val();
	jsobj.toReference=$("#toReference").val();
	jsobj.fromAmount=$("#fromAmount").val();
	jsobj.toAmount=$("#toAmount").val();
	jsobj.fromDate=$("#fromDate").val();
	jsobj.toDate=$("#toDate").val();
	jsobj.inventory_id=$("#inventory_id").val();
	jsobj.goods_id=$("#goods_id").val();
	jsobj.measureUnit_id=$("#measureUnit_id").val();
	jsobj.fromRate=$("#fromRate").val();
	jsobj.toRate=$("#toRate").val();
	jsobj.fromSum=$("#fromSum").val();
	jsobj.toSum=$("#toSum").val();
	return jsobj;
}
</script>