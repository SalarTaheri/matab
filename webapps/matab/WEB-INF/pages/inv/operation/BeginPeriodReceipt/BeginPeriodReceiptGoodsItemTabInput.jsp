<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-BeginPeriodReceiptGoodsItem">
	<input type="hidden" id="id" name="id">
	<input type="hidden" id="sum" name="sum">
	<input type="hidden" id="convertCoefficient" name="convertCoefficient" value="1">
	<div class="uk-grid uk-grid-preserve">
		<base:comboBoxAutoComplete-buttonNew name="goods_id" key="com.artonis.inv.basicInfo.inventoryGoods.goods_id" templateComaSep="name,code"
			iscomboLoaderUrlRelative="true" comboLoaderUrl="combo/loadAllGoods" dataTextField="nameAndCode" dataValueField="id" minLength="0" styleClass="small"
			hasTemplate="true" headerTemplateComaSep="com.artonis.inv.basicInfo.goods.name,com.artonis.inv.basicInfo.goods.code" 
			popupUrl="popup/goodsInput" relativeSaveUrl="/popupGoods/save"/> 
			
		<base:testBox  name="goodsCode"  key="com.artonis.inv.operation.beginPeriodReceiptGoods.goodsCode" disabled="true" styleClass="small"/>

		<base:cascadeComboBox cascadeCombo="goods_id" styleClass="small" name="measureUnitId" key="com.artonis.inv.operation.beginPeriodReceiptGoods.measureUnit"
							  comboLoaderUrl="combo/loadAllMeasureUnitsByGoodsId" />
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="small" name="goodsAmount" key="com.artonis.inv.operation.beginPeriodReceiptGoods.goodsAmount" onChangeFunction="goodsAmountChanged()" />

		<%if(GlobalVariable.getButtonContainer("011003003002","setRate")){%>
			<base:testBoxNumericEx styleClass="small" name="rate" key="com.artonis.inv.operation.beginPeriodReceiptGoods.rate" onChangeFunction="rateChanged()" />
			<base:testBoxNumericEx styleClass="small" name="sumStr" key="com.artonis.inv.operation.beginPeriodReceiptGoods.sum"  onChangeFunction="sumChanged()" disabled="true" />
		<%}%>

	</div>
</form>

<script type="text/javascript">
	function _goods_id_change(e) {
		$("#goods_id").val("");
		$("#goods_id_txt").val("");
		var goods_id = $("#goods_id_Comb").data("kendoComboBox")._selectedValue;
		var url = getBaseUrl() + "loadGoods/" + goods_id;
		$.getJSON(url, function(data) {
			$('#goodsCode').val(data.code);
		});
	}
	
	function goodsAmountChanged() {
		if($("#rate").val().length > 0) {
			rateChanged();
		} else if($("#sumStr").val().length > 0) {
			sumChanged();
		}
	}
	
	function rateChanged() {
		if($("#goodsAmount").val().length > 0) {
			if($("#convertCoefficient").val()=="") {
				$("#convertCoefficient").val(1)
			}
			var sum = $("#rate").val() * $("#goodsAmount").val()*$("#convertCoefficient").val();
			$("#sum").val(sum);
			$("#sumStr").val(sum);
			$("#sumStr_txt").val(addComma(sum));
		}
	}
	
	function sumChanged() {
		if($("#goodsAmount").val().length > 0) {
			var rate = $("#sumStr").val() / $("#goodsAmount").val();
			$("#rate").val(rate);
			$("#rate_txt").val(addComma(rate));
		}
	}

	function addComma(data) {
		data = String(data);
		
		var parts = data.split(".");
		data = parts[0];
		var decimal = parts.length > 1 ? "." + parts[1] : "";
		
		var rgx = /(\d+)(\d{3})/;
		while (rgx.test(data)) {
			data = data.replace(rgx, '$1' + ',' + '$2');
		}
		
		return data + decimal;
	}

	function callback_change_measureUnitId(e){
		var measureUnit_id = $("#measureUnitId_Comb").data("kendoComboBox")._selectedValue;
		var goods_id = $("#goods_id_Comb").data("kendoComboBox")._selectedValue;
		var url = getBaseUrl() + "loadMeasureUnit/" + measureUnit_id+"/"+goods_id;
		$.getJSON(url, function(data) {
			  if(data.length>0){
				  $("#convertCoefficient").val(data[0].convertCoefficient);
			  }else{
				  $("#convertCoefficient").val(1);
			  }
			if($("#sum").val()!=""){
				if($("#convertCoefficient").val()==""){
					$("#convertCoefficient").val(1);
				}
				var sum = $("#rate").val() * $("#goodsAmount").val()*$("#convertCoefficient").val();
				$("#sum").val(sum);
				$("#sumStr").val(sum);
				$("#sumStr_txt").val(addComma(sum));
			}
		});

	}
</script>