<%@tag import="com.artonis.core.base.components.ui.kendo.SearchOperationTag"%>
<%@tag import="java.util.List"%>

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="key" required="true" rtexprvalue="true"%>
<%@ attribute name="style" required="false" rtexprvalue="true"%>
<%@ attribute name="operation" required="false" rtexprvalue="true"%>
<%@ attribute name="checkButtonPermission" required="false" rtexprvalue="true" type="java.lang.Boolean" %>

<%
    SearchOperationTag searchOperationTag = new SearchOperationTag();
    searchOperationTag.setName(name);
    searchOperationTag.setKey(key);
    searchOperationTag.setStyle(style);
    searchOperationTag.setOperation(operation);
    //
    searchOperationTag.setCheckButtonPermission(true);
    if (checkButtonPermission != null) {
        searchOperationTag.setCheckButtonPermission(checkButtonPermission);
    }
    //
    List<SearchOperationTag> operations = (List<SearchOperationTag>) request.getAttribute("operations");
    operations.add(searchOperationTag);
    request.setAttribute("operations", operations);
%>
