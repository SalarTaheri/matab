<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="PurchaseReceiptGoodsItem"/>

<base:my-grid-item name="PurchaseReceiptGoodsItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="purchaseReceipt_id">
    <base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptGoods.goods_id' field="goodsCodeName" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.receipt.purchaseReceipt.measureUnit' field="measureUnitName" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptGoods.goodsAmount' field="goodsAmount" format="0:#,0" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptGoods.rate' field="rateText" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptGoods.sum' field="sum" width="50px"/>
</base:my-grid-item>

<base:footer/>
