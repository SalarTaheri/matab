<%@page import="java.util.ResourceBundle" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
%>

<div class="user-icon"></div>
<div class="pass-icon"></div>

<form id="signin " name="login-form" class="login-form" action="<c:url value='/j_spring_security_check' />" method="post">
    <div class="header" id="signInPageLogoDiv">
    	<br/>
    	<br/>
    	<br/>
    	<br/>
    </div>

    <div class="content">
        <input name="username" type="text" class="input username" placeholder="<%=resource.getString("login.userName")%>"/>
        <input name="password" type="password" class="input password" placeholder="<%=resource.getString("login.password")%>"/>
    </div>

    <div class="footer">
        <input type="submit" name="submit" value="<%=resource.getString("login.login")%>" class="button" style="font-family: Tahoma; font-size: 14px;"/>
    </div>
</form>
<script type="text/javascript">
    $(document).ready(function () {
        $(".username").focus(function () {
            $(".user-icon").css("left", "-48px");
        });
        $(".username").blur(function () {
            $(".user-icon").css("left", "0px");
        });

        $(".password").focus(function () {
            $(".pass-icon").css("left", "-48px");
        });
        $(".password").blur(function () {
            $(".pass-icon").css("left", "0px");
        });
    });
</script>
<style type="text/css">
	#signInPageLogoDiv{
	    background-image: url(<c:url value='/resources/images/signInPageLogo.png' />);
	    background-size:   80%; 
		background-repeat: no-repeat;
	    background-position: center center;
	}
</style>