<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-ServiceItemCostEquipment">
	<input type="hidden" id="id" name="id" >
	<input type="hidden" id="id" name="id" >
	<div class="uk-grid uk-grid-preserve" id="equipmentDiv">
		<base:comboBox name="serviceitem_id"  key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.serviceitem_id"
					   comboLoaderUrl="combo/loadEquipmentServiceItem"  styledivLabel="width:15%"/>
	</div>
	<div class="uk-grid uk-grid-preserve" >
		<%--as clinic bill--%>
		<base:comboBox name="service_item_cost_group_bill_equipment_id"  key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.showBillPrint"
					   comboLoaderUrl="combo/loadAllServiceItemGroup"  styledivLabel="width:15%"/>
	</div>

	<div class="uk-grid uk-grid-preserve" >
		<%--as patient bill--%>
		<base:checkbox  name="isNotShowInPatientBill" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.isNotShowInPatientBill"  divLableStyle="width:15%" divCheckBoxStyle="width:20%"/>

		<base:comboBox name="service_item_cost_group_patient_bill_equipment_id"  key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.showPatientBillPrint"
					   comboLoaderUrl="combo/loadAllServiceItemGroup" styledivLabel="width:15%"/>
	</div>

	<div class="uk-grid uk-grid-preserve" >
		<%--as detail  bill--%>
		<base:checkbox styleClass="small" name="isNotShowInDetailBill" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.isNotShowInDetailBill"  divLableStyle="width:15%" divCheckBoxStyle="width:20%"/>

		<base:comboBox name="service_item_cost_group_detail_bill_equipment_id"  key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.showDetailBillPrint"
					   comboLoaderUrl="combo/loadAllServiceItemGroup"   styledivLabel="width:15%"/>
		<%--<base:checkbox styleClass="small" name="isShowAsTree" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.isShowAsTree"/>--%>

	</div>
	<div class="uk-grid uk-grid-preserve" >
		<%--as fish print--%>
		<base:checkbox  name="isNotShowInFishPrint" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.isNotShowInFishPrint" divLableStyle="width:15%" divCheckBoxStyle="width:20%"/>
		<base:comboBox name="service_item_cost_group_equipment_id"  key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.showFishPrint"
					   comboLoaderUrl="combo/loadAllServiceItemGroup" styledivLabel="width:15%"  />
	</div>


	<div class="uk-grid uk-grid-preserve" id="equipmentDiv">				 
		<base:testBox styleClass="verysmall" name="serviceitemCode" dataIgnore="true" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.code" disabled="true"/>
		<base:testBoxNumericEx  onChangeFunction="onChangeQuantity()" styleClass="verysmall" name="quantity" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.quantity"/>
		<base:testBoxNumericEx disabled="true" dataIgnore="false" styleClass="verysmall" name="cost" onChangeFunction="onChangeQuantity()" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.cost"/>
		<base:testBoxNumericEx disabled="true" dataIgnore="false" styleClass="verysmall" name="totalCostEquipment" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.total"/>
	</div>
</form>
<script type="text/javascript">
function callback_change_serviceitem_id(e){
	fillServiceItemCostEquipmentByServiceItemId(e.sender._old);
}
function fillServiceItemCostEquipmentByServiceItemId(serviceItemId){
	var requestUrl = "${pageContext.request.contextPath}"+"/clinic/basicInfo/serviceItemCost/loadServiceItem/"+serviceItemId;
	$.getJSON(requestUrl, function (data) {
		$('#equipmentDiv #serviceitemCode').val(data.code);
		$('#equipmentDiv #cost').val(data.cost);
		$('#equipmentDiv #cost_txt').val(addCommaSeparator(data.cost));
		$('#equipmentDiv #quantity_txt').val('0');
		$('#equipmentDiv #quantity').val(0);

		$("#service_item_cost_group_bill_equipment_id").val(data.service_item_group_bill_id);
		$("#service_item_cost_group_bill_equipment_id_Comb").data("kendoComboBox").value(data.service_item_group_bill_id);

		$("#service_item_cost_group_patient_bill_equipment_id").val(data.service_item_group_patient_bill_id);
		$("#service_item_cost_group_patient_bill_equipment_id_Comb").data("kendoComboBox").value(data.service_item_group_patient_bill_id);

		$("#service_item_cost_group_detail_bill_equipment_id").val(data.service_item_group_detail_bill_id);
		$("#service_item_cost_group_detail_bill_equipment_id_Comb").data("kendoComboBox").value(data.service_item_group_detail_bill_id);

		$("#service_item_cost_group_equipment_id").val(data.service_item_group_fish_id);
		$("#service_item_cost_group_equipment_id_Comb").data("kendoComboBox").value(data.service_item_group_fish_id);

		if(data.isNotShowInFishPrint!=null &&data.isNotShowInFishPrint!=undefined){
			$("#isNotShowInFishPrint").prop('checked', data.isNotShowInFishPrint);
		}else{
			$("#isNotShowInFishPrint").prop('checked', false);
		}


		if(data.isNotShowInPatientBill!=null &&data.isNotShowInPatientBill!=undefined){
			$("#isNotShowInPatientBill").prop('checked', data.isNotShowInPatientBill);
		}else{
			$("#isNotShowInPatientBill").prop('checked', false);
		}

		if(data.isNotShowInDetailBill!=null &&data.isNotShowInDetailBill!=undefined){
			$("#isNotShowInDetailBill").prop('checked', data.isNotShowInDetailBill);
		}else{
			$("#isNotShowInDetailBill").prop('checked', false);
		}
		onChangeQuantity();


	});
}
    function  onChangeQuantity(){
        var quantity=$('#equipmentDiv #quantity').val();
        var cost=$('#equipmentDiv #cost').val();

        var totalCost=quantity*cost;
        $('#equipmentDiv #totalCostEquipment').val(totalCost);
        $('#equipmentDiv #totalCostEquipment_txt').val(addCommaSeparator(totalCost));


    }
</script>
