<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="PurchaseInvoiceItem"/>

<base:my-grid-item name="PurchaseInvoiceItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="purchaseInvoice_id">
    <base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptGoods.goods_id' field="goodsCodeName" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.receipt.purchaseReceipt.measureUnit' field="measureUnit_Name" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptGoods.goodsAmount' field="goodsAmount" format="0:#,0" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptGoods.rate' field="rate" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptGoods.impurePrice' field="impurePrice" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptGoods.discount' field="discount" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptGoods.tax' field="tax" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptGoods.toll' field="toll" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptGoods.carriageFare' field="carriageFare" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptGoods.payablePrice' field="payablePrice" width="50px"/>
</base:my-grid-item>

<base:footer/>

<div style="margin: 20px; text-align: center; border-color: lightgray;" align="center">
    <table border="2" style="" cellpadding="10px;" width="100%">
        <tr>
            <td><span><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.receipt.purchaseReceiptGoods.sum.purePrice")%></span> : <span id="sumPurePrice">0</span></td>
            <td><span><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.receipt.purchaseReceiptGoods.sum.impurePrice")%></span> : <span id="sumImpurePrice">0</span></td>
            <td><span><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.receipt.purchaseReceiptGoods.sum.ksoorat")%></span> : <span id="sumKsoorat">0</span></td>
            <td><span><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.receipt.purchaseReceiptGoods.sum.ezafat")%></span> : <span id="sumEzafat">0</span></td>
            <td><span><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.receipt.purchaseReceiptGoods.sum.carriage")%></span> : <span id="sumCarriage">0</span></td>
        </tr>
    </table>
</div>

<script>
    function callback_deserialize(data){
        if (eval($('#id').val()) > 0) {
            getSummeryData();
        }
    }

    function getSummeryData(){
        var url = getBaseUrl() + "getSummeryData/" + eval($('#id').val());
        $.getJSON(url, function (data) {
            if (data.success == true) {
                $("#sumPurePrice").text(data.sumPurePrice);
                $("#sumImpurePrice").text(data.sumImpurePrice);
                $("#sumEzafat").text(data.sumEzafat);
                $("#sumKsoorat").text(data.sumKsoorat);
                $("#sumCarriage").text(data.sumCarriage);
            }
        });
    }

    function doAfterRemove_PurchaseInvoiceItem(result) {
        getSummeryData();
    }

    function doAfterSave_PurchaseInvoiceItem(result) {
        getSummeryData();
    }
</script>