<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-RequestGoodsGoods">

    <input type="hidden" id="state" name="state">

    <div class="uk-grid uk-grid-preserve">
        <base:comboBoxAutoComplete name="goodsId" key="com.artonis.inv.operation.RequestGoodsGoods.goods_id" templateComaSep="name,code"
               iscomboLoaderUrlRelative="true" comboLoaderUrl="combo/loadAllGoods" dataTextField="nameAndCode" dataValueField="id" minLength="0"
               styleClass="small" hasTemplate="true" headerTemplateComaSep="com.artonis.inv.basicInfo.goods.name,com.artonis.inv.basicInfo.goods.code" pageSize="20"/>

        <base:cascadeComboBox cascadeCombo="goodsId" styleClass="verysmall" name="measureUnitId" key="com.artonis.inv.operation.RequestGoodsGoods.unit"
                              comboLoaderUrl="combo/loadAllMeasureUnitsByGoodsId"/>

        <base:testBoxNumericEx styleClass="verysmall" name="requestedAmount" key="com.artonis.inv.operation.RequestGoodsGoods.requestedAmount"/>
    </div>

    <div class="uk-grid uk-grid-preserve">
        <base:testBox styleClass="small" name="description" key="com.artonis.inv.operation.RequestGoodsGoods.description"/>
    </div>

</form>

<style>
    input {
        margin-bottom: 0;
        border-radius: 4px;
        border: 1px solid;
        border-color: #a99f9a;
        padding: 3px;
    }
    .k-input{
        height: auto !important;
        padding: 4px !important;
    }
    #itemState, #acceptedAmount_txt {
        background: #dadada;
    }
</style>
