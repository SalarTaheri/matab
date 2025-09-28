
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="disabled" required="false" rtexprvalue="true"%>
<%@ attribute name="direction" required="false" rtexprvalue="true"%>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%@ attribute name="style" required="false" rtexprvalue="true"%>
<%@ attribute name="divStyle" required="false" rtexprvalue="true"%>
<%@ attribute name="isMandatory" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="isPassword" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%
    if(direction==null || direction.equals(""))
        direction="direction:rtl";
    else
        direction="direction:ltr";
    if(styleClass==null ||styleClass.length()==0||styleClass.equals("normal"))
        styleClass="uk-width-4-10";
    else if(styleClass.equals("small"))
        styleClass="uk-width-2-10";
    else if(styleClass.equals("larg"))
        styleClass="uk-width-6-10";

    if(isMandatory==null){
        isMandatory=false;
    }
    if(isPassword==null){
        isPassword=false;
    }

%>
<jsp:doBody />
<div class="uk-width-1-10 left-align">
    <label for="${name}"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>
</div>
<%if(!isPassword){%>
<div class="<%= styleClass%>" style="${divStyle}">
    <%if(Boolean.valueOf(disabled)){%>
    <input type="text" id="${name}" name="${name}" class="uk-width-1-1" disabled style="${style}">
    <%} else { %>
    <%if(!isMandatory){%>
    <input type="text" id="${name}" name="${name}" class="uk-width-1-1" style="${direction}; ${style}">
    <%}else {%>
    <input type="text" id="${name}" name="${name}" class="uk-width-1-1" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(237,247,220,1)), color-stop(100%,rgba(255,255,204,1))); ${direction}; ${style}">
    <%} %>
    <%} %>
</div>
<%}else {%>
<div class="<%= styleClass%>"  style="${divStyle}">
    <%if(Boolean.valueOf(disabled)){%>
    <input type="password" id="${name}" name="${name}" class="uk-width-1-1" disabled style="${style}">
    <%} else { %>
    <%if(!isMandatory){%>
    <input type="password" id="${name}" name="${name}" class="uk-width-1-1" style="${direction}; ${style}">
    <%}else {%>
    <input type="password" id="${name}" name="${name}" class="uk-width-1-1" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(237,247,220,1)), color-stop(100%,rgba(255,255,204,1)));${direction}; ${style}">
    <%} %>
    <%} %>
</div>
<%} %>
