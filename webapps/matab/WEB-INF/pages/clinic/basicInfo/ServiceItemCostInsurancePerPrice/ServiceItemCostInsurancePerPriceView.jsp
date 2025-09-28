<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id">
        <div class="uk-grid uk-grid-preserve">
			<base:comboBox name="insurance_id" value="name" key="com.artonis.clinic.basicInfo.serviceItemCostInsuranceController.insurace" comboLoaderUrl="combo/loadAllInsurancePrimeType" styleClass="small" />
			<base:comboBox name="serviceItemCost_id" key="com.artonis.clinic.basicInfo.serviceItemCostInsurance.serviceName" comboLoaderUrl="combo/loadAllService" styleClass="small"/>
			<base:testBoxNumericEx styleClass="small" name="offPrice" key="com.artonis.clinic.basicInfo.serviceItemCostInsurance.off_price"/>
		</div>
        <div align="center" style="padding-top: 10px; padding-bottom: 10px;">
        	<base:SubmitButton/>
		</div>
	</form>
	<base:Pattern3/>
	<div>
		<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
			<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostInsurance.serviceName'  field="serviceName" width="50px"/>
			<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostInsurance.insuranceName'  field="insuranceName" width="50px"/>
			<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostInsurance.originalCost'  field="original_cost" width="50px"/>
			<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostInsurance.insurance_cost'  field="insurance_cost" width="50px"/>
			<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostInsurance.offPrecent'  field="off_precentStr" width="50px"/>
		</base:my-grid>
	</div>
	<base:footer/>
</div>
<script>
function grid_onEdit(data){
	console.log(data);
    if (data) {
    	$("#loadedId").val(data.id);
    	$("#id").val(data.id);
    	$("#insurance_id").val(data.insuranceorganization_id);
    	$("#insurance_id_Comb").data("kendoComboBox").value(data.insuranceorganization_id);
    	$("#serviceItemCost_id").val(data.service_item_cost_id);
    	$("#serviceItemCost_id_Comb").data("kendoComboBox").value(data.service_item_cost_id);
    	$("#offPrice").val(data.original_cost - data.insurance_cost);
    	setNumericTextValue();
    }
}
function callback_save_success(){
    var grid=$("div[data-role='grid']");
    grid.data("kendoGrid").dataSource.read();
	$("#loadedId").val("");
	$("#id").val("");
	$("#insurance_id").val("");
	$("#insurance_id_Comb").data("kendoComboBox").value("");
	$("#serviceItemCost_id").val("");
	$("#serviceItemCost_id_Comb").data("kendoComboBox").value("");
	$("#offPrice").val(0);
	setNumericTextValue();
}
</script>