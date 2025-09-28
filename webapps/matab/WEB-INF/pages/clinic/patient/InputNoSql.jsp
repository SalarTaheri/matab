<%@page import="java.util.ResourceBundle"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader></base:pageHeader>

<script src="<c:url value='/resources/doT.js' />"></script>
<script src="<c:url value='/resources/clinic/clinic.js' />"></script>
<link href="<c:url value='/resources/clinic/clinic.css'/>" rel="stylesheet" />
<jsp:include page="../ClinicTemplates.jsp"></jsp:include>
<jsp:include page="InputNoSqlJs.jsp"></jsp:include>

<div class="uk-container uk-container-center my-uk-container" >

    <div class="" style="margin-top: 20px;">
        <ul class="uk-tab p-tab" data-uk-tab data-uk-switcher="{connect:'pages-tabs'}" id="pages-selector-ul">

        </ul>
        <ul id="pages-tabs" class="uk-switcher"  style="margin-top: 20px;" >

        </ul>
    </div>

    <div style="display:none;" id="pages"></div>


</div>