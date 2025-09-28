<%@tag import="com.artonis.core.base.components.ui.kendo.MyFieldTag"%>
<%@tag import="com.artonis.core.base.components.ui.kendo.MyColumnTag"%>
<%@tag import="java.util.ArrayList"%>
<%@tag import="java.util.List"%>
<%@tag import="com.kendoui.taglib.grid.ColumnTag"%>
<%@tag import="java.util.ResourceBundle"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="type" required="true" rtexprvalue="true"%>



<%
	MyFieldTag field = new MyFieldTag();
	field.setName(name);
	field.setType(type);
	
	List<MyFieldTag> fields = (List<MyFieldTag>) request.getAttribute("fields");		
	fields.add(field);
	request.setAttribute("fields", fields);
	
%>