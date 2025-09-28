<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form2-GoodsCategoryAccountingItem">
		<input type="hidden" id="id" name="id" />
		<div class="uk-grid uk-grid-preserve">
			<base:comboBoxAutoComplete-buttonAddToCombo name="accountCodingId" key="com.artonis.inv.basicInfo.goodsCategory.accountCoding" popupUrlIsRelative="true"
                                     iscomboLoaderUrlRelative="true" comboLoaderUrl="/combo/loadAllAccountCoding" dataTextField="nameCode"
                                     dataValueField="id" minLength="0" hasTemplate="true" templateComaSep="name,code" popupUrl="popup/treeAccountCoding"
                                     headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code" />
		</div>
		<div class="uk-grid uk-grid-preserve">
        	<base:multiSelect name="documentsTypes" styleClass="normal" multiSelectLoaderUrl="combo/loadAllInventoryDocs" key="com.artonis.inv.basicInfo.goodsCategory.documentsType" />
		 </div>
	</form>
</div>

<script>
function callback_after_serialize(data) {
	data.documentsTypes = $("#documentsTypes_multiSelect").val();
	return data;
}

function callback_deserialize_GoodsCategoryAccountingItem(data) {
	$("#documentsTypes_multiSelect").data("kendoMultiSelect").value(data.documentsTypes.split(","));
}
</script>