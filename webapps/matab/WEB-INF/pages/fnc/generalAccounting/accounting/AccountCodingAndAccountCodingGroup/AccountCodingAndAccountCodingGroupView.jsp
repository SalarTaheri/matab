<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="org.springframework.web.util.UrlPathHelper" %>

<%
 String basePath = new UrlPathHelper().getOriginatingRequestUri(request); String fullPath = basePath.toString();
 String comboLoaderAccount = basePath + "/combo/loadAllAccountCoding";
 %>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>
<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
	<div class="uk-grid uk-grid-preserve">
		 <base:comboBoxAutoComplete-buttonAddToCombo name="name" styleClass="normal" key="fnc.generalAccounting.accounting.accountCoding.name"  popupUrlIsRelative="true"
                                     comboLoaderUrl="<%=comboLoaderAccount%>" dataTextField="nameCode"
                                     dataValueField="id" minLength="0"
                                     hasTemplate="true"
                                     headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
                                     templateComaSep="name,code" popupUrl="/popup/treeAccountCoding"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBox  styleClass="midsmall"  name="fromCode" key="fnc.generalAccounting.accounting.accountAndAccountGroup.fromCode"/>
		<base:testBox  styleClass="midsmall" styledivLabel="width:25%" name="toCode" key="fnc.generalAccounting.accounting.accountAndAccountGroup.toCode"/>
		<base:comboBox styleClass="midsmall" name="accounttype_id" key="fnc.generalAccounting.accounting.type" comboLoaderUrl="combo/loadAllAccountCodingType"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
        <%--<base:comboBox styleClass="midsmall" name="accountgrouptype_id" key="fnc.generalAccounting.accounting.group.type" comboLoaderUrl="combo/loadAllAccountCodingGroupType"/>--%>
        <base:comboBox styleClass="midsmall"  name="nature" key="fnc.generalAccounting.accounting.groupNature" comboLoaderUrl="combo/loadAllAccountCodingGroupNature"/>
        <base:comboBox styleClass="midsmall"  styledivLabel="width:25%" name="accountLayer" key="fnc.generalAccounting.accounting.accountLayer" comboLoaderUrl="combo/loadAllLayerName"/>
	</div>

	<base:my-grid-search>
		<base:my-grid-column title='fnc.generalAccounting.accounting.accountAndAccountGroup.code'  field="code" width="50px"/>
		<base:my-grid-column title='fnc.generalAccounting.accounting.accountAndAccountGroup.name'  field="name" width="50px"/>
		<base:my-grid-column title='fnc.generalAccounting.accounting.accountAndAccountGroup.accountTypeName'  field="accountCodingTypeStr" width="50px"/>
		<base:my-grid-column title='fnc.generalAccounting.accounting.accountAndAccountGroup.accountGroupNatureName'  field="natureStr" width="50px"/>
	
	    <base:my-grid-schema-field name="code" type="string"/>
	    <base:my-grid-schema-field name="name" type="string"/>
	    <base:my-grid-schema-field name="accountCodingTypeStr" type="string"/>
	    <base:my-grid-schema-field name="natureStr" type="string"/>
	</base:my-grid-search>

</div>
</form>

<script>
function getSearchObject(){
		var accountCodingVar = {};
		accountCodingVar.name=$("#name").val();
		accountCodingVar.fromCode=$("#fromCode").val();
		accountCodingVar.toCode=$("#toCode").val();
		accountCodingVar.accountTypeId=$("#accounttype_id").val();
		accountCodingVar.accountGroupTypeId=$("#accountgrouptype_id").val();
		accountCodingVar.nature=$("#nature").val();
		accountCodingVar.accountLayer=$("#accountLayer").val();
		return accountCodingVar;
}
</script>
<base:footer/>
