<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
            <base:comboBoxAutoComplete name="proficiency_id" styleClass="small" key="com.artonis.clinic.basicInfo.proficiency.name" comboLoaderUrl="/combo/loadAllProficiency"
                                       dataTextField="name" dataValueField="id" minLength="0"
                                       hasTemplate="false" headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name" templateComaSep="name" iscomboLoaderUrlRelative="true"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:multiSelect name="service_item_values" styleClass="normal" stylediv="overflow:  auto;max-height:  200px;" multiSelectLoaderUrl="/combo/loadAllServiceItem" key="com.artonis.clinic.basicInfo.serviceItem.name" />
		</div>

	</form>
</div>
<script type="text/javascript">
function customFormSave(){
		var proficiencyServiceItem = {};
        proficiencyServiceItem.id = $("#id").val();
        proficiencyServiceItem.proficiency_id = $("#proficiency_id").val();
		proficiencyServiceItem.service_item_values = $("#service_item_values_multiSelect").val();
		$.ajax({
			url: getBaseUrl() + "save",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(proficiencyServiceItem),
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
	            }else if(data.state == "success"){
                        alertify.success(data.message);
                        $("#proficiency_id").val("");
						var multiSelect = $("#service_item_values_multiSelect").data("kendoMultiSelect");
						multiSelect.value([]);
		        }
			},
		});
}
function callback_deserialize(data){
	if($.isNumeric(data.proficiency_id)){
		var requestUrl = getBaseUrl() + "loadServiceItems/" + data.proficiency_id;
		$.getJSON(requestUrl, function (data) {
			var serviceItem = data.serviceItemIds.replace("[","").replace("]","").split(",");
			var multiSelect = $("#service_item_values_multiSelect").data("kendoMultiSelect");
			multiSelect.value(serviceItem);
		});
	}
}
</script>

<style>
	#service_item_values_Div{
		width: 100% !important;
	}
</style>