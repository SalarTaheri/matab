<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-PurchaseInvoiceItem">

	<input type="hidden" id="id" name="id">
	<input type="hidden" id="convertCoefficient" name="convertCoefficient" value="1">

	<div class="uk-grid uk-grid-preserve numFields">
		<base:comboBoxAutoComplete-buttonNew name="goods_id" key="com.artonis.inv.basicInfo.inventoryGoods.goods_id" iscomboLoaderUrlRelative="true"
								comboLoaderUrl="combo/loadAllGoods" dataTextField="nameAndCode" dataValueField="id" minLength="0" styleClass="normal" hasTemplate="true"
								headerTemplateComaSep="com.artonis.inv.basicInfo.goods.name,com.artonis.inv.basicInfo.goods.code" templateComaSep="name,code"
								popupUrl="popup/goodsInput" relativeSaveUrl="/popupGoods/save" stylediv="padding-right: 14px;"/>
	</div>

	<div class="uk-grid uk-grid-preserve numFields">
		<base:testBox styleClass="small" readOnly="true" name="goodsCode" key="com.artonis.inv.operation.beginPeriodReceiptGoods.goodsCode" />
		<base:cascadeComboBox cascadeCombo="goods_id" styleClass="small" name="measureUnitId" key="com.artonis.inv.receipt.purchaseReceipt.measureUnit"
							  comboLoaderUrl="combo/loadAllMeasureUnitsByGoodsId"/>
	</div>

	<div class="uk-grid uk-grid-preserve numFields">
		<base:testBoxNumericEx styleClass="small" name="goodsAmount" key="com.artonis.inv.receipt.purchaseReceiptGoods.goodsAmount" onChangeFunction="calculateAllItems()" />
		<base:testBoxNumericEx styleClass="small" name="rate" key="com.artonis.inv.receipt.purchaseReceiptGoods.rate" onChangeFunction="calculateAllItems()" />
		<base:testBoxNumericEx styleClass="small" name="impurePrice" key="com.artonis.inv.receipt.purchaseReceiptGoods.impurePrice" onChangeFunction="calculateRate()"/>
	</div>

	<div class="uk-grid uk-grid-preserve numFields">
		<base:testBoxNumericEx styleClass="small" name="discount" key="com.artonis.inv.receipt.purchaseReceiptGoods.discount" onChangeFunction="calculateAllItems()" />
	</div>

	<div class="uk-grid uk-grid-preserve numFields">
		<base:testBoxNumericEx styleClass="small" name="tax" key="com.artonis.inv.receipt.purchaseReceiptGoods.tax" onChangeFunction="calculatePayablePrice()" />
		<base:testBoxNumericEx styleClass="small" name="toll" key="com.artonis.inv.receipt.purchaseReceiptGoods.toll" onChangeFunction="calculatePayablePrice()" />
		<base:testBoxNumericEx styleClass="small" name="carriageFare" key="com.artonis.inv.receipt.purchaseReceiptGoods.carriageFare"
							   onChangeFunction="calculatePayablePrice()" />
	</div>

	<div class="uk-grid uk-grid-preserve numFields">
		<base:testBoxNumericEx styleClass="small" name="payablePrice" key="com.artonis.inv.receipt.purchaseReceiptGoods.payablePrice" disabled="true"/>
	</div>

</form>

<script type="text/javascript">
    function _goods_id_change(e) {
        var goods_id = $("#goods_id_Comb").data("kendoComboBox")._selectedValue;
        var url = getBaseUrl() + "loadGoods/" + goods_id;
        $.getJSON(url, function (data) {
            $('#goodsCode').val(data.code);
        });
    }

    function callback_change_measureUnitId(e) {
        var measureUnit_id = $("#measureUnitId_Comb").data("kendoComboBox")._selectedValue;
        var goods_id = $("#goods_id_Comb").data("kendoComboBox")._selectedValue;
        var url = getBaseUrl() + "loadMeasureUnit/" + measureUnit_id + "/" + goods_id;
        $.getJSON(url, function (data) {
            if (data.length > 0) {
                $("#convertCoefficient").val(data[0].convertCoefficient);
            } else {
                $("#convertCoefficient").val(1);
            }
        });
    }

    function callback_deserialize_PurchaseInvoiceItem(data) {
        var url = getBaseUrl() + "loadGoods/" + data.goods_id;
        $.getJSON(url, function (data) {
            $('#goodsCode').val(data.code);
        });
        //
		if (data.payablePrice == null) {
            data.payablePrice = data.impurePrice;
		}
		//
		setNumericTextValue();
    }

    $(document).ready(function(){
        $(".numFields input[readonly='readonly'],.numFields input:disabled:not(input[role='combobox'])").css("background-color", "lightgray");
	});

    function calculateAllItems() {
        var goodsAmount = $("#goodsAmount").val();
        if (goodsAmount == "") {
            goodsAmount = 0;
        }
        goodsAmount = eval(goodsAmount);
        //
        var rate = $("#rate").val();
        if (rate == "") {
            rate = 0;
        }
        rate = eval(rate);
        //
        var impurePrice = goodsAmount * rate;
        $("#impurePrice").val(impurePrice);
        //
        var discount = $("#discount").val();
        if (discount == "") {
            discount = 0;
        }
        discount = eval(discount);
        //
        var tax = Math.ceil((impurePrice - discount) * (6/100));
        $("#tax").val(tax);
        //
        var toll = Math.ceil((impurePrice - discount) * (9/100)) - tax;
        $("#toll").val(toll);
        //
        var carriageFare = $("#carriageFare").val();
        if (carriageFare == "") {
            carriageFare = 0;
        }
        carriageFare = eval(carriageFare);
        //
        var payablePrice = (impurePrice + tax + toll + carriageFare) - discount;
        $("#payablePrice").val(payablePrice)
        //
        setNumericTextValue();
    }

    function calculatePayablePrice() {
        var goodsAmount = $("#goodsAmount").val();
        if (goodsAmount == "") {
            goodsAmount = 0;
        }
        goodsAmount = eval(goodsAmount);
        //
        var rate = $("#rate").val();
        if (rate == "") {
            rate = 0;
        }
        rate = eval(rate);
        //
        var impurePrice = goodsAmount * rate;
        //
        var discount = $("#discount").val();
        if (discount == "") {
            discount = 0;
        }
        discount = eval(discount);
        //
        var tax = $("#tax").val();
        if (tax == "") {
            tax = 0;
        }
        tax = eval(tax);
        //
        var toll = $("#toll").val();
        if (toll == "") {
            toll = 0;
        }
        toll = eval(toll);
        //
        var carriageFare = $("#carriageFare").val();
        if (carriageFare == "") {
            carriageFare = 0;
        }
        carriageFare = eval(carriageFare);
        //
        var payablePrice = (impurePrice + tax + toll + carriageFare) - discount;
        $("#payablePrice").val(payablePrice)
        //
        setNumericTextValue();
	}

    function calculateRate() {
        var goodsAmount = $("#goodsAmount").val();
        if (goodsAmount == "") {
            goodsAmount = 0;
        }
        goodsAmount = eval(goodsAmount);
        //
        var impurePrice = $("#impurePrice").val();
        if (impurePrice == "") {
            impurePrice = 0;
        }
        impurePrice = eval(impurePrice);
        //
		if (impurePrice > 0 && goodsAmount > 0) {
            $("#rate").val(impurePrice / goodsAmount);
		} else {
            $("#rate").val(0);
		}
        //
        setNumericTextValue();
		//
        var discount = $("#discount").val();
        if (discount == "") {
            discount = 0;
        }
        discount = eval(discount);
        //
        var tax = Math.ceil((impurePrice - discount) * (6/100));
        $("#tax").val(tax);
        //
        var toll = Math.ceil((impurePrice - discount) * (9/100)) - tax;
        $("#toll").val(toll);
        //
        var carriageFare = $("#carriageFare").val();
        if (carriageFare == "") {
            carriageFare = 0;
        }
        carriageFare = eval(carriageFare);
        //
        var payablePrice = (impurePrice + tax + toll + carriageFare) - discount;
        $("#payablePrice").val(payablePrice)
        //
        setNumericTextValue();
    }

</script>

<style>
	.numFields .uk-width-2-10{
		width: 16%;
		padding-right: 15px;
	}

	.numFields .uk-width-1-10{
		width: 13%;
	}

	.numFields input{
		border-radius: 4px;
		border-style: solid;
		border-width: thin;
		border-color: darkgrey;
		padding: 2px;
	}

</style>