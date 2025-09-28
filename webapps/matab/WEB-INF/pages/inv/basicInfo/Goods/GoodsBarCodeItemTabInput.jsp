<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form2-GoodsBarCodeItem" >
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="label" key="com.artonis.inv.basicInfo.goodsBarCode.label"/>
			<base:testBox styleClass="small" name="barcode" key="com.artonis.inv.basicInfo.goodsBarCode.barcode"/>
		</div>
	</form>
</div>
