
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader6button pageTitle="com.artonis.inv.operation.temporaryReceipt.view"/>
<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="fromSerial" key="com.artonis.inv.operation.beginPeriodReceipt.fromSerial"/>
			<base:testBox styleClass="midsmall" name="toSerial"  key="com.artonis.inv.operation.beginPeriodReceipt.toSerial"/>
		    <base:testBox styleClass="midsmall" name="fromReference" key="com.artonis.inv.operation.beginPeriodReceipt.fromReference"/>
			<base:testBox styleClass="midsmall" name="toReference"  key="com.artonis.inv.operation.beginPeriodReceipt.toReference"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="midsmall" name="fromDate" key="com.artonis.inv.operation.beginPeriodReceipt.fromDate"/>
		    <base:mDatePicker styleClass="midsmall" name="toDate" key="com.artonis.inv.operation.beginPeriodReceipt.toDate"/>
		    <base:comboBoxAutoComplete name="inventory_id" styleClass="midsmall" key="com.artonis.inv.operation.beginPeriodReceipt.inventory" comboLoaderUrl="combo/loadAllInventory"
                                       dataTextField="name" dataValueField="id" minLength="0"
                                       hasTemplate="false" headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name" templateComaSep="name" iscomboLoaderUrlRelative="true"/>
	       <base:comboBoxAutoComplete styleClass="midsmall" name="exporter"
                                       key="com.artonis.inv.operation.beginPeriodReceipt.exporter"
                                       comboLoaderUrl="combo/loadAllEmployee" dataTextField="fullName"
                                       dataValueField="id" minLength="0"
                                       hasTemplate="false"
                                       headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name"
                                       templateComaSep="fullName"/>
	   </div>

<base:my-grid-search>
    <base:my-grid-column title='com.artonis.inv.operation.temporaryReceipt.reference'  field="reference" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.operation.temporaryReceipt.serial'  field="serial" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.operation.temporaryReceipt.inventory_id'  field="inventoryName" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.operation.temporaryReceipt.date_'  field="date_" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.operation.temporaryReceipt.exporter'  field="exporterFullName" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.operation.temporaryReceipt.businessPartner_id'  field="businessPartnerTitle" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.operation.temporaryReceipt.state'  field="stateStr" width="50px"/>

        <base:my-grid-schema-field name="reference" type="string"/>
        <base:my-grid-schema-field name="serial" type="string"/>
        <base:my-grid-schema-field name="inventoryName" type="string"/>
        <base:my-grid-schema-field name="date_" type="string"/>
        <base:my-grid-schema-field name="exporterFullName" type="string"/>
        <base:my-grid-schema-field name="businessPartnerTitle" type="string"/>
        <base:my-grid-schema-field name="stateStr" type="string"/>
     <base:my-grid-search-operation name="register" key="inv.operation.requestGoods.state.sabt" style="width: 120px"/>
	 <base:my-grid-search-operation name="back" key="inv.operation.requestGoods.state.bargasht" style="width: 120px"/>
  
        
</base:my-grid-search>
</form>
</div>
<base:footer/>
<script type="text/javascript">
function getSearchObject(){
		var temporaryReceiptVar = {};
		temporaryReceiptVar.fromSerial=$("#fromSerial").val();
		temporaryReceiptVar.toSerial=$("#toSerial").val();
		temporaryReceiptVar.fromReference=$("#fromReference").val();
		temporaryReceiptVar.toReference=$("#toReference").val();
		temporaryReceiptVar.fromDate=$("#fromDate").val();
		temporaryReceiptVar.toDate=$("#toDate").val();
		temporaryReceiptVar.inventory_id=$("#inventory_id").val();
		temporaryReceiptVar.exporter=$("#exporter").val();
		return temporaryReceiptVar;
}
</script>
