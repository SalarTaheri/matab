<%@ page import="com.artonis.core.base.core.Date" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
    Date curDate = new Date(System.currentTimeMillis());
    String curStringDate = curDate.toString();
%>

<base:pageHeaderTitle/>

<div style="display:inline;" id="modal-detail"></div>

<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
        </div>
    </form>
</div>

<div class="uk-container uk-container-center my-uk-container" >
    <base:my-grid-search showMultipleDelete="false">
        <base:my-grid-column title='com.artonis.clinic.operation.factorPayment.totalCost' field="factorTotalCost"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorPayment.sumReceipt' field="sumReceipt"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorPayment.cashReceipt' field="sumCashPayment"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorPayment.posReceipt' field="sumPosPayment"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorPayment.sumPayment' field="sumPayment"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorPayment.totalExistCash' field="totalExistCash"  width="30px"/>

        <base:my-grid-function text="com.artonis.clinic.operation.factorPayment.popup.serviceDetail" functionClick="grid_onDetail"  name="detail"/>
    </base:my-grid-search>
</div>

<base:footer/>

<base:popupGrid gridPopupName="gridPatientFinanceRegistration" selectGridName="searchGrid" relativePopupUrl="popup/detailFinanceRegistration" fieldQueryPopup="factor_id"
                functionValueQueryPopup="searchQueryValueCreator"/>

<script type="text/javascript">
    $(document).ready(function() {
        resetForm();
    });

    function resetForm(){
        $("#fromDate").val("<%=curStringDate%>");
        $("#toDate").val("<%=curStringDate%>");
    }

    function getSearchObject() {
        var docVar = {};
        docVar.fromDate = $("#fromDate").val();
        docVar.toDate = $("#toDate").val();
        return docVar;
    }

    function grid_onDetail(e){
        _searchGrid_popup(e);
    }

</script>

<style type="text/css">
    .uk-modal-dialog{
        right:0px;
        margin-right: 0px;
        width: 100%;
        padding:0px;
        top: 5%;
    }
</style>

