<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    String menuSysCode = String.valueOf(request.getAttribute("menuSystemCode"));

%>

<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 4px; ">
    <form class="uk-form" id="beginPeriodReceipt">
        <input type="hidden" id="closing_slip_id" name="closing_slip_id">

        <div class="uk-grid uk-grid-preserve">
            <base:comboBox styleClass="normal" name="newFinanceyear_id"
                           key="com.artonis.inv.operation.goodsSupply.financeyear_name"  comboLoaderUrl="combo/loadAllFinanceYear"/>
        </div>

    </form>
</div>


<base:footer/>

<script type="text/javascript">
    $("#closing_slip_id").val(${closing_slip_id});


</script>

