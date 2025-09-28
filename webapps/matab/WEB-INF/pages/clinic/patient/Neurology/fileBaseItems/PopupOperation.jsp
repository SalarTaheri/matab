<%@ page import="com.artonis.clinic.basicInfo.model.Operation" %>
<%@ page import="java.util.List" %>
<form class="toPopup" style="direction: ltr">
    <%
        int rowPerColumn = 10;
        int column = 5;
        List<Operation> operationList = (List<Operation>) request.getAttribute("operationAllList");
        int index = 0;
        if(operationList==null || operationList.size()==0){
    %><table><%
            }
            for (Operation operation : operationList) {

                if (index == 0) {

        %>
    <table>
        <tr>
            <td>
                <%--<base:checkbox styleClass="small" name="<%=medicalTest.getName()%>" id="<%=medicalTest.getId().toString()%>" caption="<%=medicalTest.getName()%>" direction="ltr"/>--%>

                <input type="checkbox" name="<%=operation.getName()%>"
                       id="<%=operation.getId().toString()%>-operation-current-checkbox"
                       title="<%=operation.getName()%>"><%=operation.getName()%>
            </td>
                <%
                    } else if (index % column == 0) {
                    %>
        <tr>
            <td>
                <%--<base:checkbox styleClass="small" name="<%=medicalTest.getName()%>" id="<%=medicalTest.getId().toString()%>" caption="<%=medicalTest.getName()%>" direction="ltr"/>--%>

                <input type="checkbox" name="<%=operation.getName()%>"
                       id="<%=operation.getId().toString()%>-operation-current-checkbox"
                       title="<%=operation.getName()%>"><%=operation.getName()%>
            </td>
            <%
            } else if (index % column != 0 && index % column != column - 1) {
            %>
            <td>
                <%--<base:checkbox styleClass="small" name="<%=medicalTest.getName()%>" id="<%=medicalTest.getId().toString()%>" caption="<%=medicalTest.getName()%>" direction="ltr"/>--%>

                <input type="checkbox" name="<%=operation.getName()%>"
                       id="<%=operation.getId().toString()%>-operation-current-checkbox"
                       title="<%=operation.getName()%>"><%=operation.getName()%>
            </td>
            <%
            } else if (index % column == column - 1) {
            %>
            <td>
                <%--<base:checkbox styleClass="small" name="<%=medicalTest.getName()%>" id="<%=medicalTest.getId().toString()%>" caption="<%=medicalTest.getName()%>" direction="ltr"/>--%>

                <input type="checkbox" name="<%=operation.getName()%>"
                       id="<%=operation.getId().toString()%>-operation-current-checkbox"
                       title="<%=operation.getName()%>"><%=operation.getName()%>
            </td>
        </tr>
        <%
                }
                index++;
            }
        %>
    </table>
</form>

<script>
    function refreshPage(){
        window.location.reload();
    }
</script>