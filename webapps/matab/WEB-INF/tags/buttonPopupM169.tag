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
<%@ attribute name="saveUrl" required="true" rtexprvalue="true" %>
<%@ attribute name="loadEntityUrl" required="false" rtexprvalue="true" %>
<%@ attribute name="gridName" required="false" rtexprvalue="true" %>
<%@ attribute name="isRelative" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="smallShow" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="disableBackground" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="loadEntityUrlByEntityField" required="false" rtexprvalue="true" %>
<%@ attribute name="selectAllOnNotSelected" required="false" rtexprvalue="true" type="java.lang.Boolean"%>

<%
//    ${pageContext.request.contextPath}
    if(isRelative!=null && isRelative){
        String basePath=request.getAttribute("controllerBasePath").toString();
        saveUrl=basePath+"/"+saveUrl;
        popUrl=basePath;
        if(loadEntityUrl!=null){
            loadEntityUrl=basePath;
        }
    }else {
        saveUrl=request.getContextPath()+""+saveUrl;
        popUrl=request.getContextPath()+""+popUrl;
        if(loadEntityUrl!=null){
            loadEntityUrl=request.getContextPath()+""+loadEntityUrl;
        }
    }
    if(gridName==null){
        gridName="searchGrid";
    }
    if(loadEntityUrlByEntityField==null){
        loadEntityUrlByEntityField="id";
    }
    if(selectAllOnNotSelected==null){
        selectAllOnNotSelected=false;
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
        popUpClickM169(null);
        });
        
    });
    function doAfterSave_${formPopup}_popup(){
 		if(typeof(window["doAfterSave_"+"${formPopup}"])=== "function"){
           window["doAfterSave_"+"${formPopup}"]();
        }   
    }
     function popUpClickM169(dataRow){
       var popUpUrl='';
            var loadMyEntityUrl='';
        	var operationType=dataRow.operationType;
        	if(operationType == 1){
             popUpUrl="<%=popUrl%>"+"/item/PurchaseOperationItemTabInput";
             loadMyEntityUrl="<%=loadEntityUrl%>"+"/item/loadPurchaseOperationItems/";
          }  else if(operationType == 2){
             popUpUrl="<%=popUrl%>"+"/item/SaleOperationItemTabInput";
             loadMyEntityUrl="<%=loadEntityUrl%>"+"/item/loadSaleOperationItems/";
            }
            else if(operationType == 3){
             popUpUrl="<%=popUrl%>"+"/item/PurchaseContractOperationItemTabInput";
             loadMyEntityUrl="<%=loadEntityUrl%>"+"/item/loadPurchaseContractOperationItems/";
            }
            else if(operationType == 4){
             popUpUrl="<%=popUrl%>"+"/item/RefusalOperationItemTabInput";
             loadMyEntityUrl="<%=loadEntityUrl%>"+"/item/loadRefusalOperationItems/";
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
	                if(loadMyEntityUrl!="null"){
	                    var entityGrid = $("#"+"<%=gridName%>").data("kendoGrid");
                        var rowIds="";
//	                    if(entityGrid.select().length!=0){
                            <%--for(var i=0;i<entityGrid.select().length;i++){--%>
                               <%--rowIds+=entityGrid.dataItem(entityGrid.select()[i]).<%=loadEntityUrlByEntityField%>+",";--%>
                            <%--}--%>
                            <%--rowIds=rowIds.substring(0,rowIds.length-1);--%>
                            rowIds=""+dataRow.<%=loadEntityUrlByEntityField%>;
	                        bindToEntityByIdFormIdUrl(rowIds,id,loadMyEntityUrl);
                        <%--}else if(<%=selectAllOnNotSelected%>){--%>
//                            bindToEntityByIdFormIdUrl("all",id,loadMyEntityUrl);
//	                    }else{
//                            return;
//	                    }
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
	                
	                $('button[data-action="save"]', $("#" + id)).unbind("click").click(function(){
	                    modal.hide();
	                });
            });
        }
</script>
