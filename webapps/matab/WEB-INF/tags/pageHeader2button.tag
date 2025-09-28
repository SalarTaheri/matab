<%@tag import="org.springframework.web.util.UrlPathHelper"%>
<%@tag import="java.util.ResourceBundle"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>


<%
String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
ResourceBundle resource = ResourceBundle.getBundle("application_fa");
String notAllowUpdate=resource.getString("inventory.m169.operation.purchaseOperation.cannotUpdate");
if (basePath.indexOf("/create") > -1) {
    basePath = basePath.substring(0, basePath.indexOf("/create"));
} else if (basePath.indexOf("/edit") > -1) {
    basePath = basePath.substring(0, basePath.indexOf("/edit"));
} 
%>

<input name="loadedId" type="hidden" id="loadedId" />
 
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
			<base:buttonPermission key="fnc.btn.new" classNames="uk-button uk-button-success" id="body-heade-create-pageHeader2" onclick="javascript:customReload()"/>
			<base:buttonPermission key="fnc.btn.register" classNames="uk-button uk-button-success" id="body-heade-create-pageHeader2" onclick="javascript:saveRefusalOperation()"/>
	</div>
</div>