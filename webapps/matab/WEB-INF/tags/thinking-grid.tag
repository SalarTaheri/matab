<%@tag import="com.artonis.core.base.components.ui.kendo.MyFieldTag"%>
<%@tag import="java.util.ArrayList"%>
<%@tag import="java.util.List"%>
<%@tag import="com.artonis.core.base.components.ui.kendo.MyColumnTag"%>
<%@tag import="java.util.ResourceBundle"%>
<%@ tag import="com.artonis.core.base.components.ui.kendo.MyFunctionTag" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<%@ attribute name="name" required="true" rtexprvalue="true"%>
<%@ attribute name="transportReadUrl" required="true" rtexprvalue="true"%>
<%@ attribute name="updateUrl" required="false" rtexprvalue="true"%>
<%@ attribute name="destroyUrl" required="false" rtexprvalue="true"%>
<%@ attribute name="inlineEditing" required="false" rtexprvalue="true"%>
<%@ attribute name="selectable" required="false" rtexprvalue="true"%>

<%@ attribute name="isPopup" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="isForSearch" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%
    request.setAttribute("fields", new ArrayList<MyFieldTag>());
    request.setAttribute("cols", new ArrayList<MyColumnTag>());
    request.setAttribute("functions", new ArrayList<MyFunctionTag>());
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");

    String areUShure=resource.getString("action.alert.areYouSure.delete");

%>

<jsp:doBody />

<%

    if(isPopup==null){
        isPopup=false;
    }

    if(isForSearch==null){
        isForSearch=false;
    }

    List<MyColumnTag> cols = (List<MyColumnTag>) request.getAttribute("cols");
    List<MyFieldTag> fields = (List<MyFieldTag>) request.getAttribute("fields");
    List<MyFunctionTag> functions = (List<MyFunctionTag>) request.getAttribute("functions");
    inlineEditing=(inlineEditing==null||inlineEditing.length()==0)?"false":"true";
%>


<base:message title='action.groupBy' jsutDefine="true"/>
<base:message title='action.operation' jsutDefine="true"/>
<base:message title='action.edit' jsutDefine="true"/>
<base:message title='action.delete' jsutDefine="true"/>
<div class="k-rtl" style=" width: 100%; height: 100%;" >
    <kendo:grid  name="${name}" selectable="${selectable}" pageable="true" sortable="true" height="400"  columnReorder="true" columnResize="true" filterable="true" navigatable="true" editable="${inlineEditing}">
        <kendo:grid-groupable>
            <kendo:grid-groupable-messages empty='${label_action_groupBy}' />
        </kendo:grid-groupable>
        <%if(inlineEditing!=null &&inlineEditing.equals("true")){ %>
        <kendo:grid-toolbar>
            <kendo:grid-toolbarItem name="save" text="global.crud.save"/>
            <kendo:grid-toolbarItem name="cancel" text="global.crud.cancel"/>
        </kendo:grid-toolbar>
        <%} %>

        <kendo:grid-columns>

            <%for(MyColumnTag col : cols) {%>
            <kendo:grid-column title='<%=col.getTitle() %>'  field="<%=col.getField() %>" width="<%=col.getWidth() %>"/>
            <%} %>

          <%--  <kendo:grid-column title='${label_action_operation}' width="100px" >
                <kendo:grid-column-command >
                    <%if(!isPopup &&!isForSearch){%>
                    <kendo:grid-column-commandItem click="_${name}_onEdit" name="edit" text='${label_action_edit}' />
                    <kendo:grid-column-commandItem click="_${name}_onDelete" name="delete" text='${label_action_delete}' />
                    <%} %>

                    <%for(MyFunctionTag myFunctionTag : functions) {%>
                    <%if(!isPopup){%>
                    <kendo:grid-column-commandItem click='<%=myFunctionTag.getFunctionClick() %>'  name="<%=myFunctionTag.getName() %>" text="<%=myFunctionTag.getText() %>"/>
                    <%} else {%>
                    <kendo:grid-column-commandItem  name="<%=myFunctionTag.getName() %>" text="<%=myFunctionTag.getText() %>" className="uk-button uk-button-success uk-modal-close">
                        <kendo:grid-column-commandItem-click >
                            <script>
                                //select button in popup grid
                                function(e) {
                                    var data = this.dataItem($(e.target).closest("tr"));
                                    var tmp = {};
                                    tmp[masterIdStr]=document.getElementById("loadedId").value;
                                    tmp["member_id"]=data.id;
                                    jQuery.ajax ({
                                        url: basePath + "save/membersession",
                                        type: "POST",
                                        data: JSON.stringify(tmp),
                                        dataType: "json",
                                        context: $(this),
                                        contentType: "application/json; charset=utf-8",
                                        async :false,
                                        success: function(result){
                                            if(result.state == "error"){
                                                for(var i=0; i<result.errors.length; i++){
                                                    alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                                                }
                                            }
                                            if(result.state == "success"){
                                                alertify.success(result.message);

                                            }
                                        }

                                    });

                                }
                            </script>
                        </kendo:grid-column-commandItem-click>
                    </kendo:grid-column-commandItem>
                    <%} %>

                    <%} %>

                </kendo:grid-column-command>
            </kendo:grid-column>--%>
        </kendo:grid-columns>


        <kendo:dataSource  pageSize="10" serverPaging="true" serverSorting="true" serverFiltering="true" serverGrouping="true">
            <kendo:dataSource-transport>
                <%--<%if(!isForSearch){%>--%>
                <kendo:dataSource-transport-read  url="${transportReadUrl}" type="POST"  contentType="application/json"/>
                <%--<%} %>--%>
                <kendo:dataSource-transport-parameterMap>
                    function(options){return JSON.stringify(options);}
                </kendo:dataSource-transport-parameterMap>
            </kendo:dataSource-transport>
            <kendo:dataSource-schema  data="data" total="total" groups="data">
                <kendo:dataSource-schema-model id="id">
                    <kendo:dataSource-schema-model-fields>
                        <%for(MyFieldTag field : fields) {%>
                        <kendo:dataSource-schema-model-field name="<%=field.getName() %>" type="<%=field.getType() %>" />
                        <% }%>
                    </kendo:dataSource-schema-model-fields>
                </kendo:dataSource-schema-model>
            </kendo:dataSource-schema>
        </kendo:dataSource>
        <kendo:grid-pageable input="true" numeric="false" />

    </kendo:grid>

</div>

<script>
    function _${name}_onDelete(e){
        var areUShure = "<%=areUShure%>";
        var data = this.dataItem($(e.target).closest("tr"));
        alertify.confirm(areUShure, function (e) {
            if (e) {
                jQuery.ajax ({
                    url: basePath + "remove",
                    type: "POST",
                    data: JSON.stringify({id: data.id}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function(result){
                        if(result.state == "success"){
                            $("#grid").data("kendoGrid").dataSource.read();
                            alertify.success(result.message);
                        }else if(result.state == "error"){
                            for(var i=0; i<result.errors.length; i++){
                                alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                            }
                        }else{
                            lertify.error("Something is not good! O_o");
                        }

                    }
                });
            }
        });
    }

    function _${name}_onEdit(e){
        var data = this.dataItem($(e.target).closest("tr"));
        window.location = basePath + "edit/" + data.id;
    }
</script>
