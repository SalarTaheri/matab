<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@include file="/WEB-INF/taglibs.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>${pageTitle}</title>
<meta charset='utf-8'>
<script src="<c:url value='/resources/js/jquery.min.js' />"></script>
<script src="<c:url value='/resources/js/jquery-ui.js' />"></script>
<link href="<c:url value='/resources/css/web/kendo.common.min.css'/>" 	rel="stylesheet" />
<link href="<c:url value='/resources/css/web/kendo.default.min.css'/>" rel="stylesheet" id="kendo_style" />
<link href="<c:url value='/resources/css/web/kendo.rtl.min.css'/>" 	rel="stylesheet" />
<link href="<c:url value='/resources/uikit/css/uikit.gradient.min.rtl.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/alterify/css/alertify.core.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/alterify/css/alertify.bootstrap.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/chosen/chosen.css'/>" rel="stylesheet" /> 
<link href="<c:url value='/resources/jqueryui/jquery-ui-1.10.3/themes/ui-lightness/jquery-ui-1.10.3.custom.min.css'/>" rel="stylesheet" />
<script src="<c:url value='/resources/js/kendo.all.min.js' />"></script>
<script src="<c:url value='/resources/js/cultures/kendo.culture.fa-IR.js' />"></script>
<script src="<c:url value='/resources/js/jquery.ui.datepicker.fa.js' />"></script>
<script src="<c:url value='/resources/alterify/js/alertify.js' />"></script>
<script src="<c:url value='/resources/uikit/js/uikit.min.js' />"></script>
<script src="<c:url value='/resources/jquery.deserialize.js' />"></script>
<script src="<c:url value='/resources/js/jquery.sticky.js' />"></script>
<script src="<c:url value='/resources/js/jquery.alphanum.js' />"></script>
<script src="<c:url value='/resources/chosen/chosen.jquery.min.js' />"></script>
<script src="<c:url value='/resources/common.js' />"></script>
</head>


<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	request.setAttribute("basePath", basePath);
	String createUrl = basePath + "create";
 %>
 
<c:set var="createUrl" value="<%=createUrl %>" />

<script type="text/javascript">
	var basePath = "${basePath}";
	
</script>

<c:if test="${bindToEntity}">
	<script type="text/javascript">
		var bindToEntity = ${bindToEntity};
		var entityId = "${entityId}";
	</script>
 </c:if>


<body dir="rtl">
	<div id="body">
		<table  id="body-table">
			<tr>
				<div id="body-content">
						<tiles:insertAttribute name="body" />
				</div>
			</tr>
		</table>	
	</div>
	<div id="footer"></div>
	<script>
		function getBaseUrl(){
			var p = window.location.href.indexOf("/create");
			if( p < 0 )
				p = window.location.href.indexOf("/edit/");
			if( p < 0 )
				p = window.location.href.indexOf("/editWP/");
			if( p < 0 ){
				//alert("error andar error!");
				return "";
			}
			return window.location.href.substr(0, p + 1);
		}
		
		function createMode(){
			var backUrl = getBaseUrl();
	    	$("#breadcrumb-main-section").html(
	    		"<a href='" + backUrl + "'>" +
	    		$("#breadcrumb-main-section").html() +
	    		"</a>"
	    		);
            var arra=Object.keys(window);
            for (var i = 0; i < arra.length; i++){
                if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){
                    window[arra[i]]();
                }
            }
		}

		function editMode(){
			var backUrl = getBaseUrl();
	    	$("#breadcrumb-main-section").html(
	    		"<a href='" + backUrl + "'>" +
	    		$("#breadcrumb-main-section").html() +
	    		"</a>"
	    		);
	    	$("#breadcrumb-main-section-cancel").attr("href", backUrl);
	    	$("#breadcrumb").append('<li id="breadcrumb-action" class="uk-active"><span><%=resource.getString("global.crud.save")%></span></li>');
	    	$("#body-heade-create").hide();
	    	$("#body-heade-save-div").show();
		}
		
		function editWPMode(){
			var backUrl = getBaseUrl();
	    	$("#breadcrumb-main-section").html(
	    		"<a href='" + backUrl + "'>" +
	    		$("#breadcrumb-main-section").html() +
	    		"</a>"
	    		);
	    	$("#breadcrumb-main-section-cancel").attr("href", backUrl);
	    	$("#breadcrumb").append('<li id="breadcrumb-action" class="uk-active"><span><%=resource.getString("global.crud.save")%></span></li>');
	    	$("#body-heade-create").hide();
	    	$("#body-heade-save-div").show();
		}
		
		
		function onSelect(e){
			var elem =$(".menu-action", e.item);
			var ctrl = elem.attr("data-ctrl");
			var action = elem.attr("data-action");
			window.location.href = "${pageContext.request.contextPath}/" + action;
			//console.log($(e.item));
		}
		
		
		
		function BindToEntityQueue(){
			if(typeof(bindToEntity) == "undefined" || !bindToEntity) {
				return;
			}
			if(typeof(customFormLoad) === "function"){
	    		customFormLoadQueue();
	    		return;
		    }
			
			bindToEntityByIdQueue(entityId);
		}
		
		function BindToEntity(){
			if(typeof(bindToEntity) == "undefined" || !bindToEntity) 
				return;
			
			if(typeof(customFormLoad) === "function"){
	    		customFormLoad();
	    		return;
		    }
			
			bindToEntityById(entityId);
		}
		function bindToEntityById(Id){
			$.getJSON(basePath + 'load/' + Id, function(data) {
                jQuery.each(data, function(name, val){
                    var $el = $('[name="'+name+'"]'),
                            type = $el.attr('type');

                    switch(type){
                        case 'checkbox':
                            $el.prop('checked', val);
                            break;
                        case 'radio':
                            $el.filter('[value="'+val+'"]').attr('checked', 'checked');
                            break;
                        default:
                            $el.val(val);
                    }
                });
                $('#mainForm').deserialize(data);
                var arra=Object.keys(window);
                for (var i = 0; i < arra.length; i++){
                    if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){
                        window[arra[i]]();
                    }
                }
//                if(typeof(window['bindToEntityById_after']) === "function" ){
//                    window['bindToEntityById_after']();
//                }
			});
		}
		
		function bindToEntityByIdQueue(Id){
		var newPath=basePath.replace('editWP','loadWP');
			$.getJSON(newPath , function(data) {
				$('#mainForm').deserialize(data);
                var arra=Object.keys(window);
                for (var i = 0; i < arra.length; i++){
                    if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){
                        window[arra[i]]();
                    }
                }
//                if(typeof(window['bindToEntityById_after']) === "function" ){
//                    window['bindToEntityById_after']();
//                }
			});
		}
		
	</script>
</body>
</html>