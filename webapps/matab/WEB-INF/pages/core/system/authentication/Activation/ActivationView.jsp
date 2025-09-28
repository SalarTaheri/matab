<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>

<style>
.wide {
	width: 100%;
	height: 100%;
	text-align: center;
}
</style>
 <table class="wide">
	<tr>
		<td class="wide">
			<base:message title="activation.success" />
			<br/>
			<a href='<c:url value="/login" />'><%=ResourceBoundleHolder.resourceBundle.getString("activation.enterSystem")%></a>
		</td>
	</tr>
</table>
