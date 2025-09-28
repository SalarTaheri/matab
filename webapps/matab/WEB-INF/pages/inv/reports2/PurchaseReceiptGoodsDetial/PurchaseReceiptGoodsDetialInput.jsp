<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
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
	
	</form>
</div>
