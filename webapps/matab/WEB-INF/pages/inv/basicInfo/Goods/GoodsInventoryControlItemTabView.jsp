
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="GoodsInventoryControlItem"/>
<base:my-grid-item name="GoodsInventoryControlItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="goodsId">
	<base:my-grid-column title='com.artonis.inv.basicInfo.goodsInventoryControl.min_'  field="min_" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.basicInfo.goodsInventoryControl.max_'  field="max_" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.basicInfo.goodsInventoryControl.amountOrder'  field="amountOrder" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.basicInfo.goodsInventoryControl.pointOfAppeal'  field="pointOfAppeal" width="50px"/>


        <base:my-grid-schema-field name="min_" type="string"/>
        <base:my-grid-schema-field name="max_" type="string"/>
        <base:my-grid-schema-field name="amountOrder" type="string"/>
        <base:my-grid-schema-field name="pointOfAppeal" type="string"/>
</base:my-grid-item>
<base:footer/>
