<%@tag import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@tag import="java.util.ResourceBundle"%>
<%@ attribute name="classNames" required="true" rtexprvalue="true" %>
<%@ attribute name="id" required="true" rtexprvalue="true" %>
<%@ attribute name="key" required="true" rtexprvalue="true" %>
<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
%>
	<a href="" class="${classNames}" id="${id}">
		<%=resource.getString(key)%>
	</a>

