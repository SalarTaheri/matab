<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.util.Scanner" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");


%>

<%--<base:pageHeader/>--%>
<base:pageInputHeader/>
<div class="body-header">
    <ul class="uk-breadcrumb uk-h3" id="breadcrumb">
        <li id="breadcrumb-main-section"><span>${pageTitle}</span>
        </li>
    </ul>
    <div id="header-toolbar">
        <div id="body-heade-save-div" style="display:none;">
            <%--<button class="uk-button uk-button-success" id="body-heade-save"--%>
            <%--type="button">--%>
            <%--<%=resource.getString("global.crud.save")%>--%>
            <%--</button>--%>

            <%--<button class="uk-button uk-button-success" id="body-heade-saveAndClose"--%>
            <%--type="button">--%>
            <%--<%=resource.getString("global.crud.saveAndClose")%>--%>
            <%--</button>--%>


            <a href="" class="uk-button uk-button-danger" id="breadcrumb-main-section-cancel"><%=resource.getString("global.crud.cancel")%></a>
        </a>
        </div>
    </div>
</div>

<div class="uk-container uk-container-center my-uk-container">

    <form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id">
        <%--<input id="attachNamesCommaSep" name="attachNamesCommaSep">--%>

        <div class="uk-grid uk-grid-preserve">

            <base:testBox styleClass="small" name="username" key="aut.dsh.receiver.username"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="subject" key="aut.dsh.sender.subject"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:richTestBox name="letter" key="aut.dsh.sender.letter"/>
            <%--<base:testBox styleClass="small" name="hasRead" key="com.artonis.aut.dsh.receiver.hasRead"/>--%>
        </div>
        <div class="uk-grid uk-grid-preserve">

            <div class="uk-width-1-10 left-align">
                <%--<label> peivast ha</label>--%>
            </div>
            <%
                String attachNames = request.getAttribute("attachNames").toString();
                String[] attachNameArray = attachNames.split(",");
                for (String attachName : attachNameArray) {
                    String attachNameReplace = attachName.replaceAll("\\.", "/");
            %>

                <div class="uk-width-4-10">
                    <label> </label>

                </div>

                <div class="uk-width-4-10">

                    <a href="/g01/aut/dsh/receiver/download/<%=attachNameReplace%>"><%=attachName%></a>
                </div>
            <%} %>
        </div>


        <%--</div>--%>

    </form>
</div>

<script type="text/javascript">

    function bindToEntityById_after_letter() {
        var editor = $("#letter").data("kendoEditor");
        editor.paste($("#letter").val());
    }

</script>

