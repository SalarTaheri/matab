<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="ServiceItemCostEquipment"/>

<base:my-grid-item name="ServiceItemCostEquipment" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="service_item_cost_id">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.serviceitem_id'  field="serviceitem_text" width="70px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.cost'  field="cost" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.quantity'  field="quantity" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.total'  field="totalCostEquipment" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.isNotShowInPatientBill'  field="isNotShowInPatientBill" isCombo="true" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.showPatientBillPrint'  field="service_item_cost_group_patient_bill_equipment_txt" width="30px"/>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.showBillPrint'  field="service_item_cost_group_bill_equipment_txt" width="30px"/>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.isNotShowInDetailBill'  field="isNotShowInDetailBill" isCombo="true" width="30px"/>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.showDetailBillPrint'  field="service_item_cost_group_detail_bill_equipment_id_txt" width="30px"/>
    <%--<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.isShowAsTree'  field="isShowAsTree" isCombo="true" width="30px"/>--%>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.isNotShowInFishPrint'  field="isNotShowInFishPrint" isCombo="true" width="30px"/>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostEquipment.showFishPrint'  field="service_item_cost_group_equipment_txt" width="30px"/>

    <base:my-grid-schema-field name="serviceitem_text" type="string"/>
    <base:my-grid-schema-field name="cost" type="long"/>
    <base:my-grid-schema-field name="quantity" type="string"/>
    <%--<base:my-grid-schema-field name="totalCostEquipment" type="float"/>--%>
    <base:my-grid-schema-field name="service_item_cost_group_equipment_txt" type="string"/>
    <base:my-grid-schema-field name="service_item_cost_group_bill_equipment_txt" type="string"/>
    <base:my-grid-schema-field name="isNotShowInPatientBill" type="boolean"/>
    <base:my-grid-schema-field name="isNotShowInDetailBill" type="boolean"/>
    <%--<base:my-grid-schema-field name="isShowAsTree" type="boolean"/>--%>
    <base:my-grid-schema-field name="isNotShowInFishPrint" type="boolean"/>
    <base:my-grid-schema-field name="service_item_cost_group_patient_bill_equipment_id_txt" type="string"/>
    <base:my-grid-schema-field name="service_item_cost_group_detail_bill_equipment_id_txt" type="string"/>
</base:my-grid-item>

<base:footer/>