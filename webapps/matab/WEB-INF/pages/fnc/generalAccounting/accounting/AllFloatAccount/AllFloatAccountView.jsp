<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%
        String basePath = new UrlPathHelper().getOriginatingRequestUri(request); 
        String fullPath = basePath.toString();
        String comboLoaderFloatAccount = basePath + "/combo/loadAllFloatAccount";
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
    		<base:comboBoxAutoComplete-buttonAddToCombo name="id" styleClass="normal"  key="fnc.generalAccounting.accounting.allFloatDetailAccount.namefloatcostCenter"  popupUrlIsRelative="true"
	               comboLoaderUrl="<%=comboLoaderFloatAccount%>" dataTextField="nameCode"
	               dataValueField="id" minLength="0"
	               hasTemplate="true"
	               headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
	               templateComaSep="name,code" popupUrl="/popup/treeFloatAccount"/>
	         <base:testBox  styleClass="midsmall" name="fromCode" key="fnc.generalAccounting.accounting.allFloatDetailAccount.fromCode"/>
			<base:testBox  styleClass="midsmall" name="toCode" key="fnc.generalAccounting.accounting.allFloatDetailAccount.toCode"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
           <%--<base:comboBoxAutoComplete-buttonAddToCombo name="name" key="fnc.generalAccounting.accounting.accountCoding.name"  popupUrlIsRelative="true"--%>
	                            <%--comboLoaderUrl="<%=comboLoaderAccount%>" dataTextField="nameCode"--%>
	                            <%--dataValueField="id" minLength="0"--%>
	                            <%--hasTemplate="true"--%>
	                            <%--headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"--%>
	                            <%--templateComaSep="name,code" popupUrl="/popup/treeAccountCoding"/>--%>
        	
		   <%--<base:comboBoxAutoComplete name="groupNature_id" styleClass="midsmall"  key="fnc.generalAccounting.accounting.allFloatDetailAccount.groupNature" comboLoaderUrl="combo/loadAllOfFloatAccountGroupNature" dataTextField="name" dataValueField="id" minLength="0"--%>
	         <%--hasTemplate="true" headerTemplateComaSep="fnc.generalAccounting.accounting.allFloatDetailAccount.groupNature" templateComaSep="name"/>       --%>
		    <base:comboBox name="type" value="type" key="fnc.generalAccounting.accounting.costCenter.type" comboLoaderUrl="combo/loadAllcostCenterTypes" styleClass="midsmall" />
        </div>

    <base:my-grid-search>
		<base:my-grid-column title='fnc.generalAccounting.accounting.allFloatDetailAccount.name'  field="name" width="50px"/>
		<base:my-grid-column title='fnc.generalAccounting.accounting.allFloatDetailAccount.code'  field="code" width="50px"/>
		<base:my-grid-column title='fnc.generalAccounting.accounting.allFloatDetailAccount.level'  field="level" width="50px"/>
		<base:my-grid-column title='fnc.generalAccounting.accounting.allFloatDetailAccount.parent'  field="parentFloatAccountName" width="50px"/>
		
	    <base:my-grid-function text="fnc.generalAccounting.accounting.relatedGroup" functionClick="grid_onGoRelatedFloatAccountGroup"  name="GoRelatedFloatAccountGroup" styleClass="uk-button uk-button-success"/>
	    <base:my-grid-schema-field name="name" type="string"/>
	    <base:my-grid-schema-field name="code" type="string"/>
	    <base:my-grid-schema-field name="level" type="string"/>
	   	<base:my-grid-schema-field name="parentFloatAccountName" type="string"/>
	    
	</base:my-grid-search>
 </form>
</div>
<script>
function getSearchObject(){
		var floatAccountVar = {};
		floatAccountVar.id=$("#id").val();
		floatAccountVar.fromCode=$("#fromCode").val();
		floatAccountVar.toCode=$("#toCode").val();
//		floatAccountVar.groupNature_id=$("#groupNature_id").val();
		floatAccountVar.type=$("#type").val();
		return floatAccountVar;
}
function grid_onGoRelatedFloatAccountGroup(e){
    var data = this.dataItem($(e.target).closest("tr"));
    window.location.href="${pageContext.request.contextPath}"+"/generalAccounting/accounting/floatAccountRelatedFloatAccountGroup/loadAndSave/"+data.id;
}

</script>
<base:footer/>