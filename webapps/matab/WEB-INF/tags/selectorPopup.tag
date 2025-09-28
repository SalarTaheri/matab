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
<%@attribute name="styledivLabel" required="false" rtexprvalue="true"%>
<%@attribute name="isPassingFormpopupIdOnSave" required="false" rtexprvalue="true" type="java.lang.Boolean"%>

<style type="text/css">
.mouseOverCursor {
	cursor: pointer;
}
</style>

<%
	popupUrl = request.getContextPath() + "" + popupUrl;
	if(isPassingFormpopupIdOnSave==null){
		isPassingFormpopupIdOnSave=false;
	}
%>

<jsp:doBody />

<div class="uk-width-1-10 left-align" style="padding-right: 5px;<%=styledivLabel%>">

	<img id="${formPopup}_popup_button" onmouseover="mouseOver(this)" onmouseout="mouseOut(this)" src="<%=request.getContextPath()%>/resources/images/popupSelector.png"
		style="width: 25px; height: 25px;" />

</div>
<div style="display:inline;" id="modal-${formPopup}"></div>

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
	
	                modal.show();
	                
	                if("${disableBackground}" == "true"){
	                	$('.uk-modal').css('background','rgba(255, 255, 255, 0)');
	                }
	                
	                $('button[data-form="popup"]').html('<%=ResourceBoundleHolder.resourceBundle.getString("global.approve")%>');

				$('button[data-action="save"]', $("#" + id)).unbind("click").click(function() {
					var isPassingFormpopupIdOnSave="<%=isPassingFormpopupIdOnSave%>";
					var checked = [];
					for ( var i in checkedIds) {
						if (checkedIds[i]) {
							checked.push(i);
						}
					}

					var entityGrid = $("#searchGrid").data("kendoGrid");
					if (entityGrid.select().length != 0) {
						for (var i = 0; i < entityGrid.select().length; i++) {
							rowIds += entityGrid.dataItem(entityGrid.select()[i]).id + ",";
						}
						rowIds = rowIds.substring(0, rowIds.length - 1);
					}

					var p = basePath.indexOf("/create");

					if (p < 0)
						p = basePath.indexOf("/edit/");

					if (p < 0)
						p = basePath.indexOf("/editWP/");

					if (p < 0)
						p = basePath.indexOf("/search");

					if (p < 0)
						p = basePath.length - 1;

					var preUrl = basePath.substr(0, p + 1);
					preUrl=preUrl + "loadFromSelectorPopup/";

					if(isPassingFormpopupIdOnSave=='true'){
						preUrl=preUrl+"${formPopup}"+'/';
					}

					var destinationUrlWithout = preUrl ;
					var destinationUrl = preUrl + rowIds;

					if ("${itemTabName}" == "") {
						$.getJSON(destinationUrl, function(data) {
							if (typeof (callback_custom_deserialize_popup_${formPopup}) == "function") {
								callback_custom_deserialize_popup_${formPopup}(data);
							} else {
								jQuery.each(data, function(name, val) {
									var $el = $('[name="' + name + '"]'), type = $el.attr('type');

									switch (type) {
									case 'checkbox':
										$el.prop('checked', val);
										break;
									case 'radio':
										$el.filter('[value="' + val + '"]').attr('checked', 'checked');
										break;
									default:
										$el.val(val);
									}
								});
								$('#mainForm').deserialize(data);
								setNumericTextValue();
								var arra = Object.keys(window);
								for (var i = 0; i < arra.length; i++) {
									if (typeof (window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after') > -1) {
										window[arra[i]]();
									}
								}
								if (typeof (callback_after_select_${formPopup}) == "function") {
									callback_after_select_${formPopup}(data);
								}
							}
						});
					} else {
						bindToEntityByIdFormIdUrl(rowIds, "${itemTabName}", destinationUrlWithout);
					}

					modal.hide();
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