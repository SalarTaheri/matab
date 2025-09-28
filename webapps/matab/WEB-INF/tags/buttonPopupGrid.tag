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
<%@ attribute name="popUpGridUrl" required="true" rtexprvalue="true" %>
<%@ attribute name="popUpGridName" required="false" rtexprvalue="true" %>
<%@ attribute name="isRelative" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="smallShow" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="disableBackground" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="customPopupUrlTailFunctionName" required="false" rtexprvalue="true" %>

<%
//    ${pageContext.request.contextPath}
    if(isRelative!=null && isRelative){
        String basePath=request.getAttribute("controllerBasePath").toString();
        popUrl=basePath+"/"+popUrl;
        popUpGridUrl=basePath+"/"+popUpGridUrl;
        
    }else {
        popUrl=request.getContextPath()+""+popUrl;
        if(popUpGridUrl!=null){
        	popUpGridUrl=request.getContextPath()+""+popUpGridUrl;
        }
    }
    if(popUpGridName==null){
    	popUpGridName="searchGrid";
    }

%>

<jsp:doBody/>

<div style="display:inline;">
    <button class="uk-button uk-button-success" id="${formPopup}_popup_button"
            data-action="Create" data-popup="true" data-tab="<%=formPopup%>" type="button">
        <%=ResourceBoundleHolder.resourceBundle.getString(key)%>
    </button>
</div>

<%--<div id='${formPopup}_popup' class="uk-modal">--%>
<%----%>
<%--</div>--%>

<div style="display:inline;" id="modal-${formPopup}">
</div>

<script type="text/javascript">
    $(function () {
        $("#${formPopup}_popup_button").click(function () {
        	var customPopupUrlTailFunctionName='<%=customPopupUrlTailFunctionName%>';
        	var tail='';
        	var popUpUrl='';
        	var popUpGridUrl='';
          if(customPopupUrlTailFunctionName!=null || customPopupUrlTailFunctionName!='null'){
              if(typeof(window[customPopupUrlTailFunctionName])=="function"){
                  tail=window[customPopupUrlTailFunctionName]();
                  popUpUrl="<%=popUrl%>"+tail;
                  popUpGridUrl="<%=popUpGridUrl%>/"+tail;
              }
          }else{
          	popUpUrl="<%=popUrl%>";
          }

            $.get(popUpUrl , function (data) {
                $("#modal-" +"${formPopup}").empty();
                var id = "${formPopup}"  +'_popup';
                $("#modal-" +"${formPopup}").append('<div id="' + id + '" class="uk-modal">');
                $("#" + id).append(data);
                var modal = new $.UIkit.modal.Modal("#" + id);

                $("#" + id).on(
                        {
                            'uk.modal.hide':function () {
                                $("#modal-" +"${formPopup}").empty();
                            }
                        }
	                );
	                
	                var searchJsonString = "{}";
				    if(typeof(getSearchObject)=="function"){
				    	searchJsonString = JSON.stringify(getSearchObject(id));
				    	searchJsonString = searchJsonString.replace(/\//g, ':@:');
				    }
					var urlGrid = popUpGridUrl +'/'+ searchJsonString;
				
					$("#<%=popUpGridName%>").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
					$("#<%=popUpGridName%>").data("kendoGrid").dataSource.page(1);
				
				    if(typeof(doAfterSearch)=="function"){
				        doAfterSearch(searchJsonString);
					}
	                
	                
	
	                modal.show();
	                
	                if("${smallShow}" == "true"){
	                	$('.uk-modal-dialog').width($('.uk-modal-dialog').width()/2+'px');
	                	$("#modal-" +"${formPopup}").css('line-height','15px');
	                	$('.my-popup-title').css('min-height','0px');
	                	$('.my-popup-title').css('padding-top','3px');
	                	$('.my-popup-title').css('padding-bottom','3px')
	                }
	                if("${disableBackground}" == "true"){
	                	$('.uk-modal').css('background','rgba(255, 255, 255, 0)');
	                }
	                
	              
            });
        });
        
    });
    function doAfterSave_${formPopup}_popup(){
 		if(typeof(window["doAfterSave_"+"${formPopup}"])=== "function"){
           window["doAfterSave_"+"${formPopup}"]();
        }   
    }
    
    function _${popUpGridName}_onDelete(e){
        var areUShure = "test";
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

                    },
                    error:function(result){
                        if(result.status==401){
                            window.location.href="";
                        }
                    }
                });
            }
        });
    }

    function _${popUpGridName}_onEdit(e){
        var data = this.dataItem($(e.target).closest("tr"));
        if(typeof(grid_onEdit)=="function"){
            grid_onEdit(data);
        }else{
            window.location = basePath + "edit/" + data.id;
        }
    }

    function _${popUpGridName}_requestEnd(e){
        if(typeof(${gridPopupName}_requestEnd_callback) == "function"){
            ${gridPopupName}_requestEnd_callback(e);
        }
    }
</script>
