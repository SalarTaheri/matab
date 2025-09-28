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
			<base:mDatePicker styleClass="small" name="fromDate" key="com.artonis.clinic.basicInfo.employeeServiceAmount.fromDate" direction="ltr"/>
			<base:mDatePicker styleClass="small" name="toDate" key="com.artonis.clinic.basicInfo.employeeServiceAmount.toDate" direction="ltr"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
        	<base:comboBoxAutoComplete name="group_id" styleClass="small" key="com.artonis.clinic.basicInfo.group.name" comboLoaderUrl="/combo/loadAllGroup"
					dataTextField="name" dataValueField="id" minLength="0" ignore="true"
                    hasTemplate="true" headerTemplateComaSep="com.artonis.clinic.basicInfo.service.group_id" templateComaSep="name" iscomboLoaderUrlRelative="true"/>
    		<base:cascadeComboBox  styleClass="small" name="service_id" key="com.artonis.clinic.basicInfo.serviceItemCost.service_id"
					cascadeCombo="group_id" comboLoaderUrl="combo/loadAllService"/>
			<base:testBoxNumericEx styleClass="small" name="totalCost" key="com.artonis.clinic.basicInfo.serviceItemCost.cost" disabled="true" />
		</div>
	</form>
	<base:itemForm titleKeys="com.artonis.clinic.basicInfo.serviceItemCost.equipment,com.artonis.clinic.basicInfo.serviceItemCost.operation"
					masterIdStr="service_item_cost_id" insertWithoutPopup="true"
					formItemTabViewJspFiles="ServiceItemCostEquipmentTabView.jsp,ServiceItemCostOperationTabView.jsp"
					formItemTabInputs="ServiceItemCostEquipmentTabInput,ServiceItemCostOperationTabInput"/>

</div>
<script type="text/javascript">
    function updateServiceItemCostTotalCost(serviceItemCostId) {
        var requestUrl = "${pageContext.request.contextPath}" + "/clinic/basicInfo/serviceItemCost/updateServiceItemCostTotalCost/" + serviceItemCostId;
        $.getJSON(requestUrl, function (data) {
            $('#totalCost').val(data.totalCost);
            $('#totalCost_txt').val(addCommaSeparator(data.totalCost));
        });
    }

    function doAfterSave_ServiceItemCostEquipment() {
        updateServiceItemCostTotalCost(document.getElementById("id").value);
    }

    function doAfterRemove_ServiceItemCostEquipment() {
        updateServiceItemCostTotalCost(document.getElementById("id").value);
    }

    function doAfterRemove_ServiceItemCostOperation() {
        updateServiceItemCostTotalCost(document.getElementById("id").value);
    }

    function doAfterSave_ServiceItemCostOperation() {
        updateServiceItemCostTotalCost(document.getElementById("id").value);
        console.log('salam')
        $('#operationDiv #operation_cost_txt').prop("disabled", false);
        $('#operationDiv #operation_cost').val('');
        $('#operationDiv #operation_cost_txt').val('');

        $('#operationDiv #operation_quantity_txt').prop("disabled", false);
        $('#operationDiv #operation_quantity').val('');
        $('#operationDiv #operation_quantity_txt').val('');
    }
</script>