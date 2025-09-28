<%@tag import="java.util.ResourceBundle" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="key" required="true" rtexprvalue="true" %>
<%@ attribute name="absulotePath" required="true" rtexprvalue="true" %>
<jsp:doBody/>
	<%-- <h5><%=ResourceBoundleHolder.resourceBundle.getString(key)%></h5>--%>
	<select id="${name}" 
		data-native-menu="false" 
		data-icon="search" 
		data-mini="true" 
		data-type="horizontal" 
		multiple="multiple" 
		data-theme="b" 
		data-role="fieldcontain" 
		data-scroll="true">
		
	</select>

<script>
			$.getJSON("<c:url value='/' />" + "${absulotePath}" , function(data) {
				for ( var i = 0; i < data.length; i++) {
					$("#${name}").append(
							"<option style='direction:ltr' value='" + data[i].ComboID + "' >" + data[i].ComboCaption + "</option>");
				}
				$("#${name}").selectmenu("refresh");
			});
			
	
</script>