<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id"/>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="code" key="com.artonis.inv.basicInfo.goods.code" type="number"/>
			<base:testBox styleClass="small" name="name" key="com.artonis.inv.basicInfo.goods.name"/>
			<base:comboBoxAutoComplete name="goodsCategory_id" styleClass="small" key="com.artonis.inv.basicInfo.goodsCategory" comboLoaderUrl="combo/loadAllGoodsCategory"
                                       dataTextField="name" dataValueField="id" minLength="0" isListConstant="true"
                                       hasTemplate="false" headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name" templateComaSep="name" iscomboLoaderUrlRelative="true"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBoxAutoComplete name="measureUnit" styleClass="small" key="com.artonis.inv.basicInfo.goods.measureUnit" comboLoaderUrl="combo/loadAllMeasureUnit"
                                       dataTextField="measureUnit" dataValueField="id" minLength="0"
                                       hasTemplate="false" headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name" templateComaSep="measureUnit" iscomboLoaderUrlRelative="true"/>
			<base:testBox styleClass="small" name="goodsTypeName" key="com.artonis.inv.basicInfo.goods.type" disabled="true" />
			<base:checkbox styleClass="small" name="active" key="com.artonis.inv.basicInfo.goods.active"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<%--<base:comboBox styleClass="small" name="standardized" key="com.artonis.inv.basicInfo.goods.standardized" comboLoaderUrl="combo/loadStandardized"/>--%>
			<base:comboBox styleClass="small" name="pricing" key="com.artonis.inv.basicInfo.goods.pricing" comboLoaderUrl="combo/loadPricing"/>
			<base:testBox styleClass="small" name="latinName" key="com.artonis.inv.basicInfo.goods.latinName" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea name="description" key="com.artonis.inv.basicInfo.goods.description"/>
		</div>
	</form>
	<br>
	<base:itemForm titleKeys="com.artonis.inv.basicInfo.goodsPhysicalPlace,com.artonis.inv.basicInfo.goodsInventoryControl,com.artonis.inv.basicInfo.goodsBarCode,com.artonis.inv.basicInfo.goods.subMeasureUnit"
				   formItemTabViewJspFiles="GoodsPhysicalPlaceItemTabView.jsp,GoodsInventoryControlItemTabView.jsp,GoodsBarCodeItemTabView.jsp,GoodsSubMeasureUnitItemTabView.jsp"
				   formItemTabInputs="GoodsPhysicalPlaceItemTabInput,GoodsInventoryControlItemTabInput,GoodsBarCodeItemTabInput,GoodsSubMeasureUnitItemTabInput"
	 			   insertWithoutPopup="true" masterIdStr="goodsId"/>
</div>
<script type="text/javascript">
	function callback_change_goodsCategory_id() {
		var goodsCategoryId = $("#goodsCategory_id").val();
		if (!!goodsCategoryId) {
			var url = getBaseUrl() + "loadGoodsTypeNameByGoodsCategoryId/" + goodsCategoryId;
			$.getJSON(url, function(data) {
				$("#goodsTypeName").val(data.goodsTypeName);
			});
		}
	}
  
	function callback_deserialize() {
		$("#active").prop('checked', true);
	}
	
	$(document).ready(function() {
		callback_change_goodsCategory_id();
	});
</script>

