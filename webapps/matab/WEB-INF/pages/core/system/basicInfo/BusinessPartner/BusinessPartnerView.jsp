<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.core.system.basicInfo.businessPartner.view")%></span></li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
	</div>
</div>

<div class="uk-container uk-container-center my-uk-container" >
<form class="uk-form" id="mainForm">
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

		<div style="margin-top: 10px">
			<base:my-grid-search >
				<base:my-grid-column title='com.artonis.core.system.basicInfo.businessPartner.name'  field="nameAndFamily" width="50px"/>
				<base:my-grid-column title='com.artonis.core.system.basicInfo.businessPartner.title'  field="titleTxt" width="35px"/>
				<base:my-grid-column title='com.artonis.core.system.basicInfo.businessPartner.type'  field="personTypeTxt" width="35px"/>
				<base:my-grid-column title='com.artonis.core.system.basicInfo.businessPartner.nationalcode'  field="nationalcode" width="60px"/>
				<base:my-grid-column title='com.artonis.core.system.basicInfo.businessPartner.phoneno'  field="phoneno" width="40px"/>
				<base:my-grid-column title='com.artonis.core.system.basicInfo.businessPartner.mobileno'  field="mobileno" width="40px"/>
				<base:my-grid-column title='com.artonis.core.system.basicInfo.businessPartner.foreignPersonNumber'  field="foreignPersonNumber" width="70px"/>
			</base:my-grid-search>
		</div>

	<div style="text-align: center">
		<base:buttonPermission key="hrm.employee.updateOrCreateFloatAccoun" classNames="uk-button uk-button-success" id="updateOrCreateFloatAccounts" onClick="javascript:updateOrCreateFloatAccounts()" style="background-color: rgb(175,214,101);width: 10%;"/>
	</div>

</form>
</div>

<base:footer/>

<script >
	function getSearchObject(){
					var businessPartnerVar = {};
					businessPartnerVar.type=$("#type").val();
					businessPartnerVar.title=$("#title").val();
					businessPartnerVar.name=$("#name").val();
					businessPartnerVar.family=$("#family").val();
					businessPartnerVar.citizenship=$("#citizenship").val();
					businessPartnerVar.nationalcode=$("#nationalcode").val();
					businessPartnerVar.foreignPersonNumber=$("#foreignPersonNumber").val();
					businessPartnerVar.country_id=$("#country_id").val();
					businessPartnerVar.province_id=$("#province_id").val();
					businessPartnerVar.city_id=$("#city_id").val();
					return businessPartnerVar;
			}
 function updateOrCreateFloatAccounts(){
       var requestUrl = "${pageContext.request.contextPath}" + "/system/basicInfo/businessPartner/updateOrCreateFloatAccounts";
   	$.ajax({
   		url: requestUrl,
   		contentType: "application/json; charset=utf-8",
   		dataType: 'json',
   		type: 'POST',
   		success: function (data, success, xhr) {
                  if (data.state == "error") {
                      for (var i = 0; i < data.errors.length; i++) {
                          if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
                              alertify.error($("label[for='" + data.errors[i].Field + "']").text() + ":  " + data.errors[i].Message);
                          } else {
                              alertify.error(data.errors[i].Field + ":  " + data.errors[i].Message);
                          }
                      }
                  }else{
   					var searchJsonString = "{}";
   					var urlGrid = basePath + "search/search/grid-read/" + searchJsonString;
   					$("#searchGrid").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
   					$("#searchGrid").data("kendoGrid").dataSource.read();
   					alertify.success(data.message);
                  }
   		},
   		error: function (e) {
   			alert('Error: ' + e.responseText);
   		}
   	});	
   }
</script>
