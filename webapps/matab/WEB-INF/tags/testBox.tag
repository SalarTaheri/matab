
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="disabled" required="false" rtexprvalue="true"%>
<%@ attribute name="direction" required="false" rtexprvalue="true"%>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%@ attribute name="isMandatory" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="isPassword" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="dataIgnore" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="readOnly" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="styledivLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="value" required="false" rtexprvalue="true" %>
<%@ attribute name="type" required="false" rtexprvalue="true" %>
<%@ attribute name="divStyle" required="false" rtexprvalue="true" %>
<%
    if(divStyle!=null){
        divStyle="style='"+divStyle+"'";
    }
    if(direction==null || direction.equals(""))
        direction="direction:rtl";
    else
        direction="direction:ltr";
    if(styleClass==null ||styleClass.length()==0||styleClass.equals("normal"))
        styleClass="uk-width-4-10";
    else if(styleClass.equals("small"))
        styleClass="uk-width-2-10";
    else if(styleClass.equals("midsmall")){
         styleClass="uk-width-1-10";
         if(divStyle==null){
             divStyle="style='width: 15%'";
         }
    }else if(styleClass.equals("larg"))
        styleClass="uk-width-6-10";
    else if(styleClass.toLowerCase().equals("verysmall"))
        styleClass="uk-width-1-10";

    if(isMandatory==null){
        isMandatory=false;
    }
    if(isPassword==null){
        isPassword=false;
    }
    if(dataIgnore==null){
    	dataIgnore=false;	
    }
    if(readOnly==null){
    	readOnly=false;	
    }
    if (type == null) {
        type = "text";
    }
%>
<jsp:doBody />
<div class="uk-width-1-10 left-align" style="<%= styledivLabel%>">
    <label id="${name}_lbl_txt" for="${name}"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>
</div>
<%if(!isPassword){%>
<div <%=divStyle %> class="<%= styleClass%>">
    <%if (Boolean.valueOf(disabled)) {%>
        <%if (value != null) {%>
            <input type="<%=type%>" id="${name}" name="${name}" class="uk-width-1-1" disabled data-ignore="${dataIgnore}"
                   value="<%=ResourceBoundleHolder.resourceBundle.getString(value)%>">
        <%} else { %>
            <input type="<%=type%>" id="${name}" name="${name}" class="uk-width-1-1" disabled data-ignore="${dataIgnore}">
        <%} %>

    <%} else { %>
        <%if (!isMandatory) {%>
            <input type="<%=type%>" id="${name}" name="${name}" class="uk-width-1-1" style="${direction}" data-ignore="${dataIgnore}"

                    <% if (readOnly) { %>
                   readonly="readonly"
                    <% } %>

                    />
        <%} else {%>
            <input type="<%=type%>" id="${name}" name="${name}" class="uk-width-1-1"
                   style="background: rgb(206, 215, 235);${direction}" data-ignore="${dataIgnore}"

                    <% if (readOnly) { %>
                   readonly="readonly"
                    <% } %>

                    />
        <%} %>
    <%} %>
</div>
<%}else {%>
<div <%=divStyle %> class="<%= styleClass%>">
    <%if(Boolean.valueOf(disabled)){%>
    <input type="password" id="${name}" name="${name}" class="uk-width-1-1" disabled data-ignore="${dataIgnore}">
    <%} else { %>
    <%if(!isMandatory){%>
    <input type="password" id="${name}" name="${name}" class="uk-width-1-1" style="${direction}" data-ignore="${dataIgnore}">
    <%}else {%>
    <input type="password" id="${name}" name="${name}" class="uk-width-1-1" style="background: rgb(206, 215, 235);${direction}" data-ignore="${dataIgnore}">
    <%} %>
    <%} %>
</div>
<%} %>
