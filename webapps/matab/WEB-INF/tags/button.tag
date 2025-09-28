
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>

<%@ attribute name="id" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="false" rtexprvalue="true"%>
<%@ attribute name="text" required="false" rtexprvalue="true"%>
<%--<%@ attribute name="disabled" required="false" rtexprvalue="true"%>--%>
<%--<%@ attribute name="direction" required="false" rtexprvalue="true"%>--%>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%@ attribute name="style" required="false" rtexprvalue="true"%>
<%@ attribute name="stylediv" required="false" rtexprvalue="true"%>
<%@ attribute name="align" required="false" rtexprvalue="true"%>
<%@ attribute name="type" required="false" rtexprvalue="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if(styleClass==null ||styleClass.length()==0||styleClass.equals("normal"))
        styleClass="uk-width-4-10";
    else if(styleClass.equals("small"))
        styleClass="uk-width-1-10";
    else if(styleClass.equals("larg"))
        styleClass="uk-width-6-10";

    if(align==null || align.length()==0){
        align="center";
    }

    if(type == null || type.length() == 0)
    	type = "button";

%>
<jsp:doBody />

<div align="<%= align%>" class="<%= styleClass %> " style="<%= stylediv%>" >

    <button  id="${id}" align="<%= align%>"
            type="<%= type%>" style="<%= style%>" class="uk-button uk-button-success" >
        <c:choose>
            <c:when test="${text == null}">
                <%=ResourceBoundleHolder.resourceBundle.getString(key)%>
            </c:when>
            <c:otherwise>
                ${text}
            </c:otherwise>
        </c:choose>
    </button>

</div>
