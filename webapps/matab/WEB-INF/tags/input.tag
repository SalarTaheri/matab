<%@tag import="java.util.ResourceBundle"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="field" required="true" rtexprvalue="true"%>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
 %>
 
<div class="uk-width-1-10 left-align">
	<label for="${field}">${field}</label>
</div>
<div class="uk-width-4-10">
	<input type="text" id="${field}" name="${field}" class="uk-width-1-1">
</div>