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
		<input type="hidden" id="floatAccountId" name="floatAccountId" >
		<div class="uk-grid uk-grid-preserve">
		    <base:comboBox styleClass="small" name="type" isListConstant="true"
                           key="com.artonis.core.system.basicInfo.businessPartner.type" comboLoaderUrl="combo/loadAllPersonType" />
     		<base:comboBox styleClass="small" name="title"  isListConstant="true"
                           key="com.artonis.core.system.basicInfo.businessPartner.title" comboLoaderUrl="combo/loadAllPersonTitle" />
			<base:testBox styleClass="small" name="nameAndFamily" key="com.artonis.core.system.basicInfo.businessPartner.name"/>
		
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="citizenship" isListConstant="true" key="com.artonis.core.system.basicInfo.businessPartner.citizenship"
						   comboLoaderUrl="combo/nationality" />
			<base:testBox styleClass="small" name="nationalcode"  key="com.artonis.core.system.basicInfo.businessPartner.nationalcode"/>
			<base:testBox styleClass="small"  name="foreignPersonNumber" key="com.artonis.core.system.basicInfo.businessPartner.foreignPersonNumber"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBoxAutoComplete styleClass="small" name="province_id" key="com.artonis.core.system.basicInfo.businessPartner.province_id"
									   comboLoaderUrl="combo/loadAllProvince" dataTextField="name" dataValueField="id" minLength="0" pageSize="40"/>
			<base:cascadeComboBox styleClass="small" name="city_id" key="com.artonis.core.system.basicInfo.businessPartner.city_id"
								  cascadeCombo="province_id" comboLoaderUrl="combo/loadCascadeCity"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="phoneno" key="com.artonis.core.system.basicInfo.businessPartner.phoneno"/>
			<base:testBox styleClass="small" name="preCodeCity"  key="com.artonis.core.system.basicInfo.businessPartner.preCodeCity"/>
			<base:testBox styleClass="small" name="faxno" key="com.artonis.core.system.basicInfo.businessPartner.faxno"/>
	
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="postalCode" key="com.artonis.core.system.basicInfo.businessPartner.postalCode"/>
			<base:testBox styleClass="small" name="description" key="com.artonis.core.system.basicInfo.businessPartner.description"/>
			<base:testBox styleClass="small" name="mobileno" key="com.artonis.core.system.basicInfo.businessPartner.mobileno"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea divWidthVal="50"  name="address"  key="com.artonis.core.system.basicInfo.businessPartner.address" />		
			<base:testBox styleClass="small" name="emailaddress" key="com.artonis.core.system.basicInfo.businessPartner.emailaddress"/>
		</div>
	</form>
</div>

<script language="JavaScript" type="text/javascript">
    function callback_deserialize(data) {
        if (window.location.href.indexOf("/edit/") > -1) {
            if (document.getElementsByName('type')[0].value == 1) {
                $("#foreignPersonNumber").prop("disabled", true);
                $("#foreignPersonNumber").css('background-color', 'rgb(206, 215, 235)');
                $("#nationalCode").prop("disabled", true);
                $("#nationalCode").css('background-color', 'rgb(206, 215, 235)');
            } else {
                $("#foreignPersonNumber").prop("disabled", false);
                $("#foreignPersonNumber").css('background-color', '');
                $("#nationalCode").prop("disabled", true);
                $("#nationalCode").css('background-color', 'rgb(206, 215, 235)');
            }
            if (document.getElementsByName('citizenship')[0].value == 10) {
                $("#foreignPersonNumber").prop("disabled", true);
                $("#foreignPersonNumber").css('background-color', 'rgb(206, 215, 235)');
                $("#country_id").prop("disabled", true);
            }
        }
    }

    function callback_save_success() {
        $("#foreignPersonNumber").prop("disabled", false);
        $("#foreignPersonNumber").css('background-color', '');
        $("#country_id_Comb").data("kendoComboBox").enable(true);
        $("#nationalCode").prop("disabled", false);
        $("#nationalCode").css('background-color', '');
    }

    function callback_change_title(e) {
        disableEnableFamily();
    }

    function disableEnableFamily(e) {
        if ((document.getElementsByName('title') != null) && ( document.getElementsByName('title')[0].value == 2
            || document.getElementsByName('title')[0].value == 3)
        ) {
            $("#family").css('background-color', '');
            $("#family").prop("disabled", false);
        }
        else if (document.getElementsByName('title')[0].value == 1) {
            $("#family").prop("disabled", true);
            $("#family").css('background-color', 'rgb(206, 215, 235)');
        }
        if (document.getElementsByName('citizenship')[0].value == 1) {
            $("#country_id").prop("disabled", true);
        }
    }

    function callback_DataBound_title(data) {
        disableEnableFamily();
    }

    function callback_change_citizenship(e) {
        if (document.getElementsByName('citizenship')[0].value == 11) { // irani
            $("#province_id_Comb").data("kendoComboBox").enable(true);
            $("#city_id_Comb").data("kendoComboBox").enable(true);
            $("#foreignPersonNumber").prop("disabled", true);
            $("#foreignPersonNumber").css('background-color', 'rgb(206, 215, 235)');
            $("#economicNo").prop("disabled", false);
            $("#economicNo").css('background-color', '');
            $("#nationalCode").prop("disabled", false);
            $("#nationalCode").css('background-color', '');
        } else if (document.getElementsByName('citizenship')[0].value == 10) { // gheyre irani
            $("#province_id_Comb").data("kendoComboBox").enable(false);
            $("#city_id_Comb").data("kendoComboBox").enable(false);
            $("#foreignPersonNumber").prop("disabled", false);
            $("#foreignPersonNumber").css('background-color', '');
            $("#economicNo").prop("disabled", true);
            $("#economicNo").css('background-color', 'rgb(206, 215, 235)');
            $("#nationalCode").prop("disabled", true);
            $("#nationalCode").css('background-color', 'rgb(206, 215, 235)');
        }
    }

    function callback_change_type(e) {
        changetByType();
    }

    function changetByType() {
        if (document.getElementsByName('type')[0].value == 1) {
            $("#economicNo").prop("disabled", true);
            $("#economicNo").css('background-color', 'rgb(206, 215, 235)');
            $("#foreignPersonNumber").prop("disabled", false);
            $("#foreignPersonNumber").css('background-color', '');
            $("#nationalCode").prop("disabled", false);
            $("#nationalCode").css('background-color', '');
        } else {
            $("#economicNo").prop("disabled", false);
            $("#economicNo").css('background-color', '');
            $("#foreignPersonNumber").prop("disabled", true);
            $("#foreignPersonNumber").css('background-color', 'rgb(206, 215, 235)');
            $("#nationalCode").prop("disabled", true);
            $("#nationalCode").css('background-color', 'rgb(206, 215, 235)');
        }
    }
</script>
