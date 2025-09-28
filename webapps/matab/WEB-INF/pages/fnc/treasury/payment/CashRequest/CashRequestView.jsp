<%@page import="java.util.ResourceBundle"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	request.setAttribute("basePath", basePath);
 %>
 
<input name="loadedId" type="hidden" id="loadedId" />
 
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>
			<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.fnc.treasury.payment.cashRequest.viewCashRequest")%></span></li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
	</div>
</div>

<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
				<base:testBox styleClass="verysmall" name="serial" key="com.artonis.fnc.treasury.payment.cashRequest.serial"/>
				<base:comboBox styleClass="small" name="state" comboLoaderUrl="combo/loadAllStateType" key="com.artonis.fnc.treasury.payment.cashRequest.state"/>
				<base:comboBox  name="demandant" value="name" key="com.artonis.fnc.treasury.payment.cashRequest.demandant"
							comboLoaderUrl="combo/loadAllExpenditurer" styleClass="small" minLength="0"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
				<base:testBoxNumericEx styleClass="verysmall" name="amount" key="com.artonis.fnc.treasury.payment.cashRequest.amount"/>
				<base:comboBox styleClass="small" name="requestType" comboLoaderUrl="combo/loadAllCashRequestType" key="com.artonis.fnc.treasury.payment.cashRequest.requestType"/>
				<base:mDatePicker styleClass="small" name="registerDate" key="com.artonis.fnc.treasury.payment.cashRequest.date"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
		</div>
		<base:my-grid-search showMultipleDelete="false">
				<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashRequest.serial'  field="serial" width="40px"/>
				<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashRequest.state'  field="stateStr" width="40px"/>
				<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashRequest.demandant'  field="name" width="50px"/>
				<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashRequest.amount' format="0:#,0"  field="amount" width="50px"/>
				<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashRequest.requestType'  field="requestTypeStr" width="50px"/>
				<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashRequest.description'  field="description" width="50px"/>
				<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashRequest.registerDate'  field="registerDate" width="50px"/>
			
			    <base:my-grid-schema-field name="serial" type="string"/>
			    <base:my-grid-schema-field name="state" type="string"/>
			    <base:my-grid-schema-field name="demandant" type="string"/>
			    <base:my-grid-schema-field name="amount" type="long"/>
			    <base:my-grid-schema-field name="requestType" type="string"/>
			    <base:my-grid-schema-field name="registerDate" type="string" />
			    <base:my-grid-schema-field name="description" type="string"/>
			    
			    <base:my-grid-search-operation name="register" key="com.artonis.fnc.treasury.payment.cashRequest.state.register" style="width: 120px"/>
		</base:my-grid-search>
		<div style="padding-top: 5px;" align="center">
		 		<base:searchGridMultipleDelete style="width: 120px"/>
		 		<base:searchGridMultipleOperation key="global.crud.back" operationName="backState" style="width: 120px" />
				<base:searchGridMultipleOperation key="global.crud.save" operationName="toRegisterState" style="width: 120px" />
		
		</div>
	</form>
</div>
<base:footer/>

<script>
function getSearchObject(){
		var cashReq4Search = {};
		cashReq4Search.serial=$("#serial").val();
		cashReq4Search.state=$("#state").val();
		cashReq4Search.demandant=$("#demandant").val();
		cashReq4Search.amount=$("#amount").val();
		cashReq4Search.requestType=$("#requestType").val();
		cashReq4Search.registerDate=$("#registerDate").val();
		return cashReq4Search;
}
</script>
