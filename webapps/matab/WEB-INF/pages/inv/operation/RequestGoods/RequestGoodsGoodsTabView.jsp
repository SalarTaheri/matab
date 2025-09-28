<%@ page import="com.artonis.inv.core.model.ConstValue" %>
<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="RequestGoodsGoods"/>

<base:my-grid-item name="RequestGoodsGoods" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="requestGoodsId" exportToExcellEnable="false" >
    <base:my-grid-column title='com.artonis.inv.operation.RequestGoodsGoods.goodsCode' field="goodsCode" width="30px"/>
    <base:my-grid-column title='com.artonis.inv.operation.RequestGoodsGoods.goodsName' field="goodsName" width="100px"/>
    <base:my-grid-column title='com.artonis.inv.operation.RequestGoodsGoods.unit' field="measureUnitName" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.operation.RequestGoodsGoods.requestedAmount' field="requestedAmount" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.operation.RequestGoodsGoods.acceptedAmount' field="acceptedAmountText" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.operation.RequestGoodsGoods.state' field="itemStateText" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.operation.RequestGoodsGoods.remainingAmount' field="remainingAmount" width="50px"/>
    <base:my-grid-column title='com.artonis.inv.operation.RequestGoodsGoods.description' field="description" width="50px"/>

    <base:my-grid-function name="acceptOperation" functionClick="acceptOperation" text="inv.operation.RequestGoodsGoods.operation.accept" />
    <base:my-grid-function name="rejectOperation" functionClick="rejectOperation" text="inv.operation.RequestGoodsGoods.operation.reject"/>
    <base:my-grid-function name="modifyOperation" functionClick="modifyOperation" text="inv.operation.RequestGoodsGoods.operation.modify"/>
</base:my-grid-item>

<%if(GlobalVariable.getButtonContainer("011002002", "acceptAll")){%>
    <div style="padding: 15px;" align="center">
        <button class="uk-button uk-button-primary" id="acceptAll" type="button" onclick="acceptAllOperation()">
            <%=ResourceBoundleHolder.resourceBundle.getString("inv.operation.RequestGoodsGoods.operation.acceptAll")%>
        </button>
    </div>
<%}%>


<base:footer/>

<script type="text/javascript">
    alertify.labels.ok = "<%=ResourceBoundleHolder.resourceBundle.getString("global.approve")%>";
    alertify.labels.cancel = "<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.cancel")%>";

    $(document).ready(function () {
        $("#RequestGoodsGoods").parent().parent().css('padding','0px');
    });

    function acceptAllOperation() {
        $("#acceptAll").attr('disabled','disabled');
        $.getJSON("<c:url value='/' />" + "inv/operation/requestGoods/acceptAllItem/" + $("#id").val() , function(d) {
            $("#acceptAll").removeAttr('disabled');
            if (d.state == "success") {
                $("#stateText").val(d.requestGoodsStateText);
                $("#RequestGoodsGoods").data("kendoGrid").dataSource.read();
                alertify.success(d.message);
            } else if (d.state == "error") {
                alertify.error(d.error);
            }
        });
    }

    function acceptOperation(e) {
        e.preventDefault();
        var data = this.dataItem($(e.target).closest("tr"));
        $.getJSON("<c:url value='/' />" + "inv/operation/requestGoods/acceptItem/" + data.id , function(d) {
            if (d.state == "success") {
                $("#stateText").val(d.requestGoodsStateText);
                $("#RequestGoodsGoods").data("kendoGrid").dataSource.read();
                alertify.success(d.message);
            } else if (d.state == "error") {
                alertify.error(d.error);
            }
        });
    }

    function rejectOperation(e) {
        e.preventDefault();
        var data = this.dataItem($(e.target).closest("tr"));
        $.getJSON("<c:url value='/' />" + "inv/operation/requestGoods/rejectItem/" + data.id , function(d) {
            if (d.state == "success") {
                $("#stateText").val(d.requestGoodsStateText);
                $("#RequestGoodsGoods").data("kendoGrid").dataSource.read();
                alertify.success(d.message);
            } else if (d.state == "error") {
                alertify.error(d.error);
            }
        });
    }

    function modifyOperation(e) {
        e.preventDefault();
        var data = this.dataItem($(e.target).closest("tr"));
        alertify.prompt("<%=ResourceBoundleHolder.resourceBundle.getString("inv.operation.RequestGoodsGoods.operation.enterModifiedNumber")%>",
            function (evt, value) {
                if (!evt) {
                    return;
                }
                //
                if (!$.isNumeric(value)) {
                    alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("inv.operation.RequestGoodsGoods.operation.error.enterNumberPlz")%>");
                    return;
                } else if (eval(value) < 1) {
                    alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("inv.operation.RequestGoodsGoods.operation.error.enterPositiveNumber")%>");
                    return;
                }
                //
                $.getJSON("<c:url value='/' />" + "inv/operation/requestGoods/modifyItem/" + data.id + "/" + value, function(d) {
                    if (d.state == "success") {
                        $("#stateText").val(d.requestGoodsStateText);
                        $("#RequestGoodsGoods").data("kendoGrid").dataSource.read();
                        alertify.success(d.message);
                    } else if (d.state == "error") {
                        alertify.error(d.error);
                    }
                });
            }
        );
    }

    function RequestGoodsGoods_onDataBound_callback(e) {
        $(".k-grid-acceptOperation, .k-grid-rejectOperation, .k-grid-modifyOperation").removeClass("uk-button-success").addClass("uk-button-primary");
        //
        setGridRowColor();
    }

    function doAfterRemove_RequestGoodsGoods(result) {
        var value = eval($("#id").val());
        $.getJSON("<c:url value='/' />" + "inv/operation/requestGoods/checkRequestGoodsForUpdateState/" + value, function(d) {
            $("#stateText").val(d.requestGoodsStateText);
        });
    }

    function doAfterSave_RequestGoodsGoods(result) {
        $("#stateText").val(result.requestGoodsStateText);
    }

    function setGridRowColor() {
        var grid = $("#RequestGoodsGoods").data("kendoGrid");
        var data = grid.dataSource.data();
        $.each(data, function (i, row) {
            if (row.itemState == <%=ConstValue.RequestGoodsGoodsItemStateEnum.TAEED_SHODE.getValue()%>) {
                $('tr[data-uid="' + row.uid + '"] ').css("background-color", "#b4f19b");
            } else if (row.itemState == <%=ConstValue.RequestGoodsGoodsItemStateEnum.RAD_SHODE.getValue()%>) {
                $('tr[data-uid="' + row.uid + '"] ').css("background-color", "#fda4a4");
            } else if (row.itemState == <%=ConstValue.RequestGoodsGoodsItemStateEnum.ESLAH_SHODE.getValue()%>) {
                $('tr[data-uid="' + row.uid + '"] ').css("background-color", "#ffdd91");
            }
        });
    }
</script>

<style>
    .k-grid .k-button, .k-edit-form-container .k-button {
        margin: 1px .2em !important;
    }
    .k-grid table {
         border-collapse: inherit !important;
    }
    .k-grid table tr{
        border-bottom-style: solid !important;
        border-bottom-color: #607D8B !important;
        border-bottom-width: 1px !important;
        background-color: white;
    }
    .alertify-message{
        text-align: right !important;
    }
    .alertify {
        border: 2px solid rgb(4, 4, 4);
        box-shadow: 0 11px 34px 4px rgb(0, 0, 0);
    }
</style>
