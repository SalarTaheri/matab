<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@tag import="java.util.Map" %>
<%@tag import="java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag import="java.util.ResourceBundle" %>
<%@tag import="org.springframework.web.util.UrlPathHelper" %>
<%@ tag import="java.util.List" %>
<%@ tag import="java.util.ArrayList" %>

<%@ attribute name="formPopup" required="true" rtexprvalue="true" %>
<%@ attribute name="key" required="true" rtexprvalue="true" %>
<%@ attribute name="popUrl" required="true" rtexprvalue="true" %>
<%@ attribute name="gridName" required="false" rtexprvalue="true" %>
<%@ attribute name="isRelative" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="smallShow" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="disableBackground" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="onSelectRowEvent" required="false" rtexprvalue="true" %>
<%@ attribute name="style" required="false" rtexprvalue="true" %>



<%
//        ${pageContext.request.contextPath}
    if(isRelative!=null && isRelative){
        String basePath=request.getAttribute("controllerBasePath").toString();

        popUrl=basePath+"/"+popUrl;

    }else {

        popUrl=request.getContextPath()+""+popUrl;

    }
//    if(gridName==null){
//        gridName="searchGrid";
//    }
//    if(loadEntityUrlByEntityField==null){
//        loadEntityUrlByEntityField="id";
//    }
//    if(selectAllOnNotSelected==null){
//        selectAllOnNotSelected=false;
//    }
%>

<jsp:doBody/>

<div style="display:inline;">
    <button class="uk-button uk-button-success" id="${formPopup}_popup_button" style="${style}" data-action="Create" data-popup="true" data-tab="<%=formPopup%>" type="button">
        <%=ResourceBoundleHolder.resourceBundle.getString(key)%>
    </button>
</div>

<%--<div id='${formPopup}_popup' class="uk-modal">--%>
<%----%>
<%--</div>--%>

<div style="display:inline;" id="modal-${formPopup}">
</div>

<script type="text/javascript">
    var modal;
    $(function () {

        $("#${formPopup}_popup_button").click(function () {
	        if(typeof(do_before_${formPopup}_popup_button) == "function"){
	            do_before_${formPopup}_popup_button();
	        }
            var popUpUrl="<%=popUrl%>";
            $.get(popUpUrl , function (data) {
                $("#modal-" +"${formPopup}").empty();
                var id = "${formPopup}"  +'_popup';
                $("#modal-" +"${formPopup}").append('<div id="' + id + '" class="uk-modal">');
                $("#" + id).append(data);
                modal = new $.UIkit.modal.Modal("#" + id);

                $("#" + id).on(
                        {
                            'uk.modal.hide':function () {
                                $("#modal-" +"${formPopup}").empty();
                            }
                        }
                );


                modal.show();

                <%--if("${smallShow}" == "true"){--%>
                    <%--$('.uk-modal-dialog').width($('.uk-modal-dialog').width()/2+'px');--%>
                    <%--$("#modal-" +"${formPopup}").css('line-height','15px');--%>
                    <%--$('.my-popup-title').css('min-height','0px');--%>
                    <%--$('.my-popup-title').css('padding-top','3px');--%>
                    <%--$('.my-popup-title').css('padding-bottom','3px')--%>
                <%--}--%>
                <%--if("${disableBackground}" == "true"){--%>
                    <%--$('.uk-modal').css('background','rgba(255, 255, 255, 0)');--%>
                <%--}--%>

            });
        });

    });
    function doAfterSave_${formPopup}_popup(){
        if(typeof(window["doAfterSave_"+"${formPopup}"])=== "function"){
            window["doAfterSave_"+"${formPopup}"]();
        }
    }

</script>
