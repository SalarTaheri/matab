<%@page import="org.springframework.web.util.UrlPathHelper" %>
<%@page import="com.artonis.core.system.authentication.model.Menu" %>
<%@page import="com.artonis.core.system.authentication.service.impl.MenuTools" %>
<%@page import="java.util.ResourceBundle" %>
<%@page import="java.util.List" %>
<%@page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@include file="/WEB-INF/taglibs.jsp" %>

<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
    request.setAttribute("basePath", basePath);
    String createUrl = basePath + "create";
%>

<%--<input name="loadedId" type="hidden" id="loadedId"/>--%>
<div class="uk-modal-dialog">
    <div>
        <div class="body-header my-popup-title"  style=" text-align: center; ">
            ${pageTitle}
        </div>
        <div class="my-popup-body">
            <tiles:insertAttribute name="body"/>
        </div>

        <div class="body-header my-popup-footer" style=" text-align: center; ">
            <button class="uk-button uk-button-success uk-modal-close" id="save-button" type="button">
                <%=ResourceBoundleHolder.resourceBundle.getString("global.crud.save")%>
            </button>

            <button class="uk-button uk-button-danger" id="cancel-button" type="button">
                <%=ResourceBoundleHolder.resourceBundle.getString("global.crud.close")%>
            </button>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function () {

        $("#save-button").click(function () {
            if(typeof(callback_save_popup) == "function"){
                callback_save_popup();
            }
        });

    });
</script>


