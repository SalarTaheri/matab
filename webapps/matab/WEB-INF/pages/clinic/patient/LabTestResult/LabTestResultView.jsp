
<%@page import="java.util.ResourceBundle"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

    <link href="/resources/css/web/kendo.common.min.css" rel="stylesheet" />
    <link href="/resources/css/web/kendo.default.min.css" rel="stylesheet" />
    <script src="/resources/css/js/jquery.min.js"></script>
    <script src="/resources/css/js/kendo.all.min.js"></script>
    
    <jsp:include page="LabtTestResult.js"></jsp:include>
    
<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	request.setAttribute("basePath", basePath);
	String createUrl = basePath + "create";
 %>
 <div id="example" class="k-content" class="k-rtl">
          <!--   <div id="grid" class="k-ltr"  style="height: 380px"></div> -->
          <base:checkBoxTree outputResultTag="livesin" name="aaa" key="clinic.patient.livesIn" dataLoaderController="${pageContext.request.contextPath}/clinic/patientr/patientr/combo/loadMedicalTest" loadOnDemand="false"></base:checkBoxTree>
          <div id="livesin">
          </div>
 </div>




