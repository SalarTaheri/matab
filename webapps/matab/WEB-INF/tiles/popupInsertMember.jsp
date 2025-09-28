<%--

<%@tag import="org.springframework.web.util.UrlPathHelper"%>
<%@tag import="java.util.ResourceBundle"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
    request.setAttribute("basePath", basePath);
    String createUrl = basePath + "create";
%>


<input name="loadedId" type="hidden" id="loadedId" />

<div class="body-header">

    <div id="header-toolbar">
        <button class="uk-button uk-button-success" id="body-grid-popup-create"
                type="button">
            <%=resource.getString("global.crud.new")%>
        </button>
    </div>
</div>
--%>


<%@page import="org.springframework.web.util.UrlPathHelper" %>
<%@page import="com.artonis.core.system.authentication.model.Menu" %>
<%@page import="com.artonis.core.system.authentication.service.impl.MenuTools" %>
<%@page import="java.util.ResourceBundle" %>
<%@page import="java.util.List" %>
<%@page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@include file="/WEB-INF/taglibs.jsp" %>

<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
    request.setAttribute("basePath", basePath);
    String createUrl = basePath + "create";
%>

<%--<input name="loadedId" type="hidden" id="loadedId"/>--%>

<div >
    <div class="body-header my-popup-title">
        <%--<div class="uk-float-right">--%>
            <%--<a href="#" class="uk-modal-close uk-close"></a>--%>
        <%--</div>--%>
        <%--<div>--%>
            <%--${pageTitle}--%>
        <%--</div>--%>

    </div>
    <div class="my-popup-body">
        <tiles:insertAttribute name="body"/>
    </div>
    <%--<div id="header-toolbar">
        <button class="uk-button uk-button-success" id="popup-create"
                type="button">
            <%=resource.getString("global.crud.new")%>
        </button>
    </div>--%>
    <div class="body-header my-popup-footer">
        <button class="uk-button uk-button-success" id="insert-button" data-action="save" type="button">
            <%--Save & Close--%>
                <%=ResourceBoundleHolder.resourceBundle.getString("global.crud.saveAndClose")%>
        </button>
        <%--<button class="uk-button uk-button-success" data-action="save2new" type="button">--%>
        <%--Save & New--%>
        <%--</button>--%>
        <%--<a href="#" class="uk-modal-close">Cancel</a>--%>
        <button class="uk-button" id="cancel-button"  type="button">
            <%--cancel--%>
                <%=ResourceBoundleHolder.resourceBundle.getString("global.crud.cancel")%>
        </button>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function(){
        $("#insert-button").click(function(){
            var form = $("#form-memberinput");
            var tmp = {};
            $("input[role='combobox']").attr("disabled", "disabled");
            $("input[data-ignore='true']").attr("disabled", "disabled");
            //$("input[role='datepicker']").attr("disabled", "disabled");
            checkBoxUncheck=jQuery('#form-memberinput input[type=checkbox]:not(:checked)').map(
                    function() {
                        return {"name": this.name, "value": false}
                    }).get();
            $(form.serializeArray()).each(function(){
//					if(this.name=="date")
//						this.value=1;
                if($("input[name='"+this.name+"']").attr('type')=='checkbox'){
                    if($("input[name='"+this.name+"']").val()=='on'){
                        tmp[this.name]='true';
                    }else{
                        tmp[this.name]='false';
                    }
                }else{
                    tmp[this.name] = this.value;
                }
            });
            for(var i=0;i<checkBoxUncheck.length;i++){
                tmp[checkBoxUncheck[i].name]=checkBoxUncheck[i].value;
            }


            $("input[data-ignore='true']").removeAttr("disabled");
            $("input[role='combobox']").removeAttr("disabled");
            //$("input[role='datepicker']").removeAttr("disabled");
            jQuery.ajax ({
                url: "${pageContext.request.contextPath}/thinkRoom/sessionManagement/thinkRoomSession/save/member",
                type: "POST",
                data: JSON.stringify(tmp),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function(result){
                    if(result.state == "error"){
                        for(var i=0; i<result.errors.length; i++){
                            alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                        }
                    }
                    if(result.state == "success"){
                        alertify.success(result.message);
//                        document.getElementById("loadedId").value=result.baseObjectId;
//                        $("#item-modals-memberCr").dialog('close');
                        closeCallback()

                    }
                }
            });


        });
        $("#cancel-button").click(function(){
//            $("#item-modals-memberCr").dialog('close');
            closeCallback()
        });
    });
</script>


