
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

	<form class="uk-form2-PurchaseContractOperationItem">
		<input type="hidden" id="id" name="id">
		<input type="hidden" id="seasonVat_id" name="seasonVat_id">
		<input type="hidden" id="taxPercent" name="taxPercent">
		<input type="hidden" id="complicationPercent" name="complicationPercent">
		
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="yearName" key="inventory.m169.operation.purchaseOperation.year" disabled="true"/>
			<base:testBox styleClass="small" name="seasonVat_name" key="inventory.m169.operation.purchaseOperation.season" disabled="true"/>
			<base:testBox styleClass="small" name="personTypeTxt" key="com.artonis.inv.m169.operation.refusalOperation.personType" disabled="true"/>
		
		</div>
		<div style="padding-top: 12px" class="turnItems">		
			<div class="uk-grid uk-grid-preserve">
			 <base:testBox styleClass="small" name="personName" key="inventory.m169.operation.purchaseOperation.person_id" disabled="true"/>
			<base:testBox styleClass="small" name="goodsName" key="inventory.m169.operation.purchaseOperation.serviceGoods_id" disabled="true"/>		
			 <base:mDatePicker styleClass="small" name="backBuyerDate" disabled="true" key="com.artonis.inv.m169.operation.refusalOperation.backBuyerDate"></base:mDatePicker>
				<table>
					<tr>
						<td width="360" align="left"><%=ResourceBoundleHolder.resourceBundle.getString("inventory.m169.operation.purchaseOperation.return")%></td>
						<td align="center"><base:checkbox disabled="true" name="return_" style="width: 15px; margin-right: 10px" key="inventory.m169.operation.purchaseOperation.null"/></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="small" name="price" disabled="true" key="inventory.m169.operation.purchaseOperation.price" onChangeFunction="calcTaxTool()"/>
			<base:testBoxNumericEx styleClass="small" name="taxText" disabled="true" key="inventory.m169.operation.purchaseOperation.taxPopUp" onChangeFunction="sumAll()"/>
			<base:testBoxNumericEx styleClass="small" name="tollText" disabled="true" styledivLabel="text-align: right;width:19%" key="inventory.m169.operation.purchaseOperation.toll" onChangeFunction="sumAll()"/>
		</div>
		<div style="padding-top: 12px" class="turnItems addressingFields">		
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="provinceName" key="inventory.m169.operation.purchaseOperation.province" disabled="true"/>
			<base:testBox styleClass="small" name="cityName" key="inventory.m169.operation.purchaseOperation.city" disabled="true"/>
		
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea name="address" height="25" divWidthVal="90" key="inventory.m169.operation.purchaseOperation.address" disabled="true"/>
		</div>
		</div>
	
	</form>
	<script>
	function loadPersonValues(personId){
	if(personId!=null && personId!=""){
		var url = getBaseUrl() + "loadPerson/" + personId ; 
		$.getJSON(url, function (data) {
			$('#province').val(data.provinceName);
			$('#city').val(data.cityName);
			$('#cityCode').val(data.preCodeCity);
			$('#sellerPhone').val(data.phoneNo);
			$('#sellerPostalCode').val(data.postalCode);
			$('#address').val(data.address);
			$('#economicNo').val(data.economicNo);
			$('#nationalCode').val(data.nationalCode);
			if(data.nationalCode==""){
				$("#foreignPersonCode").prop("disabled", false);
			}else{
				$("#foreignPersonCode").prop("disabled", true);
			}
		});
	}
}
	</script>

