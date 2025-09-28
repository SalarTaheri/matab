<%@tag import="java.util.ResourceBundle"%>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="styleClass" required="false" rtexprvalue="true"%>
<%
	String  divStyle="";
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
         divStyle="style='width: 15%'";
    }
%>
<jsp:doBody />
<div class="uk-width-1-10 left-align">
    <label id="${name}" for="${name}"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>
</div>
<div <%=divStyle %> class="<%= styleClass%>">
	<input id="${name}" name="${name}" type="text" data-ignore="true" disabled
		style="background: transparent;border: none; font-weight:bold; color:black"/>
</div>

