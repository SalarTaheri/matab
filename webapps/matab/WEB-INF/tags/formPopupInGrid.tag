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
<%@attribute name="disableSaveWithoutCloseButton" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@attribute name="styledivLabel" required="false" rtexprvalue="true"%>


<%@attribute name="functUrlAppend" required="false" rtexprvalue="true" %>

<style type="text/css">
.mouseOverCursor {
	cursor: pointer;
}
</style>

<%
	String successMessage=ResourceBoundleHolder.resourceBundle.getString("action.success");
	popupUrl = request.getContextPath() + "" + popupUrl;
	if(disableSaveWithoutCloseButton==null){
		disableSaveWithoutCloseButton=false;
	}
	if(functUrlAppend==null){
		functUrlAppend="null";
	}

%>

<jsp:doBody />



<%--</div>--%>
<div class="uk-width-1-10 left-align">

	<div style="display:inline;" id="modal-${formPopup}"></div>
</div>

<script type="text/javascript">
	var originUrl;
	var rowIds = "";
    function  _${formPopup}_popup(e,rowData){

			rowIds = "";
			originUrl=getBaseUrl();
            var popUpUrl="<%=popupUrl%>";
        	if(typeof(${formPopup}_beforeCallPopupUrl) == "function"){
	            popUpUrl=${formPopup}_beforeCallPopupUrl(e,popUpUrl,rowData);
    	    }
            <%--var urlAppend="";--%>
            <%--if(<%=functUrlAppend%>!="null" && typeof(<%=functUrlAppend%>) == "function"){--%>
				<%--urlAppend=<%=functUrlAppend%>();--%>
				<%--urlAppend='/'+urlAppend;--%>
            <%--}--%>
            <%--var popUpUrl=popUpUrl+urlAppend;--%>
            $.get(popUpUrl , function (data) {
                $("#modal-" +"${formPopup}").empty();
                var id = "${formPopup}"  +'_popup';
                $("#modal-" +"${formPopup}").append('<div id="' + id + '" class="uk-modal">');
                $("#" + id).append(data);
                var modal = new $.UIkit.modal.Modal("#" + id, {modal: false, keyboard: false,bgclose:false});
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
				var disableSaveWithoutCloseButton=<%=disableSaveWithoutCloseButton%>;
				if(disableSaveWithoutCloseButton==true){
					$('button[data-action="saveWithoutClose"]', $("#"+id)).show()
				}
	                
	                <%--$('button[data-form="popup"]').html('<%=ResourceBoundleHolder.resourceBundle.getString("global.approve")%>');--%>

				$('button[data-action="save"]', $("#" + id)).unbind("click").click(function() {
					var tmp=serializeFromFormId("${formPopup}");
					if (typeof (callback_custom_deserialize_popup_${formPopup}) == "function") {
						callback_custom_deserialize_popup_${formPopup}(tmp);
					}
					modal.hide();
				});
				$('button[data-action="saveWithoutClose"]', $("#" + id)).unbind("click").click(function() {
					var tmp=serializeFromFormId("${formPopup}");
					var returnValue=false;
					if (typeof (callback_custom_deserialize_popup_${formPopup}) == "function") {
						returnValue=callback_custom_deserialize_popup_${formPopup}(tmp);
					}
					if(returnValue==true){
						alertify.success('<%=successMessage%>');
					}
					$("#"+"${formPopup}").find(":input").val('');
					$("#"+"${formPopup}")[0].reset();
				});

		});
	}

	function mouseOver(img) {
		img.className = 'mouseOverCursor';
	}
	function mouseOut(img) {
		img.removeAttribute('mouseOverCursor');
	}
</script>