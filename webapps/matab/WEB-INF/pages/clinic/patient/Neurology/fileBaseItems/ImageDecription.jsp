<%@ page import="java.util.List" %>
<%@ page import="com.mongodb.DBObject" %>


<%
    Object imageWithDescription=request.getAttribute("imageWithDescription");
    System.out.println(imageWithDescription);
    if(imageWithDescription==null){
        imageWithDescription=request.getAttribute("imageWithDescriptionForEdit");
    }
    List<DBObject> listDbObject=null;
    if(imageWithDescription!=null && !(imageWithDescription instanceof String)){
        listDbObject = (List)imageWithDescription;
    }
    Object imageNamesObject = request.getAttribute("imageNames");
    Object imageCaptionsObject = request.getAttribute("imageCaptions");
    if (!imageNamesObject.toString().equals("-1")) {
        List<String> imageNameList = (List<String>) imageNamesObject;
        List<String> imageCaptionsList=null;
        if(imageCaptionsObject !=null){
            imageCaptionsList = (List<String>) imageCaptionsObject;
        }
        int i=0;
        for (String s : imageNameList) {
          if(imageCaptionsList!=null){
%>
                <h3><%=imageCaptionsList.get(i)%></h3>
<%
          }else {
%>
                <h3><%=s%></h3>
<%
          }
%>


             <div>
                 <div class="uk-width-1-1" id="imageDesc-kanban-static-<%=s%>" style="z-index:-1; height:100%">
                     <%
                         if(listDbObject!=null){
                             for (DBObject dbObject : listDbObject) {
//                                 if(dbObject.get("imageName").toString().equals(s.split("_")[0])){
                                 if(dbObject.get("imageName").toString().equals(s)){
                                     %>
                                        description:<%=dbObject.get("imageDescription").toString()%>
                                     <%
                                     break;
                                 }
                             }
                         }
                     %>
                     <textarea rows="10" name="<%=s%>" id="<%=s%>" class="image-class" style="overflow-y: auto;overflow-x:auto; width: 100%; width:100% !important; height:100%; direction: ltr; text-align: left"  >&nbsp;</textarea>
                 </div>
             </div>
<%
            i++;
        }
    }
%>
