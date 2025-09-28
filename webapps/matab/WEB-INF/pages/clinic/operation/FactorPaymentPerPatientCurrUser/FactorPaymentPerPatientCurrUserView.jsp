<%@ page import="com.artonis.core.base.core.Date" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
    Date curDate=new Date(System.currentTimeMillis());
    String curStringDate=curDate.toString();
%>
<base:pageHeaderTitle/>

<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:testBox name="patientFullName" key="clinic.patient.name" styleClass="small"/>
            <base:testBox name="patientFileNumber" key="clinic.patient.fileNumber" styleClass="small"/>
            <base:comboBox name="type"  key="com.artonis.clinic.operation.factorPayment.type" comboLoaderUrl="combo/allType" styleClass="small"/>
        </div>

        <div class="uk-grid uk-grid-preserve">
            <%--<base:comboBox name="cashierUser_id" key="com.artonis.clinic.operation.factorView.cashierUser" comboLoaderUrl="combo/loadUsers" styleClass="small"/>--%>
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
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
        <base:my-grid-column title='com.artonis.clinic.operation.factorPayment.sumPayment' field="sumPaymentStr"  width="30px"/>
        <%--<base:my-grid-column title='com.artonis.clinic.operation.factorPayment.release' field="release"  width="30px"/>--%>
        <base:my-grid-column title='com.artonis.clinic.operation.factorPayment.type' field="typeStr"  width="30px"/>
        <%--<base:my-grid-column title='com.artonis.clinic.operation.factorView.username' field="username"  width="50px"/>--%>

        <base:my-grid-schema-field name="date" type="string" />
        <base:my-grid-schema-field name="patientFirstName" type="string" />
        <base:my-grid-schema-field name="patientLastName" type="string" />
        <base:my-grid-schema-field name="factorNumber" type="string" />
        <base:my-grid-schema-field name="sumReceiptStr" type="string" />
        <base:my-grid-schema-field name="sumPaymentStr" type="string" />
        <base:my-grid-schema-field name="totalCostStr" type="string" />
        <%--<base:my-grid-schema-field name="release" type="string" />--%>
        <base:my-grid-schema-field name="typeStr" type="string" />
        <%--<base:my-grid-schema-field name="username" type="string" />--%>


    </base:my-grid-search>
    <br>
    <br>
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="sumTotalCost" styleClass="small" key="com.artonis.clinic.operation.factorPayment.sumTotalCost"/>
        <base:testBoxNumericEx disabled="true" name="totalSumReceipt" styleClass="small" key="com.artonis.clinic.operation.factorPayment.totalSumReceipt"/>
        <base:testBoxNumericEx disabled="true" name="totalSumPayment" styleClass="small" key="com.artonis.clinic.operation.factorPayment.totalSumPayment"/>
    </div>
</div>
<base:footer/>

<script type="text/javascript">
    $(document).ready(function() {
        resetForm();
        doAfterSearch(getSearchJsonString());

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
        docVar.cashierUser_id=$("#cashierUser_id").val();
        return docVar;

    }

    function doAfterSearch(searchString){
        $.ajax({
            url:'${pageContext.request.contextPath}' + '/clinic/operation/FactorPaymentPerPatientCurrUser/sumTotalCost/' + searchString,
            contentType:"application/json",
            dataType:'json',
            type:'POST',
            success:function (result) {
                $("#sumTotalCost").val(result.sumTotalCost);
                $("#totalSumReceipt").val(result.totalSumReceipt);
                $("#totalSumPayment").val(result.totalSumPayment);
                setNumericTextValue();
            }

        });

    }

</script>
