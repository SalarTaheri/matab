<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:directive.attribute name="title" required="true" rtexprvalue="true" />

<!DOCTYPE html>
<html>
    <head>
        <title> - ${Title}</title>
        <meta charset='utf-8'> 
		<link href="<c:url value='/resources/css/web/kendo.common.min.css'/>" rel="stylesheet" />
		<link href="<c:url value='/resources/css/web/kendo.blueopal.min.css'/>" rel="stylesheet" id="kendo_style" />
		<link href="<c:url value='/resources/css/web/kendo.rtl.min.css'/>" rel="stylesheet" />
		
		<script src="<c:url value='/resources/js/jquery.min.js' />"></script>
		<script src="<c:url value='/resources/js/kendo.all.min.js' />"></script>
		<script src="<c:url value='/resources/js/cultures/kendo.culture.fa-IR.js' />"></script>
    </head>    
	<body>
		 <div style="padding-top: 50px;">
<!-- 		  <jsp:include page="/WEB-INF/view/jsp/menu.jspx"/> -->
		  <jsp:doBody />
<!-- 		  <jsp:include page="/WEB-INF/view/jsp/footer.jspx"/> -->
		 </div>
		 <script src="<c:url value='/resources/js/cultures/kendo.culture.fa-IR2.js' />"></script>
	 </body>
</html>
