
<%@page import="java.util.ResourceBundle"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
ResourceBundle resource = ResourceBundle.getBundle("application_fa");
 %>

	<style>
		body { margin: 0; font-family: verdana;}
		h1 {text-align: center; margin: 0; padding: 15px;}
		.header { top: 0px; height: 80px; border-bottom: 1px #ccc solid;background-color: #eaeaea; }
		.footer { position:absolute; bottom:0; width: 100%; border-top: 1px #ccc solid; padding: 10px 0px; background-color: #eaeaea;}
		.footer .text {float: right; margin-right: 20px;}
		input { display: block; width: 340px; margin: 3px 0px 20px 0px; padding: 5px;}
		label {font-weight: normal; font-size: 15px;}
		button {background-color: #ccc; color: #000; border: 1px #f4f4f4 solid; margin: 12px 0px; box-shadow: 0 3px 2px #AAA; margin-right: 5px; padding: 5px 10px; font-weight: bold;}
		#dialog {display: none;}
		.ui-dialog{ box-shadow: 0 20px 10px #AAA;}
		.error {border: 1px solid #FBB3B9; color: #f0051e; background: #FFECED; padding: 5px; margin-bottom: 10px; font-size: 12px;font-weight: bold;}
		.link {padding: 20px; background-color: #f4f4f4; border: 1px solid #ccc; font-family: verdana; width: 50%; margin: 0 auto; text-align: center; margin-top: 100px;}
		.login {width: 380px; margin: 0 auto; border: 1px solid #ccc; padding: 30px; margin-top: 80px;}
		.login h2 {margin-top: 0px;}
		</style>

<div class="header"><h1><%=resource.getString("action.insert")%></h1></div>