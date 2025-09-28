
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="GoodsPhysicalPlaceItem"/>
<base:my-grid-item name="GoodsPhysicalPlaceItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="goodsId">
	<base:my-grid-column title='com.artonis.inv.basicInfo.goodsPhysicalPlace.naem'  field="name" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.basicInfo.goodsPhysicalPlace.code'  field="code" width="50px"/>
	

    <base:my-grid-schema-field name="inventory_id" type="string"/>
</base:my-grid-item>
<base:footer/>
