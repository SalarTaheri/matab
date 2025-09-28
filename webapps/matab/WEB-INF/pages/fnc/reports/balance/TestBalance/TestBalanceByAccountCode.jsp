<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<div class="uk-container uk-container-center my-uk-container">

    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:testBox name="fromDocNumberBy" disabled="true"
                          key="com.artonis.fnc.reports.books.accountBook.fromDocNumber" styleClass="midsmall"/>
            <base:testBox name="toDocNumberBy" disabled="true"
                          key="com.artonis.fnc.reports.books.accountBook.toDocNumber" styleClass="midsmall"/>
            <base:testBox name="fromReferenceNumberBy" disabled="true"
                          key="com.artonis.fnc.reports.books.accountBook.fromReference" styleClass="midsmall"/>
            <base:testBox name="toReferenceNumberBy" disabled="true"
                          key="com.artonis.fnc.reports.books.accountBook.toReference" styleClass="midsmall"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker name="fromDateBy" disabled="true" styleClass="midsmall"
                              key="com.artonis.fnc.reports.books.accountBook.fromDate"/>
            <base:mDatePicker name="toDateBy" disabled="true" styleClass="midsmall"
                              key="com.artonis.fnc.reports.books.accountBook.toDate"/>
            <base:testBox name="fromPriceBy" disabled="true" styleClass="midsmall"
                          key="com.artonis.fnc.reports.balance.testBalance.fromPrice"/>
            <base:testBox name="toPriceBy" disabled="true" styleClass="midsmall"
                          key="com.artonis.fnc.reports.balance.testBalance.fromPrice"/>

        </div>
        <div class="uk-grid uk-grid-preserve">
        </div>

        <%if (request.getAttribute("balanceShowType") != null && request.getAttribute("balanceShowType").equals("1")) { %>
        <div align="center" style="padding-top: 1px">
            <button class="uk-button uk-button-success" type="button" onclick="javascript:printTestBalance2Col()" id="print2ColBtn">
                <%=ResourceBoundleHolder.resourceBundle.getString("fnc.btn.print")%>
            </button>
        </div>
        <div id="2Column">
            <base:mehrSys-sql-grid showOperation="false" sqlQueryKey="testBalanceByAccountCode" pageSize="10"
                                   name="grid" selectable="multiple" isPopup="false"
                                   transportReadUrl="${basePath}sql-grid-read">

                <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.accountName'
                                     field="accountCodeName" width="50px"/>
                <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.accountCode' field="accountCode"
                                     width="50px"/>
                <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.endRemainingBedehkar'
                                     format="0:#,0" field="endRemainingBedehkar" width="100px"/>
                <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.endRemainingBestankar'
                                     format="0:#,0" field="endRemainingBestankar" width="100px"/>

                <base:my-grid-schema-field name="accountCodeName" type="string"/>
                <base:my-grid-schema-field name="accountCode" type="string"/>
                <base:my-grid-schema-field name="endRemainingBedehkar" type="long"/>
                <base:my-grid-schema-field name="endRemainingBestankar" type="long"/>

            </base:mehrSys-sql-grid>
        </div>
    </form>
    <div class="uk-grid uk-grid-preserve"
         style="border-style: double;margin-right: 0px;padding-top: 5px;padding-bottom: 5px;">
        <div class="uk-grid uk-grid-preserve">
            <base:testBoxNumericEx disabled="true" name="endRemainingBedehkar" styleClass="small"
                                   key="com.artonis.fnc.reports.balance.testBalance.endRemainingBedehkar"/>
            <base:testBoxNumericEx disabled="true" name="endRemainingBestankar" styleClass="small"
                                   key="com.artonis.fnc.reports.balance.testBalance.endRemainingBestankar"/>
        </div>
    </div>
</div>
<%} %>

<%if (request.getAttribute("balanceShowType") != null && request.getAttribute("balanceShowType").equals("2")) { %>
<div align="center" style="padding-top: 1px">
    <button class="uk-button uk-button-success" type="button" onclick="javascript:printTestBalance4Col()" id="print4ColBtn">
        <%=ResourceBoundleHolder.resourceBundle.getString("fnc.btn.print")%>
    </button>
</div>
<div id="4Column">
    <base:mehrSys-sql-grid showOperation="false" sqlQueryKey="testBalanceByAccountCode" pageSize="10" name="grid"
                           selectable="multiple" isPopup="false"
                           transportReadUrl="${basePath}sql-grid-read">

        <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.accountName' field="accountCodeName"
                             width="50px"/>
        <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.accountCode' field="accountCode"
                             width="50px"/>
        <%--<base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.beginRemainingBedehkar' format="0:#,0" field="beginRemainingBedehkar" width="100px" />--%>
        <%--<base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.beginRemainingBestankar' format="0:#,0" field="beginRemainingBestankar" width="100px" />--%>
        <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.turnOverBedehkar' format="0:#,0"
                             field="turnOverBedehkar" width="100px"/>
        <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.turnOverBestankar' format="0:#,0"
                             field="turnOverBestankar" width="100px"/>
        <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.endRemainingBedehkar' format="0:#,0"
                             field="endRemainingBedehkar" width="100px"/>
        <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.endRemainingBestankar' format="0:#,0"
                             field="endRemainingBestankar" width="100px"/>

        <base:my-grid-schema-field name="accountCodeName" type="string"/>
        <base:my-grid-schema-field name="accountCode" type="string"/>
        <%--<base:my-grid-schema-field name="beginRemainingBedehkar" type="long" />--%>
        <%--<base:my-grid-schema-field name="beginRemainingBestankar" type="long" />--%>
        <base:my-grid-schema-field name="turnOverBedehkar" type="long"/>
        <base:my-grid-schema-field name="turnOverBestankar" type="long"/>
        <base:my-grid-schema-field name="endRemainingBedehkar" type="long"/>
        <base:my-grid-schema-field name="endRemainingBestankar" type="long"/>

    </base:mehrSys-sql-grid>
</div>
</form>
<div class="uk-grid uk-grid-preserve"
     style="border-style: double;margin-right: 0px;padding-top: 5px;padding-bottom: 5px;">
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="turnOverBedehkar" styleClass="small"
                               key="com.artonis.fnc.reports.balance.testBalance.turnOverBedehkar"/>
        <base:testBoxNumericEx disabled="true" name="turnOverBestankar" styleClass="small"
                               key="com.artonis.fnc.reports.balance.testBalance.turnOverBestankar"/>
        <base:testBoxNumericEx disabled="true" name="endRemainingBedehkar" styleClass="small"
                               key="com.artonis.fnc.reports.balance.testBalance.endRemainingBedehkar"/>
    </div>

    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="endRemainingBestankar" styleClass="small"
                               key="com.artonis.fnc.reports.balance.testBalance.endRemainingBestankar"/>
    </div>
</div>
</div>
<%} %>
</div>

<%if (request.getAttribute("balanceShowType") != null && request.getAttribute("balanceShowType").equals("3")) { %>
<div align="center" style="padding-top: 1px">
    <button class="uk-button uk-button-success" type="button" onclick="javascript:printTestBalance6Col()" id="print6ColBtn">
        <%=ResourceBoundleHolder.resourceBundle.getString("fnc.btn.print")%>
    </button>
</div>
<div id="6Column">
    <base:mehrSys-sql-grid showOperation="false" sqlQueryKey="testBalanceByAccountCode" pageSize="10" name="grid"
                           selectable="multiple" isPopup="false"
                           transportReadUrl="${basePath}sql-grid-read">

        <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.accountName' field="accountCodeName"
                             width="50px"/>
        <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.accountCode' field="accountCode"
                             width="50px"/>
        <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.beginRemainingBedehkar' format="0:#,0"
                             field="beginRemainingBedehkar" width="100px"/>
        <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.beginRemainingBestankar' format="0:#,0"
                             field="beginRemainingBestankar" width="100px"/>
        <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.turnOverBedehkar' format="0:#,0"
                             field="turnOverBedehkar" width="100px"/>
        <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.turnOverBestankar' format="0:#,0"
                             field="turnOverBestankar" width="100px"/>
        <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.endRemainingBedehkar' format="0:#,0"
                             field="endRemainingBedehkar" width="100px"/>
        <base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.endRemainingBestankar' format="0:#,0"
                             field="endRemainingBestankar" width="100px"/>

        <base:my-grid-schema-field name="accountCodeName" type="string"/>
        <base:my-grid-schema-field name="accountCode" type="string"/>
        <base:my-grid-schema-field name="beginRemainingBedehkar" type="long"/>
        <base:my-grid-schema-field name="beginRemainingBestankar" type="long"/>
        <base:my-grid-schema-field name="turnOverBedehkar" type="long"/>
        <base:my-grid-schema-field name="turnOverBestankar" type="long"/>
        <base:my-grid-schema-field name="endRemainingBedehkar" type="long"/>
        <base:my-grid-schema-field name="endRemainingBestankar" type="long"/>

    </base:mehrSys-sql-grid>
</div>
</form>
<div class="uk-grid uk-grid-preserve"
     style="border-style: double;margin-right: 0px;padding-top: 5px;padding-bottom: 5px;">
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="beginRemainingBedehkar" styleClass="small"
                               key="com.artonis.fnc.reports.balance.testBalance.beginRemainingBedehkar"/>
        <base:testBoxNumericEx disabled="true" name="beginRemainingBestankar" styleClass="small"
                               key="com.artonis.fnc.reports.balance.testBalance.beginRemainingBestankar"/>
        <base:testBoxNumericEx disabled="true" name="turnOverBedehkar" styleClass="small"
                               key="com.artonis.fnc.reports.balance.testBalance.turnOverBedehkar"/>
    </div>

    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="turnOverBestankar" styleClass="small"
                               key="com.artonis.fnc.reports.balance.testBalance.turnOverBestankar"/>
        <base:testBoxNumericEx disabled="true" name="endRemainingBedehkar" styleClass="small"
                               key="com.artonis.fnc.reports.balance.testBalance.endRemainingBedehkar"/>
        <base:testBoxNumericEx disabled="true" name="endRemainingBestankar" styleClass="small"
                               key="com.artonis.fnc.reports.balance.testBalance.endRemainingBestankar"/>
    </div>
</div>
</div>
<%} %>


