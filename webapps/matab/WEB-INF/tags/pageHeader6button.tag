<%@tag import="java.util.ResourceBundle"%>
<%@tag import="org.springframework.web.util.UrlPathHelper"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@ attribute name="pageTitle" required="false" rtexprvalue="true" %>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	request.setAttribute("basePath", basePath);
	String createUrl = basePath + "create";
%>

<input name="loadedId" type="hidden" id="loadedId" />
 
<div class="body-header">
<%if(pageTitle==null){%>
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<% }%>
	<%if(pageTitle!=null){%>
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=ResourceBoundleHolder.resourceBundle.getString(pageTitle)%></span>
		</li>
	</ul>
	<% }%>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>

		<div id="body-heade-save-div" style="display:none;">
			<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create" onClick="javascript:ajax_new_reload()"/>
			<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="body-heade-save"/>
			<base:buttonPermission key="global.crud.saveAndClose" classNames="uk-button uk-button-success" id="body-heade-saveAndClose"/>
			<base:buttonPermission key="global.crud.view" classNames="uk-button uk-button-success" id="body-heade-view-w6button"/>
			<base:buttonPermission key="global.crud.print" classNames="uk-button uk-button-success" id="body-heade-print-w6button"/>
			<base:aPermission classNames="uk-button uk-button-danger" id="breadcrumb-main-section-cancel" key="global.crud.cancel" />
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$("#breadcrumb-main-section-cancel").click(function(){
  			window.location = getBaseUrl();
		});
		$("#body-heade-view-w6button").click(function(){
  			window.location = getBaseUrl();
		});
	});
</script>