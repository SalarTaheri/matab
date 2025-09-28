<%@tag import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@tag import="java.util.ResourceBundle"%>
<%@ attribute name="id" required="true" rtexprvalue="true" %>

<%
	String menuSysCode =String.valueOf(request.getAttribute("menuSystemCode"));
%>
<% if(GlobalVariable.getButtonContainer(menuSysCode,id)){ %>
			<input value="1" type="hidden" id="${id}" name="${id}" >
<%}else{%>
			<input value="0" type="hidden" id="${id}" name="${id}" >
<%}%>