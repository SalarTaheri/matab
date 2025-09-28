<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<script type="text/javascript">
	function _goodsCategory_id_select_element(e) {}
	function _goodsCategory_id_change(e) {
		var goodsCategoryId = $("#goodsCategory_id_Comb").val()
		$("#goodsCategory_id").val(goodsCategoryId);
		if (!!goodsCategoryId) {
			var url = getBaseUrl() + "popup/loadGoodsTypeNameByGoodsCategoryId/" + goodsCategoryId;
			$.getJSON(url, function(data) {
				$("#goodsTypeName").val(data.goodsTypeName);
			});
		}
	}
	function _goodsCategory_id_dataBound(e) {}
	function _goodsCategory_id_close(e) {}
	function _goodsCategory_id_open(e) {}

	function _measureUnit_select_element(e) {}
	function _measureUnit_change(e) {
		var measureUnit = $("#measureUnit_Comb").val()
		$("#measureUnit").val(measureUnit);
	}
	function _measureUnit_dataBound(e) {}
	function _measureUnit_close(e) {}
	function _measureUnit_open(e) {}
</script>

<form class="uk-form" id="form-popup">
	<input type="hidden" id="id" name="id"/>
	<div class="uk-grid uk-grid-preserve">
		<base:testBox styleClass="small" name="code" key="com.artonis.inv.basicInfo.goods.code"/>
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
		<base:checkbox styleClass="small" name="active" key="com.artonis.inv.basicInfo.goods.active" />
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:comboBox styleClass="small" name="pricing" key="com.artonis.inv.basicInfo.goods.pricing" comboLoaderUrl="combo/loadPricing"/>
		<base:mDatePicker styleClass="small" name="expireDate" key="com.artonis.inv.basicInfo.goods.expireDate" />
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBox styleClass="small" name="latinName" key="com.artonis.inv.basicInfo.goods.latinName" />
		<base:testBox styleClass="small" name="description" key="com.artonis.inv.basicInfo.goods.description"/>
	</div>
</form>

<script type="text/javascript">
    $("#active").prop('checked', true);
    $(".ui-dialog-title").text("تعریف کالا");
    var url = getBaseUrl() + "popup/getNewGoodsCode";
    $.getJSON(url, function (data) {
        $("#code").val(data.code);
    });
</script>