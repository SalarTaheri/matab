
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="InventoryEmployeeItem"/>
<base:my-grid-item name="InventoryEmployeeItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="inventory_id">
	<base:my-grid-column title='com.artonis.inv.basicInfo.inventoryEmployee.personnelCode'  field="personnelCode" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.basicInfo.inventoryEmployee.firstName'  field="firstName" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.basicInfo.inventoryEmployee.lastName'  field="lastName" width="50px"/>

    <base:my-grid-schema-field name="employee_id" type="string"/>
</base:my-grid-item>
<base:footer/>
