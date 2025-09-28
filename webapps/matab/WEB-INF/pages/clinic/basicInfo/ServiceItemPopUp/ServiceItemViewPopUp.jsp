<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    String menuSysCode = String.valueOf(request.getAttribute("menuSystemCode"));
    boolean changeServicePricePermision = GlobalVariable.getButtonContainer("005006018", "changeServicePricePermision");
    boolean changeQuanityPermision = GlobalVariable.getButtonContainer("005006018", "changeQuanityPermision");
    boolean changeQuanityPermisionBasedOnField = GlobalVariable.getButtonContainer("005006018", "changeQuanityPermisionBasedOnField");
%>

<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 4px; ">
    <form class="uk-form" id="ServiceItem">
		<input type="hidden" id="insuranceCost" name="insuranceCost">
		<input type="hidden" id="franshiz" name="franshiz">
		<input type="hidden" id="difference" name="difference">
		<input type="hidden" id="insuranceAcceptablePrice" name="insuranceAcceptablePrice">
		<input type="hidden" id="insurancePercent" name="insurancePercent">
		<input type="hidden" id="code" name="code">
		<input type="hidden" id="serviceitem_name" name="serviceitem_name">
		<input type="hidden" id="isAnesthesiaService" name="isAnesthesiaService">
		<input type="hidden" id="insuranceItemType" name="insuranceItemType">
		<input type="hidden" id="type" name="type">
		<input type="hidden" id="serviceitem_cost" name="serviceitem_cost">
		<input type="hidden" id="rvu_id" name="rvu_id">
		<input type="hidden" id="professional_ka_id" name="professional_ka_id">
		<input type="hidden" id="professional_ka_price" name="professional_ka_price">
		<input type="hidden" id="professional_ka_total" name="professional_ka_total">
		<input type="hidden" id="professional_ka_price_acceptable_insurance" name="professional_ka_price_acceptable_insurance">
		<input type="hidden" id="professional_ka_total_acceptable_insurance" name="professional_ka_total_acceptable_insurance">
		<input type="hidden" id="professionalComponent" name="professionalComponent">
		<input type="hidden" id="technicalComponent" name="technicalComponent">
		<div class="uk-grid uk-grid-preserve">

			<base:comboBox name="service_item_id"  key="com.artonis.clinic.basicInfo.serviceItem"
					comboLoaderUrl="combo/loadServiceItem/${insurance_type_id}" styledivLabel="width:15%"/>
			<base:testBox name="measureUnit" key="com.artonis.clinic.basicInfo.serviceItem.measureUnit" disabled="true" styleClass="small"/>

		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="small" name="quantity" key="com.artonis.clinic.basicInfo.serviceItem.quantity" styledivLabel=" width: 15%; "/>
			<base:testBoxNumericEx
					styleClass="small" name="cost" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.cost" styledivLabel=" width: 30%; "/>

		</div>
		<div class="uk-grid uk-grid-preserve" id="group_bill_id">

			 <base:comboBox name="service_item_cost_group_bill_id"  key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.showBillPrint"
								comboLoaderUrl="combo/loadAllServiceItemGroup"  styledivLabel="width:15%"/>
		</div>

		<div class="uk-grid uk-grid-preserve" id="group_patient_bill_id">

			<base:checkbox  name="isNotShowInPatientBill" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.isNotShowInPatientBill" divLableStyle="width:15%" divCheckBoxStyle="width:20%"/>

			<base:comboBox name="service_item_cost_group_patient_bill_id" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.showPatientBillPrint"
						   comboLoaderUrl="combo/loadAllServiceItemGroup" styledivLabel="width:15%"/>
		</div>

		<div class="uk-grid uk-grid-preserve" id="group_detail_bill_id">

			<base:checkbox  name="isNotShowInDetailBill" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.isNotShowInDetailBill" divLableStyle="width:15%" divCheckBoxStyle="width:20%"/>

			<base:comboBox name="service_item_cost_group_detail_bill_id"  key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.showDetailBillPrint"
						   comboLoaderUrl="combo/loadAllServiceItemGroup" styledivLabel="width:15%" />


		</div>
		<div class="uk-grid uk-grid-preserve" id="group_id">

			<base:checkbox  name="isNotShowInFishPrint" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.isNotShowInFishPrint" divLableStyle="width:15%" divCheckBoxStyle="width:20%"/>
			<base:comboBox name="service_item_cost_group_id"  key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.showFishPrint"
						   comboLoaderUrl="combo/loadAllServiceItemGroup" styledivLabel="width:15%"  />
		</div>
	</form>	 
</div>


<base:footer/>

<script type="text/javascript">
	function callback_change_service_item_id(e){
		fillServiceItemCostEquipmentByServiceItemId(e.sender._old);
	}
	function fillServiceItemCostEquipmentByServiceItemId(serviceItemId){
		var items=readingAllRowsFRItems();
		var currentServiceNum=0;
		for(var c=0;c<tlbService.length;c++){
			if(!tlbService[c].cancel && tlbService[c].financeRegistration_id==currentFinanceRegistration_id){
				currentServiceNum++;
				break
			}else if(!tlbService[c].cancel){
				currentServiceNum++;
			}
		}

		for(var w=0;w<insuranceInfo.length;w++){
			items[items.length]=insuranceInfo[w];
		}
		var cFRId=-1
		if(currentFinanceRegistration_id!=null){
			cFRId=currentFinanceRegistration_id;
		}

		jQuery.ajax({
			url: '<c:url value='/' />' + "/clinic/basicInfo/serviceItemPopUp/loadServiceItem/"+serviceItemId+"/${insurance_type_id}/"+currentServiceNum+"/"+$("#factor_id").val()+"/"+cFRId,
			type: "POST",
			data: JSON.stringify(items),
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			success: function (data) {
			    console.log(data);
				$('#cost').val(data.cost);
				$('#cost_txt').val(addCommaSeparator(data.cost));
				if(data.isInsurance){
					$("#cost_txt").prop("disabled", true);
				}if(!data.isInsurance){
					$("#cost_txt").prop("disabled", false);
				}

				if(!<%=changeServicePricePermision%>){
                    $("#cost_txt").prop("disabled", true);
                }

				if(data.hasInsuranceLimit){
					$('#quantity_txt').prop("disabled", true);
				}if(!data.hasInsuranceLimit){
                    if(<%=changeQuanityPermision%>){
                        $("#quantity_txt").prop("disabled", false);
                    }else{
                        if(<%=changeQuanityPermisionBasedOnField%>){
                            if(data.hasAllowChangeQuantity==false){
                                $("#quantity_txt").prop("disabled", true);
                            }else{
                                $("#quantity_txt").prop("disabled", false);
                            }
                        }else{
                            $("#quantity_txt").prop("disabled", true);
                        }
                    }

					/*$('#quantity_txt').prop("disabled", false);
                    if(data.hasAllowChangeQuantity==false ){
                        $("#quantity_txt").prop("disabled", true);
                        if(<%=changeQuanityPermision%>){

                        }
                    }else{
                        $("#quantity_txt").prop("disabled", false);
                    }*/
				}

				if(data.rvu_id!=undefined && data.rvu_id>0){
                    $("#quantity_txt").prop("disabled", true);
                    $("#cost_txt").prop("disabled", true);
                }
				$('#measureUnit').val(data.measureUnit);




				if(data.quantity!=undefined){
					$('#quantity').val(data.quantity);
					$('#quantity_txt').val(data.quantity);
				}else{
					$('#quantity').val(1);
					$('#quantity_txt').val(1);
				}


				if(data.service_item_group_bill_id!=undefined){
                    $("#service_item_cost_group_bill_id").val(data.service_item_group_bill_id);
                    $("#service_item_cost_group_bill_id_Comb").data("kendoComboBox").value(data.service_item_group_bill_id);
                }else{
                    $("#service_item_cost_group_bill_id").val("");
                    $("#service_item_cost_group_bill_id_Comb").data("kendoComboBox").value("");
                }

                if(data.service_item_group_patient_bill_id!=undefined){
                    $("#service_item_cost_group_patient_bill_id").val(data.service_item_group_patient_bill_id);
                    $("#service_item_cost_group_patient_bill_id_Comb").data("kendoComboBox").value(data.service_item_group_patient_bill_id);
                }else{
                    $("#service_item_cost_group_patient_bill_id").val("");
                    $("#service_item_cost_group_patient_bill_id_Comb").data("kendoComboBox").value("");
                }

                if(data.service_item_group_detail_bill_id!=undefined){
                    $("#service_item_cost_group_detail_bill_id").val(data.service_item_group_detail_bill_id);
                    $("#service_item_cost_group_detail_bill_id_Comb").data("kendoComboBox").value(data.service_item_group_detail_bill_id);
                }else{
                    $("#service_item_cost_group_detail_bill_id").val("");
                    $("#service_item_cost_group_detail_bill_id_Comb").data("kendoComboBox").value("");
                }

                if(data.service_item_group_fish_id!=undefined){
                    $("#service_item_cost_group_id").val(data.service_item_group_fish_id);
                    $("#service_item_cost_group_id_Comb").data("kendoComboBox").value(data.service_item_group_fish_id);
                }else{
                    $("#service_item_cost_group_id").val("");
                    $("#service_item_cost_group_id_Comb").data("kendoComboBox").value("");
                }

				if(data.isNotShowInFishPrint!=null &&data.isNotShowInFishPrint!=undefined){
					$("#isNotShowInFishPrint").prop('checked', data.isNotShowInFishPrint);
				}


				if(data.isNotShowInPatientBill!=null &&data.isNotShowInPatientBill!=undefined){
					$("#isNotShowInPatientBill").prop('checked', data.isNotShowInPatientBill);
				}

				if(data.isNotShowInDetailBill!=null &&data.isNotShowInDetailBill!=undefined){
					$("#isNotShowInDetailBill").prop('checked', data.isNotShowInDetailBill);
				}

				$("#insuranceCost").val(data.insuranceCost);
				$("#franshiz").val(data.franshiz);
				$("#difference").val(data.difference);
				$("#serviceitem_name").val(data.serviceitem_name);
				$("#insuranceAcceptablePrice").val(data.insuranceAcceptablePrice);
				$("#code").val(data.code);
				$("#isAnesthesiaService").val(data.isAnesthesiaService);
				$("#insurancePercent").val(data.insurancePercent);
				$("#type").val(data.type);
				$("#insuranceItemType").val(data.insuranceItemType);
				$("#serviceitem_cost").val(data.serviceitem_cost);
				$("#rvu_id").val(data.rvu_id);
				$("#professional_ka_id").val(data.professional_ka_id);
				$("#professional_ka_price").val(data.professional_ka_price);
				$("#professional_ka_total").val(data.professional_ka_total);
				$("#professional_ka_price_acceptable_insurance").val(data.professional_ka_price_acceptable_insurance);
				$("#professional_ka_total_acceptable_insurance").val(data.professional_ka_total_acceptable_insurance);
				$("#professionalComponent").val(data.professionalComponent);
				$("#technicalComponent").val(data.technicalComponent);


			}
		});


		/*var requestUrl = "${pageContext.request.contextPath}"+"/clinic/basicInfo/serviceItemPopUp/loadServiceItem/"+serviceItemId+"/${insurance_type_id}";
		$.getJSON(requestUrl, function (data) {
			console.log(data);
			$('#cost').val(data.cost);
			$('#cost_txt').val(addCommaSeparator(data.cost));
			if(data.isInsurance){
				$("#cost_txt").prop("disabled", true);
			}if(!data.isInsurance){
				$("#cost_txt").prop("disabled", false);
			}
			$('#measureUnit').val(data.measureUnit);

			if(data.quantity!=undefined){
				$('#quantity').val(data.quantity);
				$('#quantity_txt').val(data.quantity);
			}else{
				$('#quantity').val(1);
				$('#quantity_txt').val(1);
			}


			$("#service_item_cost_group_bill_id").val(data.service_item_group_bill_id);
			$("#service_item_cost_group_bill_id_Comb").data("kendoComboBox").value(data.service_item_group_bill_id);

			$("#service_item_cost_group_patient_bill_id").val(data.service_item_group_patient_bill_id);
			$("#service_item_cost_group_patient_bill_id_Comb").data("kendoComboBox").value(data.service_item_group_patient_bill_id);

			$("#service_item_cost_group_detail_bill_id").val(data.service_item_group_detail_bill_id);
			$("#service_item_cost_group_detail_bill_id_Comb").data("kendoComboBox").value(data.service_item_group_detail_bill_id);

			$("#service_item_cost_group_id").val(data.service_item_group_fish_id);
			$("#service_item_cost_group_id_Comb").data("kendoComboBox").value(data.service_item_group_fish_id);

			if(data.isNotShowInFishPrint!=null &&data.isNotShowInFishPrint!=undefined){
				$("#isNotShowInFishPrint").prop('checked', data.isNotShowInFishPrint);
			}


			if(data.isNotShowInPatientBill!=null &&data.isNotShowInPatientBill!=undefined){
				$("#isNotShowInPatientBill").prop('checked', data.isNotShowInPatientBill);
			}

			if(data.isNotShowInDetailBill!=null &&data.isNotShowInDetailBill!=undefined){
				$("#isNotShowInDetailBill").prop('checked', data.isNotShowInDetailBill);
			}



		});*/
	}
</script>

