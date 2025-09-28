<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="TemporaryReceiptGoodsItem" />

<base:my-grid-item name="TemporaryReceiptGoodsItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="temporaryReceipt_id">
	<base:my-grid-column title='com.artonis.inv.operation.temporaryReceiptGoods.goods_id' field="goodsCodeName" width="50px" />
	<base:my-grid-column title='com.artonis.inv.operation.temporaryReceiptGoods.goodsAmount' field="goodsAmount" width="50px" />
	<base:my-grid-column title='com.artonis.inv.operation.beginPeriodReceiptGoods.measureUnit' field="measureUnitName" width="50px" />


	<base:my-grid-schema-field name="goodsCodeName" type="string" />
	<base:my-grid-schema-field name="goodsAmount" type="string" />
	<base:my-grid-schema-field name="measureUnitName" type="string" />
</base:my-grid-item>
<base:footer />
