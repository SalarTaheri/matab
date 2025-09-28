<%--

<%@tag import="org.springframework.web.util.UrlPathHelper"%>
<%@tag import="java.util.ResourceBundle"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
    request.setAttribute("basePath", basePath);
    String createUrl = basePath + "create";
%>


<input name="loadedId" type="hidden" id="loadedId" />

<div class="body-header">

    <div id="header-toolbar">
        <button class="uk-button uk-button-success" id="body-grid-popup-create"
                type="button">
            <%=resource.getString("global.crud.new")%>
        </button>
    </div>
</div>
--%>


<%@page import="org.springframework.web.util.UrlPathHelper" %>
<%@page import="com.artonis.core.system.authentication.model.Menu" %>
<%@page import="com.artonis.core.system.authentication.service.impl.MenuTools" %>
<%@page import="java.util.ResourceBundle" %>
<%@page import="java.util.List" %>
<%@page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@include file="/WEB-INF/taglibs.jsp" %>

<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
    request.setAttribute("basePath", basePath);
    String createUrl = basePath + "create";
%>

<input name="loadedId" type="hidden" id="loadedId"/>

<div class="uk-modal-dialog  uk-modal-dialog-slide">
    <div class="body-header my-popup-title">
        <div class="uk-float-right">
            <a href="#" class="uk-modal-close uk-close"></a>
        </div>
        <div>
            ${pageTitle}
        </div>
        <div id="header-toolbar">
            <button class="uk-button uk-button-success" id="body-grid-popup-create"
                    type="button">
                <%=resource.getString("global.crud.new")%>
            </button>
        </div>
    </div>
    <div class="my-popup-body">
        <tiles:insertAttribute name="body"/>
    </div>
</div>

