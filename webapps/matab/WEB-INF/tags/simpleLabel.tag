
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>

<jsp:doBody />
 <label for="${name}"><%=ResourceBoundleHolder.resourceBundle.getString(key)%></label>
