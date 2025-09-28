<%@tag import="java.util.ResourceBundle" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>

<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="nameDisable" required="true" rtexprvalue="true" %>
<%@ attribute name="key" required="true" rtexprvalue="true" %>
<%@ attribute name="disabled" required="false" rtexprvalue="true" %>
<%@ attribute name="direction" required="false" rtexprvalue="true" %>
<%@ attribute name="styleClass" required="false" rtexprvalue="true" %>
<%@ attribute name="isMandatory" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="isPassword" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="styledivLabel" required="false" rtexprvalue="true" %>
<%
    if (direction == null || direction.equals(""))
        direction = "direction:rtl";
    else
        direction = "direction:ltr";
    if (styleClass == null || styleClass.length() == 0 || styleClass.equals("normal"))
        styleClass = "uk-width-4-10";
    else if (styleClass.equals("small"))
        styleClass = "uk-width-2-10";
    else if (styleClass.equals("larg"))
        styleClass = "uk-width-6-10";


%>
<jsp:doBody/>
<div class="uk-width-1-10 left-align"  style="<%= styledivLabel%>">
    <label for="${name}"><%=ResourceBoundleHolder.resourceBundle.getString(key)%>
    </label>
</div>

<div class="<%= styleClass%>">
    <%--<div class="uk-width-4-10">--%>
        <input type="text" id="${name}" name="${name}"  style=" width: 32.5%; " >
    <%--</div>--%>
    <%--<div class="uk-width-4-10">--%>
        <input type="text" id="${nameDisable}" name="${nameDisable}" style=" width: 32.5%; " disabled>
    <%--</div>--%>
</div>
