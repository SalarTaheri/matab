<%@ page import="java.util.ResourceBundle" %>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>

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
    } else  if (basePath.indexOf("/edit/floatAccount/") > -1){
        prefix += "floatAccount/"+idInt;

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
        <li id="breadcrumb-main-section"></li>
        <%--<%}%>--%>
    </ul>
    <!--<div>${pageTitle}</div>-->
    <div id="header-toolbar">
	    <base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
    </div>
</div>
<%if(request.getAttribute("type")==null){%>
<%if(idInt!=-2){%>
<base:mehrSys-grid-accounting-toolbar isPopup="false" name="grid" transportReadUrl="${basePath}/grid-read/${prefix}" selectable="single">
    <base:my-grid-column title='fnc.generalAccounting.accounting.name' field="name" width="25px"/>
    <base:my-grid-column title='fnc.generalAccounting.accounting.code' field="code" width="10px"/>
     <base:my-grid-column title='fnc.generalAccounting.accounting.domain' field="domainName" width="30px"/>
    <base:my-grid-column isCombo="true" title='fnc.generalAccounting.accounting.function.subAccount' field="hasChild" width="10px"/>

    <base:my-grid-schema-field name="name" type="string"/>
    <base:my-grid-schema-field name="code" type="string"/>
    <base:my-grid-schema-field name="hasChild" type="boolean"/>
    <base:my-grid-schema-field name="domainName" type="string"/>
    <base:my-grid-function text="fnc.generalAccounting.accounting.function.doamin" functionClick="grid_onGoDomain"  name="GoDomain" styleClass="uk-button uk-button-success"/>
    <base:my-grid-function text="fnc.generalAccounting.accounting.function.subFloatAccount" functionClick="grid_onGoSubAccount"  name="GoSubAccount" styleClass="uk-button uk-button-success"/>
    <base:my-grid-function text="fnc.generalAccounting.accounting.related" functionClick="grid_onGoAccount"  name="GoAccount" styleClass="uk-button uk-button-success"/>
</base:mehrSys-grid-accounting-toolbar>
<%}else{ %>
<base:mehrSys-grid-accounting-toolbar name="grid" transportReadUrl="${basePath}/grid-read/" selectable="single">
    <base:my-grid-column title='fnc.account.group.name' field="name" width="50px"/>
    <base:my-grid-column title='fnc.account.group.code' field="code" width="50px"/>


    <base:my-grid-schema-field name="name" type="string"/>
    <base:my-grid-schema-field name="code" type="string"/>

</base:mehrSys-grid-accounting-toolbar>
<%}%>
<%}%>
<%if(request.getAttribute("type")!= null ){%>
<%if(request.getAttribute("type").toString().equals("0") ){ %>
<%if(idInt!=-2){%>
<base:mehrSys-grid-accounting-toolbar name="grid" transportReadUrl="${basePath}/grid-read/${prefix}" selectable="single">
    <base:my-grid-column title='fnc.generalAccounting.accounting.name' field="name" width="15px"/>
    <base:my-grid-column title='fnc.generalAccounting.accounting.code' field="code" width="10px"/>

    <base:my-grid-function text="fnc.generalAccounting.accounting.relatedGroup" functionClick="grid_onGoRelatedFloatAccountGroup"  name="GoRelatedFloatAccountGroup" styleClass="uk-button uk-button-success"/>
    <base:my-grid-schema-field name="name" type="string"/>
    <base:my-grid-schema-field name="code" type="string"/>
   
</base:mehrSys-grid-accounting-toolbar>
<%}else{%>
<base:mehrSys-grid-accounting-toolbar name="grid" transportReadUrl="${basePath}/grid-read/" selectable="single">
    <base:my-grid-column title='fnc.account.group.name' field="name" width="50px"/>
    <base:my-grid-column title='fnc.account.group.code' field="code" width="50px"/>

    <base:my-grid-schema-field name="name" type="string"/>
    <base:my-grid-schema-field name="code" type="string"/>

</base:mehrSys-grid-accounting-toolbar>
<%}%>
<%}%>
<%}%>
<%if(request.getAttribute("type")!= null ){%>
<%if(request.getAttribute("type").toString().equals("1") ||request.getAttribute("type").toString().equals("2")
		|| request.getAttribute("type").toString().equals("3")		
){ %>
<%if(idInt!=-2){%>
<base:mehrSys-grid-accounting-toolbar name="grid" transportReadUrl="${basePath}/grid-read/${prefix}" selectable="single">
    <base:my-grid-column title='fnc.generalAccounting.accounting.costCenter.name' field="name" width="30px"/>
    <base:my-grid-column title='fnc.generalAccounting.accounting.costCenter.code' field="code" width="20px"/>
    <base:my-grid-column title='fnc.generalAccounting.accounting.costCenter.type' field="costCenterTypeStr" width="20px"/>

    <base:my-grid-schema-field name="name" type="string"/>
    <base:my-grid-schema-field name="code" type="string"/>
    <base:my-grid-schema-field name="costCenterTypeStr" type="string"/>
    <base:my-grid-function text="fnc.generalAccounting.accounting.costCenter.subCostCenter" functionClick="grid_onGoSubAccount"  name="GoSubAccount" styleClass="uk-button uk-button-success"/>
</base:mehrSys-grid-accounting-toolbar>
<%}else{ %>
<base:mehrSys-grid-accounting-toolbar name="grid" transportReadUrl="${basePath}/grid-read/" selectable="single">
    <base:my-grid-column title='fnc.account.group.name' field="name" width="50px"/>
    <base:my-grid-column title='fnc.account.group.code' field="code" width="50px"/>


    <base:my-grid-schema-field name="name" type="string"/>
    <base:my-grid-schema-field name="code" type="string"/>

</base:mehrSys-grid-accounting-toolbar>
<%}%>
<%}%>
<%}%>
<base:footer/>

<script type="text/javascript">
    $(document).ready(function() {
//        $("#body-heade-create").show();
    });


    function customFormSave(){
        var cUrl=window.location.href;
        var lastIndexOfStash=cUrl.lastIndexOf('/');
        var id=cUrl.substring(lastIndexOfStash+1);
        $.getJSON("<c:url value='/' />" + "fnc/generalAccounting/accounting/floatAccount/validationForCreate/"+id, function (result) {
            if (result.state == "error") {
                for (var i = 0; i < result.errors.length; i++) {
                    if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                        alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                    } else {
                        alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                    }
                }
            } else {
                window.location.href ="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/floatAccount/create/floatAccount/"+id;
            }
        })
    }

    function call_back_bindToEntityById(data){
        $("#titleGrid").text(data.titleGrid);
        $("#title").text(data.title);
        var parentUrl = "";
        if (data.parent_id != null && parseInt(data.parent_id) > 0){
        	parentUrl = "floatAccount/edit/floatAccount/" + data.parent_id;
        }else{
			parentUrl = "floatAccount/";
        }
        $("#titleUrl").attr("href", "${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/" + parentUrl);
    }

    function grid_onGoSubAccount(e){
        var data = this.dataItem($(e.target).closest("tr"));
        window.location.href="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/floatAccount/edit/floatAccount/"+ data.id;
    }

    function grid_onGoAccount(e){
        var data = this.dataItem($(e.target).closest("tr"));
        window.location.href="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/accountCodingFloatAccount/edit/floatAccount/"+ data.id;
    }
    
    function grid_onGoDomain(e){
        var data = this.dataItem($(e.target).closest("tr"));
        window.location.href="${pageContext.request.contextPath}"+"/generalAccounting/accounting/floatAccountDomain/loadAndSave/"+data.id;
    }
    
    function grid_onGoRelatedFloatAccountGroup(e){
        var data = this.dataItem($(e.target).closest("tr"));
        window.location.href="${pageContext.request.contextPath}"+"/generalAccounting/accounting/floatAccountRelatedFloatAccountGroup/loadAndSave/"+data.id;
    }

</script>
