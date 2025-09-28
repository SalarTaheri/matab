<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
		<div id="body-heade-save-div" style="display:none;">
			<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create" onClick="javascript:ajax_new_reload()"/>
			<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="registerBtn" onClick="javascript:changeDirectlyConsumptionReceiptState(2)" />
			<base:buttonPermission key="global.crud.back" classNames="uk-button uk-button-success" id="backDirectlyConsumptionReceiptBtn" onClick="javascript:changeDirectlyConsumptionReceiptState(1)"/>
			<base:buttonPermission key="global.crud.view" classNames="uk-button uk-button-success" id="body-heade-view" onClick="javascript:goToView()"/>
			<base:aPermission classNames="uk-button uk-button-danger" id="breadcrumb-main-section-cancel" key="global.crud.cancel" />
		</div>
	</div>
</div>
   <input name="loadedId" type="hidden" id="loadedId" />
<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="requestNum" key="com.artonis.inv.operation.directlyConsumptionReceipt.requestNum"/>
			<base:mDatePicker styleClass="small" name="date" key="com.artonis.inv.operation.directlyConsumptionReceipt.date"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="state" key="com.artonis.inv.operation.directlyConsumptionReceipt.state"/>
			<base:comboBox styleClass="small" name="type" key="com.artonis.inv.operation.directlyConsumptionReceipt.type" comboLoaderUrl="combo/loadAllType" />
			<base:testBox styleClass="small" name="consumerProjectCenter" key="com.artonis.inv.operation.directlyConsumptionReceipt.consumerProjectCenter"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="consumerPerson" key="com.artonis.inv.operation.directlyConsumptionReceipt.consumerPerson"/>
			<base:testBox styleClass="small" name="consumerProject" key="com.artonis.inv.operation.directlyConsumptionReceipt.consumerProject"/>
			<base:testBox styleClass="small" name="description" key="com.artonis.inv.operation.directlyConsumptionReceipt.description"/>
		</div>
		   <div class="uk-grid uk-grid-preserve">
	    </div>
	   <div dir="ltr" align="center" style="background: rgb(216, 216, 216);">
		    <base:buttonPermission key="com.artonis.inv.operation.directlyConsumptionReceipt.saveDirectlyConsumption" classNames="uk-button uk-button-success" id="saveDirectlyConsumptionReceiptBtn" onClick="javascript:saveDirectlyConsumptionReceipt()" style="background-color: rgb(175,214,101);width: 10%;"/>
	   </div>
	</form>
	
</div>
