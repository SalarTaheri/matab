<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>

<style>
.wide {
	width: 100%;
	height: 100%;
}
</style>
 <form name="activationForm" class="wide" method="post">
 <table class="wide">
	<tr class="wide">
		<td style="text-align: left;">
			<base:message title="activation.systemCode" />:
			<br/><br/>
			<base:message title="activation.key" />:
		</td>
		<td style="text-align: right;">
			<input type="text" disabled="disabled" readonly="readonly" style="width: 250px" dir="ltr" value="${systemCode}" />
			<br/><br/>
			<input type="text" id="activationKey" name="activationKey" style="width: 550px" dir="ltr" />
 			<input type="submit" class="uk-button-success" value='<%=ResourceBoundleHolder.resourceBundle.getString("activation.activate")%>'/>
 			<c:if test="${not empty message}">
	 			<span style="color: red">${message}</span>
 			</c:if>
		</td>
	</tr>
</table>
</form>