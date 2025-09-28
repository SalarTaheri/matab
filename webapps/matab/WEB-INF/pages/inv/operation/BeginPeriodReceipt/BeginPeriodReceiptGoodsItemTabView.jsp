<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="BeginPeriodReceiptGoodsItem"/>

<base:my-grid-item name="BeginPeriodReceiptGoodsItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="beginPeriodReceipt_id">
    <%--<base:my-grid-column title='com.artonis.inv.operation.beginPeriodReceiptGoods.goodsCodeName' field="goodsCodeName" width="50px" />--%>
    <base:my-grid-column title='com.artonis.inv.basicInfo.inventoryGoods.goods_id' field="goodsName" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.operation.beginPeriodReceiptGoods.goodsCode' field="goodsCode" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.operation.beginPeriodReceiptGoods.goodsAmount' format="0:#,0" field="goodsAmount" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.operation.beginPeriodReceiptGoods.measureUnit' field="measureUnitName" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.operation.beginPeriodReceiptGoods.rate' field="rate" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.operation.beginPeriodReceiptGoods.sum' field="sum" width="50px"/>
</base:my-grid-item>

<base:footer/>
