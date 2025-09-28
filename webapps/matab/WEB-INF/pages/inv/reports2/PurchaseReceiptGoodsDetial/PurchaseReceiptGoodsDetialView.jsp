
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>

<div class="uk-container uk-container-center my-uk-container" >
<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="id" key="com.artonis.inv.reports2.purchaseReceiptGoodsDetial.id"/>
			<base:testBox styleClass="small" name="goods_id" key="com.artonis.inv.reports2.purchaseReceiptGoodsDetial.goods_id"/>
			<base:testBox styleClass="small" name="goodsAmount" key="com.artonis.inv.reports2.purchaseReceiptGoodsDetial.goodsAmount"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="purchaseReceipt_id" key="com.artonis.inv.reports2.purchaseReceiptGoodsDetial.purchaseReceipt_id"/>
			<base:testBox styleClass="small" name="measureUnit_id" key="com.artonis.inv.reports2.purchaseReceiptGoodsDetial.measureUnit_id"/>
			<base:testBox styleClass="small" name="rate" key="com.artonis.inv.reports2.purchaseReceiptGoodsDetial.rate"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="sum" key="com.artonis.inv.reports2.purchaseReceiptGoodsDetial.sum"/>
			</div>

<base:my-grid-search >
	<base:my-grid-column title='com.artonis.inv.reports2.purchaseReceiptGoodsDetial.goods_id'  field="goods_id" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.reports2.purchaseReceiptGoodsDetial.goodsAmount'  field="goodsAmount" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.reports2.purchaseReceiptGoodsDetial.purchaseReceipt_id'  field="purchaseReceipt_id" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.reports2.purchaseReceiptGoodsDetial.measureUnit_id'  field="measureUnit_id" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.reports2.purchaseReceiptGoodsDetial.rate'  field="rate" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.reports2.purchaseReceiptGoodsDetial.sum'  field="sum" width="50px"/>

        <base:my-grid-schema-field name="goods_id" type="string"/>
        <base:my-grid-schema-field name="goodsAmount" type="string"/>
        <base:my-grid-schema-field name="purchaseReceipt_id" type="string"/>
        <base:my-grid-schema-field name="measureUnit_id" type="string"/>
        <base:my-grid-schema-field name="rate" type="string"/>
        <base:my-grid-schema-field name="sum" type="string"/>
</base:my-grid-search>
</form>
</div>
<base:footer/>
<script type="text/javascript">
function getSearchObject(){
	var jsobj = {};
	jsobj.xxx=$("#xxx").val();
	return jsobj;
}
</script>
