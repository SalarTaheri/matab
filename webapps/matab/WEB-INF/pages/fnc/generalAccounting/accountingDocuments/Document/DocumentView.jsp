<%@page import="com.artonis.fnc.core.service.util.FncCoreServiceUtil"%>
<%@page import="com.artonis.fnc.core.model.FinanceYear"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
FinanceYear activeFinanceYear = FncCoreServiceUtil.getActiveFinanceYear();
Long avtiveFinanceYearId=  0L;
if (activeFinanceYear != null){
	avtiveFinanceYearId = activeFinanceYear.getId();
}

%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=ResourceBoundleHolder.resourceBundle.getString("menu.fnc.generalAccounting.accounting.docView")%></span></li>
	</ul>
	<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="documentInput-new-btn" onClick="javascript:reload()"/>
</div>

<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="fromDocNumber" key="fnc.generalAccounting.accountingDocuments.doc.fromDocNumber" styleClass="verySmall"/>
			<base:testBox name="toDocNumber" key="fnc.generalAccounting.accountingDocuments.doc.toDocNumber" styleClass="verySmall" />
			<base:testBox name="fromReferenceNumber" key="fnc.generalAccounting.accountingDocuments.doc.fromReferenceNumber" styleClass="verySmall"/>
			<base:testBox name="toReferenceNumber" key="fnc.generalAccounting.accountingDocuments.doc.toReferenceNumber" styleClass="verySmall" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="verysmall" name="fromDate" key="fnc.generalAccounting.accountingDocuments.doc.fromDate"/>
			<base:mDatePicker styleClass="verysmall" name="toDate" key="fnc.generalAccounting.accountingDocuments.doc.toDate"/>
			<base:testBoxNumericEx styleClass="verysmall"  name="fromAmount" key="fnc.generalAccounting.accountingDocuments.doc.fromAmount"/>
			<base:testBoxNumericEx styleClass="verysmall"  name="toAmount" key="fnc.generalAccounting.accountingDocuments.doc.toAmount"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:multiSelect name="type" styleClass="verysmall" multiSelectLoaderUrl="combo/loadAllDocumentType" key="fnc.generalAccounting.accountingDocuments.doc.Type"></base:multiSelect>
			<base:comboBox  name="currencyType" value="name" key="fnc.generalAccounting.accountingDocuments.doc.currencyType" comboLoaderUrl="combo/loadAllCurrencyType" styleClass="verysmall"/>
			<base:comboBox  name="state" value="name" key="fnc.generalAccounting.accountingDocuments.doc.State" comboLoaderUrl="combo/loadAllDocumentState" styleClass="verysmall"/>
			<base:comboBox  name="source" value="name" key="fnc.generalAccounting.accountingDocuments.doc.source" comboLoaderUrl="combo/loadAllDocumentSource" styleClass="verysmall"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
             <base:comboBox styleClass="verysmall" name="financeYear_Id" key="hrm.basicinfo.salaryperiod.financeYear" value="financeYearName" comboLoaderUrl="combo/loadAllFinanceYear"/>
             <base:comboBox  name="balanceStateId" value="name" key="fnc.generalAccounting.accountingDocuments.doc.State" comboLoaderUrl="combo/loadAllBalanceState" styleClass="verysmall"/>
			 <base:testBox name="description" key="fnc.generalAccounting.accountingDocuments.doc.description" styleClass="small" divStyle="width:  30%;"/>
        </div>
		<base:my-grid-search defaultReadUrlIsRelative="true" printButtonIds="printList" printButtonNames="printList" printButtonResoureceBundle="fnc.generalAccounting.accountingDocuments.doc.printList">
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.docNumber'  field="docNumber" width="30px"/>
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.referenceNumber'  field="referenceNumber" width="30px"/>
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.Date'  field="date" width="40px"/>
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.createDate'  field="createDate" width="40px"/>
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.Type'  field="typeStr" width="30px"/>
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.State'  field="stateStr" width="30px"/>
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.amount'  field="documentAmountWithSeperator" width="40px"/>
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.description'  field="description" width="100px"/>
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.State'  field="balanceStateText" width="30px"/>
		    <base:my-grid-function text="fnc.generalAccounting.accountingDocuments.doc.print" functionClick="printDocumentItemView"  name="documentInput-print-btn"/>
		
	        <base:my-grid-schema-field name="docNumber" type="string"/>
	        <base:my-grid-schema-field name="referenceNumber" type="string"/>
	        <base:my-grid-schema-field name="date" type="string"/>
	        <base:my-grid-schema-field name="createDate" type="string"/>
	        <base:my-grid-schema-field name="typeStr" type="string"/>
	        <base:my-grid-schema-field name="stateStr" type="string"/>
	        <base:my-grid-schema-field name="documentAmountWithSeperator" type="string"/>
	        <base:my-grid-schema-field name="description" type="string"/>
	        <base:my-grid-schema-field name="balanceStateText" type="string"/>
	        
			<base:my-grid-search-operation name="oprSabt" key="fnc.generalAccounting.accountingDocuments.doc.operation.sabt" style="width: 100px"/>
			<base:my-grid-search-operation name="oprBazgashtSabt" key="fnc.generalAccounting.accountingDocuments.doc.operation.bazgasht_sabt" style="width: 120px"/>
			<base:my-grid-search-operation name="oprTaeed" key="fnc.generalAccounting.accountingDocuments.doc.operation.taeed" style="width: 100px"/>
			<base:my-grid-search-operation name="oprBazgashtTaeed" key="fnc.generalAccounting.accountingDocuments.doc.operation.bazgasht_taeed" style="width: 120px"/>
			<base:my-grid-search-operation name="oprTasvib" key="fnc.generalAccounting.accountingDocuments.doc.operation.tasvib" style="width: 100px"/>
			<base:my-grid-search-operation name="oprBazgashtTasvib" key="fnc.generalAccounting.accountingDocuments.doc.operation.bazgasht_tasvib" style="width: 120px"/>
			<base:my-grid-search-operation name="oprCopy" key="fnc.generalAccounting.accountingDocuments.doc.operation.copy" style="width: 100px"/>
			<base:my-grid-search-operation name="oprSort" operation="sortDocuments" key="fnc.generalAccounting.accountingDocuments.doc.operation.sort" style="width: 100px"/>
		</base:my-grid-search>
     	<div style="text-align: center">
            <label id="${name}_lbl_txt" for="lbl"><%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.accountingDocuments.doc.destinationDocNumber")%></label>    		
    		<input type="text"  id="destinationDocNumber" name="destinationDocNumber" >
            <button class="uk-button uk-button-success" type="button" onclick="javascript:mergeDocument()" id="oprMerge" style="width: 120px">
	       	 	  <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.accountingDocuments.doc.operation.merge")%>
            </button>
            <%--<button class="uk-button uk-button-success" type="button" onclick="javascript:sortDocuments()" id="sort" style="width: 120px">--%>
	       		 <%--<%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.accountingDocuments.doc.operation.sort")%>--%>
            <%--</button>--%>
        </div>
	</form>
  
</div>
<base:footer/>
<script>
$(document).ready(function() {
	resetForm();
});
function resetForm(){
	$("#financeYear_Id_Comb").data("kendoComboBox").value("<%=avtiveFinanceYearId%>");
    $("#financeYear_Id_Comb").data("kendoComboBox")._initial=<%=avtiveFinanceYearId%>;
}
function getSearchObject(){
		var docVar = {};
		docVar.fromDocNumber=$("#fromDocNumber").val();
		docVar.toDocNumber=$("#toDocNumber").val();
		docVar.fromReferenceNumber=$("#fromReferenceNumber").val();
		docVar.toReferenceNumber=$("#toReferenceNumber").val();
		docVar.fromDate=$("#fromDate").val();
		docVar.toDate=$("#toDate").val();
		docVar.fromAmount=$("#fromAmount").val();
		docVar.toAmount=$("#toAmount").val();
		docVar.documentTypes=$("#type_multiSelect").val();
    	var arrayDataItems=$("#type_multiSelect").data("kendoMultiSelect")._dataItems;
    	if(arrayDataItems!=undefined &&arrayDataItems.length>0){
        	var service_item_valueText='';
        	for(var i=0;i<arrayDataItems.length;i++){
            	service_item_valueText+=arrayDataItems[i].ComboCaption+' , ';
        	}
        	docVar.documentTypes_text=service_item_valueText.substring(0,service_item_valueText.length-3);

    	}
		docVar.currencyType=$("#currencyType").val();
		docVar.currencyType_text=$("#currencyType_Comb").data("kendoComboBox").text()

		docVar.state=$("#state").val();
    	docVar.stateStr=$("#state_Comb").data("kendoComboBox").text()

		docVar.source=$("#source").val();
    	docVar.source_text=$("#source_Comb").data("kendoComboBox").text()

		docVar.financeYear_Id=$("#financeYear_Id").val();
    	docVar.financeYear_Id_text=$("#financeYear_Id_Comb").data("kendoComboBox").text()

		docVar.balanceStateId=$("#balanceStateId").val();
    	docVar.balanceStateId_text=$("#balanceStateId_Comb").data("kendoComboBox").text()

		docVar.description=$("#description").val();
		return docVar;
}

function getCurrentUrl(){
	var url = window.location.pathname;
	if (url.indexOf("/create") > -1){
		url = url.substring(0, url.indexOf("/create"));
	}else if (url.indexOf("/edit") > -1){
		url = url.substring(0, url.indexOf("/edit"));
	}
	return url;
}
function getSelectedItemIdSearchGrid(){
	var entityGrid = $("#searchGrid").data("kendoGrid");
	var rows = entityGrid.select();
	var rowEntity = [rows.length];
	rows.each(function(index, row) {
	  var selectedItem = entityGrid.dataItem(row);
	  rowEntity[index] = selectedItem; 
	});
	var rowIds = [rowEntity.length];
	for(var i=0; i<rowEntity.length; i++){
		var rowId = {};
		rowId.id = rowEntity[i].id;
		rowIds[i] = rowId;
	}
	return rowIds;
}

function mergeDocument(){
	var desDocNumber=$("#destinationDocNumber").val();
	var rowIds = getSelectedItemIdSearchGrid();
	if(desDocNumber != null && desDocNumber !="" && rowIds.length>0){
	$.ajax({
		url: getCurrentUrl() +'mergeDocument/'+desDocNumber,
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(rowIds),
		dataType: 'json',
		type: 'POST',
		success: function (data, success, xhr) {
               if (data.state == "error") {
                   for (var i = 0; i < data.errors.length; i++) {
                       if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
                           alertify.error($("label[for='" + data.errors[i].Field + "']").text() + ":  " + data.errors[i].Message);
                       } else {
                           alertify.error(data.errors[i].Field + ":  " + data.errors[i].Message);
                       }
                   }
               }else{
					var searchJsonString = "{}";
				    if(typeof(getSearchObject)=="function"){
				    	searchJsonString = JSON.stringify(getSearchObject());
				    	searchJsonString = searchJsonString.replace(/\//g, ':@:');
				    } 
					var urlGrid = basePath + "search/search/grid-read/" + searchJsonString;
					$("#searchGrid").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
					$("#searchGrid").data("kendoGrid").dataSource.read();
					$("#destinationDocNumber").val("");
					alertify.success(data.message);
               }
		},
		error: function (e) {
			alert('Error: ' + e.responseText);
		}
	});
	}
	
}

function sortDocuments(){
	$.ajax({
		url: getCurrentUrl() +'sort',
		contentType: "application/json; charset=utf-8",
		dataType: 'json',
		type: 'POST',
		success: function (data, success, xhr) {
               if (data.state == "error") {
                   for (var i = 0; i < data.errors.length; i++) {
                       if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
                           alertify.error($("label[for='" + data.errors[i].Field + "']").text() + ":  " + data.errors[i].Message);
                       } else {
                           alertify.error(data.errors[i].Field + ":  " + data.errors[i].Message);
                       }
                   }
               }else{
					var searchJsonString = "{}";
					var urlGrid = basePath + "search/search/grid-read/" + searchJsonString;
					$("#searchGrid").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
					$("#searchGrid").data("kendoGrid").dataSource.read();
					alertify.success(data.message);
               }
		},
		error: function (e) {
			alert('Error: ' + e.responseText);
		}
	});	
}

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 ) {
        return false;
    }
    return true;
}
function printDocumentItemView(e){
  	var data = this.dataItem($(e.target).closest("tr"));	  
	var searchJsonString = {};
	searchJsonString.doc_id=data.id;
	searchJsonString.docNumber=data.docNumber;
	searchJsonString.referenceNumber=data.referenceNumber;
	searchJsonString.date_=data.date;
	var baseUrl=getBaseUrl();
	searchJsonString = JSON.stringify(searchJsonString);
	searchJsonString = searchJsonString.replace(/\//g, ':@:');
	//var urlGrid = getBaseUrl() + "print/" + searchJsonString;
	var urlGrid = baseUrl + "print/documentItemView/" + searchJsonString;
	window.open( urlGrid);
}

function printprintList(){
    var searchJsonString = "{}";
    if(typeof(getSearchObject)=="function"){
        searchJsonString = JSON.stringify(getSearchObject());
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
    }

    var urlGrid = basePath + "printList/documentItemListView/" + searchJsonString;

    window.open( urlGrid);

    if(typeof(doAfterSearch)=="function"){
        doAfterSearch(searchJsonString);
    }

}
</script>