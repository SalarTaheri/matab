<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
    String gridDetailUrl = new UrlPathHelper().getOriginatingRequestUri(request);
    
    gridDetailUrl = request.getContextPath()+"/inventory/m169/operation/financeOperationHistory/grid-read";
%>
<%--<base:pageHeader/>--%>
<%--<base:pageInputHeader/>--%>
<%--<div class="uk-container uk-container-center my-uk-container" >--%>
<div >
    <form class="uk-form">


   <base:my-grid name="gridDetail" isPopup="true" transportReadUrl="<%=gridDetailUrl%>" showOperation="false">
 <base:my-grid-column title='com.artonis.inv.m169.operation.financeOperationHistory.operationType'  field="operationTypeTxt" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.operation.financeOperationHistory.operationDate'  field="operationDate" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.operation.financeOperationHistory.operationTime'  field="operationTime" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.operation.financeOperationHistory.operationSate'  field="operationStateTxt" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.operation.financeOperationHistory.employee_id'  field="employeeFullName" width="50px"/>


        <base:my-grid-schema-field name="operationTypeTxt" type="string"/>
        <base:my-grid-schema-field name="operationDate" type="string"/>
        <base:my-grid-schema-field name="operationTime" type="string"/>
        <base:my-grid-schema-field name="operationStateTxt" type="string"/>
        <base:my-grid-schema-field name="employeeFullName" type="string"/>
   </base:my-grid>
    <%--<base:testBox name="ssss" key="inventory.m169.operation.financeOperationView.operationType" />--%>
    </form>
</div>
