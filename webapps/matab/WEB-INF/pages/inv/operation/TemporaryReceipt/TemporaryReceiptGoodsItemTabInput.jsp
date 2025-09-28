<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-TemporaryReceiptGoodsItem">
	<input type="hidden" id="id" name="id"/>
	<div class="uk-grid uk-grid-preserve">
		<base:comboBoxAutoComplete-buttonNew name="goods_id" key="com.artonis.inv.basicInfo.inventoryGoods.goods_id" templateComaSep="name,code"
			iscomboLoaderUrlRelative="true" comboLoaderUrl="combo/loadAllGoods" dataTextField="nameAndCode" dataValueField="id" minLength="0" styleClass="small"
			hasTemplate="true" headerTemplateComaSep="com.artonis.inv.basicInfo.goods.name,com.artonis.inv.basicInfo.goods.code" 
			popupUrl="popup/goodsInput" relativeSaveUrl="/popupGoods/save"/>
			
		<base:testBox styleClass="small" name="goodsCode" dataIgnore="true" key="com.artonis.inv.operation.beginPeriodReceiptGoods.goodsCode" />
		<base:cascadeComboBox cascadeCombo="goods_id" styleClass="small" name="measureUnitId" key="com.artonis.inv.operation.beginPeriodReceiptGoods.measureUnit"
							  comboLoaderUrl="combo/loadAllMeasureUnitsByGoodsId" />
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="small" name="goodsAmount" key="com.artonis.inv.operation.temporaryReceiptGoods.goodsAmount" />
	</div>
</form>
<script type="text/javascript">
	function _goods_id_change(e) {
		var goods_id = $("#goods_id_Comb").data("kendoComboBox")._selectedValue;
		var url = getBaseUrl() + "loadGoods/" + goods_id;
		$.getJSON(url, function(data) {
			$('#goodsCode').val(data.code);
		});
	}
</script>