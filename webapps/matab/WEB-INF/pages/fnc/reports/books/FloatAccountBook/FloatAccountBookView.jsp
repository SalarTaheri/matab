
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="com.artonis.fnc.reports.books.model.GeneralAccountingReportsConstValue.AccountBookShowTypes"%>
<%@page import="com.artonis.fnc.reports.books.model.GeneralAccountingReportsConstValue"%>
<%@page import="com.artonis.core.base.core.EnumInterface"%>
<%@ page import="com.artonis.fnc.core.service.util.FncCoreServiceUtil" %>
<%@ page import="com.artonis.fnc.core.model.FinanceYear" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
 String basePath = new UrlPathHelper().getOriginatingRequestUri(request); 
 String comboLoaderAccount = basePath + "/combo/loadAllAccountCodingWithGroup";
 String comboLoaderFloatAccount = basePath + "/combo/loadAllFloatAccount";
	String fromDate="";
	String toDate="";
	FinanceYear financeYear = FncCoreServiceUtil.getActiveFinanceYear();
	if(financeYear != null) {
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
	<div class="uk-grid uk-grid-preserve">
	       <base:comboBoxAutoComplete-buttonAddToCombo name="floatAccount_Id"  key="com.artonis.fnc.reports.books.accountBook.floatAccountCodeName"  popupUrlIsRelative="true"
					                comboLoaderUrl="<%=comboLoaderFloatAccount%>" dataTextField="nameCode"
					                dataValueField="id" minLength="0"
					                hasTemplate="true"
					                headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
					                templateComaSep="name,code" popupUrl="/popup/treeFloatAccount"/>
	
     </div>		
     <div class="uk-grid uk-grid-preserve">
   	   <base:comboBoxAutoComplete-buttonAddToCombo name="accountCoding_IdStr" key="com.artonis.fnc.reports.books.accountBook.accountCodeName"  popupUrlIsRelative="true"
                                     comboLoaderUrl="<%=comboLoaderAccount%>" dataTextField="nameCode"
                                     dataValueField="compositionId" minLength="0"
                                     hasTemplate="true"
                                     headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
                                     templateComaSep="name,code" popupUrl="popup/treeAccountCoding"/>
		   
    </div>	
     <div class="uk-grid uk-grid-preserve">
	  <base:multiSelect name="level" styleClass="small" multiSelectLoaderUrl="combo/loadAllLevel" key="fnc.generalAccounting.accounting.level"></base:multiSelect>
     <base:mDatePicker name="fromDate" styledivLabel="width:16.5%" styleClass="verySmall" key="com.artonis.fnc.reports.books.accountBook.fromDate"/>
     <base:mDatePicker name="toDate" styledivLabel="width:19.5%" styleClass="verySmall" key="com.artonis.fnc.reports.books.accountBook.toDate"/>
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
            <base:checkbox styleClass="small" name="showRemainingPrior"  style="width:10%" key="com.artonis.fnc.reports.books.accountBook.remainingPrior"/>
	  </div>
	  <div class="uk-grid uk-grid-preserve">
	  </div>
	  <div class="uk-grid uk-grid-preserve">
	  </div>
	  

     <div style="text-align: center">
		  <base:buttonPopupGrid popUpGridName="grid"  customPopupUrlTailFunctionName="customizeUrlFunctionName" isRelative="true" popUpGridUrl="item/FloatAccountBook" formPopup="InClearingReceiptChequeItem" popUrl="item/FloatAccountBook" key="global.search"></base:buttonPopupGrid>
	      <button class="uk-button uk-button-success" type="button" onclick="javascript:clearAllFields()" id="clearAndSearchBtn">
		      <%=ResourceBoundleHolder.resourceBundle.getString("global.clearAndSearch")%>
	       </button>
	 </div>
	</form>
</div>
<script type="text/javascript">
 function getSearchObject(){
		var floatAccountBookVar = {};
		floatAccountBookVar.accountCoding_IdStr=$("#accountCoding_IdStr").val();
		//accountBookVar.floatAccountLevel1_Id=$("#floatAccountLevel1_Id").val();
		//accountBookVar.floatAccountLevel2_Id=$("#floatAccountLevel2_Id").val();
		//accountBookVar.floatAccountLevel3_Id=$("#floatAccountLevel3_Id").val();
		//accountBookVar.floatAccountLevel4_Id=$("#floatAccountLevel4_Id").val();
		//accountBookVar.fromDocNumber=$("#fromDocNumber").val();
		//accountBookVar.toDocNumber=$("#fromDocNumber").val();
		//accountBookVar.fromReferenceNumber=$("#fromDocNumber").val();
		//accountBookVar.toReferenceNumber=$("#toReferenceNumber").val();
		floatAccountBookVar.fromDate=$("#fromDate").val();
		floatAccountBookVar.toDate=$("#toDate").val();
		floatAccountBookVar.showType=$("#showType").val();
		floatAccountBookVar.showRemainingPrior=$("#showRemainingPrior")[0].checked;
		floatAccountBookVar.floatAccount_Id=$("#floatAccount_Id").val();
		floatAccountBookVar.level=$("#level_multiSelect").val();
		return floatAccountBookVar;
}

function  doAfterSearch(searchJsonString){
     $("#accountCodeName").val($("input[name=accountCoding_IdStr_Comb_input]").val());
     $("#floatAccountCodeName").val($("input[name=floatAccount_Id_Comb_input]").val());
   //  $("#floatAccount2CodeName").val($("input[name=floatAccountLevel2_Id_Comb_input]").val());
   //  $("#floatAccount3CodeName").val($("input[name=floatAccountLevel3_Id_Comb_input]").val());
   //  $("#floatAccount4CodeName").val($("input[name=floatAccountLevel4_Id_Comb_input]").val());
   //  $("#fromDateBy").val( $("#fromDate").val());
   //  $("#toDateBy").val( $("#toDate").val());
   //  $("#fromDocNumberBy").val( $("#fromDocNumber").val());   
   //  $("#toDocNumberBy").val( $("#toDocNumber").val());    
   //  $("#fromReferenceNumberBy").val( $("#fromReferenceNumber").val());
   //  $("#toReferenceNumberBy").val( $("#toReferenceNumber").val());
    setSumBoxes();
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
     resetForm();
});
 function resetForm(){
     $("#fromDate").val("<%=fromDate%>");
     $("#toDate").val("<%=toDate%>");
 }
function handleClick(myRadio) {
        $("#showType").val(myRadio.value);
}
function viewDocumentByDoc(e){
		var data = this.dataItem($(e.target).closest("tr"));
		var url="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accountingDocuments/document/edit/"+data.document_Id;
		window.open(url,'_blank');	  
}
function clearAllFields(){
	document.forms[0].reset();
	$(':input').val('');
    document.getElementsByName('showTypeOption')[0].checked = true;
    $("#showType").val(1);
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
     var requestUrl = '${pageContext.request.contextPath}'+'/fnc/reports/books/floatAccountBook/setSumBoxes/'+searchJsonString;
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
<<style>
.container 
{ 
  border:2px solid #ccc;
  width:20%;
  height: 20%;
  overflow-y:
  scroll;margin-right:12%;
}
.uk-modal-dialog{
right:0px;
margin-right: 0px;
width: 100%;
padding:0px;
top: 5%;
}
</style>
