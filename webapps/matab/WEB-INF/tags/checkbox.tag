<%@tag import="java.util.ResourceBundle" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>

<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="key" required="true" rtexprvalue="true" %>
<%@ attribute name="disabled" required="false" rtexprvalue="true" %>
<%@ attribute name="direction" required="false" rtexprvalue="true" %>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%@ attribute name="style" required="false" rtexprvalue="true"%>
<%@ attribute name="onChangeFunction" required="false" rtexprvalue="false"%>
<%@ attribute name="divLableStyle" required="false" rtexprvalue="true"%>
<%@ attribute name="divCheckBoxStyle" required="false" rtexprvalue="true"%>
<%
    if (direction == null || direction.equals(""))
        direction = "direction:rtl";
    else
        direction = "direction:ltr";

    if(styleClass==null ||styleClass.length()==0||styleClass.equals("normal"))
        styleClass="uk-width-4-10";
    else if(styleClass.equals("small"))
        styleClass="uk-width-2-10";
    else if(styleClass.equals("larg"))
        styleClass="uk-width-6-10";
    else if(styleClass.toLowerCase().equals("verysmall"))
        styleClass="uk-width-1-10";
    else if(styleClass.equals("midsmall")){
        styleClass="uk-width-1-10";
    }
//    if (divLableStyle==null){
//        divLableStyle="";
//    }
//    if(divCheckBoxStyle==null){
//        divCheckBoxStyle="";
//    }
%>
<jsp:doBody/>
<%if(divLableStyle!=null){%>
    <div class="uk-width-1-10 left-align" style="<%=divLableStyle%>">
<%}else{%>
    <div class="uk-width-1-10 left-align">
 <%}%>
    <label for="${name}"><%=ResourceBoundleHolder.resourceBundle.getString(key)%>
    </label>
    </div>
  <%if(divLableStyle!=null){%>
    <div class="<%= styleClass%>" style="<%=divCheckBoxStyle%>">
  <%}else{%>
    <div class="<%= styleClass%>">

    <%}%>
    <%if (Boolean.valueOf(disabled)) {%>
    <input type="checkbox" id="${name}" name="${name}" class="uk-width-1-1" disabled style="${style}" >
    <%} else { %>
    <input type="checkbox" id="${name}" name="${name}" class="uk-width-1-1" style="${style}" onchange="${onChangeFunction}">
    <%} %>
</div>
