<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
	String patientId=(String)request.getAttribute("patientId");
 %>
<div id="p-reaserch-patinet-file">
	<button class="uk-button" type="button" id="p-btn-card-back-main">Back&nbsp;<i class="uk-icon-mail-reply"></i>
	</button>
	<jsp:include page="ResearchPatientFileViewJs.jsp"></jsp:include>
	<jsp:include page="../../infra/FileViewNoSql.jsp"></jsp:include>
	<base:FileViewHeader masterIdStr="patientId"/>
</div>	




<script>
	$("#p-btn-card-back-main").click(function(){
 //   	window.location = "${pageContext.request.contextPath}"+"/clinic/patient/visitCardBase/${patientId}";
    });
</script>