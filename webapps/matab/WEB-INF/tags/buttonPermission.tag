<%@tag import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@tag import="java.util.ResourceBundle"%>
<%@ attribute name="classNames" required="true" rtexprvalue="true"  %>
<%@ attribute name="id" required="true" rtexprvalue="true" %>
<%@ attribute name="key" required="true" rtexprvalue="true" %>
<%@ attribute name="onClick" required="false" rtexprvalue="true" %>
<%@ attribute name="style" required="false" rtexprvalue="true" %>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String menuSysCode =String.valueOf(request.getAttribute("menuSystemCode"));
%>
<% if(GlobalVariable.getButtonContainer(menuSysCode,id)){ %>
			<button class="${classNames}" id="${id}" type="button" onclick="${onClick}" style="${style}">
				<%=resource.getString(key)%>
			</button>
<%}%>