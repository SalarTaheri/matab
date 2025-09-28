
<%@page import="com.artonis.fnc.core.service.util.FncCoreServiceUtil"%>
<%@page import="com.artonis.fnc.core.model.FinanceYear"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="com.artonis.fnc.reports.books.model.GeneralAccountingReportsConstValue.AccountBookShowTypes"%>
<%@page import="com.artonis.fnc.reports.books.model.GeneralAccountingReportsConstValue"%>
<%@page import="com.artonis.core.base.core.EnumInterface"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
 <%--<script src="<c:url value='/resources/js/alterNativeCheckBox/js/jquery.toggles.js' />"></script>--%>
 <%--<link href="<c:url value='/resources/js/alterNativeCheckBox/css/toggles-soft.css'/>" 	rel="stylesheet" />--%>
<%
 String basePath = new UrlPathHelper().getOriginatingRequestUri(request); 
 String comboLoaderAccount = basePath + "combo/loadAllAccountCodingWithGroup";
 String comboLoaderFloatAccount = basePath + "/combo/loadAllFloatAccount";
 String fromDate="";
 String toDate="";
 FinanceYear financeYear = FncCoreServiceUtil.getActiveFinanceYear();
 if(financeYear != null){
	 fromDate = financeYear.getStartDate().toString();
	 toDate = financeYear.getEndDate().toString();
 }
	 
 %>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>

<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
	<input type="hidden" id="showType" name="showType" />
	 <div class="toggle-soft"></div>
	<div class="uk-grid uk-grid-preserve">
		   <base:comboBoxAutoComplete-buttonAddToCombo name="accountCoding_IdStr" key="com.artonis.fnc.reports.books.accountBook.accountCodeName"  popupUrlIsRelative="true"
                                     comboLoaderUrl="<%=comboLoaderAccount%>" dataTextField="nameCode"
                                     dataValueField="compositionId" minLength="0"
                                     hasTemplate="true"
                                     headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
                                     templateComaSep="name,code" popupUrl="popup/treeAccountCoding"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
    		<base:comboBoxAutoComplete-buttonAddToCombo name="floatAccountLevel1_Id" key="com.artonis.fnc.reports.books.accountBook.floatAccount1CodeName"  popupUrlIsRelative="true"
					                comboLoaderUrl="<%=comboLoaderFloatAccount%>" dataTextField="nameCode"
					                dataValueField="id" minLength="0"
					                hasTemplate="true"
					                headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
					                templateComaSep="name,code" popupUrl="/popup/treeFloatAccount"/>
					               
	        <base:comboBoxAutoComplete-buttonAddToCombo name="floatAccountLevel2_Id"  key="com.artonis.fnc.reports.books.accountBook.floatAccount2CodeName"  popupUrlIsRelative="true"
					                comboLoaderUrl="<%=comboLoaderFloatAccount%>" dataTextField="nameCode"
					                dataValueField="id" minLength="0"
					                hasTemplate="true"
					                headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
					                templateComaSep="name,code" popupUrl="/popup/treeFloatAccount"/>
	</div>
    <div class="uk-grid uk-grid-preserve">
           <base:comboBoxAutoComplete-buttonAddToCombo name="floatAccountLevel3_Id"  key="com.artonis.fnc.reports.books.accountBook.floatAccount3CodeName"  popupUrlIsRelative="true"
					               comboLoaderUrl="<%=comboLoaderFloatAccount%>" dataTextField="nameCode"
					               dataValueField="id" minLength="0"
					               hasTemplate="true"
					               headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
					               templateComaSep="name,code" popupUrl="/popup/treeFloatAccount"/>
					               
	      <base:comboBoxAutoComplete-buttonAddToCombo name="floatAccountLevel4_Id"  key="com.artonis.fnc.reports.books.accountBook.floatAccount4CodeName"  popupUrlIsRelative="true"
					               comboLoaderUrl="<%=comboLoaderFloatAccount%>" dataTextField="nameCode"
					               dataValueField="id" minLength="0"
					               hasTemplate="true"
					               headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
					               templateComaSep="name,code" popupUrl="/popup/treeFloatAccount"/>
	 </div>
	<div class="uk-grid uk-grid-preserve">
			<base:testBox name="fromDocNumber" key="com.artonis.fnc.reports.books.accountBook.fromDocNumber"  styleClass="verySmall"/>
			<base:testBox name="toDocNumber" key="com.artonis.fnc.reports.books.accountBook.toDocNumber" styledivLabel="width:16.5%" styleClass="verySmall" />
			<base:testBox name="fromReferenceNumber" key="com.artonis.fnc.reports.books.accountBook.fromReference" styledivLabel="width:11.5%" styleClass="verySmall"/>
			<base:testBox name="toReferenceNumber" key="com.artonis.fnc.reports.books.accountBook.toReference" styledivLabel="width:18%" styleClass="verySmall" />
	 </div>
	<div class="uk-grid uk-grid-preserve">
		    <base:mDatePicker name="fromDate"  styleClass="verySmall" key="com.artonis.fnc.reports.books.accountBook.fromDate"/>
		    <base:mDatePicker name="toDate"  styleClass="verySmall" styledivLabel="width:16.5%" key="com.artonis.fnc.reports.books.accountBook.toDate"/>
	</div>
	 <div class="uk-grid uk-grid-preserve">
	 <label class="p-q-label uk-form-label" style="padding-right: 5.5%;"  >
				   <%= ResourceBoundleHolder.resourceBundle.getString("com.artonis.fnc.reports.books.accountBook.showType")%>
	</label>
		<div class="container">
	 <%  EnumInterface[] accountBookShowTypesEnums = GeneralAccountingReportsConstValue.AccountBookShowTypes.getAllEnums(); 
	      for (EnumInterface accountBookShowTypesEnum : accountBookShowTypesEnums) {
	 %>
				<label class="p-q-label uk-form-label" style="">
					<%= ResourceBoundleHolder.resourceBundle.getString(accountBookShowTypesEnum.getName())%>
					<input type="radio" class="p-q-radio" name="showTypeOption" value="<%=accountBookShowTypesEnum.getValue() %>" onclick="handleClick(this)" />
				</label></br>
	<%} %>
		</div>
	 </div>
	  <div class="uk-grid uk-grid-preserve">
            <base:checkbox styleClass="small" name="showRemainingPrior" key="com.artonis.fnc.reports.books.accountBook.remainingPrior"/>
	  </div>

     <div style="text-align: center">
		   <base:buttonPopupGrid popUpGridName="grid"  customPopupUrlTailFunctionName="customizeUrlFunctionName" isRelative="true" popUpGridUrl="item/AccountBook"
								 formPopup="InClearingReceiptChequeItem" popUrl="item/AccountBook" key="global.search"/>
	       <button class="uk-button uk-button-success" type="button" onclick="javascript:clearAllFields()" id="clearAndSearchBtn">
		      <%=ResourceBoundleHolder.resourceBundle.getString("global.clearAndSearch")%>
	       </button>
	 </div>


	</form>
</div>
<script type="text/javascript">
function getSearchObject(){
	var accountBookVar = {};
	if($("#accountCoding_IdStr").val()==""){
        var alter="<%= ResourceBoundleHolder.resourceBundle.getString("com.artonis.fnc.reports.books.accountBook.error.notDetermineAccountCode")%>";
    	alertify.error(alter);
    	return;
    }
	accountBookVar.accountCoding_IdStr=$("#accountCoding_IdStr").val();
	accountBookVar.floatAccountLevel1_Id=$("#floatAccountLevel1_Id").val();
    accountBookVar.floatAccountLevel1CodeName=$("#floatAccountLevel1_Id_Comb").data("kendoComboBox").text();
    accountBookVar.floatAccountLevel2_Id=$("#floatAccountLevel2_Id").val();
    accountBookVar.floatAccountLevel2CodeName=$("#floatAccountLevel2_Id_Comb").data("kendoComboBox").text();
    accountBookVar.floatAccountLevel3_Id=$("#floatAccountLevel3_Id").val();
    accountBookVar.floatAccountLevel3CodeName=$("#floatAccountLevel3_Id_Comb").data("kendoComboBox").text();
    accountBookVar.floatAccountLevel4_Id=$("#floatAccountLevel4_Id").val();
    accountBookVar.floatAccountLevel4CodeName=$("#floatAccountLevel4_Id_Comb").data("kendoComboBox").text();
    accountBookVar.fromDocNumber=$("#fromDocNumber").val();
	accountBookVar.toDocNumber=$("#toDocNumber").val();
	accountBookVar.fromReferenceNumber=$("#fromReferenceNumber").val();
	accountBookVar.toReferenceNumber=$("#toReferenceNumber").val();
	accountBookVar.fromDate=$("#fromDate").val();
	accountBookVar.toDate=$("#toDate").val();
	accountBookVar.showType=$("#showType").val();
	accountBookVar.showRemainingPrior=$("#showRemainingPrior")[0].checked;
	return accountBookVar;
}
$(document).ready(function() {
      $("#target").kendoTooltip({
        autoHide: false
      });
      resetForm();
});

function resetForm(){
	 $("#fromDate").val("<%=fromDate%>");
     $("#toDate").val("<%=toDate%>");
}

function  doAfterSearch(searchJsonString){
     $("#accountCodeName").val($("#accountCoding_IdStr_Comb").data("kendoComboBox").text());
     $("#floatAccount1CodeName").val($("input[name=floatAccountLevel1_Id_Comb_input]").val());
     $("#floatAccount2CodeName").val($("input[name=floatAccountLevel2_Id_Comb_input]").val());
     $("#floatAccount3CodeName").val($("input[name=floatAccountLevel3_Id_Comb_input]").val());
     $("#floatAccount4CodeName").val($("input[name=floatAccountLevel4_Id_Comb_input]").val());
     $("#fromDateBy").val( $("#fromDate").val());
     $("#toDateBy").val( $("#toDate").val());
     $("#fromDocNumberBy").val( $("#fromDocNumber").val());   
     $("#toDocNumberBy").val( $("#toDocNumber").val());    
     $("#fromReferenceNumberBy").val( $("#fromReferenceNumber").val());
     $("#toReferenceNumberBy").val( $("#toReferenceNumber").val());
     //////////////
     $("#grid").kendoTooltip({
       filter: "td:nth-child(9)", //this filter selects the first column cells
       position: "relative",
       width: "15%",
       height: "6%",
       resizable: true,
       content: function(e){
       var dataItem = $("#grid").data("kendoGrid").dataItem(e.target.closest("tr"));
       var content = dataItem.description;
     return content
   }
 }).data("kendoTooltip");
     /////////////set sumTextBox
     setSumBoxes();
}

function clearAllFields(){
	document.forms[0].reset();
    $(':input').not(".p-q-radio").val('');
    document.getElementsByName('showTypeOption')[0].checked = true;
    $("#showType").val(1);
    resetForm();
}

    function customizeUrlFunctionName(){
      var showType= $("#showType").val();
         if(showType==1)
         return 'ByItem';
        else if(showType==2)
         return 'ByDocument';
        else if(showType==3)
         return 'ByDay';
         
}
    function viewDocument(e){
		var data = this.dataItem($(e.target).closest("tr"));
		var url="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accountingDocuments/document/edit/"+data.document_Id;
		window.open(url,'_blank');	  
}
    $(document).ready(function(){
       document.getElementsByName('showTypeOption')[0].checked = true;
       $("#showType").val(1);
       ////////
});
   function handleClick(myRadio) {
        $("#showType").val(myRadio.value);
}
  function viewDocumentByDoc(e){
		var data = this.dataItem($(e.target).closest("tr"));
		var url="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accountingDocuments/document/edit/"+data.document_Id;
		window.open(url,'_blank');	  
}
  function _grid_onSelectRow(e){
	  
  }
  function _grid_onDataBound(e){
	  
  }
  function setSumBoxes(){
  		var searchJsonString = "{}";
  		var accountBookVar = getSearchObject();
  		searchJsonString = JSON.stringify(getSearchObject());
    	searchJsonString = searchJsonString.replace(/\//g, ':@:');
    	var requestUrl = '${pageContext.request.contextPath}'+'/fnc/reports/books/accountBook/setSumBoxes/'+searchJsonString;
    	$.getJSON(requestUrl, function (data) {
    		$("#debitSum_txt").val(addCommaSeparator(data.debitSum));
    		$("#creditSum_txt").val(addCommaSeparator(data.creditSum));
    		$("#mandeSum_txt").val(addCommaSeparator(data.mandeSum));

    	});

  }
  function print(){
		var searchJsonString = "{}";
	    searchJsonString = JSON.stringify(getSearchObject());
	    searchJsonString = searchJsonString.replace(/\//g, ':@:');
		var urlGrid = "<%=basePath%>" + "print/" + searchJsonString;
	    window.open(urlGrid);
	}

	function callback_select_element_model_accountCoding_IdStr(e){
        if(e.modelID.toString().indexOf("group")>-1){
            $("#accountCoding_IdStr").val(e.modelID.toString().replace("group", "")+'@2');
        }else{
            $("#accountCoding_IdStr").val(e.modelID+'@1');
		}
	}

</script>
<style>
.container 
{ 
  border:2px solid #ccc;
  width:20%;
  height: 20%;
  overflow-y:
  scroll;margin-right:12%;
}
.toggle-slide {
  overflow: hidden;
  cursor: pointer;
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  direction: ltr;
}
.toggle-slide .toggle-on,.toggle-slide .toggle-off,.toggle-slide .toggle-blob {
    float: left;
}
.toggle-slide .toggle-blob {
    position: relative;
    z-index: 99;
    cursor: hand;
    cursor: grab;
    cursor: -moz-grab;
    cursor: -webkit-grab;
}

.toggle-soft .toggle-slide {
  border-radius: 5px;
  box-shadow: 0 0 0 1px #999;
}
.toggle-soft .toggle-slide .toggle-on,.toggle-soft .toggle-slide .toggle-off,.toggle-soft .toggle-slide .toggle-blob {
  color: rgba(0, 0, 0, 0.7);
  font-size: 11px;
  text-shadow: 1px 1px white;
}
.toggle-soft .toggle-slide .toggle-on, .toggle-soft .toggle-select .toggle-inner .active {
  background: #d2ff52;
  background: -moz-linear-gradient(top,  #d2ff52 0%, #91e842 100%);
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#d2ff52), color-stop(100%,#91e842));
  background: -webkit-linear-gradient(top,  #d2ff52 0%,#91e842 100%);
  background: -o-linear-gradient(top,  #d2ff52 0%,#91e842 100%);
  background: -ms-linear-gradient(top,  #d2ff52 0%,#91e842 100%);
  background: linear-gradient(to bottom,  #d2ff52 0%,#91e842 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d2ff52', endColorstr='#91e842',GradientType=0 );

}
.toggle-soft .toggle-slide .toggle-off, .toggle-soft .toggle-select .toggle-on {
  background: #cfcfcf;
  background: -moz-linear-gradient(top,  #cfcfcf 0%, #f5f5f5 100%);
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#cfcfcf), color-stop(100%,#f5f5f5));
  background: -webkit-linear-gradient(top,  #cfcfcf 0%,#f5f5f5 100%);
  background: -o-linear-gradient(top,  #cfcfcf 0%,#f5f5f5 100%);
  background: -ms-linear-gradient(top,  #cfcfcf 0%,#f5f5f5 100%);
  background: linear-gradient(to bottom,  #cfcfcf 0%,#f5f5f5 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cfcfcf', endColorstr='#f5f5f5',GradientType=0 );
}
.toggle-soft .toggle-slide .toggle-blob {
  border-radius: 4px;
  background: #cfcfcf;
  background: -moz-linear-gradient(top,  #cfcfcf 0%, #f5f5f5 100%);
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#cfcfcf), color-stop(100%,#f5f5f5));
  background: -webkit-linear-gradient(top,  #cfcfcf 0%,#f5f5f5 100%);
  background: -o-linear-gradient(top,  #cfcfcf 0%,#f5f5f5 100%);
  background: -ms-linear-gradient(top,  #cfcfcf 0%,#f5f5f5 100%);
  background: linear-gradient(to bottom,  #cfcfcf 0%,#f5f5f5 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cfcfcf', endColorstr='#f5f5f5',GradientType=0 );

  box-shadow: inset 0 0 0 1px #bbb, inset 0 0 0 2px white;
}
.toggle-soft .toggle-slide .toggle-blob:hover {
  background: #e4e4e4;
  background: -moz-linear-gradient(top,  #e4e4e4 0%, #f9f9f9 100%);
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#e4e4e4), color-stop(100%,#f9f9f9));
  background: -webkit-linear-gradient(top,  #e4e4e4 0%,#f9f9f9 100%);
  background: -o-linear-gradient(top,  #e4e4e4 0%,#f9f9f9 100%);
  background: -ms-linear-gradient(top,  #e4e4e4 0%,#f9f9f9 100%);
  background: linear-gradient(to bottom,  #e4e4e4 0%,#f9f9f9 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e4e4e4', endColorstr='#f9f9f9',GradientType=0 );

  box-shadow: inset 0 0 0 1px #ddd,inset 0 0 0 2px #ddd;
}
.uk-modal-dialog{
    right:0px;
    margin-right: 0px;
    width: 100%;
    padding:0px;
    top: 5%;
}


</style>