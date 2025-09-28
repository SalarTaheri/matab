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

<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 0px;margin-top: 5px;padding-bottom: 5px;">
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:comboBox name="doctor_id"  key="his.patient.doctorName" comboLoaderUrl="combo/loadAllDoctor" styleClass="small"/>
            <base:comboBox name="service_id" key="com.artonis.clinic.basicInfo.service.name" comboLoaderUrl="combo/allService" styleClass="small"/>
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
        </div>

        <base:my-grid-search  showMultipleDelete="false" >
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.patientCount' field="patientCount"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.doctor_lastName' field="doctor_lastName"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.service_name' field="service_name"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.date' field="date"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.totatCost' field="totalCostStr"  width="50px"/>
            <%--<base:my-grid-column title='com.artonis.clinic.operation.factorView.cashierUserFullName' field="cashierUserFullName"  width="50px"/>--%>
            <%--<base:my-grid-column title='com.artonis.clinic.operation.factorView.username' field="username"  width="50px"/>--%>

            <base:my-grid-schema-field name="patientCount" type="string" />
            <base:my-grid-schema-field name="doctor_lastName" type="string" />
            <base:my-grid-schema-field name="service_name" type="string" />
            <base:my-grid-schema-field name="date" type="string" />
            <base:my-grid-schema-field name="totalCost" type="string" />
            <%--<base:my-grid-schema-field name="cashierUserFullName" type="string" />--%>
            <%--<base:my-grid-schema-field name="username" type="string" />--%>

        </base:my-grid-search>
    </form>
    <div class="uk-grid uk-grid-preserve" style="background: linear-gradient(to bottom, rgba(160, 188, 197, 1) 0%,rgba(190, 201, 206, 1) 37%,rgba(121, 139, 142, 1) 100%);padding-top: 10px;margin-right: 0px;padding-bottom: 10px;">
        <base:testBoxNumericEx disabled="true" name="totalCostSum" styleClass="small" key="com.artonis.clinic.operation.factorView.totatCost"/>
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
        docVar.doctor_id=$("#doctor_id").val();
        docVar.service_id=$("#service_id").val();
        return docVar;

    }

    function doAfterSearch(searchString){
        $.ajax({
            url:'${pageContext.request.contextPath}' + '/clinic/operation/factorPatientCountPerDoctorServiceCurrUser/sumTotalCost/' + searchString,
            contentType:"application/json",
            dataType:'json',
            type:'POST',
            success:function (result) {
                $("#totalCostSum").val(result.totalCostSum);
                setNumericTextValue();
            }

        });

    }

</script>
