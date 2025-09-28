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
			<base:multiSelect name="serviceItemCost_ids" styleClass="small" multiSelectLoaderUrl="combo/loadAllService" key="com.artonis.clinic.basicInfo.proficiency.name"/>
			<base:testBoxNumericEx styleClass="small" name="percent" key="com.artonis.clinic.basicInfo.employeeContract.percent"/>
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

<script type="text/javascript">
function callback_save_success(){
			var service = {};
			service.id= $("#id").val();
			service.serviceItemCost_ids = $("#serviceItemCost_ids_multiSelect").val();
			service.insurance_id= $("#insurance_id").val();
			service.percent= $("#percent_txt").val();
			$.ajax({
				url: '${pageContext.request.contextPath}'+'/clinic/basicInfo/serviceItemCostInsurance/saveServiceInsurance',
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify(service),
				dataType: 'json',
				type: 'POST',
				success: function (data, success, xhr) {
		            if (data.state == "error") {
		                for (var i = 0; i < data.errors.length; i++) {
		                    if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
		                        alertify.error($("label[for='" + data.errors[i].Field + "']").text() + "  " + data.errors[i].Message);
		                    } else {
		                        alertify.error(data.errors[i].Field + "  " + data.errors[i].Message);
		                    }
		                }
		            }
		            var grid=$("div[data-role='grid']");
		            grid.data("kendoGrid").dataSource.read();
		            $('#mainForm')[0].reset();
				},
				error: function (e) {
					alert('Error: ' + e.responseText);
				}
		});
}
function grid_onEdit(data){
	console.log(data);
    if (data) {
    	$("#loadedId").val(data.id);
    	$("#insurance_id").val(data.insuranceorganization_id);
    	$("#insurance_id_Comb").data("kendoComboBox").value(data.insuranceorganization_id);
    	$("#serviceItemCost_ids_multiSelect").data("kendoMultiSelect").value(data.service_item_cost_id);
    	$("#percent").val(data.off_precent);
    	setNumericTextValue();
    }
}
</script> 
