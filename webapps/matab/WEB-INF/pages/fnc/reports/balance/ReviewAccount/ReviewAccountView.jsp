
<%@page import="com.artonis.fnc.core.service.util.FncCoreServiceUtil"%>
<%@page import="com.artonis.fnc.core.model.FinanceYear"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
 String basePath = new UrlPathHelper().getOriginatingRequestUri(request); 
 String comboLoaderAccount = basePath + "combo/loadAllAccountCodingWithGroup";
 String comboLoaderFloatAccount = basePath + "/combo/loadAllFloatAccount";
 FinanceYear activeFinanceYear = FncCoreServiceUtil.getActiveFinanceYear();
 Long avtiveFinanceYearId=  0L;
 if (activeFinanceYear != null){
 	avtiveFinanceYearId = activeFinanceYear.getId();
 }
 %>
 <input type="hidden" id="parentAccountCoding" name="parentAccountCoding" >
 <input type="hidden" id="currentVerticalBtnClicked" name="currentVerticalBtnClicked" >
 <input type="hidden" id="currentVerticalAccountCodingBtnClicked" name="currentVerticalAccountCodingBtnClicked" >
 <input type="hidden" id="accountCodingId" name="accountCodingId" >
 <input type="hidden" id="accountCodingCode" name="accountCodingCode" >
 <input type="hidden" id="floatAccount1Id" name="floatAccount1Id" >
 <input type="hidden" id="floatAccount2Id" name="floatAccount2Id" >
 <input type="hidden" id="floatAccount3Id" name="floatAccount3Id" >
 <input type="hidden" id="floatAccount4Id" name="floatAccount4Id" >
<input type="hidden" id="accountClicked" name="accountClicked" >
 
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>
<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
	<div class="uk-grid uk-grid-preserve">
			<base:testBox name="fromDocNumber" key="com.artonis.fnc.reports.balance.testBalance.toDocNumber"  styleClass="verySmall" />
			<base:testBox name="toDocNumber" key="com.artonis.fnc.reports.balance.testBalance.toDocNumber"  styleClass="verySmall" />
		    <base:testBox name="fromReferenceNumber" key="com.artonis.fnc.reports.balance.testBalance.fromReferenceNumber"  styleClass="verySmall"/>
			<base:testBox name="toReferenceNumber" key="com.artonis.fnc.reports.balance.testBalance.toReferenceNumber"  styleClass="verySmall" />
	</div>
	<div class="uk-grid uk-grid-preserve">
	        <base:mDatePicker name="fromDate"  styleClass="verySmall" key="com.artonis.fnc.reports.balance.testBalance.fromDate"/>
		    <base:mDatePicker name="toDate"  styleClass="verySmall"  key="com.artonis.fnc.reports.balance.testBalance.toDate"/>
			<base:testBoxNumericEx name="fromPrice" key="com.artonis.fnc.reports.balance.testBalance.fromPrice"  styleClass="verySmall"/>
			<base:testBoxNumericEx name="toPrice" key="com.artonis.fnc.reports.balance.testBalance.toPrice"  styleClass="verySmall" />
	</div>
	<div class="uk-grid uk-grid-preserve">
			<base:multiSelect name="docType" styleClass="verysmall" multiSelectLoaderUrl="combo/loadAllDocumentType" key="fnc.generalAccounting.accountingDocuments.doc.Type"></base:multiSelect>
		    <base:comboBox styleClass="verysmall" name="financeYearId" key="hrm.basicinfo.salaryperiod.financeYear" value="financeYearName" comboLoaderUrl="combo/loadAllFinanceYear"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
	</div>
	<div style="text-align: center">
			<button class="uk-button uk-button-success" type="button" onclick="javascript:search()" id="serach">
		      <%=ResourceBoundleHolder.resourceBundle.getString("global.search")%>
	       </button>
	       <button class="uk-button uk-button-success" type="button" onclick="javascript:clearAllFields()" id="clearAndSearchBtn">
		      <%=ResourceBoundleHolder.resourceBundle.getString("global.clearAndSearch")%>
	       </button>
	 </div>
		<div align="center" style="padding-top: 1px">
			<button class="uk-button uk-button-success" type="button" onclick="javascript:print()" id="printBtn">
				<%=ResourceBoundleHolder.resourceBundle.getString("fnc.btn.print")%>
			</button>
		</div>
   </div> 
   <table>
   		<input type="text" name="accountCodingName" id="accountCodingName" style="width:100%;border:0px;font-weight: inherit;" readonly="readonly"  value="" />
   		<input type="text" name="floatAccountName" id="floatAccountName" style="width:100%;border:0px;font-weight: inherit;" readonly="readonly"  value="" />
		<tr>
			<td colspan="4">
    			 <div  id="horizontal" align="right">
					      <%--<button class="uk-button uk-button-success"  type="button" onclick="javascript:reviewDetailSearch(this)" id="detailaccountCoding1">--%>
						      <%--<%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.setting.accountLayersName.detailGrouh")%>--%>
					       <%--</button>--%>
					        <button class="uk-button uk-button-success" type="button" onclick="javascript:reviewDetailSearch(this)" id="detailaccountCoding2">
						      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.setting.accountLayersName.detailKol")%>
					       </button>
					        <button class="uk-button uk-button-success" type="button" onclick="javascript:reviewDetailSearch(this)" id="detailaccountCoding3">
						      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.setting.accountLayersName.detailMoein")%>
					       </button>
					        <button class="uk-button uk-button-success" type="button" onclick="javascript:reviewDetailSearch(this)" id="detaillevel1">
						      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.setting.floatAccountCodeSetting.detailLevel1")%>
					       </button>
					       <button class="uk-button uk-button-success" type="button" onclick="javascript:reviewDetailSearch(this)" id="detaillevel2">
						      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.setting.floatAccountCodeSetting.detailLevel2")%>
					       </button>
					        <button class="uk-button uk-button-success" type="button" onclick="javascript:reviewDetailSearch(this)" id="detaillevel3">
						      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.setting.floatAccountCodeSetting.detailLevel3")%>
					       </button>
					        <button class="uk-button uk-button-success" type="button" onclick="javascript:reviewDetailSearch(this)" id="detaillevel4">
						      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.setting.floatAccountCodeSetting.detailLevel4")%>
					       </button>
					       <base:buttonPopupGrid popUpGridName="accountBookByItemGrid"  customPopupUrlTailFunctionName="customizeUrlFunctionName"
												 isRelative="true" popUpGridUrl="item/AccountBook" formPopup="accountBook" popUrl="item/AccountBook" key="fnc.generalAccounting.setting.accountLayersName.accountBook"/>
		  				   <base:buttonPopupGrid popUpGridName="floatAccountBookByItemGrid"  customPopupUrlTailFunctionName="customizeUrlFunctionName"
												 isRelative="true" popUpGridUrl="item/FloatAccountBook" formPopup="floatAccountBook" popUrl="item/FloatAccountBook" key="fnc.generalAccounting.setting.accountLayersName.floatAccountBook"/>
					     
	 			</div>
		 </td>
	 </tr>
	 <tr>
		<td valign="top" >
			<div id="vertical" >	
			   <button class="uk-button uk-button-success" style="width: 60px;"  type="button" onclick="javascript:reviewSearch(this.id,true)" id="accountCoding1">
			      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.setting.accountLayersName.grouh")%>
		       </button>
		        <button class="uk-button uk-button-success" style="width: 60px;" type="button"  onclick="javascript:reviewSearch(this.id,true)" id="accountCoding2">
			      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.setting.accountLayersName.kol")%>
		       </button>
		        <button class="uk-button uk-button-success" style="width: 60px;" type="button" onclick="javascript:reviewSearch(this.id,true)" id="accountCoding3">
			      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.setting.accountLayersName.moein")%>
		       </button>
		        <button class="uk-button uk-button-success" style="width: 60px;" type="button" onclick="javascript:reviewSearch(this.id,true)" id="level1">
			      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.setting.floatAccountCodeSetting.level1")%>
		       </button>
		       <button class="uk-button uk-button-success" style="width: 60px;" type="button" onclick="javascript:reviewSearch(this.id,true)" id="level2">
			      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.setting.floatAccountCodeSetting.level2")%>
		       </button>
		        <button class="uk-button uk-button-success" style="width: 60px;" type="button" onclick="javascript:reviewSearch(this.id,true)" id="level3">
			      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.setting.floatAccountCodeSetting.level3")%>
		       </button>
		        <button class="uk-button uk-button-success" style="width: 60px;" type="button" onclick="javascript:reviewSearch(this.id,true)" id="level4">
			      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.setting.floatAccountCodeSetting.level4")%>
		       </button>
		       
			</div>
		</td>
		 <td align="center">
				 <base:mehrSys-sql-grid  showOperation="false"   sqlQueryKey="reviewAccounts"  pageSize="10" name="grid" selectable="multiple" isPopup="false" transportReadUrl="${basePath}item/reviewAccountSqlGridRead/{}"   >
						<base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.accountName' field="accountCodeName" width="50px" />
						<base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.accountCode' field="accountCode" width="50px" />
						<base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.beginRemainingBedehkar' format="0:#,0" field="beginRemainingBedehkar" width="100px" />
						<base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.beginRemainingBestankar' format="0:#,0" field="beginRemainingBestankar" width="100px" />
						<base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.turnOverBedehkar' format="0:#,0" field="turnOverBedehkar" width="100px" />
						<base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.turnOverBestankar' format="0:#,0" field="turnOverBestankar" width="100px" />
						<base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.endRemainingBedehkar' format="0:#,0" field="endRemainingBedehkar" width="100px" />
						<base:my-grid-column title='com.artonis.fnc.reports.balance.testBalance.endRemainingBestankar' format="0:#,0" field="endRemainingBestankar" width="100px" />
						<base:my-grid-schema-field name="accountCodeName" type="string" />
						<base:my-grid-schema-field name="accountCode" type="string" />
						<base:my-grid-schema-field name="beginRemainingBedehkar" type="long" />
						<base:my-grid-schema-field name="beginRemainingBestankar" type="long" />
						<base:my-grid-schema-field name="turnOverBedehkar" type="long" />
						<base:my-grid-schema-field name="turnOverBestankar" type="long" />
						<base:my-grid-schema-field name="endRemainingBedehkar" type="long" />
						<base:my-grid-schema-field name="endRemainingBestankar" type="long" />
			   </base:mehrSys-sql-grid>
		 </td>
	 </tr>
</table>
</form>
</div>

<script type="text/javascript">

	var currentGroupAccountCodingId;
	var currentGroupAccountCodingCode;

	var currentKolAccountCodingId;
	var currentKolAccountCodingCode;

$(document).ready(function(){
	$("#accountCoding1").css("background", "#9b9c9c");
	$("#currentVerticalBtnClicked").val("accountCoding1");
	$("#currentVerticalAccountCodingBtnClicked").val("accountCoding1");
	$('#horizontal').find('button').prop('disabled', true);
	$('#horizontal').find('button').css("background", "");
	resetForm();
});
function resetForm(){
	$("#financeYearId_Comb").data("kendoComboBox").value("<%=avtiveFinanceYearId%>");
}
var searchJsonStringForCurrentSearch;
function reviewSearch(btnId ,resetHidden,completBtnId){
	if (resetHidden)
		resetHiddenFields();
	$('#vertical').find('button').css("background", "");
	$("#"+btnId).css("background", "#9b9c9c");
	var testBalanceVar = {};
	testBalanceVar.fromDocNumber=$("#fromDocNumber").val();
	testBalanceVar.toDocNumber=$("#toDocNumber").val();
	testBalanceVar.fromReferenceNumber=$("#fromReferenceNumber").val();
	testBalanceVar.toReferenceNumber=$("#toReferenceNumber").val();
	testBalanceVar.fromDate=$("#fromDate").val();
	testBalanceVar.toDate=$("#toDate").val();
	testBalanceVar.fromPrice=$("#fromPrice").val();
	testBalanceVar.toPrice=$("#toPrice").val();
	testBalanceVar.docType=$("#docType_multiSelect").val();
	testBalanceVar.financeYearId=$("#financeYearId").val();
	testBalanceVar.accountClicked=btnId;
    $("#accountClicked").val(btnId);
	if(completBtnId!=undefined && completBtnId=='detailaccountCoding2' && currentGroupAccountCodingId !=undefined){
		testBalanceVar.accountCodingId=currentGroupAccountCodingId;
		testBalanceVar.accountCodingCode=currentGroupAccountCodingCode;

	}else if (completBtnId!=undefined && completBtnId=='detailaccountCoding3' && currentKolAccountCodingId !=undefined) {
		testBalanceVar.accountCodingId = currentKolAccountCodingId;
		testBalanceVar.accountCodingCode = currentKolAccountCodingCode;

	} else if(completBtnId!=undefined && completBtnId.indexOf('detail')>-1){
		currentKolAccountCodingId=undefined;
		currentKolAccountCodingCode=undefined;
		testBalanceVar.accountCodingId=$("#accountCodingId").val();
		testBalanceVar.accountCodingCode=$("#accountCodingCode").val();
	}else{
		testBalanceVar.accountCodingId=$("#accountCodingId").val();
		testBalanceVar.accountCodingCode=$("#accountCodingCode").val();
	}
	testBalanceVar.floatAccount1Id=$("#floatAccount1Id").val();
	testBalanceVar.floatAccount2Id=$("#floatAccount2Id").val();
	testBalanceVar.floatAccount3Id=$("#floatAccount3Id").val();
	testBalanceVar.floatAccount4Id=$("#floatAccount4Id").val();
	$("#currentVerticalBtnClicked").val(btnId);
	if (btnId.indexOf("accountCoding") !=-1) 
			$("#currentVerticalAccountCodingBtnClicked").val(btnId);
	var searchJsonString = "{}";
	searchJsonString = JSON.stringify(testBalanceVar);
	searchJsonString = searchJsonString.replace(/\//g, ':@:');
    searchJsonStringForCurrentSearch=searchJsonString;
	var urlGrid = basePath + "item/reviewAccountSqlGridRead/" + searchJsonString;
	$("#grid").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
	$("#grid").data("kendoGrid").dataSource.read();
}
function reviewDetailSearch(btn){
	$('#horizontal').find('button').css("background", "");
	$("#"+btn.id).css("background", "#9b9c9c");

	if(btn.id.indexOf('detailaccount')>-1){
        $("#floatAccount1Id").val('');
        $("#floatAccount2Id").val('');
        $("#floatAccount3Id").val('');
        $("#floatAccount4Id").val('');
        $("#floatAccountName").val('');
	}
	reviewSearch(btn.id.substring(6),false,btn.id);
}

function _grid_onSelectRow(e){
    var entityGrid = $("#grid").data("kendoGrid");
    var rows = entityGrid.select();
    var selectedItem = entityGrid.dataItem(rows);
    $('#accountBook_popup_button').prop('disabled', true);
    $('#floatAccountBook_popup_button').prop('disabled', true);
	var requestUrl =  basePath + "checkDisableEnableDetailBtn/" +$("#currentVerticalBtnClicked").val()+":"+ selectedItem.accountCode;
	$.getJSON(requestUrl, function (data) {
		level=data.level;
		if(level==1){
			currentGroupAccountCodingId=data.accountCodingId;
			currentGroupAccountCodingCode=data.accountCodingCode;
			currentKolAccountCodingId=undefined;
			currentKolAccountCodingCode=undefined;
		}else if(level==2){
            currentGroupAccountCodingId=data.accountCodingGroupId;
            currentGroupAccountCodingCode=data.accountCodingGroupCode;
			currentKolAccountCodingId=data.accountCodingId;
			currentKolAccountCodingCode=data.accountCodingCode;
		}else if(level==3){
            currentGroupAccountCodingId=data.accountCodingGroupId;
            currentGroupAccountCodingCode=data.accountCodingGroupCode;
		}
		if (data.accountCodingId != null && data.accountCodingId != ''){
			$('#accountBook_popup_button').prop('disabled', false);
			$("#accountCodingId").val(data.accountCodingId);	
		}
		else
			$('#accountBook_popup_button').prop('disabled', true);
		
		if (data.accountCodingCode != null && data.accountCodingCode != ''){
			$("#accountCodingCode").val(data.accountCodingCode);
		}
		
		
		if (data.floatAccount1Id != null && data.floatAccount1Id != ''){
			$("#floatAccount1Id").val(data.floatAccount1Id);	
			$('#floatAccountBook_popup_button').prop('disabled', false);
		}
		else
			$('#floatAccountBook_popup_button').prop('disabled', true);
		
		if (data.floatAccount2Id != null && data.floatAccount2Id != ''){
			$("#floatAccount2Id").val(data.floatAccount2Id);	
		}
		if (data.floatAccount3Id != null && data.floatAccount3Id != ''){
			$("#floatAccount3Id").val(data.floatAccount3Id);	
		}
		if (data.floatAccount4Id != null && data.floatAccount4Id != ''){
			$("#floatAccount4Id").val(data.floatAccount4Id);	
		}
		if (data.accountCodingName != null && data.accountCodingName != ''){
			$("#accountCodingName").val(data.accountCodingName);
		}
		if (data.floatAccountName != null && data.floatAccountName != ''){
			$("#floatAccountName").val(data.floatAccountName);
		}
		if (data.level0 != null && data.level0 != ''){
			$('#detaillevel1').prop('disabled', false);
		}
		else
			$('#detaillevel1').prop('disabled', true);
		
		if (data.level1 != null && data.level1 != ''){
			$('#detaillevel2').prop('disabled', false);
		}
		else
			$('#detaillevel2').prop('disabled', true);
		
		if (data.level2 != null && data.level2 != ''){
			$('#detaillevel3').prop('disabled', false);
		}
		else
			$('#detaillevel3').prop('disabled', true);
		
		if (data.level3 != null && data.level3 != ''){
			$('#detaillevel4').prop('disabled', false);
		}
		else
			$('#detaillevel4').prop('disabled', true);
		
		$("#detail"+$("#currentVerticalBtnClicked").val()).prop('disabled', false);
	});
//	$('#detailaccountCoding1').prop('disabled', false);
	$('#detailaccountCoding2').prop('disabled', false);
	$('#detailaccountCoding3').prop('disabled', false);
} 
function resetHiddenFields(){
	$("#accountCodingId").val("");
	$("#accountCodingCode").val("");
	$("#floatAccount1Id").val("");
	$("#floatAccount2Id").val("");
	$("#floatAccount3Id").val("");
	$("#floatAccount4Id").val("");
	$("#accountCodingName").val("");
	$("#floatAccountName").val("");
	$("#currentVerticalAccountCodingBtnClicked").val("");
	$('#horizontal').find('button').prop('disabled', true);
	$('#horizontal').find('button').css("background", "");
} 
function _grid_onDataBound(e){
    var entityGrid = $("#grid").data("kendoGrid");
//    entityGrid.select("tr:eq(0)");
    var rows = entityGrid.dataSource.data();
    if(rows.length>0){
        var model = rows[0];
        var lastRowUid = model.uid;
//find the target row element:
        var row = entityGrid.table.find("[data-uid=" + lastRowUid + "]");
        entityGrid.select(row);
    }
}
function search(){
	reviewSearch('accountCoding1' ,true);
}
function clearAllFields(){
	$("#fromDocNumber").val("");
	$("#toDocNumber").val("");
	$("#fromReferenceNumber").val("");
	$("#toReferenceNumber").val("");
	$("#fromDate").val("");
	$("#toDate").val("");
	$("#fromPrice").val("");
    $('#fromPrice_txt').val('')
	$("#toPrice").val("");
    $('#toPrice_txt').val('')
}
function customizeUrlFunctionName(){
       return 'ByItem';    
}
function _accountBookByItemGrid_onSelectRow() {
}
function _accountBookByItemGrid_onDataBound() {
}
function _accountBookByItemGrid_requestEnd()  {
}
function _floatAccountBookByItemGrid_onSelectRow() {
}
function _floatAccountBookByItemGrid_onDataBound() {
}
function _floatAccountBookByItemGrid_requestEnd()  {
}
function getSearchObject(fromBottonClick){
	var accountBookVar = {};
	var accountcodingIdStr = $("#accountCodingId").val();
	var floatAccountId ;
	var floatlevel = new Array(0);
	if ($("#currentVerticalAccountCodingBtnClicked").val() == 'accountCoding1')
		accountcodingIdStr =accountcodingIdStr+"@2";
	else
		accountcodingIdStr =accountcodingIdStr+"@1";
	accountBookVar.accountCoding_IdStr=accountcodingIdStr;
	accountBookVar.floatAccountLevel1_Id=$("#floatAccount1Id").val();
	accountBookVar.floatAccountLevel2_Id=$("#floatAccount2Id").val();
	accountBookVar.floatAccountLevel3_Id=$("#floatAccount3Id").val();
	accountBookVar.floatAccountLevel4_Id=$("#floatAccount4Id").val();
	accountBookVar.fromDocNumber=$("#fromDocNumber").val();
	accountBookVar.toDocNumber=$("#toDocNumber").val();
	accountBookVar.fromReferenceNumber=$("#fromReferenceNumber").val();
	accountBookVar.toReferenceNumber=$("#toReferenceNumber").val();
	accountBookVar.fromDate=$("#fromDate").val();
	accountBookVar.toDate=$("#toDate").val();
	accountBookVar.fromPrice=$("#fromPrice").val();
	accountBookVar.toPrice=$("#toPrice").val();
	accountBookVar.showType=1;
	accountBookVar.showRemainingPrior=false;
	if ($("#floatAccount1Id").val() != null && $("#floatAccount1Id").val() > 0){
		floatAccountId = $("#floatAccount1Id").val();
		floatlevel.push("1");
	}
	if ($("#floatAccount2Id").val() != null && $("#floatAccount2Id").val() > 0){
		floatAccountId = $("#floatAccount2Id").val();
		floatlevel.push("2");
	}
	if ($("#floatAccount3Id").val() != null && $("#floatAccount3Id").val() > 0){
		floatAccountId = $("#floatAccount3Id").val();
		floatlevel.push("3");
	}
	if ($("#floatAccount4Id").val() != null && $("#floatAccount4Id").val() > 0){
		floatAccountId = $("#floatAccount4Id").val();
		floatlevel.push("4");
	}
	accountBookVar.floatAccount_Id = floatAccountId;
	accountBookVar.level = floatlevel;
	accountBookVar.financeYearId=$("#financeYearId").val();
    accountBookVar.accountClicked = $("#accountClicked").val();
    if(fromBottonClick!=undefined){
        if(fromBottonClick.indexOf('accountBookByItemGrid')){
            accountBookVar.bookType='accountBook';
        }else if(fromBottonClick.indexOf('floatAccountBookByItemGrid')) {
            accountBookVar.bookType='floatAccountBook';
        }
    }
	return accountBookVar;

}
function doAfterSearch(searchJsonString){
		$("#accountCodeName").val($("#accountCodingName").val());
    	$("#floatAccountCodeName").val($("#floatAccountName").val());
		$("#fromDateBy").val( $("#fromDate").val());
	    $("#toDateBy").val( $("#toDate").val());
	    $("#fromDocNumberBy").val( $("#fromDocNumber").val());   
	    $("#toDocNumberBy").val( $("#toDocNumber").val());    
	    $("#fromReferenceNumberBy").val( $("#fromReferenceNumber").val());
	    $("#toReferenceNumberBy").val( $("#toReferenceNumber").val());
	    setSumBoxes(searchJsonString);
}
function setSumBoxes(searchJsonString){
//	var searchJsonString = "{}";
//	var accountBookVar = getSearchObject();
//	searchJsonString = JSON.stringify(getSearchObject());
//	searchJsonString = searchJsonString.replace(/\//g, ':@:');
	var jsonArray=JSON.parse(searchJsonString);
	if(jsonArray.bookType=='accountBook'){
        var requestUrl = '${pageContext.request.contextPath}'+'/fnc/reports/books/accountBook/setSumBoxes/'+searchJsonString;
        $.getJSON(requestUrl, function (data) {
            $("#debitSum_txt").val(addCommaSeparator(data.debitSum));
            $("#creditSum_txt").val(addCommaSeparator(data.creditSum));
            $("#mandeSum_txt").val(addCommaSeparator(data.mandeSum));
        });
    }else{
        var requestUrl = '${pageContext.request.contextPath}'+'/fnc/reports/books/floatAccountBook/setSumBoxes/'+searchJsonString;
        $.getJSON(requestUrl, function (data) {
            $("#debitSum_txt").val(addCommaSeparator(data.debitSum));
            $("#creditSum_txt").val(addCommaSeparator(data.creditSum));
            $("#mandeSum_txt").val(addCommaSeparator(data.mandeSum));
        });
    }
}
function print(){
    // var searchJsonString = "{}";
    // searchJsonString = JSON.stringify(getSearchObject());
    // searchJsonString = searchJsonString.replace(/\//g, ':@:');
	if(searchJsonStringForCurrentSearch==undefined){
	    search();
	}
    var urlGrid = "<%=basePath%>" + "print/" + searchJsonStringForCurrentSearch;
    window.open(urlGrid);
}
function printAccountBook(){
    var searchJsonString = "{}";
    searchJsonString = JSON.stringify(getSearchObject());
    searchJsonString = searchJsonString.replace(/\//g, ':@:');
    var urlGrid = "<%=basePath%>" + "printAccountBook/" + searchJsonString;
    window.open(urlGrid);
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
