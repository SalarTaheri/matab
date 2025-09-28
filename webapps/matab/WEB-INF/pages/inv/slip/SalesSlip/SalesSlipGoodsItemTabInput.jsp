<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-SalesSlipGoodsItem">
	<input type="hidden" id="id" name="id">
	<div class="uk-grid uk-grid-preserve">
		<base:comboBoxAutoComplete-buttonNew name="goodsId" key="com.artonis.inv.slip.salesSlipGoods.goods" templateComaSep="name,code"
			iscomboLoaderUrlRelative="true" comboLoaderUrl="combo/loadAllGoods" dataTextField="nameAndCode" dataValueField="id" minLength="0" styleClass="small"
			hasTemplate="true" headerTemplateComaSep="com.artonis.inv.basicInfo.goods.name,com.artonis.inv.basicInfo.goods.code" 
			popupUrl="popup/goodsInput" relativeSaveUrl="/popupGoods/save"/>
			
		<base:testBox styleClass="small" name="goodsCode" dataIgnore="true" key="com.artonis.inv.slip.salesSlipGoods.goodsCode" disabled="true" readOnly="true"/>
		<base:cascadeComboBox cascadeCombo="goodsId" styleClass="small" name="measureUnitId" key="com.artonis.inv.slip.salesSlipGoods.measureUnit"
							  comboLoaderUrl="combo/loadAllMeasureUnitsByGoodsId" />
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="small" name="amount" key="com.artonis.inv.slip.salesSlipGoods.amount" onChangeFunction="amountChanged()" />
	</div>
</form>

<script type="text/javascript">
	function _goodsId_change(e) {
		var goodsId = $("#goodsId_Comb").data("kendoComboBox")._selectedValue;
		var url = getBaseUrl() + "loadGoods/" + goodsId;
		$.getJSON(url, function(data) {
			$('#goodsCode').val(data.code);
		});
	}

    function amountChanged() {
        if ($("#rate").val().length > 0) {
            rateChanged();
        } else if ($("#sum").val().length > 0) {
            sumChanged();
        }
    }

    function rateChanged() {
        if ($("#amount").val().length > 0) {
            var sum = $("#rate").val() * $("#amount").val();
            $("#sum").val(sum);
            $("#sum_txt").val(addComma(sum));
        }
    }

    function sumChanged() {
        if ($("#amount").val().length > 0) {
            var rate = $("#sum").val() / $("#amount").val();
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
	
	function callback_deserialize_SalesSlipGoodsItem(data){
		var url = getBaseUrl() + "loadGoods/" + data.goodsId;
		$.getJSON(url, function(data) {
			$('#goodsCode').val(data.code);
		});
	}
</script>
