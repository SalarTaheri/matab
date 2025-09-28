<%@ page import="java.util.ResourceBundle" %>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@ page import="org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper" %>
<%@ page import="org.apache.tiles.request.RequestWrapper" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
//    String createUrl = basePath + "create";
    int idInt=-2;
    String prefix="";
//    if(basePath.lastIndexOf("/")+1==basePath.length()){
    String id = basePath.substring(basePath.lastIndexOf("/") + 1);

    try {
        idInt = Integer.parseInt(id);
    } catch (NumberFormatException e) {
        e.printStackTrace();
    }

    if (basePath.indexOf("group") > -1) {
        prefix += "group/" + idInt;
    } else  if (basePath.indexOf("/edit/accountCoding/") > -1){
        prefix += "accountCoding/"+idInt;

    }
    request.setAttribute("prefix", prefix);
    basePath=basePath.substring(0,basePath.indexOf("/edit"));
    request.setAttribute("basePath", basePath);
//    }

%>

<input name="loadedId" type="hidden" id="loadedId"/>

<div class="body-header" >
    <ul class="uk-breadcrumb uk-h3" id="breadcrumb">
       <%--<%if(request.getRequestURL().indexOf("/edit/group")==-1 && request.getRequestURL().indexOf("/edit/account")==-1){--%>
           <%--System.out.println("****request.getRequestURL():"+request.getRequestURL());%>--%>
        <li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
       <%--<%}%>--%>
    </ul>
    <div id="header-toolbar">
    	<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
    </div>
</div>

<%if(idInt!=-2){%>
<base:mehrSys-grid-accounting-toolbar name="grid" transportReadUrl="${basePath}/grid-read/${prefix}" selectable="single">
    <base:my-grid-column title='fnc.generalAccounting.accounting.account.name' field="name" width="30px"/>
    <base:my-grid-column title='fnc.generalAccounting.accounting.account.code' field="code" width="17px"/>
    <base:my-grid-column title='fnc.generalAccounting.accounting.type' field="accountCodingTypeStr" width="15px"/>
    <base:my-grid-column title='fnc.generalAccounting.accounting.nature' field="natureStr" width="15px"/>
    <base:my-grid-column isCombo="true" title='fnc.generalAccounting.accounting.function.subAccount' field="hasChild" width="15px"/>


    <base:my-grid-schema-field name="name" type="string"/>
    <base:my-grid-schema-field name="code" type="string"/>
    <base:my-grid-schema-field name="accountCodingTypeStr" type="string"/>
    <base:my-grid-schema-field name="accountCodingTypeStr" type="string"/>
    <base:my-grid-schema-field name="hasChild" type="boolean"/>
    <base:my-grid-function text="fnc.generalAccounting.accounting.function.subAccount" functionClick="grid_onGoSubAccount"  name="GoSubAccount"/>
    <base:my-grid-function text="fnc.generalAccounting.accounting.detail.float.related" functionClick="grid_onGoFloatAccount"  name="GoFloatAccount"/>

</base:mehrSys-grid-accounting-toolbar>
<%}else{ %>
<base:mehrSys-grid-accounting-toolbar name="grid" transportReadUrl="${basePath}/grid-read/" selectable="single">
    <base:my-grid-column title='fnc.account.group.name' field="name" width="50px"/>
    <base:my-grid-column title='fnc.account.group.code' field="code" width="50px"/>


    <base:my-grid-schema-field name="name" type="string"/>
    <base:my-grid-schema-field name="code" type="string"/>

</base:mehrSys-grid-accounting-toolbar>
<%}%>

<base:footer/>

<script type="text/javascript">
    $(document).ready(function() {
//        $("#body-heade-create").show();
    });

    function call_back_bindToEntityById(data){
        $("#titleGrid").text(data.titleGrid);
        $("#title").text(data.title);
        var parentUrl = "";
        if (data.parent_id != null && parseInt(data.parent_id) > 0){
        	parentUrl = "accountCoding/edit/accountCoding/" + data.parent_id;
        }else if (data.accountgroup_id != null && parseInt(data.accountgroup_id) > 0){
        	parentUrl = "accountCoding/edit/group/" + data.accountgroup_id;
        }else{
			parentUrl = "accountCodingGroup/";
        }
        $("#titleUrl").attr("href", "${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/" + parentUrl);
    }

    function grid_onGoSubAccount(e){
        var data = this.dataItem($(e.target).closest("tr"));
        window.location.href="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/accountCoding/edit/accountCoding/"+ data.id;
    }

    function grid_onGoFloatAccount(e){
        var data = this.dataItem($(e.target).closest("tr"));
        window.location.href="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/accountCodingFloatAccount/edit/accountCoding/"+ data.id;
    }

</script>
