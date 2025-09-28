<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<div class="body-header">
    <ul class="uk-breadcrumb uk-h3" id="breadcrumb">
        <li id="breadcrumb-main-section"><span>${pageTitle}</span>
        </li>
    </ul>
    <div id="header-toolbar">
        <base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
        <div id="body-heade-save-div" style="display:none;">
            <base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create" onClick="javascript:ajax_new_reload()"/>
            <base:aPermission classNames="uk-button uk-button-danger" id="breadcrumb-main-section-cancel" key="global.crud.cancel"/>
        </div>
    </div>
</div>

<div class="uk-container uk-container-center my-uk-container">

    <form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id">
        <div class="uk-grid uk-grid-preserve">
            <base:comboBox name="goodsTemplate_id" key="com.artonis.inv.slip.CustomizeConsumptionSlip.goodsTemplate"
                           comboLoaderUrl="combo/loadGoodsTemplate" styleClass="small"/>
            <base:comboBox name="inventory_id" key="com.artonis.inv.operation.requestGoods.fromInventory"
                           comboLoaderUrl="combo/loadAllInventory" styleClass="small" selectIndex="0"/>
            <input type="hidden" id="consumptionSlip_id" name="consumptionSlip_id">
        </div>
    </form>
    <div align="center">
        <table border="1" width="80%" id="goods-table" style="">
            <tr style="background: linear-gradient(to bottom, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%);">
                <th width="5%">
                    <%=ResourceBoundleHolder.resourceBundle.getString("global.row") %>
                </th>
                <th width="10%">
                    <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.slip.CustomizeConsumptionSlip.goodsName") %>
                </th>
                <th width="10%">
                    <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.slip.CustomizeConsumptionSlip.measureUnit") %>
                </th>
                <th width="10%">
                    <%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.slip.CustomizeConsumptionSlip.count") %>
                </th>
            </tr>
        </table>

    </div>
    <div align="center"
         style="padding-top: 5px; padding-bottom: 5px;background: linear-gradient(to bottom, rgba(160, 188, 197, 1) 0%,rgba(190, 201, 206, 1) 37%,rgba(166, 186, 190, 1) 100%);">
        <base:buttonPermission id="saveCustomizeConsumtionSlip" key="global.crud.save" classNames="uk-button uk-button-primary"
                               style="width:180px;" onClick="saveConsumptionSlip()"/>
    </div>

</div>
<script type="application/javascript">
    var tlbWrapper = [];
    var inventoryId;

    function saveConsumptionSlip() {
        var tmp = [];

        for (var i = 0; i < tlbWrapper.length; i++) {
            var element = {};
            element['amount'] = tlbWrapper[i].amount;
            element['id'] = $("#id").val();
            element['goodsTemplate_id'] = $("#goodsTemplate_id").val();
            element['goods_id'] = tlbWrapper[i].goods_id;
            element['measureUnit_id'] = tlbWrapper[i].measureUnit_id;
            element['inventory_id'] = $("#inventory_id").val();
            element['consumptionSlip_id'] = $("#consumptionSlip_id").val();
            tmp[i] = element;
        }

        jQuery.ajax({
            url: '<c:url value='/' />' + '/inv/slip/customizeConsumptionSlip/save',
            type: "POST",
            data: JSON.stringify(tmp),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.state == "error") {
                    for (var i = 0; i < result.errors.length; i++) {
                        if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                            alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                        } else {
                            alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);

                        }
                    }
                }
                if (result.state == "success") {
                    alertify.success(result.message);
                    if (document.getElementById("loadedId") != null) {
                        document.getElementById("loadedId").value = result.baseObjectId;
                    }
                    if (document.getElementById("id") != null) {
                        document.getElementById("id").value = result.baseObjectId;
                    }
                    if (document.getElementById("consumptionSlip_id") != null) {
                        document.getElementById("consumptionSlip_id").value = result.consumptionSlip_id;
                    }
                }
            },
            error: function (result) {
                if (result.status == 401) {
                    window.location.href = "";
                }
            }
        });
    }

    function callback_deserialize(dataDeserial){
        $.getJSON("<c:url value='/' />" + "/inv/slip/customizeConsumptionSlip/loadConsumptionSlipGoods/" + dataDeserial.consumptionSlip_id, function (data) {
            createTable(data);
        });
        inventoryId=dataDeserial.inventory_id;
    }

    function callback_change_goodsTemplate_id(e) {
        $.getJSON("<c:url value='/' />" + "/inv/slip/customizeConsumptionSlip/loadGoodsTemplateItem/" + e.sender._old, function (data) {
            createTable(data);
        });
    }

    function createTable(data){
        deleteRow('goods-table');

        var tbl = document.getElementById('goods-table');
        tbl.setAttribute('style', 'width: 100%');
        var tbdy = document.createElement('tbody');
        var tr = document.createElement("tr");
        tr.style.background = 'linear-gradient(to bottom, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%)';
        var th1 = document.createElement("th");
        th1.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("global.row") %>'));
        th1.setAttribute('style', 'width: 5%');
        var th2 = document.createElement("th");
        th2.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.slip.CustomizeConsumptionSlip.goodsName") %>'));
        th2.setAttribute('style', 'width: 10%');
        var th3 = document.createElement("th");
        th3.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.slip.CustomizeConsumptionSlip.measureUnit") %>'));
        th3.setAttribute('style', 'width: 10%');

        var th4 = document.createElement("th");
        th4.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.slip.CustomizeConsumptionSlip.count") %>'));
        th4.setAttribute('style', 'width: 10%');

        tr.appendChild(th1);
        tr.appendChild(th2);
        tr.appendChild(th3);
        tr.appendChild(th4);
        tbdy.appendChild(tr);
        tbl.appendChild(tbdy);

        for (i = 0; i < data.length; i++) {
            var indexOfRow = i;
            var tmpRowWrapper = {};
            if(data[i].consumptionSlipId>0){
                tmpRowWrapper.goods_id = data[i].goodsId;
                tmpRowWrapper.measureUnit_id = data[i].measureUnitId;
                tmpRowWrapper.amount = data[i].amount;
            }else{
                tmpRowWrapper.goods_id = data[i].goods_id;
                tmpRowWrapper.measureUnit_id = data[i].measureUnit_id;
                tmpRowWrapper.amount = 0;
            }

            tlbWrapper[i] = tmpRowWrapper;

            var tr = document.createElement("tr");
            if (indexOfRow % 2 == 0) {
                tr.style.background = "ivory";
            }
            var td1 = document.createElement("td");
            td1.align = 'center';
            td1.appendChild(document.createTextNode(indexOfRow + 1));
            var td2 = document.createElement("td");
            if(data[i].consumptionSlipId>0){
                td2.id = 'tbl-' + indexOfRow + '-2-' + data[i].goodsId;
            }else{
                td2.id = 'tbl-' + indexOfRow + '-2-' + data[i].goods_id;
            }
            td2.style.paddingRight = '5px';
            td2.appendChild(document.createTextNode(data[i].goodsName));

            var td3 = document.createElement("td");
            td3.id = 'tbl-goodsMeasureUnit-' + indexOfRow;
            td3.style.paddingRight = '5px';
//                td3.appendChild(document.createTextNode(data[i].measureUnit));


            var select_input = document.createElement("select");
            select_input.className = "uk-width-1-1";
            select_input.id = 'measureUnit-select-' + indexOfRow;
            select_input.onchange = function (e) {
                var elementId = this.id;
                var rowNumber = elementId.split('-')[2];
                tlbWrapper[rowNumber].measureUnit_id = $("#" + elementId).val().split('-')[0];
            };

            $.ajax({
                url: "${pageContext.request.contextPath}" + "/inv/slip/customizeConsumptionSlip/loadAllMeasureUnitService/",
                type: "GET",
                serviceItemDataType: "json",
                async: false,
                contentType: "application/json; charset=utf-8",
                success: function (measurementUnitList) {
                    for (j = 0; j < measurementUnitList.length; j++) {
                        var option1 = document.createElement("option");
                        option1.value = measurementUnitList[j].ComboID + "-" + measurementUnitList[j].ComboCaption;
                        option1.text = measurementUnitList[j].ComboCaption;
                        select_input.add(option1);


                    }

                }, error: function (result) {
                    if (result.status == 401) {
                        top.location.href = top.location.href;
                    }
                }
            });

            td3.appendChild(select_input);
            if(data[i].consumptionSlipId>0){
                select_input.value = data[i].measureUnitId + '-' + data[i].measureUnitName;
            }else{
                select_input.value = data[i].measureUnit_id + '-' + data[i].measureUnit;
            }


            var td4 = document.createElement("td");
            td4.id = 'tbl-' + indexOfRow + '-4';
            var amount_input = document.createElement("input");
            amount_input.className = "uk-width-1-1";
            amount_input.id = 'amount-txt-' + indexOfRow;
            amount_input.type = 'text';
            amount_input.style.textAlign = 'center';
            amount_input.tabIndex = indexOfRow;

            if(data[i].consumptionSlipId>0){

                amount_input.value = data[i].amount;
            }else{
                amount_input.value = addCommaSeparator(0);
            }


            amount_input.onkeyup = function (e) {
                if (!isNumberKey(e)) {
                    var str = (this.value).toUpperCase();
                    this.value = str.replace(String.fromCharCode(e.keyCode), "");
                }
                if ((this.value).length == 0 || isNaN(this.value)) {
                    this.value = 0;
                }
                var hasDotLastOfString = false;
                if (this.value.indexOf('.') + 1 == this.value.length) {
                    hasDotLastOfString = true;
                }
                this.value = parseFloat(this.value);
                if (hasDotLastOfString) {
                    this.value = this.value + '.';
                }
                var splitArray = this.id.split('-');
                tlbWrapper[splitArray[2]].amount = this.value;

            }
            td4.appendChild(amount_input);

            tr.appendChild(td1);
            tr.appendChild(td2);
            tr.appendChild(td3);
            tr.appendChild(td4);

            tbdy.appendChild(tr);
            tbl.appendChild(tbdy);


        }
    }

    function deleteRow(tableID) {
        try {
            var table = document.getElementById(tableID);
            var rowCount = table.rows.length;
            for (var i = 0; i < rowCount; i++) {
                var row = table.rows[i];
                table.deleteRow(i);
                rowCount--;
                i--;
            }
            ;
        } catch (e) {
            alert(e);
        }
        ;
        //getValues();
    }

    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 190)
            return false;
        return true;
    }

    $("#consumtionSlipSave").click(function () {
        $("#consumtionSlipSave").prop("disabled", true);

    });

    function restPageClientSide(){
        deleteRow('goods-table');
        $("#inventory_id").val('');
        tlbWrapper = [];
    }

    function callback_DataBound_inventory_id(e){
        if(inventoryId!=undefined){
            $("#inventory_id").val(inventoryId);
            $("#inventory_id_Comb").data("kendoComboBox").value(inventoryId);
        }
    }

    jQuery.extend(jQuery.expr[':'], {
        focusable: function (el, index, selector) {
            return $(el).is('a, button, [tabindex]');
        }
    });

    $(document).on('keypress', 'input,select', function (e) {
        if (e.which == 13) {
            e.preventDefault();
            // Get all focusable elements on the page
            var $canfocus = $(':focusable');
            var index = $canfocus.index(document.activeElement) + 1;
            if (index >= $canfocus.length) index = 0;
            $canfocus.eq(index).focus();
            }
    });



</script>
