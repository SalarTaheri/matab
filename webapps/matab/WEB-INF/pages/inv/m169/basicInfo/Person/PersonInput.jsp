<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	String basePath = (String) request.getAttribute("basePath");
    int posEdit = basePath.indexOf("/edit/");
    int posCreate = basePath.indexOf("/create");

    String loadCountry = "";
    
    if(posCreate == basePath.length()-"/create".length())
    	loadCountry = basePath.substring(0, posCreate) + "/combo/loadCountry";
    else
    	loadCountry = basePath.substring(0, posEdit) + "/combo/loadCountry";
 %>

<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm" >
		<input type="hidden" id="id" name="id" >
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
			<base:textBoxNum styleClass="small" name="economicNo" styledivLabel="width: 12%" key="com.artonis.inv.m169.basicInfo.person.economicNo"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textBoxNum styleClass="small" name="nationalCode" key="com.artonis.inv.m169.basicInfo.person.nationalCode"/>
			<base:textBoxNum styleClass="small" styledivLabel="width: 15%" name="foreignPersonNumber" key="com.artonis.inv.m169.basicInfo.person.foreignPersonNumber"/>
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
			<base:textBoxNum styleClass="small" name="phoneNo" key="com.artonis.inv.m169.basicInfo.person.phoneNo"/>
			<base:testBox styleClass="small" styledivLabel="width: 15%" name="postalCode" key="com.artonis.inv.m169.basicInfo.person.postalCode"/>
			<base:textBoxNum styleClass="small" name="preCodeCity" styledivLabel="width: 12%" key="com.artonis.inv.m169.basicInfo.person.preCodeCity"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textBoxNum styleClass="small" name="faxNo" key="com.artonis.inv.m169.basicInfo.person.faxNo"/>
			<base:textBoxNum styleClass="small" name="mobileNo" styledivLabel="width: 15%" key="com.artonis.inv.m169.basicInfo.person.mobileNo"/>
			<base:testBox styleClass="small" name="clientCode" styledivLabel="width: 12%" key="com.artonis.inv.m169.basicInfo.person.clientCode"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="emailAddress" key="com.artonis.inv.m169.basicInfo.person.emailAddress"/>
			<base:testBox styleClass="small" name="description" styledivLabel="width: 15%"  key="com.artonis.inv.m169.basicInfo.person.description"/>
		
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea height="25" divWidthVal="55" name="address"  key="com.artonis.inv.m169.basicInfo.person.address" />	
		</div>
	
	</form>
</div>
<script language="JavaScript" type="text/javascript">
function callback_deserialize(data){
	if(window.location.href.indexOf("/edit/") > -1) {
		if (document.getElementsByName('type')[0].value == 1) {
			$("#foreignPersonNumber").prop("disabled", true);
			$("#foreignPersonNumber").css('background-color','rgb(206, 215, 235)');
			$("#nationalCode").prop("disabled", true);
			$("#nationalCode").css('background-color','rgb(206, 215, 235)');
		} else {
			$("#foreignPersonNumber").prop("disabled", false);
			$("#foreignPersonNumber").css('background-color','');
			$("#nationalCode").prop("disabled", true);
			$("#nationalCode").css('background-color','rgb(206, 215, 235)');
		}
		if(document.getElementsByName('citizenship')[0].value == 1) {
			$("#foreignPersonNumber").prop("disabled", true);
			$("#foreignPersonNumber").css('background-color','rgb(206, 215, 235)');
			$("#countryId").prop("disabled", true);
		}
	}
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
		if((document.getElementsByName('title') !=null) &&( document.getElementsByName('title')[0].value ==1)){
        	$("#family").css('background-color','');
			$("#family").prop("disabled", false);
    	}else if((document.getElementsByName('title') !=null) &&( document.getElementsByName('title')[0].value ==2
     	|| document.getElementsByName('title')[0].value ==3)
     	){
        	$("#family").css('background-color','');
			$("#family").prop("disabled", false);
       	}
       	if (document.getElementsByName('citizenship')[0].value == 1) {
           $("#countryId").prop("disabled", true);
       	}
}   
function callback_DataBound_title(data){
    disableEnableFamily();
}
function callback_change_citizenship(e){
	changetByType();
	changeByCitizenship();
}

function callback_change_type(e){
	changetByType();
	changeByCitizenship();
}
function changetByType(){
	if (document.getElementsByName('type')[0].value ==1) {
		$("#economicNo").prop("disabled", true);
		$("#economicNo").val("");
		$("#economicNo").css('background-color','rgb(206, 215, 235)');
		$("#foreignPersonNumber").prop("disabled", false);
		$("#foreignPersonNumber").css('background-color','');
		//$("#nationalCode").prop("disabled", false);
		//$("#nationalCode").css('background-color','');
		$('#nationalCode_lbl_txt').text('شماره ملی');
		$('#family_lbl_txt').text('نام و نام خانوادگی');
	} else {
		$("#economicNo").prop("disabled", false);
		$("#economicNo").css('background-color','');
		$("#foreignPersonNumber").prop("disabled", true);
		$("#foreignPersonNumber").css('background-color','rgb(206, 215, 235)');
		//$("#nationalCode").prop("disabled", true);
		//$("#nationalCode").css('background-color','rgb(206, 215, 235)');
		$('#nationalCode_lbl_txt').text('شناسه ملی');
		$('#family_lbl_txt').text('نام و نام خانوادگی مدیرعامل');
	}
}

function changeByCitizenship(){
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
         $("#nationalCode").prop("disabled", false);
		 $("#nationalCode").css('background-color',''); 
     }
     else if(document.getElementsByName('citizenship')[0].value ==2){
     	$("#countryId").val(2);
         $("#countryId_Comb").data("kendoComboBox").value(2);
         $("#countryId_Comb").data("kendoComboBox").enable(false);
         $("#provinceId_Comb").data("kendoComboBox").enable(false);
         $("#cityId_Comb").data("kendoComboBox").enable(true);
         $("#foreignPersonNumber").prop("disabled", false);
         $("#foreignPersonNumber").css('background-color','');
         $("#economicNo").prop("disabled", true);
         $("#economicNo").val("");
		 $("#economicNo").css('background-color','rgb(206, 215, 235)');
		 $("#nationalCode").prop("disabled", true);
		 $("#nationalCode").css('background-color','rgb(206, 215, 235)');
     }
}
</script>
