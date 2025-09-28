
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
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
    <base:dialogAlert name="statesIsInvalid" key="fnc.generalAccounting.accountingDocuments.docOperation.stateIsInvalid"/>
	<!--  <span class="title"><%= ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.accountingDocuments.docOperation.sorting")%></span> 
     <div class="box"> 
     <div class="uk-grid uk-grid-preserve">
            <base:comboBox styleClass="verysmall" name="financeYear_id" key="fnc.generalAccounting.accountingDocuments.docOperation.financeYear" value="financeYearName" comboLoaderUrl="combo/loadAllFinanceYear"/>
			<base:mDatePicker styleClass="verysmall" name="fromDate" disabled="true" key="fnc.generalAccounting.accountingDocuments.docOperation.fromDate"/>
			<base:mDatePicker styleClass="verysmall" name="toDate" key="fnc.generalAccounting.accountingDocuments.docOperation.toDate"/>
     </div>
      <div class="uk-grid uk-grid-preserve">
      </div>
     <div style="text-align: center">
	     <button class="uk-button uk-button-success" type="button" onclick="javascript:doSorting()" id="sortingBtn">
		      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.accountingDocuments.docOperation.sorting")%>
	     </button>
	      <button class="uk-button uk-button-success" type="button" onclick="javascript:clearSortintFileds()" id="sortingBtn">
		      <%=ResourceBoundleHolder.resourceBundle.getString("global.clearAndSearch")%>
	     </button>
	 </div>
     </div> -->
     <div class="uk-grid uk-grid-preserve">
     </div>
     <div class="uk-grid uk-grid-preserve">
     </div> 
     <div class="uk-grid uk-grid-preserve">
     </div> 
     <div class="uk-grid uk-grid-preserve">
     </div> 
     <span class="title"><%= ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.accountingDocuments.docOperation.groupOperation")%></span> 
     <div class="box"> 
     <div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="small" name="fromGroupDate" key="fnc.generalAccounting.accountingDocuments.docOperation.fromDate"/>
			<base:mDatePicker styleClass="small" name="toGroupDate" key="fnc.generalAccounting.accountingDocuments.docOperation.toDate"/>
     </div>
     <div class="uk-grid uk-grid-preserve">
			<base:testBox name="fromDocNumber" key="fnc.generalAccounting.accountingDocuments.docOperation.fromDocNumber" styleClass="verySmall"/>
			<base:testBox name="toDocNumber" key="fnc.generalAccounting.accountingDocuments.docOperation.toDocNumber" styleClass="verySmall" />
	 </div>
	 <div class="uk-grid uk-grid-preserve">
		    <base:testBox name="fromReferenceNumber" key="fnc.generalAccounting.accountingDocuments.docOperation.fromAtfNumber" styleClass="verySmall"/>
			<base:testBox name="toReferenceNumber" key="fnc.generalAccounting.accountingDocuments.docOperation.toAtfNumber" styleClass="verySmall" />
	 </div>
	 <div class="uk-grid uk-grid-preserve">
	 		<base:comboBox  name="fromState" value="name" key="fnc.generalAccounting.accountingDocuments.docOperation.fromState" comboLoaderUrl="combo/loadAllConfirmDocumentState" styleClass="small"/>
	 	 	<base:comboBox  name="toState" value="name" key="fnc.generalAccounting.accountingDocuments.docOperation.toState" comboLoaderUrl="combo/loadAllCertainDocumentState" styleClass="small"/>
	 </div> 
	 <div class="uk-grid uk-grid-preserve">
	 			<base:comboBox  name="docType" value="name" key="fnc.generalAccounting.accountingDocuments.doc.Type" comboLoaderUrl="combo/loadAllDocumentType" styleClass="verysmall"/>
	 </div>
	 </div>
	 <div class="box"> 
	     <div style="text-align: center">
		     <button class="uk-button uk-button-success" type="button" onclick="javascript:groupOperation()" id="grpOperationBtn">
			      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.accountingDocuments.docOperation.doOperation")%>
		     </button>
		      <button class="uk-button uk-button-success" type="button" onclick="javascript:clearGroupOperationFileds()" id="grpOperationBtn">
			      <%=ResourceBoundleHolder.resourceBundle.getString("global.clearAndSearch")%>
		     </button>
		 </div>
	 </div>
     <div class="box"> 
	     <div style="text-align: center">
	     	 <base:comboBox  name="destinationDocType" value="name" key="fnc.generalAccounting.accountingDocuments.docOperation.docTypeDestination" comboLoaderUrl="combo/loadAllDocumentType" styleClass="verysmall"/>
		     <button class="uk-button uk-button-success" type="button" onclick="javascript:docTypeOperation()" id="grpOperationBtn">
			      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.accountingDocuments.docOperation.docTypeOperation")%>
		     </button>
		 </div>
	 </div>
     
	
	</form>
</div>
<style>
.box { 
	border : 1px solid black; 
	padding : 10px; 
} 
.title { 
	position : inherit; 
	top : 10px; 
	left : 25px; 
	border-left : 1px solid orange; 
	border-right : 1px solid orange; 
	background-color : white; 
	padding : 0 5px; 
}
</style>
<script type="text/javascript">
function callback_change_financeYear_id(e){
	var financeYear_id = $("#financeYear_id_Comb").data("kendoComboBox")._selectedValue;
	if(financeYear_id != null){
		 $("#fromDate").slideToggle(600);
		 $("#fromDate_lbl_date").slideToggle(600);
		 $("#toDate").slideToggle(600);
		 $("#toDate_lbl_date").slideToggle(600);
	}
}
function doSorting(){
	var docOperationJsonString = "{}";
	docOperationJsonString = JSON.stringify(getSearchObject());
    docOperationJsonString = docOperationJsonString.replace(/\//g, ':@:');
    $.ajax({
			       url: '${pageContext.request.contextPath}'+'/fnc/generalAccounting/accountingDocuments/documentOperation/doSorting/'+docOperationJsonString,
                   data:JSON.stringify(docOperationJsonString),
                   dataType:'json',
                   type:'POST',
                   success:function (data, success, xhr) {
                       alertify.success(data.message);
                       
                   },
			       error: function (e) {
				       alert('Error: ' + e.responseText);
			}
         });
	}
function groupOperation(){
	 var fromState = $("#fromState_Comb").data("kendoComboBox")._selectedValue;
	 var toState = $("#toState_Comb").data("kendoComboBox")._selectedValue;
	 if (fromState == 3)
		 fromState = 4;
	 var difference=Math.abs(fromState-toState);
	if(difference ==1){
		var docOperationJsonString = "{}";
	    docOperationJsonString = JSON.stringify(getSearchObject());
    	docOperationJsonString = docOperationJsonString.replace(/\//g, ':@:');
    	 $.ajax({
			       url: '${pageContext.request.contextPath}'+'/fnc/generalAccounting/accountingDocuments/documentOperation/groupOperation/'+docOperationJsonString,
                   data:JSON.stringify(docOperationJsonString),
                   dataType:'json',
                   type:'POST',
                   success:function (data, success, xhr) {
                       alertify.success(data.message);
                       
                   },
			       error: function (e) {
				       alert('Error: ' + e.responseText);
			}
         });
	}
	else{
	  $("#statesIsInvalid").dialog("open");
	}
}
function docTypeOperation(){
	 var docOperationJsonString = "{}";
	 docOperationJsonString = JSON.stringify(getSearchObject());
   	 docOperationJsonString = docOperationJsonString.replace(/\//g, ':@:');
   	 $.ajax({
			      url: '${pageContext.request.contextPath}'+'/fnc/generalAccounting/accountingDocuments/documentOperation/docTypeOperation/'+docOperationJsonString,
                  data:JSON.stringify(docOperationJsonString),
                  dataType:'json',
                  type:'POST',
                  success:function (data, success, xhr) {
                      alertify.success(data.message);
                  },
			      error: function (e) {
				       alert('Error: ' + e.responseText);
				  }
        });
}
function getSearchObject(){
		var docOperationForm = {};
		docOperationForm.fromDate=$("#fromDate").val();
		docOperationForm.toDate=$("#toDate").val();
		docOperationForm.financeYear_id=$("#financeYear_id").val();
		docOperationForm.fromGroupDate=$("#fromGroupDate").val();
		docOperationForm.toGroupDate=$("#toGroupDate").val();
		docOperationForm.fromDocNumber=$("#fromDocNumber").val();
		docOperationForm.toDocNumber=$("#toDocNumber").val();
		docOperationForm.fromReferenceNumber=$("#fromReferenceNumber").val();
		docOperationForm.toReferenceNumber=$("#toReferenceNumber").val();
		docOperationForm.fromState=$("#fromState").val();
		docOperationForm.toState=$("#toState").val();
		docOperationForm.docType=$("#docType").val();
		docOperationForm.destinationDocType=$("#destinationDocType").val();
		return docOperationForm;
}
$(document).ready(function(){
		    	$.getJSON(basePath + '/reset/' + 0, function(data) {
				$('#mainForm').deserialize(data);
                if(typeof(callback_deserialize) == "function"){
                    callback_deserialize(data);
                }
			});
			 $("#fromDate").css('background-color','rgb(206, 215, 235)');
			 
});
function clearGroupOperationFileds(){
	 document.forms[0].reset();
	 $(':input').val('');
}
function clearSortintFileds(){
	 $("#financeYear_id").val('');
     $("#financeYear_id_Comb").data("kendoComboBox").value('');
}
	 

</script>
