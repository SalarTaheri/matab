<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String notAllowUpdate=resource.getString("inventory.m169.operation.purchaseOperation.cannotUpdate");
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
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
	  	<base:buttonPermission key="fnc.btn.new" classNames="uk-button uk-button-success" id="refusalOperationView-new-btn" onClick="javascript:customReload()"/>
	  	<base:buttonPermission key="fnc.btn.register" classNames="uk-button uk-button-success" id="refusalOperationView-register-btn" onClick="javascript:saveRefusalOperation()"/>
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
			<base:comboBox styleClass="midsmall" name="personType" key="com.artonis.inv.m169.operation.refusalOperation.personType" comboLoaderUrl="combo/loadAllPersonType"/>
		
		</div>
			<div class="uk-grid uk-grid-preserve">
		    <base:cascadeComboBox-buttonNew cascadeCombo="personType" styleClass="midsmall" name="person_id" key="inventory.m169.operation.purchaseOperation.person_id"
            		isListConstant="true" comboLoaderUrl="combo/loadAllPerson" popupUrl="/popup/person" relativeSaveUrl="/person/save"/>
	    	<base:comboBox-buttonNew styleClass="midsmall" name="serviceGoods_id" key="inventory.m169.operation.purchaseOperation.serviceGoods_id"
            		isListConstant="true" comboLoaderUrl="combo/loadAllServiceGoods" popupUrl="/popup/serviceGoods" relativeSaveUrl="/serviceGoods/save"/>
			    <base:mDatePicker styleClass="midsmall" name="backBuyerDate" key="com.artonis.inv.m169.operation.refusalOperation.backBuyerDate"></base:mDatePicker>
			<table>
					<tr>
						<td width="170" align="left"><%=ResourceBoundleHolder.resourceBundle.getString("inventory.m169.operation.purchaseOperation.return")%></td>
						<td align="center"><base:checkbox name="return_" style="width: 45px; margin-right: 10px" key="inventory.m169.operation.purchaseOperation.null"/></td>
					</tr>
				</table>
			</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="midsmall"  name="price" key="com.artonis.inv.m169.operation.refusalOperation.price" onChangeFunction="calcTaxTool()"/>
			<base:testBoxNumericEx  styleClass="midsmall" name="tax"  key="inventory.m169.operation.purchaseOperation.tax" onChangeFunction="sumAll()"/>
	        <base:testBoxNumericEx styleClass="midsmall"  name="toll" key="inventory.m169.operation.purchaseOperation.toll" onChangeFunction="sumAll()"/>
			<base:testBoxNumericEx styleClass="midsmall"  name="sum" key="inventory.m169.operation.purchaseOperation.sum" disabled="true"/>
	
			</div>
		<div style="padding-top: 12px" class="turnItems">		
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="province"  key="inventory.m169.operation.purchaseOperation.province" disabled="true"/>
			<base:testBox styleClass="midsmall" name="city"  key="inventory.m169.operation.purchaseOperation.city" disabled="true"/>
			<base:textArea name="address" divWidthVal="40"  key="inventory.m169.operation.purchaseOperation.address"  disabled="true"/>
		</div>
		</div>
		 <div class="uk-grid uk-grid-preserve">
		 </div>
	    <div class="uk-grid uk-grid-preserve">
		    <base:textArea name="description" divWidthVal="40"  key="inventory.m169.operation.purchaseOperation.description"/>
		</div>
	</form>
</div>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single" noEditButton="true">
	<base:my-grid-column title='com.artonis.inv.m169.operation.refusalOperation.personType'  field="personTypeTxt" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.operation.refusalOperation.person_id'  field="personName" width="50px"/>
	<base:my-grid-column title='inventory.m169.operation.purchaseOperation.serviceGoods_id'  field="goodsName" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.operation.refusalOperation.backBuyerDate'  field="backBuyerDate" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.operation.refusalOperation.price'  field="price" width="50px"/>
	<base:my-grid-column title='inventory.m169.operation.purchaseOperation.tax'  field="taxText" width="50px"/>
	<base:my-grid-column title='inventory.m169.operation.purchaseOperation.toll'  field="tollText" width="50px"/>

    <base:my-grid-schema-field name="personTypeTxt" type="string"/>
    <base:my-grid-schema-field name="personName" type="string"/>
    <base:my-grid-schema-field name="goodsName" type="string"/>  
    <base:my-grid-schema-field name="backBuyerDate" type="string"/>  
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
		$('#sellerPhone').val(data.phoneNo);
		$('#sellerPostalCode').val(data.postalCode);
		$('#address').val(data.address);
		$('#economicNo').val(data.economicNo);
		$('#nationalCode').val(data.nationalCode);
	});
}
function saveRefusalOperation(){
	var data = {};
	data.id=$("#loadedId").val();
	data.seasonVat_id=$("#seasonVat_id").val();
	data.personType=$("#personType").val();
	data.person_id=$("#person_id").val();
	data.serviceGoods_id=$("#serviceGoods_id").val();
	data.return_=$('#return_')[0].checked;
	data.price=$("#price").val();
	data.tax=$("#tax").val();
	data.toll=$("#toll").val();
	data.backBuyerDate=$("#backBuyerDate").val();
	data.description=$("#description").val();	
	data.state=1;

	$.ajax({
		url: '${pageContext.request.contextPath}'+'/inventory/m169/operation/refusalOperation/save',
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
		
		//changeCheckbox();
    	$('#serviceGoods_id').val(data.serviceGoods_id);
        $("#serviceGoods_id_Comb").data("kendoComboBox").value(data.serviceGoods_id);
    	$('#personType').val(data.personType);
        $("#personType_Comb").data("kendoComboBox").value(data.personType);
    	//checkSellerType(data.sellerType);
		//changePersonType(data.personType);
		$('#person_id').val(data.person_id);
		$("#person_id_Comb").data("kendoComboBox").value(data.person_id);
		loadPersonValues(data.person_id);
		var returnValue = data.foreignPersonCode;
		if(returnValue == false){
			$('#return_').prop('checked','');
		}else{
			$('#return_').prop('checked','true');
		}
		$('#backBuyerDate').val(data.backBuyerDate);
		$('#price').val(data.price);
		$('#tax').val(data.tax);
		$('#toll').val(data.toll);
		sumAll();
    }
}
function loadPersonValues(personId){
	var url = getBaseUrl() + "loadPerson/" + personId ; 
	$.getJSON(url, function (data) {
		$('#province').val(data.provinceName);
		$('#city').val(data.cityName);
		$('#cityCode').val(data.preCodeCity);
		$('#sellerPhone').val(data.phoneNo);
		$('#sellerPostalCode').val(data.postalCode);
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

</script>