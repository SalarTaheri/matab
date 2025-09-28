<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<div class="uk-container uk-container-center my-uk-container" >

     <form class="uk-form2-InventoryPhysicalLocationItem" >
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="physicalLocationName" key="com.artonis.inv.basicInfo.inventoryPhysicalLocation.physicalLocationName"/>
			<base:testBox styleClass="small" name="physicalLocationCode" key="com.artonis.inv.basicInfo.inventoryPhysicalLocation.physicalLocationCode"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox styleClass="small" name="physicalLocationActive" key="com.artonis.inv.basicInfo.inventoryPhysicalLocation.physicalLocationActive"/>
			<base:testBox styleClass="small" name="physicalLocationDescription" key="com.artonis.inv.basicInfo.inventoryPhysicalLocation.physicalLocationDescription"/>
		</div>
	
	</form>
</div>
