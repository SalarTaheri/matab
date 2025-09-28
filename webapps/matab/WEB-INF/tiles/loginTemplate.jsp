
<%@page import="java.util.ResourceBundle"%>
<%@include file="/WEB-INF/taglibs.jsp"%>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	
%>

<!DOCTYPE html>
<html>
	<head>
		<title><%=resource.getString("login.title")%></title>
		<meta charset='utf-8'>
		<link href="<c:url value='/resources/css/web/kendo.common.min.css'/>" rel="stylesheet" />
		<link href="<c:url value='/resources/css/web/kendo.blueopal.min.css'/>" rel="stylesheet" id="kendo_style" />
		<link href="<c:url value='/resources/css/web/kendo.rtl.min.css'/>" rel="stylesheet" />
		<link href="<c:url value='/resources/css/login/style.css'/>" rel="stylesheet" />
		
		<script src="<c:url value='/resources/js/jquery.min.js' />"></script>
		<script src="<c:url value='/resources/js/kendo.all.min.js' />"></script>
		<script src="<c:url value='/resources/js/cultures/kendo.culture.fa-IR.js' />"></script>
	</head>
<body>
	<div id="body">
		
	</div>
	<div id="footer"></div>
	
	<!--WRAPPER-->
	<div id="wrapper">
		<tiles:insertAttribute name="body" />
	</div>
	<!--END WRAPPER-->
	
	<!--GRADIENT--><div class="gradient"></div><!--END GRADIENT-->
	
</body>
</html>