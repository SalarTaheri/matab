<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@include file="/WEB-INF/taglibs.jsp"%>

<!DOCTYPE html>
<html >
	<script src="<c:url value='/resources/alterify/js/alertify.js' />"></script>
    <link href="<c:url value='/resources/alterify/css/alertify.core.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/alterify/css/alertify.bootstrap.css'/>" rel="stylesheet" />

<head>
<title>${pageTitle}</title>
<meta charset='utf-8'>
</head>

<script type="text/javascript">
	var basePath = "${basePath}";
	
</script>


<body>	
	<div id="body">
		<tiles:insertAttribute name="body" />	
	</div>

</body>
</html>
