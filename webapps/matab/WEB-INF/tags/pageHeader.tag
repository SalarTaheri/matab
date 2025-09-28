<%@tag import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@tag import="org.springframework.web.util.UrlPathHelper"%>
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	request.setAttribute("basePath", basePath);
	String createUrl = basePath + "create";
	String menuSysCode =String.valueOf(request.getAttribute("menuSystemCode"));
	System.out.println(menuSysCode);
 %>
 <%@ attribute name="title" required="false" rtexprvalue="true"%>
 <input name="loadedId" type="hidden" id="loadedId" />
 
<div class="body-header">
<%if(title==null){%>
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<% }%>
	<%if(title!=null){%>
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=ResourceBoundleHolder.resourceBundle.getString(title)%></span>
		</li>
	</ul>
	<% }%>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
		<div id="body-heade-save-div" style="display:none;">
			<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="body-heade-save"/>
			<base:buttonPermission key="global.crud.saveAndClose" classNames="uk-button uk-button-success" id="body-heade-saveAndClose"/>
			<base:aPermission classNames="uk-button uk-button-danger" id="breadcrumb-main-section-cancel" key="global.crud.cancel" />
		</div>
	</div>
</div>
