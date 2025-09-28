
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%><%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>

<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
	<%--<div style="padding-top: 5px;" align="center">--%>
	<div class="uk-grid uk-grid-preserve" >
	   	<base:mDatePicker name="fromDate" styleClass="small" key="com.artonis.fnc.generalAccounting.automaticDocuments.fromDate"/>
    	<base:mDatePicker name="toDate"   styleClass="small" key="com.artonis.fnc.generalAccounting.automaticDocuments.toDate"/>
		<base:multiSelect name="treasurtEntitesCommaSep" styleClass="small" multiSelectLoaderUrl="combo/loadAllTreasuryEntities" key="com.artonis.fnc.generalAccounting.automaticDocuments.tre"></base:multiSelect>
	</div>
	<%--</div>--%>
	<%--<div style="padding-top: 5px;" align="center">--%>
	<%--</div>--%>
	<div class="uk-grid uk-grid-preserve">

		<base:multiSelect name="inventoryEntitesCommaSep" styleClass="small" multiSelectLoaderUrl="combo/loadAllInventoryEntities" key="com.artonis.fnc.generalAccounting.automaticDocuments.inventory"></base:multiSelect>
		<base:multiSelect name="purchaseSaleEntitesCommaSep" styleClass="small" multiSelectLoaderUrl="combo/loadAllPurchaseSaleEntities" key="com.artonis.fnc.generalAccounting.automaticDocuments.purchaseSale"></base:multiSelect>
		<!--<base:multiPersianSelctionCombo name="clinicEntitesCommaSep" styleClass="small" key="com.artonis.fnc.generalAccounting.automaticDocuments.clinic" comboLoaderUrl="combo/loadAllClinicEntities"/>-->
		<!-- <base:multiPersianSelctionCombo name="m169EntitesCommaSep" styleClass="small" key="com.artonis.fnc.generalAccounting.automaticDocuments.m169" comboLoaderUrl="combo/loadAllM169Entities"/> -->
		<base:multiSelect name="clinicEntitesCommaSep" styleClass="small" key="com.artonis.fnc.generalAccounting.automaticDocuments.clinic" multiSelectLoaderUrl="combo/loadAllClinicEntities"/>
	</div>

	<div align="center" style="margin: 15px;">
		<button class="uk-button uk-button-success" type="button" onclick="javascript:mehrsys_sql_grid_searchEntities()" id="searchBtn">
		<%=ResourceBoundleHolder.resourceBundle.getString("global.search")%>
	    </button>
	</div>

	<%--<div class="uk-grid uk-grid-preserve">
	        <base:multiSelect name="treasurtEntitesCommaSep" styleClass="small" multiSelectLoaderUrl="combo/loadAllTreasuryEntities" key="com.artonis.fnc.generalAccounting.automaticDocuments.tre"></base:multiSelect>
	      	<base:multiSelect name="inventoryEntitesCommaSep" styleClass="small" multiSelectLoaderUrl="combo/loadAllInventoryEntities" key="com.artonis.fnc.generalAccounting.automaticDocuments.inventory"></base:multiSelect>
			<base:multiSelect name="purchaseSaleEntitesCommaSep" styleClass="small" multiSelectLoaderUrl="combo/loadAllPurchaseSaleEntities" key="com.artonis.fnc.generalAccounting.automaticDocuments.purchaseSale"></base:multiSelect>

	        <!-- <base:multiPersianSelctionCombo name="m169EntitesCommaSep" styleClass="small" key="com.artonis.fnc.generalAccounting.automaticDocuments.m169" comboLoaderUrl="combo/loadAllM169Entities"/> -->
	</div>
	--%>
	<div id="gridButton"  >
		<base:mehrSys-sql-grid  sqlQueryKey="abbas" name="grid" selectable="multiple" showOperation="false"
	transportReadUrl="${basePath}sql-grid-read"  >
	<base:my-grid-column title='com.artonis.fnc.generalAccounting.automaticDocuments.entityGroup' field="entityGroupTxt" width="20px" />
	<base:my-grid-column title='com.artonis.fnc.generalAccounting.automaticDocuments.entityName' field="entityNameTxt" width="20px" />
	<base:my-grid-column title='com.artonis.fnc.generalAccounting.automaticDocuments.entitySerial' field="entitySerial" width="30px" />
	<base:my-grid-column title='com.artonis.fnc.generalAccounting.automaticDocuments.entityDate' field="entityDate" width="20px" />
	<base:my-grid-column title='com.artonis.fnc.generalAccounting.automaticDocuments.entityPrice' field="entityPrice" width="30px" />
	<base:my-grid-column title='com.artonis.fnc.generalAccounting.automaticDocuments.description' field="description" width="50px" />

	<base:my-grid-schema-field name="entityNameTxt" type="string" />
	<base:my-grid-schema-field name="entitySerial" type="string" />
	<base:my-grid-schema-field name="entityDate" type="string" />
	<base:my-grid-schema-field name="entityPrice" type="long" />
	<base:my-grid-schema-field name="entityGroupTxt" type="string" />
	<base:my-grid-schema-field name="description" type="string" />
</base:mehrSys-sql-grid>
<div style="padding-top: 5px;" align="left">
    <button class="uk-button uk-button-success" type="button" onclick="javascript:mehrsys_sql_grid_GenerateDocuments()" id="searchGenerateBtn">
		<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.fnc.generalAccounting.automaticDocuments.generateAutomatic")%>
	</button>
</div>
</div>
	</form>
</div>
<script type="text/javascript">
function searchEntities(){
    var fromDate=$("#fromDate").val();
    fromDate=fromDate.replace(/\//g, ':@:');
    var toDate=$("#toDate").val();
    toDate=toDate.replace(/\//g, ':@:');
    var allEntities=$("#treasurtEntitesCommaSep").val();
    $.ajax({
                   url:'${pageContext.request.contextPath}' + '/fnc/generalAccounting/accountingDocuments/automaticDocument/searchEntities/'
                    + fromDate+'/'+toDate+'/'+allEntities,
                   contentType:"application/json; charset=utf-8",
                   dataType:'json',
                   type:'POST',
                   success:function (data, success, xhr) {
                   }
               });
}
function getSearchObject(){
	var automaticdocumentVar = {};
	automaticdocumentVar.fromDate=$("#fromDate").val();
	automaticdocumentVar.toDate=$("#toDate").val();
	var tre = $("#treasurtEntitesCommaSep_multiSelect").val();
	var inv = $("#inventoryEntitesCommaSep_multiSelect").val();
    var purSale = $("#purchaseSaleEntitesCommaSep_multiSelect").val();
    var clinic = $("#clinicEntitesCommaSep_multiSelect").val();
    automaticdocumentVar.allEntities = [];
	if (tre != null && tre!= undefined)
        automaticdocumentVar.allEntities=automaticdocumentVar.allEntities.concat($("#treasurtEntitesCommaSep_multiSelect").val());
    if (inv != null && inv != undefined)
        automaticdocumentVar.allEntities=automaticdocumentVar.allEntities.concat($("#inventoryEntitesCommaSep_multiSelect").val());
    if (purSale != null && purSale != undefined)
        automaticdocumentVar.allEntities=automaticdocumentVar.allEntities.concat($("#purchaseSaleEntitesCommaSep_multiSelect").val());
	if (clinic != null && clinic != undefined)
        automaticdocumentVar.allEntities=automaticdocumentVar.allEntities.concat($("#clinicEntitesCommaSep_multiSelect").val());
	return automaticdocumentVar;
}

function mehrsys_sql_grid_GenerateDocuments() {
    var entityGrid = $("#grid").data("kendoGrid");
    var rowIds = '';
    if (entityGrid.select().length != 0) {
        for (var i = 0; i < entityGrid.select().length; i++) {
            rowIds += entityGrid.dataItem(entityGrid.select()[i]).compositionId + ",";
        }
        $.ajax({
            url: '${pageContext.request.contextPath}' + '/fnc/generalAccounting/accountingDocuments/automaticDocument/generateAutomaticDocuments/'
            + rowIds,
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            type: 'GET',
            success: function (data, success, xhr) {
                if (data.state == "success") {
                    $("#grid").data("kendoGrid").dataSource.read();
                    alertify.success(data.message);
                } else if (data.state == "error") {
                    alertify.error(data.message);
                }
            }
        });
    }
    else
        alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.fnc.generalAccounting.automaticDocuments.err.noSelect")%>');
}

function  doAfterSearch(searchJsonString){
  //$("#gridButton").show( "fold", 750 );
}
function _grid_onSelectRow(e){
	  
}
function _grid_onDataBound(e){
	  
}

</script>
