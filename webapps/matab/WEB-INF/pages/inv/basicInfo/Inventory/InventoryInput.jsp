<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageHeader6button/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="code" key="com.artonis.inv.basicInfo.inventory.code" type="number"/>
			<base:testBox styleClass="small" name="name" key="com.artonis.inv.basicInfo.inventory.name"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="inventoryTypeId" key="com.artonis.inv.basicInfo.inventory.type" comboLoaderUrl="combo/loadAllInventoryTypes"/>
			<base:testBox styleClass="small" name="description" key="com.artonis.inv.basicInfo.inventory.description"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			 <base:comboBoxAutoComplete name="accountCodingId" key="fnc.generalAccounting.accounting.name"
			 		comboLoaderUrl="combo/loadAllAccountCoding" dataTextField="nameCode" dataValueField="id" minLength="0" iscomboLoaderUrlRelative="true"
                    hasTemplate="true" headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
                    templateComaSep="name,code"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
            <base:checkbox name="centerInventory" key="com.artonis.inv.basicInfo.inventory.centerInventory" styleClass="small" style="width: 15px; margin-right: 10px"/> 
        </div>
	</form>
	<base:itemForm titleKeys="com.artonis.inv.basicInfo.InventoryEmployee,com.artonis.inv.basicInfo.InventoryDocuments,com.artonis.inv.basicInfo.inventoryPhysicalLocation,com.artonis.inv.basicInfo.inventoryGoods"
				   formItemTabViewJspFiles="InventoryEmployeetemTabView.jsp,InventoryDocumentsItemTabView.jsp,InventoryPhysicalLocationItemTabView.jsp,InventoryGoodsItemTabView.jsp"
				   formItemTabInputs="InventoryEmployeeItemTabInput,InventoryDocumentsItemTabInput,InventoryPhysicalLocationItemTabInput,InventoryGoodsItemTabInput"
	 			   insertWithoutPopup="true" masterIdStr="inventory_id"/>
</div>
