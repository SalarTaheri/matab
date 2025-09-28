<%@tag import="com.artonis.core.base.components.ui.kendo.MyFieldTag" %>
<%@tag import="java.util.ArrayList" %>
<%@tag import="java.util.List" %>
<%@tag import="com.artonis.core.base.components.ui.kendo.MyColumnTag" %>
<%@tag import="java.util.ResourceBundle" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>

<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="pageName" required="true" rtexprvalue="true" %>
<%@ attribute name="transportReadUrl" required="true" rtexprvalue="true" %>

<%
    request.setAttribute("fields", new ArrayList<MyFieldTag>());
    request.setAttribute("cols", new ArrayList<MyColumnTag>());

    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String areUShure=resource.getString("action.alert.areYouSure.delete");
%>
<script type="text/javascript">
    var pageName = "${pageName}";

</script>

<jsp:doBody/>

<%
    List<MyColumnTag> cols = (List<MyColumnTag>) request.getAttribute("cols");
    List<MyFieldTag> fields = (List<MyFieldTag>) request.getAttribute("fields");
%>


<base:message title='action.groupBy' jsutDefine="true"/>
<base:message title='action.operation' jsutDefine="true"/>
<base:message title='action.edit' jsutDefine="true"/>
<base:message title='action.delete' jsutDefine="true"/>
<div class="k-rtl">
    <kendo:grid name="${name}" pageable="true" sortable="true" height="400" columnReorder="true" columnResize="true"
                filterable="true" navigatable="true">

        <kendo:grid-groupable>
            <kendo:grid-groupable-messages empty='${label_action_groupBy}'/>
        </kendo:grid-groupable>

        <kendo:grid-columns>

            <%for (MyColumnTag col : cols) {%>
            <kendo:grid-column title='<%=col.getTitle() %>' field="<%=col.getField() %>" width="<%=col.getWidth() %>"/>
            <%} %>

            <kendo:grid-column title='${label_action_operation}' width="100px">
                <kendo:grid-column-command>
                    <kendo:grid-column-commandItem className="uk-button uk-button-success" click="_${name}_onEdit" name="edit" text='${label_action_edit}'/>
                    <kendo:grid-column-commandItem className="uk-button uk-button-danger" click="_${name}_onDelete" name="delete"
                                                   text='${label_action_delete}'/>
                    <kendo:grid-column-commandItem className="uk-button uk-button-success" click="_${name}_onDetail" name="detail" text='File'/>
                    <kendo:grid-column-commandItem className="uk-button uk-button-success" click="_${name}_onSurvey" name="survey" text='Survey'/>
                    <kendo:grid-column-commandItem className="uk-button uk-button-success" click="_${name}_onVisit" name="visit" text='Visit'/>
                </kendo:grid-column-command>
            </kendo:grid-column>
        </kendo:grid-columns>


        <kendo:dataSource pageSize="10" serverPaging="true" serverSorting="true" serverFiltering="true"
                          serverGrouping="true">
            <kendo:dataSource-transport>
                <kendo:dataSource-transport-read url="${transportReadUrl}" type="POST" contentType="application/json"/>
                <kendo:dataSource-transport-parameterMap>
                    function(options){return JSON.stringify(options);}
                </kendo:dataSource-transport-parameterMap>
            </kendo:dataSource-transport>
            <kendo:dataSource-schema data="data" total="total" groups="data">
                <kendo:dataSource-schema-model id="id">
                    <kendo:dataSource-schema-model-fields>
                        <%for (MyFieldTag field : fields) {%>
                        <kendo:dataSource-schema-model-field name="<%=field.getName() %>" type="<%=field.getType() %>"/>
                        <%} %>
                    </kendo:dataSource-schema-model-fields>
                </kendo:dataSource-schema-model>
            </kendo:dataSource-schema>
            <kendo:dataSource-error>
                <script>
                    function error(e) {
                        errorRequestAjax(e);
                    }
                </script>
            </kendo:dataSource-error>
        </kendo:dataSource>
        <kendo:grid-pageable input="true" numeric="false"/>

    </kendo:grid>

</div>

<script>
    function _${name}_onDelete(e) {
        var areUShure = "<%=areUShure%>";
        var data = this.dataItem($(e.target).closest("tr"));
        alertify.confirm(areUShure, function (e) {
            if (e) {
                jQuery.ajax({
                    url:basePath + "remove",
                    type:"POST",
                    data:JSON.stringify({id:data.id}),
                    dataType:"json",
                    contentType:"application/json; charset=utf-8",
                    success:function (result) {
                        if (result.state == "success") {
                            $("#grid").data("kendoGrid").dataSource.read();
                            alertify.success(result.message);
                        } else if (result.state == "error") {
                            for (var i = 0; i < result.errors.length; i++) {
                                alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                            }
                        } else {
                            lertify.error("Something is not good! O_o");
                        }

                    }
                });
            }
        });
    }

    function _${name}_onEdit(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        window.location = basePath + "edit/" + data.id;
    }

    
    function _${name}_onSurvey(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        var t = basePath.replace("/" + pageName + "/", "/" + pageName + "/survey/");
        window.location = t + data.id;
    }

    function _${name}_onDetail(e) {
        var data = this.dataItem($(e.target).closest("tr"));
//                var t = basePath.replace("/patient/", "/patient/file/");
        var t = basePath.replace("/" + pageName + "/", "/" + pageName + "/file/");
        window.location = t + data.id;
    }
    
    function _${name}_onVisit(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        var t = basePath.replace("/" + pageName + "/", "/" + pageName + "/visit/");
        window.location = t + data.id;
    }

</script>
        