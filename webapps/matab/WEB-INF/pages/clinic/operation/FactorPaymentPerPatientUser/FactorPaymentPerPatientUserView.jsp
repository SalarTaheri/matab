<%@page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@ page import="com.artonis.core.base.core.Date" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
    Date curDate=new Date(System.currentTimeMillis());
    String curStringDate=curDate.toString();
    String menuSysCode = String.valueOf(request.getAttribute("menuSystemCode"));
%>
<base:pageHeaderTitle/>
<div style="display:inline;" id="modal-detail"></div>
<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:testBox name="patientFullName" key="clinic.patient.name" styleClass="small"/>
            <base:testBox name="patientFileNumber" key="clinic.patient.fileNumber" styleClass="small"/>
            <base:comboBox name="type"  key="com.artonis.clinic.operation.factorPayment.type" comboLoaderUrl="combo/allType" styleClass="small"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:comboBox name="factorPaymentType"  key="com.artonis.clinic.operation.factorPayment.paymentType" comboLoaderUrl="combo/allPaymentType" styleClass="small"/>
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:comboBox name="equalNotEqual"  key="com.artonis.clinic.operation.factorPayment.equalNotEqual" comboLoaderUrl="combo/allPaymentDiff" styleClass="small"/>
            <base:testBoxNumericEx  name="cost" styleClass="small" key="com.artonis.clinic.operation.factorPayment.cost"/>
            <%if(GlobalVariable.getButtonContainer(menuSysCode,"factor-pcpdsu-cashierUserPermission")){ %>
            	<base:comboBox name="cashierUser_id" key="com.artonis.clinic.operation.factorView.cashierUser" comboLoaderUrl="combo/loadUsers" styleClass="small"/>
           	<%}else{ %>
           		<base:label name="cashierCurrentUser" key="com.artonis.clinic.operation.factorView.cashierUser" styleClass="small"></base:label>
           	<%} %>
        </div>
    </form>
</div>
<div class="uk-container uk-container-center my-uk-container" >
    <base:my-grid-search  showMultipleDelete="false" >
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.date' field="date"  width="30px"/>
        <base:my-grid-column title='clinic.patient.firstName' field="patientFirstName"  width="30px"/>
        <base:my-grid-column title='clinic.patient.lastName' field="patientLastName"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorPayment.factorNumber' field="factorNumber"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorPayment.totalCost' field="totalCostStr"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorPayment.sumReceipt' field="sumReceiptStr"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorPayment.cashReceipt' field="sumCashPayment"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorPayment.posReceipt' field="sumPosPayment"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorPayment.sumPayment' field="sumPaymentStr"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorPayment.sumRounded' field="sumRounded"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorPayment.type' field="typeStr"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.cashierUserFullName' field="cashierFullName"  width="50px"/>
	    <base:my-grid-column title='com.artonis.clinic.operation.factorView.username' field="cashierUsername"  width="30px"/>

        <base:my-grid-schema-field name="factorNumber" type="string" />
        <base:my-grid-schema-field name="sumRounded" type="long" />

        <base:my-grid-function text="com.artonis.clinic.operation.factorPayment.popup.serviceDetail" functionClick="grid_onDetail"  name="detail"/>
    </base:my-grid-search>
    <br>
    <br>
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="sumTotalCost" styleClass="small" key="com.artonis.clinic.operation.factorPayment.sumTotalCost"/>
        <base:testBoxNumericEx disabled="true" name="totalExistCash" styleClass="small" key="com.artonis.clinic.operation.factorPayment.totalExistCash"/>
        <base:testBoxNumericEx disabled="true" name="totalSumReceipt" styleClass="small" key="com.artonis.clinic.operation.factorPayment.totalSumReceipt"/>
    </div>
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="totalSumPayment" styleClass="small" key="com.artonis.clinic.operation.factorPayment.totalSumPayment"/>
        <base:testBoxNumericEx disabled="true" name="totalCashPayment" styleClass="small" key="com.artonis.clinic.operation.factorPayment.totalCashReceipt"/>
        <base:testBoxNumericEx disabled="true" name="totalPosPayment" styleClass="small" key="com.artonis.clinic.operation.factorPayment.totalPosReceipt"/>
    </div>
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="totalRounded" styleClass="small" key="com.artonis.clinic.operation.factorPayment.totalRounded"/>
    </div>
</div>
<base:footer/>
<base:popupGrid gridPopupName="gridPatientFinanceRegistration" selectGridName="searchGrid" relativePopupUrl="popup/detailFinanceRegistration" fieldQueryPopup="factor_id" functionValueQueryPopup="searchQueryValueCreator"/>

<script type="text/javascript">
    $(document).ready(function() {
        resetForm();
        doAfterSearch(getSearchJsonString());
        $("#cashierCurrentUser").val("${currentUsername}");
    });
    function resetForm(){
        $("#fromDate").val("<%=curStringDate%>");
        $("#toDate").val("<%=curStringDate%>");
    }
    function getSearchObject(){
        var docVar = {};
        docVar.fromDate=$("#fromDate").val();
        docVar.toDate=$("#toDate").val();
        docVar.type=$("#type").val();
        docVar.patientFullName=$("#patientFullName").val();
        docVar.patientFileNumber=$("#patientFileNumber").val();
        docVar.factorPaymentType=$("#factorPaymentType").val();
        docVar.equalNotEqual=$("#equalNotEqual").val();
        docVar.cost=$("#cost").val();
        var hasPermision = <%=GlobalVariable.getButtonContainer(menuSysCode,"factor-pcpdsu-cashierUserPermission")%>;
        if(hasPermision){
        	docVar.cashierUser_id = $("#cashierUser_id").val();	
        }else{
        	docVar.cashierUser_id = "${currentUserId}";
        }
        return docVar;
    }

    function doAfterClearAndSearch(){
        doAfterSearch(getSearchJsonString());
    }

    function doAfterSearch(searchString){
        $.ajax({
            url:'${pageContext.request.contextPath}' + '/clinic/operation/FactorPaymentPerPatientUser/sumTotalCost/' + searchString,
            contentType:"application/json",
            dataType:'json',
            type:'POST',
            success:function (result) {
                $("#sumTotalCost").val(result.sumTotalCost);
                $("#totalSumReceipt").val(result.totalSumReceipt);
                $("#totalSumPayment").val(result.totalSumPayment);
                $("#totalCashPayment").val(result.totalCashPayment);
                $("#totalPosPayment").val(result.totalPosPayment);
                if(result.totalSumReceipt!=undefined &&result.totalSumPayment!=undefined){
                    $("#totalExistCash").val(result.totalSumReceipt-result.totalSumPayment);
                }
                $("#totalRounded").val(result.totalRounded);
                setNumericTextValue();
            }
        });
    }

    function searchQueryValueCreator(row){
        var search=[];
        search[0]=row.factorNumber;
        return search;
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