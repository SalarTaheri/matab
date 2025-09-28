<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<link href="<c:url value='/resources/clinic/clinic.css'/>" rel="stylesheet" />

<div class="uk-grid">
	<div class="uk-width-2-3">
		<div id="pages"></div>
	</div>
	<div class="uk-width-1-3">
		<div class="p-myform uk-panel uk-panel-box uk-form uk-form-horizontal" id="pages-selector">
			<h3 class="uk-panel-title">Select Page</h3>
			<ul class="uk-nav uk-nav-side" id="pages-selector-ul">
				
			</ul>
		</div>
	</div>
</div>

<script>
	$(function(){
		$("#pages-selector").sticky({topSpacing: 120});
		$("#pages-selector").css("min-width", $("#pages-selector").width())
	});
	
</script>

<script src="<c:url value='/resources/doT.js' />"></script>
<script src="<c:url value='/resources/clinic/clinic.js' />"></script>
<jsp:include page="../../infra/ClinicTemplates.jsp"></jsp:include>
<jsp:include page="FormsViewJs.jsp"></jsp:include>