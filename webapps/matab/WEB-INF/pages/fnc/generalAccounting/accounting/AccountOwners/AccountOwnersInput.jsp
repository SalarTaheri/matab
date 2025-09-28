<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@ page import="org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper" %>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    String basePath = new UrlPathHelper().getOriginatingRequestUri(request); 
    if (basePath.indexOf("/create") > -1) {
        basePath = basePath.substring(0, basePath.indexOf("/create"));
    } else if (basePath.indexOf("/edit") > -1) {
        basePath = basePath.substring(0, basePath.indexOf("/edit"));
    }
    String comboLoaderAccount = basePath + "/combo/loadAllFloatAccountGroup";
%>
<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="name" name="name" >
		<input type="hidden" id="groupe" name="groupe" >
		<input type="hidden" id="floatAccountGroupNature_id" name="floatAccountGroupNature_id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="nameTxt" disabled="true" key="fnc.generalAccounting.accounting.accountOwner.name"/>
			<base:testBox styleClass="small" name="groupTxt" disabled="true" key="fnc.generalAccounting.accounting.accountOwner.group"/>
            <base:comboBoxAutoComplete-buttonAddToCombo name="floatAccountGroup_id" key="fnc.generalAccounting.accounting.accountOwner.float"
                                                        comboLoaderUrl="<%=comboLoaderAccount%>" dataTextField="nameCode" popupUrlIsRelative="false"
                                                        dataValueField="id" minLength="0"
                                                        hasTemplate="true"
                                                        styleClass="small"
                                                        headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
                                                        templateComaSep="name,code" popupUrl="${pageContext.request.contextPath}/fnc/generalAccounting/accounting/accountOwners/popup/treeFloatAccount"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small"  name="floatAccountGroupNatureName" key="fnc.generalAccounting.accounting.accountOwner.nature" disabled="true"/>
	    </div>
	    <div dir="ltr" align="center" style="padding-left: 80px">
		        <base:buttonPermission key="fnc.generalAccounting.accounting.related" classNames="uk-button" id="savepaymentBillBtn" onClick="javascript:showAccountOwnersItemTab();" style="background-color: rgb(175,214,101);"/>
		</div>
		
	</form>

	<div id="divItem" style="display: none" >
    <base:itemForm formItemTabInputs="AccountOwnersItemTabInput" masterIdStr="accountowners_id" insertWithoutPopup="true" titleKeys="fnc.generalAccounting.accounting.related" formItemTabViewJspFiles="AccountOwnersItemTabView.jsp"></base:itemForm>
    </div>
    </div>
<script type="text/javascript">
     $(document).ready(function(){
    
    });
    function callback_select_element_floatAccountGroup_id(floatAccountGroup_id){
        var url="<%=basePath%>" + '/load/floatAccountGroupNature/'+floatAccountGroup_id;
        $.getJSON(url, function (data) {
            $('#floatAccountGroupNatureName').val(data.groupNature_name);
            $('#floatAccountGroupNature_id').val(data.groupNature_id);
        });
    }
    function showAccountOwnersItemTab(){
    $("#divItem").slideToggle(600);
    }
 
</script>
