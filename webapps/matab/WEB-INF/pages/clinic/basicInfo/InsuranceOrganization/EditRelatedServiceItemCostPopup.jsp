<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
 String serviceItemId=request.getAttribute("serviceItemId").toString();
 String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
 String gridRead=request.getContextPath()+"/clinic/basicInfo/insuranceOrganization/popup/editRelatedServiceItemCostPopupNew/editRelatedServiceItemCostGridGridRead/"+serviceItemId;
%>
<script>
    var serviceItemId = ${serviceItemId};
    var relativeValue = '${relativeValue}';
    var cost = '${cost}';
    var professionalPercent='${professionalPercent}';
    var technicalPercent='${technicalPercent}';
    if(technicalPercent=='null'){
        technicalPercent='0';
    }
    var professional_ka_price='${professional_ka_price}';
    var technical_ka_price='${technical_ka_price}';
    //
    function _editRelatedServiceItemCostGrid_onEdit(e){
        var data = this.dataItem($(e.target).closest("tr"));
        //
        $("#serviceItemCostIdValues_multiSelect").data("kendoMultiSelect").value(data.serviceItemCostId);
        $("#serviceItemCostIdValues_multiSelect").data("kendoMultiSelect").enable(false);
        //
        if (!(relativeValue != 'null' && eval(relativeValue) > 0)) {
            $("#popupForm_quantity").val(data.quantity);
            setNumericTextValue();
        }
    }
    //
    function _editRelatedServiceItemCostGrid_onDelete(e){
        var data = this.dataItem($(e.target).closest("tr"));
        //
        var areYouSure = "<%=ResourceBoundleHolder.resourceBundle.getString("action.alert.areYouSure.delete")%>";
        //
        alertify.confirm(areYouSure, function (e) {
            if (e) {
                //
                var requestUrl = "${pageContext.request.contextPath}" + "/clinic/basicInfo/insuranceOrganization/popup/deleteRelatedServiceItemCost/"
                    + data.type + "/" + data.itemId;
                //
                $.getJSON(requestUrl, function (data) {
                    if (data.state = "success") {
                        alertify.success(data.message);
                        //
                        $("#editRelatedServiceItemCostGrid").data("kendoGrid").dataSource.read();
                        //
                        resetPopup();
                    } else {
                        alertify.error(data.error);
                    }
                });
            }
        });
    }
    //
    function _editRelatedServiceItemCostGrid_requestEnd(){
    }
    //
    function resetPopup() {
        $("#serviceItemCostIdValues_multiSelect").data("kendoMultiSelect").value('');
        $("#serviceItemCostIdValues_multiSelect").data("kendoMultiSelect").enable(true);
        //
        if (!(relativeValue != 'null' && eval(relativeValue) > 0)) {
            $("#popupForm_quantity").val('');
            setNumericTextValue();
        }
    }
    //
    function savePopup(){
        var serviceItemCostIds = $("#serviceItemCostIdValues_multiSelect").data("kendoMultiSelect").value();
        var quantity = $("#popupForm_quantity").val();
        //
        if (serviceItemCostIds.length < 1 || !$.isNumeric(quantity)) {
            alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.insuranceItem.popup.error.fillForm")%>");
            return;
        }
        //
        $(".popupBtnDiv button").prop("disabled","disabled");
        //
        var serviceItemCostIdsStr = '';
        for (var i = 0; i < serviceItemCostIds.length; i++) {
            if (i > 0) {
                serviceItemCostIdsStr += ',' + serviceItemCostIds[i];
            } else {
                serviceItemCostIdsStr = serviceItemCostIds[i];
            }
        }
        //
        console.log(cost);
        if(cost>0){
            var requestUrl = "${pageContext.request.contextPath}" + "/clinic/basicInfo/insuranceOrganization/popup/saveRelatedServiceItemCost/"
                + serviceItemCostIdsStr + "/" + serviceItemId + "/" + quantity+"/"+cost;
            //
            $.getJSON(requestUrl, function (data) {
                if (data.state = "success") {
                    alertify.success(data.message);
                    //
                    $("#editRelatedServiceItemCostGrid").data("kendoGrid").dataSource.read();
                    //
                    resetPopup();
                } else {
                    alertify.error(data.error);
                }
                //
                $(".popupBtnDiv button").prop("disabled","");
            });
        }else{
            var requestUrl = "${pageContext.request.contextPath}" + "/clinic/basicInfo/insuranceOrganization/popup/saveRelatedServiceItemCostForRelativeValue/"
                + serviceItemCostIdsStr + "/" + serviceItemId + "/" + professionalPercent+"/"+technicalPercent+"/"+professional_ka_price+"/"+technical_ka_price;
            //
            $.getJSON(requestUrl, function (data) {
                if (data.state = "success") {
                    alertify.success(data.message);
                    //
                    $("#editRelatedServiceItemCostGrid").data("kendoGrid").dataSource.read();
                    //
                    resetPopup();
                } else {
                    alertify.error(data.error);
                }
                //
                $(".popupBtnDiv button").prop("disabled","");
            });
        }


    }
    //
    $(document).ready(function () {
        if (relativeValue != 'null' && eval(relativeValue) > 0) {
            $("#popupForm_quantity").val(Number(relativeValue).toFixed(2));
            setNumericTextValue();
            //
            $("#popupForm_quantity_txt").prop("disabled","disabled");
        }
    });
</script>

<div style="padding-top: 20px; padding-bottom: 20px;">
    <div class="uk-grid uk-grid-preserve popupFormDiv">
        <base:multiSelect name="serviceItemCostIdValues" styleClass="normal" multiSelectLoaderUrl="combo/loadAllCurrentServiceItemCost" serverFilter="true"
                          key="com.artonis.clinic.basicInfo.insuranceItem.popup.service" />
        <base:testBoxNumericEx name="popupForm_quantity" key="com.artonis.clinic.basicInfo.insuranceItem.popup.quantity" styleClass="small"/>
    </div>
</div>

<div align="center" style="padding-bottom: 10px;" class="popupBtnDiv">
    <button class="uk-button uk-button-success" onclick="savePopup()" >
        <%=ResourceBoundleHolder.resourceBundle.getString("global.crud.save")%>
    </button>
    <button class="uk-button uk-button-success" onclick="resetPopup()">
        <%=ResourceBoundleHolder.resourceBundle.getString("global.crud.new")%>
    </button>
</div>

<%--<base:my-grid name="editRelatedServiceItemCostGrid" transportReadUrl="${basePath}/editRelatedServiceItemCostGridGridRead" selectable="single" serverPaging="false"--%>
<base:my-grid name="editRelatedServiceItemCostGrid" transportReadUrl="<%=gridRead%>" selectable="single" serverPaging="false"
              showToolbar="false" groupable="false" filterable="false" sortable="false">
    <base:my-grid-column title="com.artonis.clinic.basicInfo.insuranceItem.popup.serviceName" field="serviceName" width="80px"/>
    <base:my-grid-column title="com.artonis.clinic.basicInfo.insuranceItem.popup.serviceCode" field="serviceCode" width="20px"/>
    <base:my-grid-column title="com.artonis.clinic.basicInfo.insuranceItem.popup.quantity" field="quantity" width="20px"/>
    <base:my-grid-column title="com.artonis.clinic.basicInfo.insuranceItem.popup.itemTotalCost" field="itemTotalCost" width="20px"/>
    <base:my-grid-column title="com.artonis.clinic.basicInfo.insuranceItem.popup.totalCost" field="totalCost" width="20px"/>
    <base:my-grid-schema-field name="quantity" type="string"/>

</base:my-grid>

<base:footer/>

<style>
    .uk-modal-dialog {
        padding-top: 0px;
        padding-bottom: 0px;
        top: 5px;
        padding-right: 0px;
        padding-left: 0px;
        width: 70% !important;
        right: 40% !important;
        margin-top: 5% !important;
        border-style: solid;
        border-width: thin;
    }

    .my-popup-body {
        padding-top: 5px;
        padding-bottom: 5px;
        padding-right: 5px;
        padding-left: 5px;
    }

    .my-uk-container {
        margin-top: 5px;
        margin-bottom: 5px;
        padding-top: 5px;
        padding-bottom: 5px;
        margin-right: 0px;
        margin-left: 0px;
        padding-right: 2px;
        padding-left: 2px;
    }

    .my-popup-title {
        font-weight: bold !important;
        color: #444444;
        padding-right: 10px;
    }

    div .k-multiselect {
        border-color: gray;
        border-radius: 5px;
    }

    #popupForm_quantity_txt{
        border-color: gray;
        border-radius: 5px;
        border-style: solid;
        border-width: thin;
        height: 25px;
        padding: 3px;
    }

    .popupFormDiv > [class*='uk-width-'] {
        padding-right: 10px !important;
    }
</style>
