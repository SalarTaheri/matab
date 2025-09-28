<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-ServiceItemCostInsurance">
	<input type="hidden" id="id" name="id" >
	<div class="uk-grid uk-grid-preserve">
        <base:testBox styleClass="small" name="insuranceType" key="com.artonis.clinic.basicInfo.serviceItemCostInsurance.insuranceorganizationType"
                      disabled="true" dataIgnore="true" value="com.artonis.clinic.basicInfo.insuranceOrganization.type.primary"/>
		<base:comboBox  comboLoaderUrl="combo/loadInsuranceOrganization" styleClass="small"
		 	name="insuranceorganization_id" value="name" key="com.artonis.clinic.basicInfo.serviceItemCostInsurance.insuranceorganization_id" />
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx onChangeFunction="fillInsuranceCostField()" styleClass="small" name="off_precent"
				key="com.artonis.clinic.basicInfo.serviceItemCostInsurance.off_precent"/>
		<base:testBoxNumericEx onChangeFunction="fillOffPercentField()" styleClass="small" name="off_price"
				key="com.artonis.clinic.basicInfo.serviceItemCostInsurance.off_price"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:mDatePicker styleClass="small" name="fromDate" key="com.artonis.clinic.basicInfo.serviceItemCostInsurance.fromDate" direction="ltr"/>
		<base:mDatePicker styleClass="small" name="toDate" key="com.artonis.clinic.basicInfo.serviceItemCostInsurance.toDate" direction="ltr"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="small" name="original_cost" key="com.artonis.clinic.basicInfo.serviceItemCostInsurance.original_cost" disabled="true"/>
		<base:testBoxNumericEx styleClass="small" name="insurance_cost" key="com.artonis.clinic.basicInfo.serviceItemCostInsurance.insurance_cost"/>
	</div>
</form>
<script type="text/javascript">
function fillInsuranceCostField(){
	var totalCost = $("#totalCost").val();
	if(totalCost==NaN){
		totalCost = 0;
	}
	var taxPercent = $("#off_precent").val();
	if(taxPercent==NaN){
		taxPercent = 0;
	}
	$("#original_cost").val(totalCost);
	var offPrice = (((totalCost * (taxPercent/100)).toFixed(3)*1000)/1000);
	$("#off_price").val(offPrice);
	$("#insurance_cost").val(totalCost - offPrice);
	setNumericTextValue();
}
function callback_change_insuranceorganization_id(e){
	$("#off_precent").val("");
	$("#original_cost").val("");
	$("#insurance_cost").val("");
	$("#off_price").val("");
	fillInsuranceCostField();
}
function callback_change_insuranceType(e){
	$("#off_precent").val("");
	$("#original_cost").val("");
	$("#insurance_cost").val("");
	$("#off_price").val("");
	fillInsuranceCostField();
}
function fillOffPercentField(){
	var totalCost = $("#totalCost").val();
	var offPrice = $("#off_price").val();
	var offPercent = (offPrice *100)/totalCost;
	$("#off_precent").val(offPercent);
	fillInsuranceCostField();
}
function callback_deserialize_ServiceItemCostInsurance(data){
	$("#off_precent").val(data.off_precent);
	fillInsuranceCostField();
}
</script>