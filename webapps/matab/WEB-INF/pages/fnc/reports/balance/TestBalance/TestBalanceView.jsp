
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
 %>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>
<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
	<div class="uk-grid uk-grid-preserve">
			<base:testBox name="fromDocNumber" key="com.artonis.fnc.reports.balance.testBalance.fromDocNumber"  styleClass="verySmall"/>
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
	        <base:comboBox styleClass="verySmall" name="accountLayer" key="com.artonis.fnc.reports.balance.testBalance.accountLayer" comboLoaderUrl="combo/loadAllLayerName"/>
		    <base:comboBox styleClass="verySmall" name="showType" key="com.artonis.fnc.reports.balance.testBalance.showType" comboLoaderUrl="combo/loadAllBalanceShowTypes"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
				<base:comboBox styleClass="verySmall" name="accountChoice"  key="com.artonis.fnc.reports.balance.testBalance.accountsChoice" comboLoaderUrl="combo/loadAllBalanceAccountChoice"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
	</div>
	<div id="accountsListDiv">
	<div class="uk-grid uk-grid-preserve" >
	   <base:comboBoxAutoComplete-buttonAddToCombo name="accountCoding_IdStr" key="com.artonis.fnc.reports.books.accountBook.accountCodeName"  popupUrlIsRelative="true"
                                     comboLoaderUrl="<%=comboLoaderAccount%>" dataTextField="nameCode"
                                     dataValueField="compositionId" minLength="0"
                                     hasTemplate="true"
                                     headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
                                     templateComaSep="name,code" popupUrl="popup/treeAccountCoding"/>
       <button class="uk-button uk-button-success k-rtl" type="button" onclick="javascript:addToAccountsList()" id="addBtn">
		      <%=ResourceBoundleHolder.resourceBundle.getString("global.add")%>
	   </button>
	   </div>
	<div class="uk-grid uk-grid-preserve" >
	<div class="uk-width-1-10 left-align">
        <label for="ad"><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.fnc.reports.balance.testBalance.accountsList")%>
        </label>
     </div>
   <div style='width: 82%' class="uk-width-4-10 k-rtl"  id="${name}_Div">
		 <select id="accountsList"  multiple="multiple" class="uk-width-4-10 k-rtl">
         </select>
    </div>
   </div>                       
    <div class="uk-grid uk-grid-preserve"  >
	<div class="uk-width-1-10 left-align" id="lblDiv">
        <label for="lblDelBtn"><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.fnc.reports.balance.testBalance.accountsList")%>
        </label>
    </div>
   <div style='width: 82%' class="uk-width-4-10 k-rtl"  >
		  <button class="uk-button uk-button-success" type="button" onclick="javascript:deleteItem()" id="deleteBtn">
		      <%=ResourceBoundleHolder.resourceBundle.getString("global.delete")%>
	       </button>
	         <button class="uk-button uk-button-success" type="button" onclick="javascript:deleteAllItems()" id="deleteAllBtn">
		      <%=ResourceBoundleHolder.resourceBundle.getString("global.allDelete")%>
	       </button>
    </div>
   </div>    
   </div> 
     <div style="text-align: center">
		 <base:buttonPopupGrid popUpGridName="grid"  customPopupUrlTailFunctionName="customizeUrlFunctionName" isRelative="true" popUpGridUrl="item/TestBalance" formPopup="TestBalanceItem" popUrl="item/TestBalance" key="global.search"></base:buttonPopupGrid>
	       <button class="uk-button uk-button-success" type="button" onclick="javascript:clearAllFields()" id="clearAndSearchBtn">
		      <%=ResourceBoundleHolder.resourceBundle.getString("global.clearAndSearch")%>
	       </button>
	 </div>
	</form>
</div>

<script type="text/javascript">
    function getSearchObject(){
	var testBalanceVar = {};
	testBalanceVar.fromDocNumber=$("#fromDocNumber").val();
	testBalanceVar.toDocNumber=$("#toDocNumber").val();
	testBalanceVar.fromReferenceNumber=$("#fromReferenceNumber").val();
	testBalanceVar.toReferenceNumber=$("#toReferenceNumber").val();
	testBalanceVar.fromDate=$("#fromDate").val();
	testBalanceVar.toDate=$("#toDate").val();
	testBalanceVar.fromPrice=$("#fromPrice").val();
	testBalanceVar.toPrice=$("#toPrice").val();
	testBalanceVar.accountLayer=$("#accountLayer").val();
	testBalanceVar.showType=$("#showType").val();
	testBalanceVar.accountChoice=$("#accountChoice").val();
	testBalanceVar.accountsList=allAccountsInListSeperateWithComma();
	return testBalanceVar;
}
   $(document).ready(function() {
    	resetFields();
    });

    function resetFields() {
        $("#accountLayer").val(1);
        $("#accountsListDiv").hide();
        $("#showType").val(3); //default for 6column
        $("#accountChoice").val(1); //default for AllAccounts
        $("#accountLayer_Comb").data("kendoComboBox").value(1)
        $("#showType_Comb").data("kendoComboBox").value(3)
        $("#accountChoice_Comb").data("kendoComboBox").value(1)
        // $('label[for="lblDelBtn"]').hide();
    }

     function doAfterSearch(searchJsonString){
     $("#accountCodeName").val($("input[name=accountCoding_Id_Comb_input]").val());
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
     $("#fromPriceBy").css('background-color','rgb(206, 215, 235)');
     $("#toPriceBy").css('background-color','rgb(206, 215, 235)');
     $("#fromPriceBy").val( $("#fromPrice").val());
     $("#toPriceBy").val( $("#toPrice").val());
     $("#fromDocNumberBy").css('background-color','rgb(206, 215, 235)');
     $("#toDocNumberBy").css('background-color','rgb(206, 215, 235)');
     $("#fromReferenceNumberBy").css('background-color','rgb(206, 215, 235)');
     $("#toReferenceNumberBy").css('background-color','rgb(206, 215, 235)');

     setSumBoxes();
}

    function clearAllFields(){
//	 document.forms[0].reset();
	 $(':input').val('');
	 $("#showType").val(3); //default for 6column
     $("#accountChoice").val(1); //default for AllAccounts
	 deleteAllItems();
	 resetFields();
}
    function customizeUrlFunctionName(){
         return 'ByAccountCode@'+$("#showType").val();
}
    function addToAccountsList(){
        var x = document.getElementById("accountsList");
        var option = document.createElement("option");
        if($("#accountCoding_IdStr_Comb").val() != ""){
            option.text = $("#accountCoding_IdStr_Comb").data("kendoComboBox").text();
            option.value = $("#accountCoding_IdStr").val();
            x.add(option);
            $("#accountCoding_IdStr_Comb").val("");
            $("#accountCoding_IdStr").val("");
            $("#accountCoding_IdStr_Comb").data("kendoComboBox").value("");
            $("#accountCoding_IdStr_Comb").data("kendoComboBox").dataSource.filter([]);
        }
}
    function deleteItem(){
     $("#accountsList option:selected").remove();
    }
    function deleteAllItems(){
    $('#accountsList').find('option').remove().end()
    }
   function callback_change_accountChoice(e){
   var accountChoiceVal = $("#accountChoice_Comb").data("kendoComboBox")._selectedValue;
   if(accountChoiceVal== 2)
      $("#accountsListDiv").slideToggle(600);
       if(accountChoiceVal== 1){
      $("#accountsListDiv").hide(600);
       
       }
   }
   function allAccountsInListSeperateWithComma(){
   var options = $('#accountsList option');
   var values = $.map(options ,function(option) {
    return option.value;
      });
     return values;
   }
   function _grid_onSelectRow(e){
		  
   }
   function _grid_onDataBound(e){
 	  
   }
    function printTestBalance6Col(){
        var searchJsonString = "{}";
        searchJsonString = JSON.stringify(getSearchObject());
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
        var urlGrid = "<%=basePath%>" + "print/testBalance6Col/" + searchJsonString;
        window.open(urlGrid);
    }

    function printTestBalance4Col(){
        var searchJsonString = "{}";
        searchJsonString = JSON.stringify(getSearchObject());
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
        var urlGrid = "<%=basePath%>" + "print/testBalance4Col/" + searchJsonString;
        window.open(urlGrid);
    }

    function printTestBalance2Col(){
        var searchJsonString = "{}";
        searchJsonString = JSON.stringify(getSearchObject());
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
        var urlGrid = "<%=basePath%>" + "print/testBalance2Col/" + searchJsonString;
        window.open(urlGrid);
    }

    function callback_select_element_model_accountCoding_IdStr(e){
        if(e.modelID.toString().indexOf("group")>-1){
            $("#accountCoding_IdStr").val(e.modelID.toString().replace("group", "")+'@2');
        }else{
            $("#accountCoding_IdStr").val(e.modelID+'@1');
        }
    }

    function setSumBoxes(){
        var searchJsonString = "{}";
        var accountBookVar = getSearchObject();
        searchJsonString = JSON.stringify(getSearchObject());
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
        var requestUrl = '${pageContext.request.contextPath}'+'/fnc/reports/balance/testBalance/setSumBoxes/'+searchJsonString;
        $.getJSON(requestUrl, function (data) {
            $("#beginRemainingBedehkar_txt").val(addCommaSeparator(data.beginRemainingBedehkar));
            $("#beginRemainingBestankar_txt").val(addCommaSeparator(data.beginRemainingBestankar));
            $("#turnOverBedehkar_txt").val(addCommaSeparator(data.turnOverBedehkar));
            $("#turnOverBestankar_txt").val(addCommaSeparator(data.turnOverBestankar));
            $("#endRemainingBedehkar_txt").val(addCommaSeparator(data.endRemainingBedehkar));
            $("#endRemainingBestankar_txt").val(addCommaSeparator(data.endRemainingBestankar));

        });

    }
  
</script>
<style>
.uk-modal-dialog{
    right:0px;
    margin-right: 0px;
    width: 100%;
    padding:0px;
    top: 5%;
}
</style>
