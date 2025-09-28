<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<base:pageHeader />

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">

		<div class="uk-grid uk-grid-preserve" style="margin-bottom: 10px;">

			<base:multiSelect serverFilter="true" name="inventory_ids" styleClass="small" multiSelectLoaderUrl="combo/loadAllInventory"
							  key="com.artonis.inv.operation.goodsSupply.inventoryName" />

			<base:multiSelect serverFilter="true" name="goods_ids" styleClass="normal" multiSelectLoaderUrl="combo/loadAllGoods"
							  key="com.artonis.inv.operation.goodsSupply.goodsName" />

		</div>
		<div class="uk-grid uk-grid-preserve" style="margin-bottom: 10px;">
			<base:multiSelect serverFilter="true" styleClass="small" name="goodsTypeIds" key="com.artonis.inv.operation.goodsSupply.goodsType"
							  multiSelectLoaderUrl="combo/loadAllGoodsTypes"/>
			<base:multiSelect serverFilter="true" styleClass="small" name="goodsCategoryIds" key="com.artonis.inv.operation.goodsSupply.goodsCategory"
							  multiSelectLoaderUrl="combo/loadAllGoodsCategoris"/>

		</div>
		<div class="uk-grid uk-grid-preserve" style="margin-bottom: 10px;">
			<base:comboBox styleClass="small" name="financeyear_id"
						   key="com.artonis.inv.operation.goodsSupply.financeyear_name"  comboLoaderUrl="combo/loadAllFinanceYear"/>
			<base:checkbox name="isShowNotZero" key="com.artonis.inv.operation.goodsSupply.isShowNotZero" styleClass="small"/>
		</div>


		<base:my-grid-search showOperation="false">
			<base:my-grid-column title='com.artonis.inv.operation.goodsSupply.goodsName' field="goodsName" width="80px" />
			<base:my-grid-column title='com.artonis.inv.operation.goodsSupply.goodsCode' field="goodsCode" width="30px" />
			<base:my-grid-column title='com.artonis.inv.operation.goodsSupply.basemeasureUnitName' field="basemeasureUnitName" width="30px" />
			<base:my-grid-column title='com.artonis.inv.operation.goodsSupply.goodsType' field="goodsTypeName" width="30px" />
			<base:my-grid-column title='com.artonis.inv.operation.goodsSupply.goodsCategory' field="goodsCategoryName" width="30px" />
			<base:my-grid-column title='com.artonis.inv.operation.goodsSupply.inventoryName' field="inventoryName" width="50px" />
			<base:my-grid-column title='com.artonis.inv.operation.goodsSupply.inventoryCode' field="inventoryCode" width="30px" />
			<base:my-grid-column title='com.artonis.inv.operation.goodsSupply.remaining' field="remaining" width="40px" />
			<base:my-grid-column title='com.artonis.inv.operation.goodsSupply.financeyear_name' field="financeyear_name" width="40px" />
		</base:my-grid-search>

	</form>
</div>

<base:footer />

<script type="text/javascript">

	function getSearchObject() {
		var searchObject = {};

        ////---- This part is for get values from multiSelects -----------
        var getOptionArray = function(options){
            var arr = [];
            for(var i=0;i<options.length;i++){
                arr[i]=options[i].value;
            }
            return arr;
        };
        $("*[data-role='multiselect']").each(function(){
            searchObject[this.id.replace("_multiSelect","")] = getOptionArray(this.selectedOptions);
        })
        searchObject.isShowNotZero = $("#isShowNotZero").is(":checked");
        searchObject.financeyear_id = $("#financeyear_id").val();
        searchObject.financeyear_name=$("#financeyear_id_Comb").data("kendoComboBox").text()
        ////---------- END -------------

		return searchObject;
	}

    function callback_DataBound_financeyear_id(e) {
        $.ajax({
            url: getBaseUrl() + "getActiveFinanceYear",
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            type: 'GET',
            success: function (data) {
                if (data != null) {
                    $("#financeyear_id_Comb").data("kendoComboBox").value(data.activeFinanceYearId);
                    $("#financeyear_id").val(data.activeFinanceYearId);
                }
            },
            error: function (e) {
                console.log('Error: ' + e.responseText);
            }
        });
    }

</script>

