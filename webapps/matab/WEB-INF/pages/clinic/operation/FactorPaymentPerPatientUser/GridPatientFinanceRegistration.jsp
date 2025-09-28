<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
    String gridDetailUrl = request.getContextPath()+"/clinic/operation/FactorPaymentPerPatientUser/grid-FinanceRegistration-patient";
%>
<div >
    <form class="uk-form">
        <base:my-grid name="gridPatientFinanceRegistration" isPopup="true" transportReadUrl="<%=gridDetailUrl%>" showOperation="false">
            <base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.service_id'  field="serviceName" width="25px"/>
            <base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.grid.amount'  field="totalCost" width="25px"/>
            <base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.grid.insurance'  field="insurancePercent" width="25px"/>
            <base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.grid.totalAmount'  field="totalCostMinesInsurancePercent" width="25px"/>
            <base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.grid.totalDiscounts'  field="totalDiscounts" width="25px"/>
            <base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.grid.payableAmount'  field="payable" width="25px"/>
            <base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.doctorName'  field="fullName" width="25px"/>
            <base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.visitState'  field="visitState" width="25px"/>

            <base:my-grid-schema-field name="serviceName" type="string"/>
            <base:my-grid-schema-field name="totalCost" type="string"/>
            <base:my-grid-schema-field name="insurancePercent" type="string"/>
            <base:my-grid-schema-field name="totalCost" type="long"/>
            <base:my-grid-schema-field name="totalCostMinesInsurancePercent" type="long"/>
            <base:my-grid-schema-field name="totalDiscounts" type="long"/>
            <base:my-grid-schema-field name="fullName" type="string"/>
            <base:my-grid-schema-field name="visitState" type="string"/>
        </base:my-grid>
    </form>
</div>