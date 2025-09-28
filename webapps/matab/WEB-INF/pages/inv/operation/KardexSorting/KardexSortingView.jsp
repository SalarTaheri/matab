<%@page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader />

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:comboBoxAutoComplete name="inventory_id" styleClass="small" key="com.artonis.inv.reports.goodsKardex.inventory" comboLoaderUrl="combo/loadAllInventory"
							dataTextField="name" dataValueField="id" minLength="0" hasTemplate="false" iscomboLoaderUrlRelative="true"/>
			<base:mDatePicker styleClass="small" name="fromDate" key="com.artonis.inv.reports.goodsKardex.fromDate" />
			<base:mDatePicker styleClass="small" name="toDate" key="com.artonis.inv.reports.goodsKardex.toDate" />
		</div>
	</form>
</div>

<base:my-grid-search showOperation="false" defaultReadUrlIsRelative="true">
	<base:my-grid-column title="com.artonis.inv.reports.goodsKardex.documentName" field="documentName" width="50px" />
	<base:my-grid-column title="com.artonis.inv.reports.goodsKardex.documentDate" field="documentDate" width="50px" />
	<base:my-grid-column title="com.artonis.inv.reports.goodsKardex.documentReference" field="documentReference" width="50px" />
	<base:my-grid-column title="com.artonis.inv.reports.goodsKardex.documentSerial" field="documentSerial" width="50px" />
	<base:my-grid-column title="com.artonis.inv.operation.kardexSorting.documentState" field="documentStateStr" width="50px" />

	<base:my-grid-schema-field name="incomingAmount" type="long" />
	<base:my-grid-schema-field name="outgoingAmount" type="long" />
	<base:my-grid-schema-field name="remaining" type="long" />
</base:my-grid-search>

<div align="center" style="padding-top: 1px">
	<%if(GlobalVariable.getButtonContainer("011002009", "sortBtn") == true) { %>
		<button class="uk-button uk-button-success" type="button" onclick="javascript:startSorting()" id="sortBtn">
			<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.operation.kardexSorting")%>
		</button>
	<%} %>
	<%if(GlobalVariable.getButtonContainer("011002009", "sortReferenceBtn") == true) { %>
		<button class="uk-button uk-button-success" type="button" onclick="javascript:startSortingReference()" id="sortReferenceBtn">
			<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.operation.kardexSortingReference")%>
		</button>
	<%} %>
	<%if(GlobalVariable.getButtonContainer("011002009", "finalizationBtn") == true) { %>
		<button class="uk-button uk-button-success" type="button" onclick="javascript:startFinalization()" id="finalizationBtn">
			<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.operation.finalization")%>
		</button>
	<%} %>
	<%if(GlobalVariable.getButtonContainer("011002009", "returnFinalizeBtn") == true) { %>
		<button class="uk-button uk-button-success" type="button" onclick="javascript:returnFinalize()" id="returnFinalizeBtn">
			<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.operation.kardexSorting.returnFinalize")%>
		</button>
	<%} %>
</div>

<base:footer />

<script type="text/javascript">
    function getSearchObject() {
        var searchObject = {};
        searchObject.fromDate = $("#fromDate").val();
        searchObject.toDate = $("#toDate").val();
        searchObject.inventoryId = $("#inventory_id").val();
        return searchObject;
    }

    function startSorting() {
        var inventoryId = $("#inventory_id").val();
        var fromDate = $("#fromDate").val().replace(/\//g, ':@:');
        var toDate = $("#toDate").val().replace(/\//g, ':@:');
        if (inventoryId == null || inventoryId == "") {
            alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.reports.goodsKardex.err.selectInventory")%>');
            return;
        }
        if (fromDate != null && toDate != null && fromDate != "" && toDate != "") {
            $("#finalizationBtn").attr('disabled', 'disabled');
            $("#returnFinalizeBtn").attr('disabled', 'disabled');
            $("#sortBtn").attr('disabled', 'disabled');
            //
            var requestUrl = "${pageContext.request.contextPath}" + "/inv/operation/KardexSorting/sort/" + fromDate + "/" + toDate + "/" + inventoryId;
            $.getJSON(requestUrl, function (data) {
                if (data.state == "success") {
                    $("#searchGrid").data("kendoGrid").dataSource.read();
                    alertify.success(data.message);
                } else if (data.state == "error") {
                    alertify.error(data.message);
                }
                //
                $("#finalizationBtn").removeAttr('disabled');
                $("#returnFinalizeBtn").removeAttr('disabled');
                $("#sortBtn").removeAttr('disabled');
            });
        } else {
            alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.operation.err.fillDates")%>');
        }
    }

    function startSortingReference() {
        var inventoryId = $("#inventory_id").val();
        var fromDate = $("#fromDate").val().replace(/\//g, ':@:');
        var toDate = $("#toDate").val().replace(/\//g, ':@:');
        if (inventoryId == null || inventoryId == "") {
            alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.reports.goodsKardex.err.selectInventory")%>');
            return;
        }
        if (fromDate != null && toDate != null && fromDate != "" && toDate != "") {
            $("#finalizationBtn").attr('disabled', 'disabled');
            $("#returnFinalizeBtn").attr('disabled', 'disabled');
            $("#sortBtn").attr('disabled', 'disabled');
            $("#sortReferenceBtn").attr('disabled', 'disabled');
            //
            var requestUrl = "${pageContext.request.contextPath}" + "/inv/operation/KardexSorting/sortReference/" + fromDate + "/" + toDate + "/" + inventoryId;
            $.getJSON(requestUrl, function (data) {
                if (data.state == "success") {
                    $("#searchGrid").data("kendoGrid").dataSource.read();
                    alertify.success(data.message);
                } else if (data.state == "error") {
                    alertify.error(data.message);
                }
                //
                $("#finalizationBtn").removeAttr('disabled');
                $("#returnFinalizeBtn").removeAttr('disabled');
                $("#sortBtn").removeAttr('disabled');
                $("#sortReferenceBtn").removeAttr('disabled');
            });
        } else {
            alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.operation.err.fillDates")%>');
        }
    }

    function startFinalization() {
        var inventoryId = $("#inventory_id").val();
        var fromDate = $("#fromDate").val().replace(/\//g, ':@:');
        var toDate = $("#toDate").val().replace(/\//g, ':@:');
        if (inventoryId == null || inventoryId == "") {
            alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.reports.goodsKardex.err.selectInventory")%>');
            return;
        }
        if (fromDate != null && toDate != null && fromDate != "" && toDate != "") {
            $("#finalizationBtn").attr('disabled', 'disabled');
            $("#returnFinalizeBtn").attr('disabled', 'disabled');
            $("#sortBtn").attr('disabled', 'disabled');
            //
            var requestUrl = "${pageContext.request.contextPath}" + "/inv/operation/KardexSorting/finalize/" + fromDate + "/" + toDate + "/" + inventoryId;
            $.getJSON(requestUrl, function (data) {
                if (data.state == "success") {
                    $("#searchGrid").data("kendoGrid").dataSource.read();
                    alertify.success(data.message);
                } else if (data.state == "error") {
                    alertify.error(data.message);
                }
                //
                $("#finalizationBtn").removeAttr('disabled');
                $("#returnFinalizeBtn").removeAttr('disabled');
                $("#sortBtn").removeAttr('disabled');
            });
        } else {
            alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.operation.err.fillDates")%>');
        }
    }

    function returnFinalize() {
        var inventoryId = $("#inventory_id").val();
        var fromDate = $("#fromDate").val().replace(/\//g, ':@:');
        var toDate = $("#toDate").val().replace(/\//g, ':@:');
        if (inventoryId == null || inventoryId == "") {
            alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.reports.goodsKardex.err.selectInventory")%>');
            return;
        }
        if (fromDate != null && toDate != null && fromDate != "" && toDate != "") {
            $("#finalizationBtn").attr('disabled', 'disabled');
            $("#returnFinalizeBtn").attr('disabled', 'disabled');
            $("#sortBtn").attr('disabled', 'disabled');
            //
            var requestUrl = "${pageContext.request.contextPath}" + "/inv/operation/KardexSorting/returnFinalize/" + fromDate + "/" + toDate + "/" + inventoryId;
            $.getJSON(requestUrl, function (data) {
                if (data.state == "success") {
                    $("#searchGrid").data("kendoGrid").dataSource.read();
                    alertify.success(data.message);
                } else if (data.state == "error") {
                    alertify.error(data.message);
                }
                //
                $("#finalizationBtn").removeAttr('disabled');
                $("#returnFinalizeBtn").removeAttr('disabled');
                $("#sortBtn").removeAttr('disabled');
            });
        } else {
            alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.operation.err.fillDates")%>');
        }
    }
    $(document).ready(function () {
        var grid = $("#searchGrid").data("kendoGrid");
        grid.selectable.destroy();
    });
</script>
