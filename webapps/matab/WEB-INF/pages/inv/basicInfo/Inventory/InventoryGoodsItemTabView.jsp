
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="InventoryGoodsItem"/>


<base:my-grid-item name="InventoryGoodsItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="inventory_id">
	<base:my-grid-column title='com.artonis.inv.basicInfo.inventoryGoods.goods_id'  field="goodsName" width="50px"/>


        <base:my-grid-schema-field name="goodsName" type="string"/>
</base:my-grid-item>
<base:footer/>
