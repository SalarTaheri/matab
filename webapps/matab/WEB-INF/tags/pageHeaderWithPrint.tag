<%@tag import="org.springframework.web.util.UrlPathHelper"%>
<%@tag import="java.util.ResourceBundle"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	request.setAttribute("basePath", basePath);
	String createUrl = basePath + "create";
 %>
 
 <input name="loadedId" type="hidden" id="loadedId" />
 
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
		<div id="body-heade-save-div" style="display:none;">
			<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="body-heade-save"/>
			<base:buttonPermission key="global.crud.saveAndClose" classNames="uk-button uk-button-success" id="body-heade-saveAndClose"/>
			<base:buttonPermission key="global.crud.save.print" classNames="uk-button uk-button-success" id="body-heade-print"/>
			<base:aPermission classNames="uk-button uk-button-danger" id="breadcrumb-main-section-cancel" key="global.crud.cancel" />
		</div>
	</div>
</div>