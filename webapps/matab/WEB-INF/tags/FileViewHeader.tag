
<%@ attribute name="masterIdStr" required="true" rtexprvalue="true" type="java.lang.String" %>

<%
//    String patientId = (String)request.getAttribute("patientId");
    String masterId = (String)request.getAttribute(masterIdStr);
%>
<script type="text/javascript">
    <%--var patientId = "${patientId}";--%>
    <%--var masterId = "${masterId}";--%>
    var masterId = "<%=masterId%>";
    var masterIdStr = "${masterIdStr}";
</script>