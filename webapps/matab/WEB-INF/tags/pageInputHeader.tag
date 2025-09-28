<%
	String basePath = (String) request.getAttribute("basePath");
	int pos = basePath.indexOf("/edit/");
	if(pos < 0)
		pos = basePath.length();
 %>
 
<script type="text/javascript">
	var basePath = "<%=basePath.substring(0, pos)%>";
</script>