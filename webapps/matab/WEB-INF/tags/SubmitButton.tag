<%@tag import="org.springframework.web.util.UrlPathHelper"%>
<%@tag import="java.util.ResourceBundle"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<%@ attribute name="onClick" required="false" rtexprvalue="true" %>
<%@ attribute name="style" required="false" rtexprvalue="true" %>
<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
//    String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
//    request.setAttribute("basePath", basePath);
//    String createUrl = basePath + "create";
%>
<div>
	<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="body-heade-save" style="width:10%"/>
</div>
