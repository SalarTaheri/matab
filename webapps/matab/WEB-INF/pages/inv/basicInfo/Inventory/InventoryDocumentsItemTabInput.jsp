<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<div class="uk-container uk-container-center my-uk-container" >
		 <form class="uk-form2-InventoryDocumentsItem" >
		 <input type="hidden" id="id" name="id" >
		 <div class="uk-grid uk-grid-preserve">
			<base:comboBox comboLoaderUrl="combo/loadAllInventoryDocs" styleClass="small" name="documentsIssued" key="com.artonis.inv.basicInfo.inventoryDocuments.documentsIssued"/>
		 </div>
	</form>
</div>
