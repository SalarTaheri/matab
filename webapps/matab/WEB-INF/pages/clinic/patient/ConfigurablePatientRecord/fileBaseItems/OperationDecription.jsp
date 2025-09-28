<%@ page import="java.util.List" %>
<%@ page import="com.mongodb.DBObject" %>


<%
    Object operationWithDescription=request.getAttribute("operationWithDescription");
    System.out.println(operationWithDescription);
    if(operationWithDescription==null){
        operationWithDescription=request.getAttribute("operationWithDescriptionForEdit");
    }
    List<DBObject> listDbObject=null;
    if(operationWithDescription!=null && !(operationWithDescription instanceof String)){
        listDbObject = (List)operationWithDescription;
    }
    Object operationNamesObject = request.getAttribute("operationNames");
    Object operationCaptionsObject = request.getAttribute("operationCaptions");
    if (!operationNamesObject.toString().equals("-1")) {
        List<String> operationNameList = (List<String>) operationNamesObject;
        List<String> operationCaptionsList=null;
        if(operationCaptionsObject !=null){
            operationCaptionsList = (List<String>) operationCaptionsObject;
        }
        int i=0;
        for (String s : operationNameList) {
          if(operationCaptionsList!=null){
%>
                <h3><%=operationCaptionsList.get(i)%></h3>
<%
          }else {
%>
                <h3><%=s%></h3>
<%
          }
%>


             <div>
                 <div class="uk-width-1-1" id="operationDesc-kanban-static-<%=s%>" style="z-index:-1; height:100%">
                     <%
                         if(listDbObject!=null){
                             for (DBObject dbObject : listDbObject) {
//                                 if(dbObject.get("operationName").toString().equals(s.split("_")[0])){
                                 if(dbObject.get("operationName").toString().equals(s)){
                                     %>
                                        description:<%=dbObject.get("operationDescription").toString()%>
                                     <%
                                     break;
                                 }
                             }
                         }
                     %>
                     <textarea rows="10" name="<%=s%>" id="<%=s%>" class="operation-class" style="overflow-y: auto;overflow-x:auto; width: 100%; width:100% !important; height:100%; direction: ltr; text-align: left"  >&nbsp;</textarea>
                 </div>
             </div>
<%
            i++;
        }
    }
%>
