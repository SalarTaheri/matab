
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader title="com.artonis.inv.receipt.directlyConsumptionReceipt.view"/>
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
	   <base:comboBoxAutoComplete styleClass="midsmall" name="exporter"
                                       key="com.artonis.inv.operation.beginPeriodReceipt.exporter"
                                       comboLoaderUrl="combo/loadAllEmployee" dataTextField="fullName"
                                       dataValueField="id" minLength="0"
                                       hasTemplate="false"
                                       headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name"
                                       templateComaSep="fullName"/>
       <base:comboBoxAutoComplete styleClass="midsmall" name="businessPartner_id"
                                       key="com.artonis.inv.receipt.purchaseReceipt.businessPartner_id"
                                       comboLoaderUrl="combo/loadAllBusinessPartner" dataTextField="nameAndFamily"
                                       dataValueField="id" minLength="0" iscomboLoaderUrlRelative="true"
                                       hasTemplate="false"
                                       headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name"
                                       templateComaSep="nameAndFamily"/>
	
	</div>

<base:my-grid-search>
	<base:my-grid-column title='com.artonis.inv.receipt.directlyConsumptionReceipt.serial'  field="serial" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.receipt.directlyConsumptionReceipt.reference'  field="reference" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.receipt.directlyConsumptionReceipt.date_'  field="date_" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.receipt.directlyConsumptionReceipt.state'  field="stateStr" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.receipt.directlyConsumptionReceipt.businessPartner_id'  field="businesspartnerName" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.receipt.directlyConsumptionReceipt.exporter'  field="exportername" width="50px"/>


        <base:my-grid-schema-field name="serial" type="string"/>
        <base:my-grid-schema-field name="reference" type="string"/>
        <base:my-grid-schema-field name="date_" type="string"/>
        <base:my-grid-schema-field name="stateStr" type="string"/>
        <base:my-grid-schema-field name="businesspartnerName" type="string"/>
        <base:my-grid-schema-field name="exportername" type="string"/>
        <base:my-grid-search-operation name="sabt" key="inv.operation.requestGoods.state.sabt" style="width: 120px"/>
        <base:my-grid-search-operation name="bargasht" key="inv.operation.requestGoods.state.bargasht" style="width: 120px"/>
        
</base:my-grid-search>
</form>
</div>
<base:footer/>
<script type="text/javascript">
function getSearchObject(){
		var DirectlyConsumptionReceiptVar = {};
		DirectlyConsumptionReceiptVar.fromSerial=$("#fromSerial").val();
		DirectlyConsumptionReceiptVar.toSerial=$("#toSerial").val();
		DirectlyConsumptionReceiptVar.fromReference=$("#fromReference").val();
		DirectlyConsumptionReceiptVar.toReference=$("#toReference").val();
		DirectlyConsumptionReceiptVar.fromDate=$("#fromDate").val();
		DirectlyConsumptionReceiptVar.toDate=$("#toDate").val();
		DirectlyConsumptionReceiptVar.exporter=$("#exporter").val();
		DirectlyConsumptionReceiptVar.businessPartner_id=$("#businessPartner_id").val();
		return DirectlyConsumptionReceiptVar;
}
</script>

