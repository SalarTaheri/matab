<%@page import="org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
String context = ((SecurityContextHolderAwareRequestWrapper) pageContext.getRequest()).getContextPath();
String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
if (basePath.indexOf("/create") > -1) {
    basePath = basePath.substring(0, basePath.indexOf("/create"));
} else if (basePath.indexOf("/edit") > -1) {
    basePath = basePath.substring(0, basePath.indexOf("/edit"));
} 
%>
<input name="loadedId" type="hidden" id="loadedId" />

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
	<div id="header-toolbar" align="right">
	  	<base:buttonPermission key="fnc.btn.new" classNames="uk-button uk-button-success" id="purchaseContractOperationView-new-btn" onClick="javascript:customReload()"/>
	  	<base:buttonPermission key="fnc.btn.register" classNames="uk-button uk-button-success" id="purchaseContractOperationView-register-btn" onClick="javascript:savePurchaseContractOperation()"/>
	</div>
</div>

<div class="uk-container uk-container-center my-uk-container" style="">
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id">
		<input type="hidden" id="seasonVat_id" name="seasonVat_id">
		<input type="hidden" id="taxPercent" name="taxPercent">
		<input type="hidden" id="complicationPercent" name="complicationPercent">
		
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="season" key="inventory.m169.operation.purchaseOperation.season" disabled="true"/>
			<base:testBox styleClass="midsmall" name="year" key="inventory.m169.operation.purchaseOperation.year" disabled="true"/>
			<base:comboBox styleClass="midsmall" name="contractSideType" key="com.artonis.inv.m169.operation.purchaseContractOperation.contractSideType" comboLoaderUrl="combo/loadAllContractSideType"/>
		    <base:cascadeComboBox-buttonNew cascadeCombo="contractSideType" styleClass="midsmall" name="person_id" key="inventory.m169.operation.purchaseOperation.person_id"
            		isListConstant="true" comboLoaderUrl="combo/loadAllPerson" popupUrl="/popup/person" relativeSaveUrl="/person/save"/>
			   
		</div>
		<div style="padding-top: 12px" class="turnItems">		
			<div class="uk-grid uk-grid-preserve">
				 <base:mDatePicker styleClass="midsmall" name="startDate" key="com.artonis.inv.m169.operation.purchaseContractOperation.startdate"></base:mDatePicker>
				<base:mDatePicker styleClass="midsmall" name="finishDate" key="com.artonis.inv.m169.operation.purchaseContractOperation.endDate"></base:mDatePicker>
				<base:testBox styleClass="midsmall" name="contractSubject" key="com.artonis.inv.m169.operation.purchaseContractOperation.contractSubject" />
			<table>
					<tr>
						<td width="120" align="left"><%=ResourceBoundleHolder.resourceBundle.getString("inventory.m169.operation.purchaseOperation.return")%></td>
						<td align="center"><base:checkbox name="return_" style="width: 45px; margin-right: 10px" key="inventory.m169.operation.purchaseOperation.null"/></td>
					</tr>
				</table>
			</div>
			<div class="uk-grid uk-grid-preserve">
				<base:testBox styleClass="midsmall" name="economicNo" key="inventory.m169.operation.purchaseOperation.economicNo" disabled="true"/>
				<base:testBox styleClass="midsmall" name="nationalCode" key="inventory.m169.operation.purchaseOperation.nationalCode" disabled="true"/>
				<base:testBox styleClass="midsmall" name="foreignPersonCode" key="inventory.m169.operation.purchaseOperation.foreignPersonCode"/>
			</div>
			
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="midsmall" name="price" key="inventory.m169.operation.purchaseOperation.price" onChangeFunction="calcTaxTool()"/>
			<base:testBoxNumericEx styleClass="midsmall" name="tax" key="inventory.m169.operation.purchaseOperation.tax" onChangeFunction="sumAll()"/>
		    <base:testBoxNumericEx styleClass="midsmall" name="toll" key="inventory.m169.operation.purchaseOperation.toll" onChangeFunction="sumAll()"/>
			<base:testBoxNumericEx styleClass="midsmall" name="deductionTax" key="com.artonis.inv.m169.operation.purchaseContractOperation.deductionTax" onChangeFunction="sumAll()"/>	
		</div>
		<div class="uk-grid uk-grid-preserve">	
			<base:testBoxNumericEx styleClass="midsmall" name="sum" key="inventory.m169.operation.purchaseOperation.sum" disabled="true"/>
		
		</div>
		
		<div style="padding-top: 12px" class="turnItems">		
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="province" key="inventory.m169.operation.purchaseOperation.province" disabled="true"/>
			<base:testBox styleClass="midsmall" name="city" key="inventory.m169.operation.purchaseOperation.city" disabled="true"/>
			<base:testBox styleClass="midsmall" name="cityCode" key="inventory.m169.operation.purchaseOperation.cityCode" disabled="true"/>
			<base:testBox styleClass="midsmall" name="sellerPhone" key="inventory.m169.operation.purchaseOperation.sellerPhone" disabled="true"/>
		
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="sellerPostalCode" key="inventory.m169.operation.purchaseOperation.sellerPostalCode" disabled="true"/>
			<base:textArea name="address" key="inventory.m169.operation.purchaseOperation.address" disabled="true" width="500"/>
	
		</div>
	
		</div>
		<div class="uk-grid uk-grid-preserve">
		</div>
		  <div class="uk-grid uk-grid-preserve">
		    <base:textArea name="description" divWidthVal="65"  key="inventory.m169.operation.purchaseOperation.description"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
		    <base:textArea name="paymentDescription" divWidth="50"  key="inventory.m169.operation.purchaseOperation.paymentDescription"/>
		</div>
	</form>
</div>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single" noEditButton="true">
	<base:my-grid-column title='com.artonis.inv.m169.operation.purchaseContractOperation.person_id'  field="personName" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.operation.purchaseContractOperation.contractSideType'  field="contractSideTypeTxt" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.operation.purchaseContractOperation.startdate'  field="startDate" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.operation.purchaseContractOperation.endDate'  field="finishDate" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.operation.purchaseContractOperation.contractSubject'  field="contractSubject" width="50px"/>
	<base:my-grid-column title='inventory.m169.operation.purchaseOperation.price'  field="price" width="50px"/>
	<base:my-grid-column title='inventory.m169.operation.purchaseOperation.tax'  field="taxText" width="50px"/>
	<base:my-grid-column title='inventory.m169.operation.purchaseOperation.toll'  field="tollText" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.operation.purchaseContractOperation.deductionTax'  field="deductionTaxText" width="50px"/>

    <base:my-grid-schema-field name="personName" type="string"/>
    <base:my-grid-schema-field name="contractSideTypeTxt" type="string"/>
    <base:my-grid-schema-field name="startDate" type="string"/>  
    <base:my-grid-schema-field name="finishDate" type="string"/>  
    <base:my-grid-schema-field name="contractSubject" type="contractSubject"/>  
    <base:my-grid-schema-field name="price" type="long"/>
    <base:my-grid-schema-field name="taxText" type="long"/>
    <base:my-grid-schema-field name="tollText" type="long"/>
    <base:my-grid-schema-field name="deductionTaxText" type="long"/>
    <base:my-grid-function text="inventory.m169.operation.purchaseOperation.operation.edit" functionClick="grid_onEdit" name="editItem" styleClass="uk-button-success"/>
</base:my-grid>

<base:footer/>

<script type="text/javascript">
$(document).ready(function(){
	$("#sum_txt").css('background-color','rgb(252, 216, 157)');
	$("#sum_txt").css('color','black');
	$("#sum_txt").css('text-align','center');
    loadActiveSeason();
});
function loadActiveSeason(){
	var url = getBaseUrl() + "loadActiveSeason" ; 
	$.getJSON(url, function (data) {
		$('#seasonVat_id').val(data.id);
		$('#year').val(data.year);
		$('#season').val(data.season);
		$('#complicationPercent').val(data.complicationPercent);
		$('#taxPercent').val(data.taxPercent);
	});
}
function customReload(){
	window.location = getBaseUrl();
}
function changePersonType(personTypeVal){

    if(personTypeVal=="1"){
		$("#economicNo").prop("disabled", true);
		$("#economicNo").css('background-color','rgb(206, 215, 235)');
		$("#nationalCode").prop("disabled", false);
		$("#nationalCode").css('background-color','');
		$("#foreignPersonCode").prop("disabled", true);
		$("#foreignPersonCode").css('background-color','rgb(206, 215, 235)');
	}else if(personTypeVal!="1" ){
	
		$("#economicNo").prop("disabled", false);
		$("#economicNo").css('background-color','');
		$("#nationalCode").prop("disabled", true);
		$("#nationalCode").css('background-color','rgb(206, 215, 235)');
		$("#foreignPersonCode").prop("disabled", true);
		$("#foreignPersonCode").css('background-color','rgb(206, 215, 235)');
		
	}
}
function changeCheckbox(){
	var mainWrapper = $('.turnItems');
	var checked = $('#tradingBelow10Percent')[0].checked;
	if(checked){
		mainWrapper.find('input, textarea, button, select').each(function () {
		    $(this).prop('disabled', true);
		});
		var mainWrapperPos = mainWrapper.position();
		var mainWrapperHeight = mainWrapper.height();
		var mainWrapperWidth = mainWrapper.width();
		$('.turnItems').css({
		    'opacity':0.3,
		    'top': mainWrapperPos.top,
		    'left': mainWrapperPos.left,
		    'height': mainWrapperHeight,
		    'width': $('.turnItems').width()
		});
		$("input[data-role='combobox']").data("kendoComboBox").enable(false);
	}else{
		$("input[data-role='combobox']").data("kendoComboBox").enable(true);
		mainWrapper.find('input, textarea, button, select').each(function () {
		    $(this).prop('disabled', false);
		});
		var mainWrapperPos = mainWrapper.position();
		var mainWrapperHeight = mainWrapper.height();
		var mainWrapperWidth = mainWrapper.width();
		$('.turnItems').css({
		    'opacity':1,
		    'top': mainWrapperPos.top,
		    'left': mainWrapperPos.left,
		    'height': mainWrapperHeight,
		    'width': $('.turnItems').width()
		});
	}
}
function callback_change_sellerType(e){
	var sellerTypeVal = $("#sellerType_Comb").data("kendoComboBox")._selectedValue;
	if(sellerTypeVal=="1"){
		$("#person_id_Comb").data("kendoComboBox").enable(true);
		$("#person_id_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%";
		$("#economicNo").prop("disabled", false);
		$("#economicNo").css('background-color','');
		$("#nationalCode").prop("disabled", false);
		$("#nationalCode").css('background-color','');
		$("#foreignPersonCode").prop("disabled", true);
		$("#foreignPersonCode").css('background-color','rgb(206, 215, 235)');
	}else if(sellerTypeVal=="2"){
		$("#person_id_Comb").data("kendoComboBox").enable(false);
		$("#person_id_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%; background: rgb(206, 215, 235);";
		$("#economicNo").prop("disabled", true);
		$("#economicNo").css('background-color','rgb(206, 215, 235)');
		$("#nationalCode").prop("disabled", true);
		$("#nationalCode").css('background-color','rgb(206, 215, 235)');
		$("#foreignPersonCode").prop("disabled", false);
		$("#foreignPersonCode").css('background-color','');
	}
}
function calcTaxTool(){
	var taxPercent = $('#taxPercent').val();
	var complicationPercent = $('#complicationPercent').val();
	if(taxPercent==NaN){
		taxPercent = 0;
	}
	if(complicationPercent==NaN){
		complicationPercent = 0;
	}
	taxPercent /= 100;
	complicationPercent /= 100;
	taxPercent = taxPercent.toFixed(3);
	complicationPercent = complicationPercent.toFixed(3);
	var price = $('#price').val();
	$('#tax').val(((price * taxPercent).toFixed(3)*1000)/1000);
	$('#toll').val(((price * complicationPercent).toFixed(3)*1000)/1000);
	$('#deductionTax').val(price * 0.03);
	$('#sum').val(Number($('#tax').val()) + Number($('#toll').val()) + Number(price)- Number($('#deductionTax').val()));
	setNumericTextValue();
}
function sumAll(){
	$('#sum').val(Number($('#tax').val()) + Number($('#toll').val()) + Number($('#price').val())- Number($('#deductionTax').val()));
	setNumericTextValue();
}
function callback_change_person_id(e){
	var personId = $("#person_id_Comb").data("kendoComboBox")._selectedValue;
	var url = getBaseUrl() + "loadPersonAndContract/" + personId ; 
	$.getJSON(url, function (data) {
		$('#province').val(data.provinceName);
		$('#city').val(data.cityName);
		$('#cityCode').val(data.preCodeCity);
		$('#sellerPhone').val(data.phoneNo);
		$('#sellerPostalCode').val(data.postalCode);
		$('#address').val(data.address);
		$('#economicNo').val(data.economicNo);
		$('#nationalCode').val(data.nationalCode);
		$('#startDate').val(data.startDate);
		$('#finishDate').val(data.finishDate);
		$('#price_txt').val(data.price);	
		$('#price').val(data.price);	
		calcTaxTool();
	});
}
function savePurchaseContractOperation(){
	var data = {};
	data.id=$("#loadedId").val();
	data.seasonVat_id=$("#seasonVat_id").val();
	data.contractSideType=$("#contractSideType").val();
	data.person_id=$("#person_id").val();
	data.foreignPersonCode=$("#foreignPersonCode").val();
	data.return_=$('#return_')[0].checked;
	data.price=$("#price").val();
	data.tax=$("#tax").val();
	data.toll=$("#toll").val();
	//data.contractDate=$("#contractDate").val();
	data.contractSubject=$("#contractSubject").val();
	data.deductionTax=$("#deductionTax").val();
	data.startDate=$("#startDate").val();
	data.finishDate=$("#finishDate").val();	
	data.description=$("#description").val();	
	data.paymentDescription=$("#paymentDescription").val();	
	data.state=1;

	$.ajax({
		url: '${pageContext.request.contextPath}'+'/inventory/m169/operation/purchaseContractOperation/save',
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(data),
		dataType: 'json',
		type: 'POST',
		//async: true,
		success: function (data) {
               if (data.state == "error") {
                   for (var i = 0; i < data.errors.length; i++) {
                       if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
                           alertify.error($("label[for='" + data.errors[i].Field + "']").text() + ":  " + data.errors[i].Message);
                       } else {
                           alertify.error(data.errors[i].Field + ":  " + data.errors[i].Message);
                       }
                   }
               }else{
					alertify.success(data.message);
					loadActiveSeason();
					$(':input').val('');
	                document.getElementById("loadedId").value = data.baseObjectId;
	                $('#return_').prop('checked','');
                    $.getJSON(basePath + '/reset/', function (data) {
                        if(typeof(callback_deserialize) == "function"){
                            callback_deserialize(data);
                        }
                        $('#mainForm').deserialize(data);
						setNumericTextValue();
                        var comboOnFormArray=$( "input[id$='_Comb']" );
                        if(comboOnFormArray.length>0){
                            for(var i=0;i<comboOnFormArray.length;i++){
                                var combo=$( "input[id$='_Comb']" )[i].id;
                                var comboKendo=$("#"+combo).data("kendoComboBox");
                                if(comboKendo!=undefined){
                                    comboKendo.dataSource._filter=undefined;
                                }
                            }
                        }
                    });
	                $("#grid").data("kendoGrid").dataSource.read();
               }
		},
		error: function (e) {
			alert('Error: ' + e.responseText);
		}
	});
}
function grid_onEdit(e){
	var data = this.dataItem($(e.target).closest("tr"));
    if (e) {
    	$("#loadedId").val(data.id);
		var url = getBaseUrl() + "loadSeasonVat/" + data.seasonVat_id; 
		$.getJSON(url, function (seasonVat) {
			$('#seasonVat_id').val(seasonVat.id);
			$('#year').val(seasonVat.year);
			$('#season').val(seasonVat.season);
			$('#complicationPercent').val(seasonVat.complicationPercent);
			$('#taxPercent').val(seasonVat.taxPercent);
		});
		var trBlow = data.tradingBelow10Percent;
		if(trBlow == false){
			$('#tradingBelow10Percent').prop('checked','');
		}else{
			$('#tradingBelow10Percent').prop('checked','true');
		}
		//changeCheckbox();
    	//$('#serviceGoods_id').val(data.serviceGoods_id);
       // $("#serviceGoods_id_Comb").data("kendoComboBox").value(data.serviceGoods_id);
    	$('#contractSideType').val(data.contractSideType);
        $("#contractSideType_Comb").data("kendoComboBox").value(data.contractSideType);
    	//checkSellerType(data.sellerType);
		changePersonType(data.contractSideType);
		$('#person_id').val(data.person_id);
		$("#person_id_Comb").data("kendoComboBox").value(data.person_id);
		$('#contractDate').val(data.contractDate);
		$('#contractSubject').val(data.contractSubject);
		$('#foreignPersonCode').val(data.foreignPersonCode);
		loadPersonValues(data.person_id);
		$('#foreignPersonCode').val(data.foreignPersonCode);
		var returnValue = data.foreignPersonCode;
		if(returnValue == false){
			$('#return_').prop('checked','');
		}else{
			$('#return_').prop('checked','true');
		}
		$('#price').val(data.price);
		$('#tax').val(data.tax);
		$('#toll').val(data.toll);
		$('#deductionTax').val(data.deductionTax);
		sumAll();
    }
}
function loadPersonValues(personId){
	var url = getBaseUrl() + "loadPersonAndContract/" + personId ; 
	$.getJSON(url, function (data) {
		$('#province').val(data.provinceName);
		$('#city').val(data.cityName);
		$('#cityCode').val(data.preCodeCity);
		$('#sellerPhone').val(data.phoneNo);
		$('#sellerPostalCode').val(data.postalCode);
		$('#address').val(data.address);
		$('#economicNo').val(data.economicNo);
		$('#nationalCode').val(data.nationalCode);
	    $('#startDate').val(data.startDate);
		$('#finishDate').val(data.finishDate);
		$('#price').val(data.price);	
		if(data.nationalCode==""){
			$("#foreignPersonCode").prop("disabled", false);
		}else{
			$("#foreignPersonCode").prop("disabled", true);
		}
	});
}
function callback_change_contractSideType(e){
	var contractSideType = $("#contractSideType_Comb").data("kendoComboBox")._selectedValue;	
	changePersonType(contractSideType);
}

</script>