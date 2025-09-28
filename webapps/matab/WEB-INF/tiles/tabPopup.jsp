<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@include file="/WEB-INF/taglibs.jsp"%>

<div class="uk-modal-dialog  uk-modal-dialog-slide" >
	<div class="body-header my-popup-title">
		<div class="uk-float-right">
			<a href="#" class="uk-modal-close uk-close"></a>
			<script type="text/javascript">
				function getBaseUrl(){
					var baseUrl = '<%= request.getAttribute("controllerBasePath")%>' ;
					if(baseUrl.substring(baseUrl.length-1,baseUrl.length)!='/'){
						baseUrl = baseUrl + '/';
					}
					return baseUrl;
				}
			</script>
		</div>
		<div>
			${pageTitle}
		</div>
	</div>
	<div class="my-popup-body">
		<tiles:insertAttribute name="body" />
	</div>
	<div class="body-header my-popup-footer">
		<button class="uk-button uk-button-success" data-action="save" type="button" data-form="popup">
                <%=ResourceBoundleHolder.resourceBundle.getString("global.crud.saveAndClose")%>
		</button>
		<button class="uk-button uk-button-success" data-action="saveWithoutClose" type="button" data-form="popup" style="display: none">
                <%=ResourceBoundleHolder.resourceBundle.getString("global.crud.save")%>
		</button>
        <button class="uk-button uk-button-success uk-modal-close"   type="button">
                <%=ResourceBoundleHolder.resourceBundle.getString("global.crud.cancel")%>
        </button>
	</div>
</div>
