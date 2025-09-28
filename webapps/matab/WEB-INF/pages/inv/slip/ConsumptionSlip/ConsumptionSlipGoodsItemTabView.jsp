<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="ConsumptionSlipGoodsItem" />

<base:my-grid-item name="ConsumptionSlipGoodsItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="consumptionSlipId">
	<base:my-grid-column title="com.artonis.inv.slip.consumptionSlipGoods.goods" field="goodsName" width="50px" />
	<base:my-grid-column title="com.artonis.inv.slip.consumptionSlipGoods.measureUnit" field="measureUnitName" width="50px" />
	<base:my-grid-column title="com.artonis.inv.slip.consumptionSlipGoods.amount" field="amount" format="0:#,0" width="50px" />
	<%--<base:my-grid-column title="com.artonis.inv.slip.consumptionSlipGoods.rate" field="rate" width="50px" />--%>
	<%--<base:my-grid-column title="com.artonis.inv.slip.consumptionSlipGoods.sum" field="sum" width="50px" />--%>

	<base:my-grid-schema-field name="goodsName" type="string" />
	<base:my-grid-schema-field name="measureUnitName" type="string" />
	<base:my-grid-schema-field name="amount" type="long" />
	<%--<base:my-grid-schema-field name="rate" type="long" />--%>
	<%--<base:my-grid-schema-field name="sum" type="long" />--%>
</base:my-grid-item>
<base:footer />
