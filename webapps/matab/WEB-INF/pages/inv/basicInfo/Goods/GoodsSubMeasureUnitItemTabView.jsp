<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="transportupdateUrl" tabName="GoodsSubMeasureUnitItem"/>

<base:my-grid-item name="GoodsSubMeasureUnitItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="goodsId">
	<base:my-grid-column title="com.artonis.inv.basicInfo.goods.subMeasureUnit" field="measureUnitName" width="50px"/>
	<base:my-grid-column title="com.artonis.inv.basicInfo.goods.convertCoefficient" field="convertCoefficient" width="50px"/>

    <base:my-grid-schema-field name="measureUnitName" type="string"/>
    <base:my-grid-schema-field name="convertCoefficient" type="long"/>
</base:my-grid-item>

<base:footer/>

<script>
function doAfterRemove_GoodsSubMeasureUnitItem(e) {
	if($("#GoodsSubMeasureUnitItem").data("kendoGrid").dataSource.total() > 0) {
		$("#measureUnit_Comb").data("kendoComboBox").enable(false);
	} else {
		$("#measureUnit_Comb").data("kendoComboBox").enable(true);
	}
}

function doAfterSave_GoodsSubMeasureUnitItem() {
	$("#measureUnit_Comb").data("kendoComboBox").enable(false);
}

function GoodsSubMeasureUnitItem_onDataBound_callback(e) {
	if($("#GoodsSubMeasureUnitItem").data("kendoGrid").dataSource.total() > 0) {
		$("#measureUnit_Comb").data("kendoComboBox").enable(false);
	} else {
		$("#measureUnit_Comb").data("kendoComboBox").enable(true);
	}
}
</script>