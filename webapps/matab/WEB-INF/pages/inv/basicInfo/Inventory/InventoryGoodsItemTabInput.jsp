<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form2-InventoryGoodsItem" >
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
		   <base:comboBoxAutoComplete-buttonAddToCombo name="goods_id" key="com.artonis.inv.basicInfo.inventoryGoods.goods_id"  popupUrlIsRelative="true"
                                     iscomboLoaderUrlRelative="true" comboLoaderUrl="combo/loadAllGoods" dataTextField="nameAndCode"
                                     dataValueField="id" minLength="0"
                                     hasTemplate="true"
                                     headerTemplateComaSep="com.artonis.inv.basicInfo.goods.name,com.artonis.inv.basicInfo.goods.code"
                                     templateComaSep="name,code" popupUrl="popup/goodsView" />
	    </div>
	
	</form>
</div>
