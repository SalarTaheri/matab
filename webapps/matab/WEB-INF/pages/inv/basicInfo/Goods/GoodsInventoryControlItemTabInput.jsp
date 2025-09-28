<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form2-GoodsInventoryControlItem" >
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="min_" key="com.artonis.inv.basicInfo.goodsInventoryControl.min_" type="number"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="max_" key="com.artonis.inv.basicInfo.goodsInventoryControl.max_" type="number"/>
			<base:testBox styleClass="small" name="amountOrder" key="com.artonis.inv.basicInfo.goodsInventoryControl.amountOrder" type="number"/>
			<base:testBox styleClass="small" name="pointOfAppeal" key="com.artonis.inv.basicInfo.goodsInventoryControl.pointOfAppeal" type="number"/>
		</div>
	
	</form>
</div>
