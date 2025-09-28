<%@tag import="org.apache.commons.lang3.StringUtils"%>
<%@tag import="java.util.ResourceBundle"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="title" required="true" rtexprvalue="true"%>
<%@ attribute name="cssClass" required="false" rtexprvalue="true"%>
<%@ attribute name="jsutDefine" required="false" rtexprvalue="true" %>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String labelName = "label_" + title.replace(".", "_");
	request.setAttribute(labelName, resource.getString(title)); 
	boolean printLabel = StringUtils.isBlank(jsutDefine) || !jsutDefine.equals("true");
	
 %>
 
<%if(printLabel){ %>
	<span class="${cssClass}"><%=resource.getString(title)%></span>
<%} %>

