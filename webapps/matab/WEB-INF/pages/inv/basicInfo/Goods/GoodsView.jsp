<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader6button pageTitle="com.artonis.inv.basicInfo.goods.view"/>
<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="code" key="com.artonis.inv.basicInfo.goods.code"/>
			<base:testBox styleClass="small" name="name" key="com.artonis.inv.basicInfo.goods.name"/>
			<base:testBox styleClass="small" name="measureUnit" key="com.artonis.inv.basicInfo.goods.measureUnit"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="goodsTypeId" key="com.artonis.inv.basicInfo.goods.type" comboLoaderUrl="combo/loadAllGoodsTypes"/>
			<base:comboBox styleClass="small" name="active" key="com.artonis.inv.basicInfo.goods.active" comboLoaderUrl="combo/loadStandardized"/>
			<%--<base:comboBox styleClass="small" name="standardized" key="com.artonis.inv.basicInfo.goods.standardized" comboLoaderUrl="combo/loadStandardized"/>--%>
			<base:comboBox styleClass="small" name="pricing" key="com.artonis.inv.basicInfo.goods.pricing" comboLoaderUrl="combo/loadPricing"/>
		</div>
		<div style="padding-top: 10px;">
			<base:my-grid-search>
				<base:my-grid-column title='com.artonis.inv.basicInfo.goods.code'  field="code" width="50px"/>
				<base:my-grid-column title='com.artonis.inv.basicInfo.goods.name'  field="name" width="50px"/>
				<base:my-grid-column title='com.artonis.inv.basicInfo.goods.measureUnit'  field="baseMeasureUnitName" width="50px"/>
				<base:my-grid-column title='com.artonis.inv.basicInfo.goods.type'  field="goodsTypeName" width="50px"/>
				<base:my-grid-column title='com.artonis.inv.basicInfo.goods.active'  field="activeTxt" width="50px"/>
				<%--<base:my-grid-column title='com.artonis.inv.basicInfo.goods.standardized'  field="standardizedTxt" width="50px"/>--%>
				<base:my-grid-column title='com.artonis.inv.basicInfo.goods.pricing'  field="pricingTxt" width="50px"/>
				<base:my-grid-column title='com.artonis.inv.basicInfo.goods.description'  field="description" width="50px"/>
			
		        <base:my-grid-schema-field name="code" type="string"/>
		        <base:my-grid-schema-field name="name" type="string"/>
		        <base:my-grid-schema-field name="baseMeasureUnitName" type="string"/>
		        <base:my-grid-schema-field name="goodsTypeName" type="string"/>
		        <base:my-grid-schema-field name="active" type="string"/>
		        <%--<base:my-grid-schema-field name="standardized" type="string"/>--%>
		        <base:my-grid-schema-field name="pricing" type="string"/>
		        <base:my-grid-schema-field name="description" type="string"/>
			</base:my-grid-search>
		</div>
	</form>
</div>
<base:footer/>
<script type="text/javascript">
function getSearchObject() {
	var goods = {};
	goods.code = $("#code").val();
	goods.name = $("#name").val();
	goods.measureUnit = $("#measureUnit").val();
	goods.goodsTypeId = $("#goodsTypeId").val();
	goods.active = $("#active").val();
	goods.standardized = $("#standardized").val();
	goods.pricing = $("#pricing").val();
	return goods;
}
</script>