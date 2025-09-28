<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<div class="uk-container uk-container-center my-uk-container">
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="fromSerial" key="fnc.treasury.basicInfo.expenditure.expenditureFund.fromSerial"/>
            <base:testBox styleClass="small" name="toSerial" key="fnc.treasury.basicInfo.expenditure.expenditureFund.toSerial"/>
            <base:mDatePicker styleClass="small" name="date" key="fnc.treasury.basicInfo.expenditure.expenditureFund.date"/>
        </div>
    </form>
</div>

<base:my-grid-search showMultipleDelete="false" isPopup="true" showOperation="false" >
    <base:my-grid-column title='pursal.purchaseInvoice.serial' field="serial" width="50px"/>
    <base:my-grid-column title='pursal.purchaseInvoice.date' field="date_" width="50px"/>
    <base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditureFund.registerer' field="registererName" width="50px"/>
    <base:my-grid-column title='pursal.purchaseInvoice.totalPrice' field="totalPrice" width="50px"/>
    <base:my-grid-column title='pursal.purchaseInvoice.state' field="stateText" width="50px"/>
</base:my-grid-search>

<base:footer/>

<script>
    function getSearchObject() {
        var bbVar = {};
        bbVar.fromSerial = $("#fromSerial").val();
        bbVar.toSerial = $("#toSerial").val();
        bbVar.date_ = $("#date").val();
        return bbVar;
    }
</script>

<style>
    .my-popup-body {
        padding: 0px !important;
    }
    .uk-modal-dialog {
        right: 40% !important;
    }
</style>