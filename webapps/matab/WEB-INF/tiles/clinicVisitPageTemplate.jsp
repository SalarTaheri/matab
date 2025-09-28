<%@include file="/WEB-INF/taglibs.jsp"%>

<!DOCTYPE html>

<html>

	<head>
		<title>${pageTitle}</title>
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
