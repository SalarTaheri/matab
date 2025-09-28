<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%
	String basePath = (String) request.getAttribute("basePath");
    int posEdit = basePath.indexOf("/edit/");

 %>

<div class="uk-container uk-container-center my-uk-container" >
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>
<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id">
		<input type="hidden" id="seasonVat_id" name="seasonVat_id">
		<input type="hidden" id="companyPerson_id" name="companyPerson_id">
		<div class="uk-grid uk-grid-preserve">
			<base:label  name="infoType" styleClass="verysmall" key="com.artonis.inv.m169.reports.infoType"></base:label>
			<base:label  name="price" styleClass="verysmall" key="com.artonis.inv.m169.reports.price"></base:label>	
		</div>
		<div class="uk-grid uk-grid-preserve">			
		<base:label name="year" styleClass="verysmall" key="com.artonis.inv.m169.reports.year"></base:label>
		<base:label  name="tax" styleClass="verysmall" key="com.artonis.inv.m169.reports.tax"></base:label>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:label  name="season" styleClass="verysmall" key="inventory.m169.operation.purchaseOperation.season"></base:label>
			<base:label  name="toll" styleClass="verysmall" key="com.artonis.inv.m169.reports.toll"></base:label>	
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:label  name="countPurchaseOperation" styleClass="verysmall" key="com.artonis.inv.m169.reports.count"></base:label>
			<base:label  name="backingPrice" styleClass="verysmall" key="com.artonis.inv.m169.reports.backingPrice"></base:label>	
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:label  name="backingSeasonVat" styleClass="verysmall" key="com.artonis.inv.m169.reports.backingSeasonVat"></base:label>
			<base:label  name="backingToll" styleClass="verysmall" key="com.artonis.inv.m169.reports.backingToll"></base:label>	
		</div>
	 	<div class="uk-grid uk-grid-preserve">
	 	  <base:comboBox ignore="true" styleClass="small"  name="personType" isListConstant="true"
                           key="com.artonis.inv.m169.basicInfo.companyPerson.personType" comboLoaderUrl="/combo/loadAllPersonType" />
  	 		<base:comboBox ignore="true" styleClass="small" name="companyType" isListConstant="true"
                           key="com.artonis.inv.m169.basicInfo.companyPerson.companyType" comboLoaderUrl="combo/loadAllCompanyType" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" disabled="true" name="personCompanyName" key="com.artonis.inv.m169.basicInfo.companyPerson.personCompanyName"/>
			<base:testBox styleClass="small" disabled="true" name="firstAndLastName" key="com.artonis.inv.m169.basicInfo.companyPerson.firstAndLastName"/>
			<base:testBox styleClass="small" disabled="true" name="registerNumber" key="com.artonis.inv.m169.basicInfo.companyPerson.registerNumber"/>
		</div>
		<div class="uk-grid uk-grid-preserve" >
			<base:testBox styleClass="small" disabled="true" name="nationalId" key="com.artonis.inv.m169.basicInfo.companyPerson.nationalId"/>
		
			<base:testBox styleClass="small" disabled="true" name="taxAffairs" key="com.artonis.inv.m169.basicInfo.companyPerson.taxAffairs"/>
		</div>
		<div >
			<label class="p-q-label uk-form-label" style="width:10%; padding-right: 2.5%">
				<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.includeband")%>
			</label>
			<label class="p-q-label uk-form-label" style="width:50px; padding-right: 3%">
				<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.alef")%>
				<input type="radio" class="p-q-radio" name="includeBand" value="1" onclick="handleClick(this)" />
			</label>
			<label class="p-q-label uk-form-label" style="width:40px; padding-right: 20px">
				<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.be")%>
				<input type="radio" class="p-q-radio" name="includeBand" value="2" onclick="handleClick(this)" />
			</label>
		</div>
		<div class="uk-grid uk-grid-preserve">
		      <base:testBox styleClass="small" disabled="true" name="provinceName" key="com.artonis.inv.m169.basicInfo.companyPerson.province_Id"/> 
              <base:testBox styleClass="small" disabled="true" name="cityName" key="com.artonis.inv.m169.basicInfo.person.city"/> 
                 
	 	</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" disabled="true"  name="address" key="com.artonis.inv.m169.basicInfo.companyPerson.address"/>
			<base:testBox styleClass="small" disabled="true" name="postalCode" key="com.artonis.inv.m169.basicInfo.companyPerson.postalCode"/>
			<base:testBox styleClass="small" disabled="true" name="phoneNo" key="com.artonis.inv.m169.basicInfo.companyPerson.phoneNo"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" disabled="true" name="priorEconomicCode" key="com.artonis.inv.m169.basicInfo.companyPerson.priorEconomicCode"/>
			<base:testBox styleClass="small" disabled="true" name="newEconomicCode" key="com.artonis.inv.m169.basicInfo.companyPerson.newEconomicCode"/>
	       </div>
        <div class="uk-grid uk-grid-preserve">
        	    <base:testBox styleClass="small" disabled="true" name="registrationStateText" key="com.artonis.inv.m169.basicInfo.companyPerson.registrationState"/>      
     			<base:testBox styleClass="small" disabled="true" name="userName" key="com.artonis.inv.m169.basicInfo.companyPerson.userName"/>
        </div>
     <div id="header-toolbar" align="left">
          	  	<base:buttonPermission key="fnc.btn.registerInfo" classNames="uk-button" id="purchaseReportInput-registerInfo-btn" onClick="javascript:savePurchaseReport()" style="width: 100px; color: blue;"/>
          	  	<base:buttonPermission key="fnc.btn.print" classNames="uk-button" id="purchaseReportInput-print-btn" onClick="javascript:myPrint()" style="width: 100px; color: green;"/>
          	  	<base:buttonPermission key="fnc.btn.cancel" classNames="uk-button" id="purchaseReportInput-cancel-btn" onClick="javascript:showPurchaseReportView()" style="width: 100px; color: green;"/>
    </div>
</form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	if(<%=posEdit%><1){
		$("#sum_txt").css('background-color','rgb(252, 216, 157)');
		$("#sum_txt").css('color','black');
		$("#sum_txt").css('text-align','center');
		///////////////////////////////////////////
		var url = getBaseUrl() + "loadActiveSeason" ; 
		$.getJSON(url, function (data) {
			$('#seasonVat_id').val(data.seasonVat_id);
			$('#year').val(data.year);
			$('#season').val(data.season);
			$('#complicationPercent').val(data.complicationPercent);
			$('#taxPercent').val(data.taxPercent);
			$('#infoType').val(data.infoType);
			$('#countPurchaseOperation').val(data.countPurchaseOperation);
			$('#toll').val(data.toll);
			$('#tax').val(data.tax);
			$('#price').val(data.price);
			$('#backingPrice').val(data.backingPrice);
			$('#backingSeasonVat').val(data.backingSeasonVat);
			$('#backingToll').val(data.backingToll);
						
		});
	}
	   jQuery('#alef').attr('disabled','disabled');
	   jQuery('#be').attr('disabled','disabled');
	
});
  function callback_change_personType(e){
    changeTextByPersonType();
 }
  function callback_change_companyType(e){
    changeTextByCompanyType();
 }
  function callback_change_companyType(e){
   loadCompanyPerson(document.getElementsByName('personType')[0].value,document.getElementsByName('companyType')[0].value);
   changeTextByCompanyType();
 }
  function loadCompanyPerson(personType,companyType){
  var url = getBaseUrl() + "loadCompanyPerson/"+personType+","+companyType ; 
	$.getJSON(url, function (data) {
	    $('#companyPerson_id').val(data.companyPerson_id);
		$('#personCompanyName').val(data.personCompanyName);
		$('#firstAndLastName').val(data.firstAndLastName);
		$('#includeBand').val(data.includeBand);
		$('#registerNumber').val(data.registerNumber);
		$('#nationalId').val(data.nationalId);
		$('#taxAffairs').val(data.taxAffairs);
		$('#provinceName').val(data.provinceName);
		$('#cityName').val(data.cityName);
		$('#address').val(data.address);
		$('#postalCode').val(data.postalCode);
		$('#phoneNo').val(data.phoneNo);
		$('#priorEconomicCode').val(data.priorEconomicCode);
		$('#newEconomicCode').val(data.newEconomicCode);
		$('#registrationStateText').val(data.registrationStateText);
		$('#userName').val(data.userName);	
	});
   
 }
  function changeTextByPersonType(e){
	  if(document.getElementsByName('personType')[0].value ==1){
	  $("label[for='personCompanyName']").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.economicBoard")%>');
	  $("label[for='firstAndLastName']").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.officerName")%>');
	  $("label[for='registerNumber']").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.shenasnameNumber")%>');
	  $("label[for='nationalId']").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.melliCode")%>');
	  
	  }
	  else{
	  $("label[for='personCompanyName']").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.personCompanyName")%>');
	  $("label[for='firstAndLastName']").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.firstAndLastName")%>');
	  $("label[for='registerNumber']").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.registerNumber")%>');
	  $("label[for='nationalId']").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.nationalId")%>');
	 
	 }
	 }
	 function changeTextByCompanyType(e){
	  if(document.getElementsByName('companyType')[0].value ==2){
	   $("label[for='nationalId']").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.rahgiriCode")%>');
	  
	  }
	  else{
	  $("label[for='nationalId']").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.foreignPersonNumber")%>');
	   
	 }
}
function savePurchaseReport(){
	save();
}
function callback_DataBound_personType(data){
	if(document.getElementsByName('personType')[0].value !="" && document.getElementsByName('companyType')[0].value!=""){
		loadCompanyPerson(document.getElementsByName('personType')[0].value,document.getElementsByName('companyType')[0].value);
		changeTextByCompanyType();
	}
}
function showPurchaseReportView(){
	window.location = "${pageContext.request.contextPath}"+"/inventory/m169/reports/purchaseReport/";
}
function getPageObject(){
		var param = {};
		param.id = $("#id").val();
		param.infoType = $("#infoType").val();
		param.price = $("#price").val();
		param.year = $("#year").val();
		param.tax = $("#tax").val();
		param.season = $("#season").val();
		param.toll = $("#toll").val();
		param.countPurchaseOperation = $("#countPurchaseOperation").val();
		param.backingPrice = $("#backingPrice").val();
		param.backingSeasonVat = $("#backingSeasonVat").val();
		param.backingToll = $("#backingToll").val();
		param.personType = $("#personType_Comb").data("kendoComboBox")._prev;
		param.companyType = $("#companyType_Comb").data("kendoComboBox")._prev;
		param.personCompanyName = $("#personCompanyName").val();
		param.firstAndLastName = $("#firstAndLastName").val();
		param.registerNumber = $("#registerNumber").val();
		param.nationalId = $("#nationalId").val();
		param.taxAffairs = $("#taxAffairs").val();
		param.includeband = $("#includeBand").val();
		param.provinceName = $("#provinceName").val();
		param.cityName = $("#cityName").val();
		param.address = $("#address").val();
		param.postalCode = $("#postalCode").val();
		param.phoneNo = $("#phoneNo").val();
		param.priorEconomicCode = $("#priorEconomicCode").val();
		param.newEconomicCode = $("#newEconomicCode").val();
		param.registrationStateText = $("#registrationStateText").val();
		param.userName = $("#userName").val();
		return param;
}
function myPrint(){
	var jsonString = JSON.stringify(getPageObject());
	jsonString = jsonString.replace(/\./gi, ':@:');
	jsonString = jsonString.replace(/\//g, ':@:');
	jsonString = jsonString.replace(/\\/g, ':@:');
	window.location = "${pageContext.request.contextPath}"+"/inventory/m169/reports/purchaseReport/print/" + jsonString;
}
</script>
