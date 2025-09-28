<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	String basePath = request.getAttribute("controllerBasePath").toString();
%>

<base:pageHeader/>

<div id="modal-copyItem" style="display: inline;">
</div>
<%--<div id="header-toolbar">--%>
    <base:buttonPermission  key="com.artonis.clinic.basicInfo.serviceItemCost.update"
                           id="update-btn"  classNames="uk-button uk-button-success" onClick="updateServiceitemcost()"/>
<%--</div>--%>

<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 4px; ">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:multiSelect serverFilter="true" name="groupValues" styleClass="small" multiSelectLoaderUrl="combo/allGroup" key="com.artonis.clinic.basicInfo.service.group_id" />
			<base:multiSelect serverFilter="true" name="serviceValues" styleClass="small" multiSelectLoaderUrl="combo/allService" key="com.artonis.clinic.basicInfo.service.name" />
			<base:checkbox name="showCurrentService" key="com.artonis.clinic.basicInfo.serviceItemCost.showCurrentService" divLableStyle="width: 25%;" divCheckBoxStyle="width: 10%;"/>
		</div>
	</form>
</div>

<base:my-grid-search selectable="single" printButtonIds="printDetail" printButtonNames="Detail" printButtonResoureceBundle="com.artonis.clinic.basicInfo.serviceItemCost.print.detail">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCost.group_id'  field="group_name" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCost.service_id'  field="service_name" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCost.cost'  field="totalCost" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeServiceAmount.fromDate'  field="fromDate" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeServiceAmount.toDate'  field="toDate" width="50px"/>

    <base:my-grid-schema-field name="service_text" type="string"/>
    <base:my-grid-schema-field name="totalCost" type="long"/>
    
    <base:my-grid-function name="serviceItemCostCopy" styleClass="uk-button-primary" functionClick="grid_copyItem" text="com.artonis.clinic.basicInfo.serviceItemCost.copyItem" />
</base:my-grid-search>

<base:footer/>

<script type="text/javascript">
    function grid_copyItem(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        var sic_id = data.id;
        if (e) {
            var modal;
            $(function () {
                var popUpUrl = '<%=basePath%>' + "/popup/copyServiceItemCost";
                $.get(popUpUrl, function (data) {
                    $("#modal-copyItem").empty();
                    var id = "modal-copyItem_popup";
                    $("#modal-copyItem").append('<div id="' + id + '" class="uk-modal" data-serviceItemCostId="' + sic_id + '">');
                    $("#" + id).append(data);
                    modal = new $.UIkit.modal.Modal("#" + id);
                    $("#" + id).on(
                        {
                            'uk.modal.hide': function () {
                                $("#modal-copyItem").empty();
                            }
                        }
                    );
                    modal.show();
                });
            });
        }
    }

    function getSearchObject(){
        var searchObj = {};
        searchObj.serviceValues = $("#serviceValues_multiSelect").val();
        var arrayDataItems=$("#serviceValues_multiSelect").data("kendoMultiSelect")._dataItems;
        if(arrayDataItems!=undefined &&arrayDataItems.length>0){
            var service_item_valueText='';
            for(var i=0;i<arrayDataItems.length;i++){
                service_item_valueText+=arrayDataItems[i].ComboCaption+' , ';
            }
           // searchObj.services_text=service_item_valueText.substring(0,service_item_valueText.length-3);
        }

        searchObj.groupValues = $("#groupValues_multiSelect").val();
         arrayDataItems=$("#groupValues_multiSelect").data("kendoMultiSelect")._dataItems;
        if(arrayDataItems!=undefined &&arrayDataItems.length>0){
            var group_valueText='';
            for(var j=0;j<arrayDataItems.length;j++){
                group_valueText+=arrayDataItems[j].ComboCaption+' , ';
            }
            searchObj.group_text=group_valueText.substring(0,group_valueText.length-3);
        }

        searchObj.showCurrentService = $("#showCurrentService").prop('checked');
        return searchObj;
    }

    $(document).ready(function () {
        $("#showCurrentService").prop('checked', 'checked');
	});

//    $('#update-btn').on("click", function (e) {
    function updateServiceitemcost(){
        $.getJSON(basePath + 'update', function (result) {
            if (result.state == "success") {
                grid = $("#searchGrid").data("kendoGrid");
                grid.dataSource.page(grid.dataSource.page());
                alertify.success(result.message);
            }
        });
    }

    function printDetail(){
        var searchJsonString = "{}";
        if(typeof(getSearchObject)=="function"){
            searchJsonString = JSON.stringify(getSearchObject());
            searchJsonString = searchJsonString.replace(/\//g, ':@:');
        }

        var urlGrid = basePath + "print/serviceItemCostDetail/" + searchJsonString;

        window.open(urlGrid);

        if(typeof(doAfterSearch)=="function"){
            doAfterSearch(searchJsonString);
        }

    }

</script>