
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<base:pageHeader title="com.artonis.inv.m169.basicInfo.companyPerson.view"/>
<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
 		<input type="hidden" id="id" name="id">
       	<div class="uk-grid uk-grid-preserve">
       		 <base:comboBox styleClass="small" styledivLabel="text-align: right;width:14%"  name="personType" isListConstant="true"
                           key="com.artonis.inv.m169.basicInfo.companyPerson.personType" comboLoaderUrl="/combo/loadAllPersonType" />
     		<base:comboBox styleClass="small" name="companyType" styledivLabel="text-align: right;width:12.5%" isListConstant="true"
                           key="com.artonis.inv.m169.basicInfo.person.citizenship" comboLoaderUrl="combo/loadAllCompanyType" />
			<base:testBox styleClass="small" name="personCompanyName"  styledivLabel="text-align: right;width:13%" key="com.artonis.inv.m169.basicInfo.companyPerson.personCompanyName"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="firstAndLastName" styledivLabel="text-align: right;width:14%" key="com.artonis.inv.m169.basicInfo.companyPerson.firstAndLastName"/>
			<base:testBox styleClass="small" name="registerNumber" styledivLabel="text-align: right;width:12.5%" key="com.artonis.inv.m169.basicInfo.companyPerson.registerNumber"/>
			<base:testBox styleClass="small" name="nationalId" styledivLabel="text-align: right;width:13%" key="com.artonis.inv.m169.basicInfo.companyPerson.nationalId"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="taxAffairs" styledivLabel="text-align: right;width:14%" key="com.artonis.inv.m169.basicInfo.companyPerson.taxAffairs"/>
			<base:cascadeComboBox styleClass="small"  name="province_Id" styledivLabel="text-align: right;width:12.5%" cascadeCombo="countryId" key="com.artonis.inv.m169.basicInfo.person.state" selectIndex="0" comboLoaderUrl="combo/loadProvince" />
	        <base:cascadeComboBox styleClass="small"  name="city_Id" styledivLabel="text-align: right;width:13%" isListConstant="true" cascadeCombo="province_Id" key="com.artonis.inv.m169.basicInfo.person.city" comboLoaderUrl="combo/loadCity"/>
		</div>
		<div >
			<label class="p-q-label uk-form-label" style="width:70px;">
				<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.includeband")%>
			</label>
			<label class="p-q-label uk-form-label" style="width:50px; padding-right: 10%">
				<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.alef")%>
				<input type="radio" class="p-q-radio" name="includeBand" value="1" onclick="handleClick(this)" />
			</label>
			<label class="p-q-label uk-form-label" style="width:50px; padding-right: 20px">
				<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.be")%>
				<input type="radio" class="p-q-radio" name="includeBand" value="2" onclick="handleClick(this)" />
			</label>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="postalCode" styledivLabel="text-align: right;width:14%" key="com.artonis.inv.m169.basicInfo.companyPerson.postalCode"/>
			<base:testBox styleClass="small" styledivLabel="text-align: right;width:12.5%" name="phoneNo" key="com.artonis.inv.m169.basicInfo.companyPerson.phoneNo"/>
			<base:testBox styleClass="small" name="priorEconomicCode" styledivLabel="text-align: right;width:13%" key="com.artonis.inv.m169.basicInfo.companyPerson.priorEconomicCode"/>	
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="newEconomicCode" styledivLabel="text-align: right;width:14%" key="com.artonis.inv.m169.basicInfo.companyPerson.newEconomicCode"/>
			<base:comboBox styledivLabel="text-align: right;width:12.5%" styleClass="small" name="registrationState" 
                           key="com.artonis.inv.m169.basicInfo.companyPerson.registrationState" comboLoaderUrl="/combo/loadAllRegistrationState" /> 
			<base:testBox styleClass="small" styledivLabel="text-align: right;width:13%" name="userName"  key="com.artonis.inv.m169.basicInfo.companyPerson.userName"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea height="25" divWidthVal="53"  name="address" styledivLabel="text-align: right;width:14%" key="com.artonis.inv.m169.basicInfo.companyPerson.address"/>
        </div>
        <div class="uk-grid uk-grid-preserve" style="text-align: center; padding: 10px">
        	<div>
	        	<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="body-heade-save-companyPerson" />
			</div>
        </div>
   </form>         
</div>	
<base:Pattern3/>
<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='com.artonis.inv.m169.basicInfo.companyPerson.personType'  field="personTypeText" width="45px"/>
	<base:my-grid-column title='com.artonis.inv.m169.basicInfo.companyPerson.companyType'  field="companyTypeText" width="35px"/>
	<base:my-grid-column title='com.artonis.inv.m169.basicInfo.companyPerson.personCompanyName'  field="personCompanyName" width="80px"/>
	<base:my-grid-column title='com.artonis.inv.m169.basicInfo.companyPerson.registerNumber'  field="registerNumber" width="40px"/>
	<base:my-grid-column title='com.artonis.inv.m169.basicInfo.companyPerson.nationalId'  field="nationalId" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.basicInfo.companyPerson.province_Id'  field="provinceName" width="30px"/>
	<base:my-grid-column title='com.artonis.inv.m169.basicInfo.companyPerson.city_Id'  field="cityName" width="30px"/>
	<base:my-grid-column title='com.artonis.inv.m169.basicInfo.companyPerson.phoneNo'  field="phoneNo" width="40px"/>
	<base:my-grid-column title='com.artonis.inv.m169.basicInfo.companyPerson.newEconomicCode'  field="newEconomicCode" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.basicInfo.companyPerson.registrationState'  field="registrationStateText" width="80px"/>


        <base:my-grid-schema-field name="personTypeText" type="string"/>
        <base:my-grid-schema-field name="companyTypeText" type="string"/>
        <base:my-grid-schema-field name="personCompanyName" type="string"/>
        <base:my-grid-schema-field name="registerNumber" type="string"/>
        <base:my-grid-schema-field name="nationalId" type="string"/>
        <base:my-grid-schema-field name="provinceName" type="string"/>
        <base:my-grid-schema-field name="cityName" type="string"/>
        <base:my-grid-schema-field name="phoneNo" type="string"/>
        <base:my-grid-schema-field name="newEconomicCode" type="string"/>
        <base:my-grid-schema-field name="registrationStateText" type="string"/>
        
</base:my-grid>
<base:footer/>
<script type="text/javascript">
	$("#body-heade-save-companyPerson").click(function(){
		         save();
	});
  function callback_change_personType(e){
    changeTextByPersonType();
 }
  function callback_change_companyType(e){
    changeTextByCompanyType();
 }
   function callback_change_registrationState(e){
    changeTextByRegistrationState();
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
        $("#nationalId").prop("disabled", false);
        $("#nationalId").val("");
		$("#nationalId").css('background-color','');

	}
	else{
		$("label[for='nationalId']").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.foreignPersonNumber")%>');
        $("#nationalId").prop("disabled", true);
        $("#nationalId").val("");
		$("#nationalId").css('background-color','rgb(206, 215, 235)');
	}
}
function handleClick(myRadio) {
	$("#includeBand").val(myRadio.value);
}
function changeTextByRegistrationState(e){
	if(document.getElementsByName('registrationState')[0].value ==2){
		$("label[for='userName']").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.rahgiriCode")%>');
	}else{
		$("label[for='userName']").text('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.inv.m169.basicInfo.companyPerson.userName")%>');
	}
}

</script>

