<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader6button pageTitle="com.artonis.inv.basicInfo.inventory.view"/>
<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="code" key="com.artonis.inv.basicInfo.inventory.code"/>
			<base:testBox styleClass="small" name="name" key="com.artonis.inv.basicInfo.inventory.name"/>
			<base:comboBox styleClass="small" name="inventoryTypeId" key="com.artonis.inv.basicInfo.inventory.type" comboLoaderUrl="combo/loadAllInventoryTypes"/>
		</div>
		<base:my-grid-search>
			<base:my-grid-column title='com.artonis.inv.basicInfo.inventory.code'  field="code" width="50px"/>
			<base:my-grid-column title='com.artonis.inv.basicInfo.inventory.name'  field="name" width="50px"/>
			<base:my-grid-column title='com.artonis.inv.basicInfo.inventory.type'  field="inventoryTypeName" width="50px"/>
			<base:my-grid-column title='com.artonis.inv.basicInfo.inventory.description'  field="description" width="50px"/>
		
	        <base:my-grid-schema-field name="code" type="string"/>
	        <base:my-grid-schema-field name="name" type="string"/>
	        <base:my-grid-schema-field name="inventoryTypeName" type="string"/>
	        <base:my-grid-schema-field name="description" type="string"/>
		</base:my-grid-search>
	</form>
</div>
<base:footer/>
<script type="text/javascript">
function getSearchObject() {
	var inventory = {};
	inventory.code = $("#code").val();
	inventory.name = $("#name").val();
	inventory.inventoryTypeId = $("#inventoryTypeId").val();
	return inventory;
}
</script>