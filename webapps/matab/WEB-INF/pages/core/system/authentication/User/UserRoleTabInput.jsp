
<%@page import="java.util.ResourceBundle"%><%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
%>

<form class="uk-form2-UserRole" >

    <input  type="hidden" id="id" name="id" class="uk-width-1-1">
    <div class="uk-grid uk-grid-preserve">

        <base:comboBox name="role_id" value="name" key="system.authentication.role.name" comboLoaderUrl="combo/loadAllRole"/>
        <%--<div class="uk-width-1-10 left-align">--%>
            <%--<label for="name"><%=resource.getString("system.authentication.role.name")%></label>--%>
        <%--</div>--%>
        <%--<div class="uk-width-4-10">--%>
            <%--<input type="text" id="name" name="name" class="uk-width-1-1">--%>
        <%--</div>--%>
    </div>




</form>
