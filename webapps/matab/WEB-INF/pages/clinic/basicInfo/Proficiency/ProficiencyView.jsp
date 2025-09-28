<%@ page import="java.util.ResourceBundle" %>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	request.setAttribute("basePath", basePath);
	String createUrl = basePath + "create";
	String menuSysCode = String.valueOf(request.getAttribute("menuSystemCode"));
%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
		<base:buttonPermission key="com.artonis.clinic.basicInfo.proficiency.btn.update" classNames="uk-button uk-button-success" id="body-header-btn-update" onClick="updateProficiencyView()"/>
	</div>
</div>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.proficiency.name'  field="name" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.proficiency.code'  field="code" width="50px"/>
</base:my-grid>

<base:footer/>

<script>
    function updateProficiencyView(){
        var requestUrl = "${pageContext.request.contextPath}" + "/clinic/basicInfo/proficiency/updateProficiencyView";
        $.getJSON(requestUrl, function (result) {
            if (result.state == "success") {
                alertify.success(result.message);
                //
                $("#grid").data("kendoGrid").dataSource.read();
            } else if (result.errorMsg == "error") {
                alertify.error(result.errorMsg);
            }
        });
	}
</script>