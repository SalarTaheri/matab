<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<base:pageHeader />

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">

		<div class="uk-grid uk-grid-preserve">

			<base:multiSelect serverFilter="true" name="inventory_ids" styleClass="small" multiSelectLoaderUrl="combo/loadAllInventory"
							  key="com.artonis.inv.reports.receiptAndSlip.inventoryName" />

			<base:multiSelect serverFilter="true" name="goods_ids" styleClass="normal" multiSelectLoaderUrl="combo/loadAllGoods"
							  key="com.artonis.inv.reports.receiptAndSlip.goodsName" />

		</div>
		<div class="uk-grid uk-grid-preserve" style="margin-bottom: 10px;">
			<base:mDatePicker styleClass="small" name="fromDate" key="com.artonis.inv.reports.receiptAndSlip.fromDate" />
			<base:mDatePicker styleClass="small" name="toDate" key="com.artonis.inv.reports.receiptAndSlip.toDate" />
		</div>

		<base:my-grid-search showOperation="false">
			<base:my-grid-column title='com.artonis.inv.reports.receiptAndSlip.inventoryName' field="inventoryName" width="50px" />
			<base:my-grid-column title='com.artonis.inv.reports.receiptAndSlip.documentName' field="documentName" width="50px" />
			<base:my-grid-column title='com.artonis.inv.reports.receiptAndSlip.documentDate' field="documentDate" width="40px" />
			<base:my-grid-column title='com.artonis.inv.reports.receiptAndSlip.goodsName' field="goodsName" width="80px" />
			<base:my-grid-column title='com.artonis.inv.reports.receiptAndSlip.issuer' field="issuerFullName" width="60px" />
			<base:my-grid-column title='com.artonis.inv.reports.receiptAndSlip.incomingAmount' field="incomingAmount" width="40px" />
			<base:my-grid-column title='com.artonis.inv.reports.receiptAndSlip.outgoingAmount' field="outgoingAmount" width="40px" />
		</base:my-grid-search>

	</form>
</div>

<base:footer />

<script type="text/javascript">

	function getSearchObject() {
        var searchObject = {};
		if($("#fromDate").val()!=""){
			searchObject.fromDate = $("#fromDate").val();
		}
		if($("#toDate").val()!=""){
			searchObject.toDate = $("#toDate").val();
		}

        ////---- This part is for get values from multiSelects -----------
        var getOptionArray = function (options) {
            var arr = [];
            for (var i = 0; i < options.length; i++) {
                arr[i] = options[i].value;
            }
            return arr;
        };
        $("*[data-role='multiselect']").each(function () {
            searchObject[this.id.replace("_multiSelect", "")] = getOptionArray(this.selectedOptions);
        })
        ////---------- END -------------

        return searchObject;
	}

</script>

