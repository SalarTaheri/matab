<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader title="com.artonis.clinic.basicInfo.serviceItem.view"/>

<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 4px; ">
    <form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="nameOrGoodsName" key="com.artonis.clinic.basicInfo.serviceItem.name"/>
			<base:comboBox name="type"  key="com.artonis.clinic.basicInfo.serviceItem.type"
					comboLoaderUrl="combo/loadAllType" styleClass="small"/>
			<base:testBox styleClass="small" name="code" key="com.artonis.clinic.basicInfo.serviceItem.code"/>
		</div>
	</form>	 
</div>

<base:my-grid-search>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItem.name'  field="nameOrGoodsName" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItem.type'  field="typeText" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItem.code'  field="code" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.isNotShowInPatientBill'  field="isNotShowInPatientBill" isCombo="true" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.showPatientBillPrint'  field="service_item_group_patient_bill_name" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.showBillPrint'  field="service_item_group_bill_name" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.isNotShowInDetailBill'  field="isNotShowInDetailBill" isCombo="true" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.showDetailBillPrint'  field="service_item_group_detail_bill_name" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.isNotShowInFishPrint'  field="isNotShowInFishPrint" isCombo="true" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.showFishPrint'  field="service_item_group_fish_name" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItem.isAnesthesiaService'  field="isAnesthesiaService" isCombo="true" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItem.priorityOnPatientBill'  field="priorityOnPatientBill"  width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItem.hasAllowChangeQuantity'  field="hasAllowChangeQuantity" isCombo="true" width="30px"/>


	<base:my-grid-schema-field name="nameOrGoodsName" type="string"/>
        <base:my-grid-schema-field name="typeText" type="string"/>
        <base:my-grid-schema-field name="code" type="string"/>
        <base:my-grid-schema-field name="cost" type="long"/>
        <base:my-grid-schema-field name="technicalPercent" type="string"/>
        <base:my-grid-schema-field name="professionalPercent" type="string"/>
</base:my-grid-search>

<base:footer/>

<script type="text/javascript">
function getSearchObject(){
		var serviceItem = {};
		serviceItem.nameOrGoodsName=$("#nameOrGoodsName").val();
		serviceItem.type=$("#type").val();
		serviceItem.code=$("#code").val();
		serviceItem.hasK=$("#hasK").val();
		serviceItem.k_id=$("#k_id").val();
		return serviceItem;
}
</script>