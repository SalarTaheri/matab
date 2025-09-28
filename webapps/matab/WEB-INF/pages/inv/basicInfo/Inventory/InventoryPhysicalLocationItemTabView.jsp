
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="InventoryPhysicalLocationItem"/>


<base:my-grid-item name="InventoryPhysicalLocationItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="inventory_id">
	<base:my-grid-column title='com.artonis.inv.basicInfo.inventoryPhysicalLocation.physicalLocationName'  field="physicalLocationName" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.basicInfo.inventoryPhysicalLocation.physicalLocationCode'  field="physicalLocationCode" width="50px"/>


        <base:my-grid-schema-field name="physicalLocationName" type="string"/>
        <base:my-grid-schema-field name="physicalLocationCode" type="string"/>
</base:my-grid-item>
<base:footer/>
