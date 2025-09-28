
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="GoodsBarCodeItem"/>
<base:my-grid-item name="GoodsBarCodeItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="goodsId">
	<base:my-grid-column title='com.artonis.inv.basicInfo.goodsBarCode.label'  field="barcode" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.basicInfo.goodsBarCode.barcode'  field="barcode" width="50px"/>

    <base:my-grid-schema-field name="label" type="string"/>
    <base:my-grid-schema-field name="barcode" type="string"/>
</base:my-grid-item>
<base:footer/>
