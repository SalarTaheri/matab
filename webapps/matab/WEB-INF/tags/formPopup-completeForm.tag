<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@tag import="java.util.Map"%>
<%@tag import="java.util.HashMap"%>
<%@tag import="java.util.ResourceBundle"%>
<%@tag import="org.springframework.web.util.UrlPathHelper"%>
<%@tag import="java.util.List"%>
<%@tag import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@attribute name="formPopup" required="true" rtexprvalue="true"%>
<%@attribute name="popupUrl" required="true" rtexprvalue="true"%>
<%@attribute name="itemTabName" required="false" rtexprvalue="true"%>
<%@attribute name="disableBackground" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%--<%@attribute name="disableSaveWithoutCloseButton" required="false" rtexprvalue="true" type="java.lang.Boolean"%>--%>
<%@attribute name="styledivLabel" required="false" rtexprvalue="true"%>
<%@attribute name="keyLabel" required="true" rtexprvalue="true" %>

<style type="text/css">
.mouseOverCursor {
	cursor: pointer;
}
</style>

<%
	String successMessage=ResourceBoundleHolder.resourceBundle.getString("action.success");
	popupUrl = request.getContextPath() + "" + popupUrl;
//	if(disableSaveWithoutCloseButton==null){
//		disableSaveWithoutCloseButton=false;
//	}
%>

<jsp:doBody />

<%--<div class="uk-width-1-10 left-align" style="<%=styledivLabel%>">--%>

	<%--<img id="${formPopup}_popup_button" onmouseover="mouseOver(this)" onmouseout="mouseOut(this)" src="<%=request.getContextPath()%>/resources/images/blue/presentation.png"
		style="width: 30px; height: 30px;" />--%>
		<button class="uk-button uk-button-success"   type="button" id="${formPopup}_popup_button">
			<%=ResourceBoundleHolder.resourceBundle.getString(keyLabel)%>
		</button>

<%--</div>--%>
<div class="uk-width-1-10 left-align">

	<div style="display:inline;" id="modal-${formPopup}"></div>
</div>

<script type="text/javascript">
	var originUrl;
	var rowIds = "";
    $(function () {
        $("#${formPopup}_popup_button").click(function () {
			rowIds = "";
			originUrl=getBaseUrl();
            var popUpUrl="<%=popupUrl%>";
            $.get(popUpUrl , function (data) {
                $("#modal-" +"${formPopup}").empty();
                var id = "${formPopup}"  +'_popup';
                $("#modal-" +"${formPopup}").append('<div id="' + id + '" class="uk-modal">');
                $("#" + id).append(data);
                var modal = new $.UIkit.modal.Modal("#" + id);
				getBaseUrl();
                $("#" + id).on(
                        {
                            'uk.modal.hide':function () {
                                $("#modal-" +"${formPopup}").empty();
								$.getJSON(originUrl+'setOriginUrl', function(data){

								});
                            }
                        }
	                );

				if (typeof (callback_popup_load_${formPopup}) == "function") {
					callback_popup_load_${formPopup}();
				}
	                modal.show();
	                
	                if("${disableBackground}" == "true"){
	                	$('.uk-modal').css('background','rgba(255, 255, 255, 0)');
	                }
				<%--var disableSaveWithoutCloseButton=<%=disableSaveWithoutCloseButton%>;--%>
				<%--if(disableSaveWithoutCloseButton==true){--%>
					<%--$('button[data-action="saveWithoutClose"]', $("#"+id)).show()--%>
				<%--}--%>
				$("#cancel-button").click(function(){
					if (typeof (callback_popup_hide_${formPopup}) == "function") {
						callback_popup_hide_${formPopup}();
					}

				});
			});
		});
	});

	function mouseOver(img) {
		img.className = 'mouseOverCursor';
	}
	function mouseOut(img) {
		img.removeAttribute('mouseOverCursor');
	}
</script>