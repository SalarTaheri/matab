<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="SalesSlipGoodsItem"/>

<base:my-grid-item name="SalesSlipGoodsItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="salesSlipId">
    <base:my-grid-column title="com.artonis.inv.slip.salesSlipGoods.goods" field="goodsName" width="50px"/>
    <base:my-grid-column title="com.artonis.inv.slip.salesSlipGoods.measureUnit" field="measureUnitName" width="50px"/>
    <base:my-grid-column title="com.artonis.inv.slip.salesSlipGoods.amount" field="amount" format="0:#,0" width="50px"/>
</base:my-grid-item>

<base:footer/>
