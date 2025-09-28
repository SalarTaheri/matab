
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader title="com.artonis.inv.m169.basicInfo.person.view"/>

<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
		    <base:comboBox styleClass="small" name="type" isListConstant="true"
                           key="com.artonis.inv.m169.basicInfo.person.type" comboLoaderUrl="combo/loadAllPersonType" />
     		<base:comboBox styleClass="small" name="title" styledivLabel="width: 15%" isListConstant="true"
                           key="com.artonis.inv.m169.basicInfo.person.title" comboLoaderUrl="combo/loadAllPersonTitle" />
			<base:testBox styleClass="small" styledivLabel="width: 12%" name="name" key="com.artonis.inv.m169.basicInfo.person.name"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="family" key="com.artonis.inv.m169.basicInfo.person.family"/>
            <base:comboBox styleClass="small" styledivLabel="width: 15%" name="citizenship" isListConstant="true"
                           key="com.artonis.inv.m169.basicInfo.person.citizenship" comboLoaderUrl="combo/loadAllPersonCitizenship" />
			<base:testBox styleClass="small" name="economicNo" styledivLabel="width: 12%" key="com.artonis.inv.m169.basicInfo.person.economicNo"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="nationalCode" key="com.artonis.inv.m169.basicInfo.person.nationalCode"/>
			<base:testBox styleClass="small" styledivLabel="width: 15%" name="foreignPersonNumber" key="com.artonis.inv.m169.basicInfo.person.foreignPersonNumber"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:cascadeComboBox styleClass="small"  name="countryId" cascadeCombo="citizenship"
                           key="com.artonis.inv.m169.basicInfo.person.country" comboLoaderUrl="combo/loadCountry" />
			<base:cascadeComboBox styleClass="small" name="provinceId" styledivLabel="width: 15%"  cascadeCombo="countryId"
                           key="com.artonis.inv.m169.basicInfo.person.state" selectIndex="0" comboLoaderUrl="combo/loadProvince" />
            <base:cascadeComboBox styleClass="small" name="cityId" styledivLabel="width: 12%" isListConstant="true" cascadeCombo="provinceId"
                           key="com.artonis.inv.m169.basicInfo.person.city" comboLoaderUrl="combo/loadCity" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="phoneNo" key="com.artonis.inv.m169.basicInfo.person.phoneNo"/>
			<base:testBox styleClass="small" styledivLabel="width: 15%" name="postalCode" key="com.artonis.inv.m169.basicInfo.person.postalCode"/>
			<base:testBox styleClass="small" name="preCodeCity" styledivLabel="width: 12%" key="com.artonis.inv.m169.basicInfo.person.preCodeCity"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="faxNo" key="com.artonis.inv.m169.basicInfo.person.faxNo"/>
			<base:testBox styleClass="small" name="mobileNo" styledivLabel="width: 15%" key="com.artonis.inv.m169.basicInfo.person.mobileNo"/>
			<base:testBox styleClass="small" name="clientCode" styledivLabel="width: 12%" key="com.artonis.inv.m169.basicInfo.person.clientCode"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="emailAddress" key="com.artonis.inv.m169.basicInfo.person.emailAddress"/>
			<base:testBox styleClass="small" name="description" styledivLabel="width: 15%"  key="com.artonis.inv.m169.basicInfo.person.description"/>
		
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea  name="address"  divWidthVal="55" key="com.artonis.inv.m169.basicInfo.person.address" />	
		</div>


		<base:my-grid-search>
			<base:my-grid-column title='com.artonis.inv.m169.basicInfo.person.name'  field="name" width="50px"/>
			<base:my-grid-column title='com.artonis.inv.m169.basicInfo.person.family'  field="family" width="40px"/>
			<base:my-grid-column title='com.artonis.inv.m169.basicInfo.person.type'  field="personTypeTxt" width="30px"/>
			<base:my-grid-column title='com.artonis.inv.m169.basicInfo.person.citizenship'  field="personCitizenshipTxt" width="20px"/>
			<base:my-grid-column title='com.artonis.inv.m169.basicInfo.person.nationalCode'  field="nationalCode" width="25px"/>
			<base:my-grid-column title='com.artonis.inv.m169.basicInfo.person.country'  field="countryName" width="20px"/>
			<base:my-grid-column title='com.artonis.inv.m169.basicInfo.person.state'  field="provinceName" width="30px"/>
			<base:my-grid-column title='com.artonis.inv.m169.basicInfo.person.city'  field="cityName" width="40px"/>
			<base:my-grid-column title='com.artonis.inv.m169.basicInfo.person.phoneNo'  field="phoneNo" width="25px"/>
			<base:my-grid-column title='com.artonis.inv.m169.basicInfo.person.postalCode'  field="postalCode" width="25px"/>
	
	        <base:my-grid-schema-field name="name" type="string"/>
	        <base:my-grid-schema-field name="family" type="string"/>
	        <base:my-grid-schema-field name="personTypeTxt" type="string"/>
	        <base:my-grid-schema-field name="personCitizenshipTxt" type="string"/>
	        <base:my-grid-schema-field name="nationalCode" type="string"/>
	        <base:my-grid-schema-field name="countryName" type="string"/>
	        <base:my-grid-schema-field name="provinceName" type="string"/>
	        <base:my-grid-schema-field name="cityName" type="string"/>
	        <base:my-grid-schema-field name="phoneNo" type="string"/>
	        <base:my-grid-schema-field name="postalCode" type="string"/>
		</base:my-grid-search>
	</form>
</div>
<base:footer/>
<script>
function getSearchObject(){
		var person4Search = {};
		person4Search.serial=$("#serial").val();
		person4Search.type=$("#type").val();
		person4Search.title=$("#title").val();
		person4Search.name=$("#name").val();
		person4Search.family=$("#family").val();
		person4Search.citizenship=$("#citizenship").val();
		person4Search.economicNo=$("#economicNo").val();
		person4Search.nationalCode=$("#nationalCode").val();
		person4Search.foreignPersonNumber=$("#foreignPersonNumber").val();
		person4Search.countryId=$("#countryId").val();
		person4Search.provinceId=$("#provinceId").val();
		person4Search.cityId=$("#cityId").val();
		person4Search.phoneNo=$("#phoneNo").val();
		person4Search.postalCode=$("#postalCode").val();
		person4Search.preCodeCity=$("#preCodeCity").val();
		person4Search.faxNo=$("#faxNo").val();
		person4Search.mobileNo=$("#mobileNo").val();
		person4Search.clientCode=$("#clientCode").val();
		person4Search.emailAddress=$("#emailAddress").val();
		person4Search.description=$("#description").val();
		person4Search.address=$("#address").val().trim();
		console.log(person4Search);
		return person4Search;
}
function callback_save_success() {
	$("#foreignPersonNumber").prop("disabled", false);
	$("#foreignPersonNumber").css('background-color','');
	$("#countryId_Comb").data("kendoComboBox").enable(true);
	$("#nationalCode").prop("disabled", false);
	$("#nationalCode").css('background-color','');
}
function callback_change_title(e){
    disableEnableFamily();
} 
function disableEnableFamily(e){
      if((document.getElementsByName('title') !=null) &&( document.getElementsByName('title')[0].value ==2
     || document.getElementsByName('title')[0].value ==3)
     ){
        $("#family").css('background-color','');
		$("#family").prop("disabled", false);
       }
       else if(document.getElementsByName('title')[0].value ==1)
       {
    	$("#family").prop("disabled", true);
		$("#family").css('background-color','rgb(206, 215, 235)');  
       }
       if (document.getElementsByName('citizenship')[0].value == 1) {
           $("#countryId").prop("disabled", true);
       }
}   
function callback_DataBound_title(data){
    disableEnableFamily();
}
function callback_change_citizenship(e){
     if(document.getElementsByName('citizenship')[0].value ==1){
         $("#countryId_Comb").data("kendoComboBox").enable(false);
         /*if($("div").children("ul#countryId_Comb_listbox").children().length == 0) {
         	var url = getBaseUrl() + "combo/loadCountry/";
			$.getJSON(url, function (data) {
				alert(data.country);
				$("#countryId").val(data);
			});
         }*/
         $("#countryId").val(1);
         $("#countryId_Comb").data("kendoComboBox").value(1);
         $("#foreignPersonNumber").prop("disabled", true);
         $("#foreignPersonNumber").css('background-color','rgb(206, 215, 235)');  
     }
     else if(document.getElementsByName('citizenship')[0].value ==2){
         $("#countryId_Comb").data("kendoComboBox").value(2);
         $("#countryId_Comb").data("kendoComboBox").enable(false);
         $("#provinceId_Comb").data("kendoComboBox").enable(false);
         $("#cityId_Comb").data("kendoComboBox").enable(false);
         $("#foreignPersonNumber").prop("disabled", false);
         $("#foreignPersonNumber").css('background-color','');
         $("#economicNo").prop("disabled", true);
		 $("#economicNo").css('background-color','rgb(206, 215, 235)');
		 $("#nationalCode").prop("disabled", true);
		 $("#nationalCode").css('background-color','rgb(206, 215, 235)');
     }
   
}
function callback_change_type(e){
	changetByType();
}
function changetByType(){
if (document.getElementsByName('type')[0].value ==1) {
		$("#economicNo").prop("disabled", true);
		$("#economicNo").css('background-color','rgb(206, 215, 235)');
		$("#foreignPersonNumber").prop("disabled", false);
		$("#foreignPersonNumber").css('background-color','');
		$("#nationalCode").prop("disabled", false);
		$("#nationalCode").css('background-color','');
	
	} else {
		$("#economicNo").prop("disabled", false);
		$("#economicNo").css('background-color','');
		$("#foreignPersonNumber").prop("disabled", true);
		$("#foreignPersonNumber").css('background-color','rgb(206, 215, 235)');
		$("#nationalCode").prop("disabled", true);
		$("#nationalCode").css('background-color','rgb(206, 215, 235)');
	}
}
    </script>