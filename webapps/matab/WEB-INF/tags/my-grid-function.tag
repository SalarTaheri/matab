<%@tag import="com.artonis.core.base.components.ui.kendo.MyColumnTag"%>
<%@tag import="java.util.ArrayList"%>
<%@tag import="java.util.List"%>
<%@tag import="com.kendoui.taglib.grid.ColumnTag"%>
<%@tag import="java.util.ResourceBundle"%>
<%@ tag import="com.artonis.core.base.components.ui.kendo.MyFunctionTag" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<%@ attribute name="text" required="true" rtexprvalue="true"%>
<%@ attribute name="functionClick" required="true" rtexprvalue="true"%>
<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="styleClass" required="false" %>



<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");

    MyFunctionTag myFunctionTag = new MyFunctionTag();
    myFunctionTag.setText(resource.getString(text));
    myFunctionTag.setFunctionClick(functionClick);
    myFunctionTag.setName(name);
    myFunctionTag.setStyleClass(styleClass);

    List<MyFunctionTag> funcs = (List<MyFunctionTag>) request.getAttribute("functions");
    funcs.add(myFunctionTag);
    request.setAttribute("functions", funcs);

%>
