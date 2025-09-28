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

    </div>
    <div class="my-popup-body">
        <tiles:insertAttribute name="body"/>
    </div>

    <div class="body-header my-popup-footer">
        <button class="uk-button" id="cancel-button"  type="button">
                <%=ResourceBoundleHolder.resourceBundle.getString("global.crud.cancel")%>
        </button>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function(){
        $("#insert-button").click(function(){
            var form = $("#form-popup");
            var tmp = {};
            $("input[role='combobox']").attr("disabled", "disabled");
            $("input[data-ignore='true']").attr("disabled", "disabled");
            //$("input[role='datepicker']").attr("disabled", "disabled");
            checkBoxUncheck=jQuery('#form-popup input[type=checkbox]:not(:checked)').map(
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
                <%--url: "${pageContext.request.contextPath}/thinkRoom/sessionManagement/thinkRoomSession/save/member",--%>
                url: save_${name}_url(),
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
                        success_save_${name}_Callback();
                    }
                }
            });


        });
        $("#cancel-button").click(function(){
//            $("#item-modals-memberCr").dialog('close');
            cancel_${name}_Callback();
        });
    });
</script>


