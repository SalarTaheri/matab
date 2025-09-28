<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 4px; ">
    <form class="uk-form" id="surgeryPopup">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="register_employee_id" name="register_employee_id" >
		<input type="hidden" id="service_id" name="service_id" >
		<input type="hidden" id="surgeon_employee_id" name="surgeon_employee_id" >
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="surgeryType"
						   key="com.artonis.clinic.operation.surgery.surgeryType" selectIndex="0" comboLoaderUrl="combo/allSurgeryType"/>
			<%--<base:comboBox  name="service_id" styleClass="small"--%>
							<%--key="com.artonis.clinic.operation.surgery.service.name"  comboLoaderUrl="combo/allService"/>--%>
			<base:testBox name="service_name" styleClass="small" key="com.artonis.clinic.operation.surgery.service.name" readOnly="true"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<%--<base:comboBox comboLoaderUrl="combo/loadAllDoctor" styleClass="small" name="surgeon_employee_id" key="com.artonis.clinic.operation.surgery.surgeon_employee_fullname"/>--%>
			<base:testBox name="surgeon_employee_fullname" styleClass="small" key="com.artonis.clinic.operation.surgery.surgeon_employee_fullname" readOnly="true"/>
			<base:comboBox styleClass="small"  name="surgeon_assistant1_employee_id" key="com.artonis.clinic.operation.surgery.surgeon_assistant1_employee_fullname" comboLoaderUrl="combo/loadAllDoctor"/>
			<base:comboBox styleClass="small" name="surgeon_assistant2_employee_id" key="com.artonis.clinic.operation.surgery.surgeon_assistant2_employee_fullname" comboLoaderUrl="combo/loadAllDoctor"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="anesthesiologist_employee_id" key="com.artonis.clinic.operation.surgery.anesthesiologist_employee_fullname" comboLoaderUrl="combo/loadAllDoctor"/>
			<base:comboBox styleClass="small" name="anesthesia_technicians_employee_id" key="com.artonis.clinic.operation.surgery.anesthesia_technicians_employee_fullname" comboLoaderUrl="combo/loadAllOfficalEmployee"/>
			<base:comboBox styleClass="small" name="anesthesiaType_id" key="com.artonis.clinic.operation.surgery.anesthesiaType" comboLoaderUrl="combo/allAnesthesiaType"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="technician1_employee_id" key="com.artonis.clinic.operation.surgery.technician1_employee_fullname" comboLoaderUrl="combo/loadAllOfficalEmployee"/>
			<base:comboBox styleClass="small" name="technician2_employee_id" key="com.artonis.clinic.operation.surgery.technician2_employee_fullname" comboLoaderUrl="combo/loadAllOfficalEmployee"/>
			<base:comboBox styleClass="small" name="nurse_operating_employee_id" key="com.artonis.clinic.operation.surgery.nurse_operating_employee_fullname" comboLoaderUrl="combo/loadAllOfficalEmployee"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="nurse_assistant_employee_id" key="com.artonis.clinic.operation.surgery.nurse_assistant_employee_fullname" comboLoaderUrl="combo/loadAllOfficalEmployee"/>
			<base:comboBox styleClass="small" name="nurse_recovery_employee_id" key="com.artonis.clinic.operation.surgery.nurse_recovery_employee_fullname" comboLoaderUrl="combo/loadAllOfficalEmployee"/>
			<base:comboBox styleClass="small" name="scrub1_employee_id" key="com.artonis.clinic.operation.surgery.scrub1_employee_fullname" comboLoaderUrl="combo/loadAllEmployee"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="scrub2_employee_id" key="com.artonis.clinic.operation.surgery.scrub2_employee_fullname" comboLoaderUrl="combo/loadAllEmployee"/>
			<base:comboBox styleClass="small" name="sirculer1_employee_id" key="com.artonis.clinic.operation.surgery.sirculer1_employee_fullname" comboLoaderUrl="combo/loadAllOfficalEmployee"/>
			<base:comboBox styleClass="small" name="sirculer2_employee_id" key="com.artonis.clinic.operation.surgery.sirculer2_employee_fullname" comboLoaderUrl="combo/loadAllOfficalEmployee"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker name="date" key="com.artonis.clinic.operation.surgery.date" styleClass="small" />
			<base:timePicker name="start_time" key="com.artonis.clinic.operation.surgery.start_time" styleClass="small" interval="5"/>
			<base:timePicker name="end_time" key="com.artonis.clinic.operation.surgery.end_time" styleClass="small" interval="5"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:multiSelect serverFilter="true" name="operatingType_ids" styleClass="small" multiSelectLoaderUrl="combo/allOperatingType" key="com.artonis.clinic.operation.surgery.operatingType" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox styleClass="small" name="radiography" key="com.artonis.clinic.operation.surgery.radiography"/>
			<base:checkbox styleClass="small" name="patology" key="com.artonis.clinic.operation.surgery.patology"/>
			<base:checkbox styleClass="small" name="bloodreserve" key="com.artonis.clinic.operation.surgery.bloodreserve"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea name="description" divWidthVal="90%" key="com.artonis.clinic.operation.surgery.description" height="80" />
			<%--<base:testBox styleClass="small" name="register_employee_id" key="com.artonis.clinic.operation.surgery.register_employee_fullname"/>--%>
		</div>

	</form>	 
</div>


<base:footer/>

<script type="text/javascript">
	<%--function callback_change_service_item_id(e){--%>
		<%--fillServiceItemCostEquipmentByServiceItemId(e.sender._old);--%>
	<%--}--%>
	<%--function fillServiceItemCostEquipmentByServiceItemId(serviceItemId){--%>
		<%--var requestUrl = "${pageContext.request.contextPath}"+"/clinic/basicInfo/serviceItemPopUp/loadServiceItem/"+serviceItemId;--%>
		<%--$.getJSON(requestUrl, function (data) {--%>
			<%--console.log(data);--%>

			<%--$('#cost').val(data.cost);--%>
			<%--$('#cost_txt').val(addCommaSeparator(data.cost));--%>
			<%--$('#measureUnit').val(data.measureUnit);--%>

			<%--$('#quantity').val(1);--%>
			<%--$('#quantity_txt').val(1);--%>

			<%--$("#service_item_cost_group_bill_id").val(data.service_item_group_bill_id);--%>
			<%--$("#service_item_cost_group_bill_id_Comb").data("kendoComboBox").value(data.service_item_group_bill_id);--%>

			<%--$("#service_item_cost_group_patient_bill_id").val(data.service_item_group_patient_bill_id);--%>
			<%--$("#service_item_cost_group_patient_bill_id_Comb").data("kendoComboBox").value(data.service_item_group_patient_bill_id);--%>

			<%--$("#service_item_cost_group_detail_bill_id").val(data.service_item_group_detail_bill_id);--%>
			<%--$("#service_item_cost_group_detail_bill_id_Comb").data("kendoComboBox").value(data.service_item_group_detail_bill_id);--%>

			<%--$("#service_item_cost_group_id").val(data.service_item_group_fish_id);--%>
			<%--$("#service_item_cost_group_id_Comb").data("kendoComboBox").value(data.service_item_group_fish_id);--%>

			<%--if(data.isNotShowInFishPrint!=null &&data.isNotShowInFishPrint!=undefined){--%>
				<%--$("#isNotShowInFishPrint").prop('checked', data.isNotShowInFishPrint);--%>
			<%--}--%>


			<%--if(data.isNotShowInPatientBill!=null &&data.isNotShowInPatientBill!=undefined){--%>
				<%--$("#isNotShowInPatientBill").prop('checked', data.isNotShowInPatientBill);--%>
			<%--}--%>

			<%--if(data.isNotShowInDetailBill!=null &&data.isNotShowInDetailBill!=undefined){--%>
				<%--$("#isNotShowInDetailBill").prop('checked', data.isNotShowInDetailBill);--%>
			<%--}--%>



		<%--});--%>
	<%--}--%>
	
	function callback_deserialize(data){
		var multiSelect = $("#operatingType_ids_multiSelect").data("kendoMultiSelect");
		multiSelect.value(data.operatingType_ids);
	}
</script>

