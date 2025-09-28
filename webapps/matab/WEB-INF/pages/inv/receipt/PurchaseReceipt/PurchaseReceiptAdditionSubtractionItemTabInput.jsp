<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-PurchaseReceiptAdditionSubtractionItem">
	<input type="hidden" id="id" name="id">
	<div class="uk-grid uk-grid-preserve">
		<base:comboBox comboLoaderUrl="combo/loadAllSurplusDeficits" styleClass="small" name="surplusDeficitId"
			key="com.artonis.inv.receipt.purchaseReceiptAdditionSubtraction.additionSubtraction" />
		<base:testBoxNumericEx styleClass="small" name="price" key="com.artonis.inv.receipt.purchaseReceiptAdditionSubtraction.price" />
		<base:comboBox comboLoaderUrl="combo/loadAllValueAddedTax" styleClass="small" name="valueAddedtax"
			key="com.artonis.inv.receipt.purchaseReceiptAdditionSubtraction.valueAddedtax" />
	</div>
	<div id="hasTax">
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="small" name="tax" key="com.artonis.inv.receipt.purchaseReceiptAdditionSubtraction.tax" />
			<base:testBoxNumericEx styleClass="small" name="toll" key="com.artonis.inv.receipt.purchaseReceiptAdditionSubtraction.toll" />
		</div>
	</div>
</form>

<script type="text/javascript">
	function callback_change_valueAddedtax(e) {
		var accountChoiceVal = $("#valueAddedtax_Comb").data("kendoComboBox")._selectedValue;
		if (accountChoiceVal == 2)
			$("#hasTax").slideToggle(600);
		if (accountChoiceVal == 1) {
			$("#hasTax").hide(600);
		}
	}
	function callback_DataBound_valueAddedtax(data) {
		var accountChoiceVal = $("#valueAddedtax_Comb").data("kendoComboBox")._selectedValue;
		if (accountChoiceVal == 2)
			$("#hasTax").slideToggle(600);
		if (accountChoiceVal == 1) {
			$("#hasTax").hide(600);
		}
	}
</script>