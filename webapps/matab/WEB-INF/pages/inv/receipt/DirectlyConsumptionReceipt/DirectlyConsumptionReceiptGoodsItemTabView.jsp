
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="DirectlyConsumptionReceiptGoodsItem"/>

<base:my-grid-item name="DirectlyConsumptionReceiptGoodsItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="directlyConsumptionReceipt_id">
	<base:my-grid-column title='com.artonis.inv.operation.beginPeriodReceiptGoods.goodsCodeName'  field="goodsCodeName" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.operation.beginPeriodReceiptGoods.goodsAmount'  field="goodsAmount" width="50px" format="0:#,0"/>
	<base:my-grid-column title='com.artonis.inv.receipt.directlyConsumptionReceipt.costcenter'  field="costCenterName" width="50px"/>

        <base:my-grid-schema-field name="goodsCodeName" type="string"/>
        <base:my-grid-schema-field name="goodsAmount" type="long"/>
        <base:my-grid-schema-field name="costCenterName" type="string"/>
</base:my-grid-item>
<base:footer/>
