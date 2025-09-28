<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@page import="org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
String context=((SecurityContextHolderAwareRequestWrapper) pageContext.getRequest()).getContextPath();
String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
if (basePath.indexOf("/create") > -1) {
    basePath = basePath.substring(0, basePath.indexOf("/create"));
} else if (basePath.indexOf("/edit") > -1) {
    basePath = basePath.substring(0, basePath.indexOf("/edit"));
} else if (basePath.indexOf("/loadFromCustomizeAccount") > -1) {
    basePath = basePath.substring(0, basePath.indexOf("/loadFromCustomizeAccount"));
}
String comboLoaderAccount = basePath + "/combo/loadLastLayerAccountCoding";
%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><a href="<%=request.getContextPath()%>/fnc/generalAccounting/basicinfo/customizeAccount/"><span>${pageTitle}</span></a></li>
	</ul>
</div>

<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="customizeAccount_id" name="customizeAccount_id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" dataIgnore="true" name="customizeAccount_text" key="fnc.generalAccounting.basicinfo.customizeAccountRelatedAccountCoding.customizeAccount_id" disabled="true"/>
            <base:comboBoxAutoComplete-buttonAddToCombo styledivLabel="width:30%" name="accountCoding_id" dataValueField="id" minLength="0"
            		   key="fnc.generalAccounting.basicinfo.customizeAccountRelatedAccountCoding.accountCoding_id" 
					   popupUrlIsRelative="true" hasTemplate="true"
	                   comboLoaderUrl="<%=comboLoaderAccount%>" dataTextField="nameCode"
	                   headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
	                   templateComaSep="name,code" popupUrl="/popup/treeAccountCoding" style="width: 40%"/>
		
		</div>
		<div class="uk-grid uk-grid-preserve">
		</div>
		<div align="center">
			<span >
				<base:buttonPermission key="global.crud.save" classNames="uk-button" style="background-color: rgb(175,214,101);" id="saveBtn" onClick="javascript:save();"/>
			</span>
			</div>
	</form>
</div>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single" editLabel="false" noEditButton="true">
	<base:my-grid-column title='fnc.generalAccounting.basicinfo.customizeAccountRelatedAccountCoding.accountCoding_id'  field="accountCoding_text" width="50px"/>
    <base:my-grid-schema-field name="accountCoding_text" type="string"/>
</base:my-grid>

<base:footer/>

<script type="text/javascript">
$(document).ready(function () {
	$('#customizeAccount_id').val('${customizeAccount_id}');
	$('#customizeAccount_text').val('${customizeAccount_text}');
    setTailEndUrl('/');
});
function callback_save_success(){
	$('#customizeAccount_text')[0].setAttribute('disabled','true');
	$("#grid").data("kendoGrid").dataSource.read();
	$("#accountCoding_id").val("");
	$("#id").val("");
	$("#accountCoding_id_Comb").data("kendoComboBox").value("");
	
}

</script>
