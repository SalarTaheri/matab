<%@page import="org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@page import="java.util.ResourceBundle"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
String context = ((SecurityContextHolderAwareRequestWrapper) pageContext.getRequest()).getContextPath();
String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
ResourceBundle resource = ResourceBundle.getBundle("application_fa");
String notAllowUpdate=resource.getString("inventory.m169.operation.purchaseOperation.cannotUpdate");
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
		  	<base:buttonPermission key="fnc.btn.new" classNames="uk-button uk-button-success" id="saleOperationView-new-btn" onClick="javascript:customReload()"/>
		  	<base:buttonPermission key="fnc.btn.register" classNames="uk-button uk-button-success" id="saleOperationView-register-btn" onClick="javascript:saveSaleOperation()"/>
	</div>
</div>
<div class="uk-container uk-container-center my-uk-container" style="">
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id">
		<input type="hidden" id="seasonVat_id" name="seasonVat_id">
		<input type="hidden" id="taxPercent" name="taxPercent">
		<input type="hidden" id="complicationPercent" name="complicationPercent">
		
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="year" key="inventory.m169.operation.saleOperation.year" disabled="true"/>
			<base:testBox styleClass="midsmall" name="season" key="inventory.m169.operation.saleOperation.season" disabled="true"/>
			<table >
				<tr>
					<td width="250" align="left"><%=ResourceBoundleHolder.resourceBundle.getString("inventory.m169.operation.purchaseOperation.tradingBelow10Percent")%></td>
					<td align="center"><base:checkbox name="tradingBelow10Percent" onChangeFunction="changeCheckbox()" style="width: 15px; margin-right: 10px" key="inventory.m169.operation.purchaseOperation.null"/></td>
					<td width="170" align="left"><%=ResourceBoundleHolder.resourceBundle.getString("inventory.m169.operation.purchaseOperation.return")%></td>
					<td align="center"><base:checkbox name="return_" style="width: 15px; margin-right: 10px" key="inventory.m169.operation.purchaseOperation.null"/></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 12px" class="turnItems">		
			<div class="uk-grid uk-grid-preserve">
				<base:comboBox styleClass="midsmall" name="buyerType" key="inventory.m169.operation.saleOperation.buyerType" comboLoaderUrl="combo/loadAllBuyerType"/>
			  	<base:comboBox-buttonNew styleClass="midsmall" name="serviceGoods_id" key="inventory.m169.operation.purchaseOperation.serviceGoods_id"
            		isListConstant="true" comboLoaderUrl="combo/loadAllServiceGoods" popupUrl="/popup/serviceGoods" relativeSaveUrl="/serviceGoods/save"/>
			<base:comboBox styleClass="midsmall" name="personType" key="com.artonis.inv.m169.operation.refusalOperation.personType" comboLoaderUrl="combo/loadAllPersonType"/>			
			<base:cascadeComboBox-buttonNew cascadeCombo="personType" styleClass="midsmall" name="person_id" key="inventory.m169.operation.purchaseOperation.person_id"
            		isListConstant="true" comboLoaderUrl="combo/loadAllPerson" popupUrl="/popup/person" relativeSaveUrl="/person/save"/>	
				</div>
			<div class="uk-grid uk-grid-preserve">
				<base:testBox styleClass="midsmall" name="economicNo" key="inventory.m169.operation.saleOperation.economicNo" disabled="true"/>
				<base:testBox styleClass="midsmall" name="nationalCode" key="inventory.m169.operation.saleOperation.nationalCode" disabled="true"/>
				<base:testBox styleClass="midsmall" name="foreignPersonCode" key="inventory.m169.operation.saleOperation.foreignPersonCode"/>
			</div>
		
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="midsmall" name="price" key="inventory.m169.operation.saleOperation.price" onChangeFunction="calcTaxTool()"/>
			<base:testBoxNumericEx styleClass="midsmall" name="tax" key="inventory.m169.operation.saleOperation.tax" onChangeFunction="sumAll()"/>
		    <base:testBoxNumericEx styleClass="midsmall" name="toll" key="inventory.m169.operation.saleOperation.toll" onChangeFunction="sumAll()"/>
			<base:testBoxNumericEx styleClass="midsmall" name="sum" key="inventory.m169.operation.saleOperation.sum" disabled="true"/>
		</div>
		
		<div style="padding-top: 12px" class="turnItems" id="personInfos">		
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="province" key="inventory.m169.operation.saleOperation.province" disabled="true"/>
			<base:testBox styleClass="midsmall" name="city" key="inventory.m169.operation.saleOperation.city" disabled="true"/>
			<base:testBox styleClass="midsmall" name="cityCode" key="inventory.m169.operation.saleOperation.cityCode" disabled="true"/>
			<base:testBox styleClass="midsmall" name="buyerPhone" key="inventory.m169.operation.saleOperation.buyerPhone" disabled="true"/>
	
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="buyerPostalCode" key="inventory.m169.operation.saleOperation.buyerPostalCode" disabled="true"/>
			<base:textArea name="address" key="inventory.m169.operation.saleOperation.address" disabled="true" width="500"/>
		
		</div>
        </div>
        <div class="uk-grid uk-grid-preserve">
        </div>
        <div class="uk-grid uk-grid-preserve">
		    <base:textArea name="description" divWidthVal="65"  key="inventory.m169.operation.purchaseOperation.description"/>
		</div>
	</form>
</div>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single" noEditButton="true">
	<base:my-grid-column title='inventory.m169.operation.purchaseOperation.seasonVat_name'  field="seasonVat_name" width="50px"/>
	<base:my-grid-column title='inventory.m169.operation.purchaseOperation.serviceGoods_name'  field="serviceGoods_name" width="50px"/>
	<base:my-grid-column title='inventory.m169.operation.purchaseOperation.person_fullName'  field="person_fullName" width="50px"/>
	<base:my-grid-column title='inventory.m169.operation.purchaseOperation.sellerType'  field="sellerTypeText" width="50px"/>
	<base:my-grid-column title='inventory.m169.operation.purchaseOperation.price'  field="price" width="50px"/>
	<base:my-grid-column title='inventory.m169.operation.purchaseOperation.tax'  field="taxText" width="50px"/>
	<base:my-grid-column title='inventory.m169.operation.purchaseOperation.toll'  field="tollText" width="50px"/>

    <base:my-grid-schema-field name="seasonVat_name" type="string"/>
    <base:my-grid-schema-field name="serviceGoods_name" type="string"/>
    <base:my-grid-schema-field name="person_fullName" type="string"/>
    <base:my-grid-schema-field name="sellerTypeText" type="string"/>
    <base:my-grid-schema-field name="price" type="long"/>
    <base:my-grid-schema-field name="taxText" type="long"/>
    <base:my-grid-schema-field name="tollText" type="long"/>
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
	var buyerTypeVal = $("#buyerType_Comb").data("kendoComboBox")._selectedValue;
    if(personTypeVal=="1"){
		$("#economicNo").prop("disabled", true);
		$("#economicNo").css('background-color','rgb(206, 215, 235)');
		$("#nationalCode").prop("disabled", false);
		$("#nationalCode").css('background-color','');
		$("#foreignPersonCode").prop("disabled", true);
		$("#foreignPersonCode").css('background-color','rgb(206, 215, 235)');
	}else if(personTypeVal!="1" && buyerTypeVal=="1"){
		$("#economicNo").prop("disabled", false);
		$("#economicNo").css('background-color','');
		$("#nationalCode").prop("disabled", true);
		$("#nationalCode").css('background-color','rgb(206, 215, 235)');
		
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
function grid_onEdit(e){
	var data = this.dataItem($(e.target).closest("tr"));
	if(data.state==1 || data.state==2)
	alertify.alert("<%=notAllowUpdate%>");
	else
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
		changeCheckbox();
    	$('#serviceGoods_id').val(data.serviceGoods_id);
        $("#serviceGoods_id_Comb").data("kendoComboBox").value(data.serviceGoods_id);
        $('#buyerType').val(data.buyerType);
        $("#buyerType_Comb").data("kendoComboBox").value(data.buyerType);
        $('#personType').val(data.personType);
        $("#personType_Comb").data("kendoComboBox").value(data.personType);
        changeBuyerType(data.buyerType);
        changePersonType(data.personType);
		$('#person_id').val(data.person_id);
		$("#person_id_Comb").data("kendoComboBox").value(data.person_id);
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
		sumAll();
    }
}
function callback_change_buyerType(e){
	var buyerTypeVal = $("#buyerType_Comb").data("kendoComboBox")._selectedValue;
	changeBuyerType(buyerTypeVal);
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
	$('#sum').val(Number($('#tax').val()) + Number($('#toll').val()) + Number(price));
	setNumericTextValue();
}
function sumAll(){
	$('#sum').val(Number($('#tax').val()) + Number($('#toll').val()) + Number($('#price').val()));
	setNumericTextValue();
}
function callback_change_person_id(e){
	var personId = $("#person_id_Comb").data("kendoComboBox")._selectedValue;
	var url = getBaseUrl() + "loadPerson/" + personId ; 
	$.getJSON(url, function (data) {
		$('#province').val(data.provinceName);
		$('#city').val(data.cityName);
		$('#cityCode').val(data.preCodeCity);
		$('#buyerPhone').val(data.phoneNo);
		$('#buyerPostalCode').val(data.postalCode);
		$('#address').val(data.address);
		$('#economicNo').val(data.economicNo);
		$('#nationalCode').val(data.nationalCode);
		$('#foreignPersonCode').val(data.clientCode);
	});
}

function saveSaleOperation(){
	var data = {};
	data.id=$("#loadedId").val();
	data.seasonVat_id=$("#seasonVat_id").val();
	data.tradingBelow10Percent=$('#tradingBelow10Percent')[0].checked;
	data.serviceGoods_id=$("#serviceGoods_id").val();
	data.buyerType=$("#buyerType").val();
	data.person_id=$("#person_id").val();
	data.foreignPersonCode=$("#foreignPersonCode").val();
	data.return_=$('#return_')[0].checked;
	data.price=$("#price").val();
	data.tax=$("#tax").val();
	data.toll=$("#toll").val();
	data.description=$("#description").val();
	data.state=1;

	$.ajax({
		url: '${pageContext.request.contextPath}'+'/inventory/m169/operation/saleOperation/save',
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
					$(':input').val('');
					$('#tradingBelow10Percent').prop('checked','');
					changeCheckbox();
					$('#return_').prop('checked','');
					loadActiveSeason();
					$("#loadedId").val("");
					$("#grid").data("kendoGrid").dataSource.read();
					}
		},
		error: function (e) {
			alert('Error: ' + e.responseText);
		}
	});
}
function callback_change_personType(e){
	var personTypeVal = $("#personType_Comb").data("kendoComboBox")._selectedValue;	
	changePersonType(personTypeVal);
}
function checkSellerType(sellerTypeVal){
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
function loadPersonValues(personId){
	var url = getBaseUrl() + "loadPerson/" + personId ; 
	$.getJSON(url, function (data) {
		$('#province').val(data.provinceName);
		$('#city').val(data.cityName);
		$('#cityCode').val(data.preCodeCity);
		$('#buyerPhone').val(data.phoneNo);
		$('#buyerPostalCode').val(data.postalCode);
		$('#address').val(data.address);
		$('#economicNo').val(data.economicNo);
		$('#nationalCode').val(data.nationalCode);
		if(data.nationalCode==""){
			$("#foreignPersonCode").prop("disabled", false);
		}else{
			$("#foreignPersonCode").prop("disabled", true);
		}
	});
}
function changeBuyerType(buyerTypeVal){
	if(buyerTypeVal=="1"){
		$("#person_id_Comb").data("kendoComboBox").enable(true);
		$("#person_id_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%";
		$("#economicNo").prop("disabled", false);
		$("#economicNo").css('background-color','');
		$("#nationalCode").prop("disabled", false);
		$("#nationalCode").css('background-color','');
		$("#foreignPersonCode").prop("disabled", true);
		$("#foreignPersonCode").css('background-color','rgb(206, 215, 235)');
		$("#serviceGoods_id_Comb").data("kendoComboBox").enable(true);
		$("#serviceGoods_id_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%";
		$("#button-serviceGoods_id-new").attr("disabled", false);
		$("#personType_Comb").data("kendoComboBox").enable(true);
		$("#personType_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%";
	    $("#description").prop("disabled", false);
		$("#description").css('background-color','');	
		$("#tradingBelow10Percent").attr("disabled", false);	
	
		var mainWrapper = $("#personInfos");
		mainWrapper.find('input, textarea, button').each(function () {
		$(this).prop('disabled', false);
		});
		var mainWrapperPos = mainWrapper.position();
		var mainWrapperHeight = mainWrapper.height();
		var mainWrapperWidth = mainWrapper.width();
		$("#personInfos").css({
		    'opacity':1,
		    'top': mainWrapperPos.top,
		    'left': mainWrapperPos.left,
		    'height': mainWrapperHeight,
		    'width': $('#personInfos').width()
		});
	}else if(buyerTypeVal=="2"){
		$("#serviceGoods_id_Comb").data("kendoComboBox").enable(true);
		$("#serviceGoods_id_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%";
		$("#button-serviceGoods_id-new").attr("disabled", false);
		$("#personType_Comb").data("kendoComboBox").enable(true);
		$("#personType_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%";
	    $("#description").prop("disabled", false);
		$("#description").css('background-color','');	
		$("#person_id_Comb").data("kendoComboBox").enable(false);
		$("#person_id_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%; background: rgb(206, 215, 235);";
		$("#economicNo").prop("disabled", true);
		$("#economicNo").css('background-color','rgb(206, 215, 235)');
		$("#nationalCode").prop("disabled", true);
		$("#nationalCode").css('background-color','rgb(206, 215, 235)');
		$("#foreignPersonCode").prop("disabled", false);
		$("#foreignPersonCode").css('background-color','');
		$("#tradingBelow10Percent").attr("disabled", false);	
		var mainWrapper = $("#personInfos");
		mainWrapper.find('input, textarea, button').each(function () {
		$(this).prop('disabled', false);
		});
		var mainWrapperPos = mainWrapper.position();
		var mainWrapperHeight = mainWrapper.height();
		var mainWrapperWidth = mainWrapper.width();
		$("#personInfos").css({
		    'opacity':1,
		    'top': mainWrapperPos.top,
		    'left': mainWrapperPos.left,
		    'height': mainWrapperHeight,
		    'width': $('#personInfos').width()
		});
	}
	else if(buyerTypeVal=="3"){
		$("#serviceGoods_id_Comb").data("kendoComboBox").enable(false);
		$("#serviceGoods_id_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%; background: rgb(206, 215, 235);";
		$("#button-serviceGoods_id-new").attr("disabled", true);
		$("#personType_Comb").data("kendoComboBox").enable(false);
		$("#personType_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%; background: rgb(206, 215, 235);";
		$("#person_id_Comb").data("kendoComboBox").enable(false);
		$("#person_id_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%; background: rgb(206, 215, 235);";
		$("#economicNo").prop("disabled", true);
		$("#economicNo").css('background-color','rgb(206, 215, 235)');
		$("#nationalCode").prop("disabled", true);
		$("#nationalCode").css('background-color','rgb(206, 215, 235)');
		$("#foreignPersonCode").prop("disabled", true);
		$("#foreignPersonCode").css('background-color','rgb(206, 215, 235)');
		$("#description").prop("disabled", true);
		$("#description").css('background-color','rgb(206, 215, 235)');
		$("#tradingBelow10Percent").attr("disabled", true);
		var mainWrapper = $("#personInfos");
		mainWrapper.find('input, textarea, button').each(function () {
		    $(this).prop('disabled', true);
		});
		var mainWrapperPos = mainWrapper.position();
		var mainWrapperHeight = mainWrapper.height();
		var mainWrapperWidth = mainWrapper.width();
		$("#personInfos").css({
		    'opacity':0.3,
		    'top': mainWrapperPos.top,
		    'left': mainWrapperPos.left,
		    'height': mainWrapperHeight,
		    'width': $('#personInfos').width()
		});

	}
}
</script>