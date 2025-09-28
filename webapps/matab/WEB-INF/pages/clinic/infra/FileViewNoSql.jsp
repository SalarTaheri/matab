<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%--<div class="body-header">--%>
<%--    <ul class="uk-breadcrumb uk-h3" id="breadcrumb">--%>
<%--        <li id="breadcrumb-main-section"><span>${pageTitle}</span>--%>
<%--        </li>--%>
<%--    </ul>--%>
<%--    <div id="header-toolbar">--%>
<%--        <label>Name</label>--%>
<%--    </div>--%>
<%--</div>--%>

<script src="<c:url value='/resources/doT.js' />"></script>
<script src="<c:url value='/resources/clinic/clinic.js' />"></script>
<link href="<c:url value='/resources/clinic/clinic.css'/>" rel="stylesheet" />
<jsp:include page="ClinicTemplates.jsp"></jsp:include>
<jsp:include page="FileViewNoSqlJs.jsp"></jsp:include>

<div id="p-kanban-view-page">
    <div class="uk-grid p-kanban p-kanban-static" id="p-kanban-static">

    </div>

    <div class="uk-grid p-kanban"><div class="uk-width-5-5 p-kanban-card"><hr /></div></div>

    <div class="uk-grid p-kanban " id="p-kanban-main">
    </div>

    <div class="uk-grid p-kanban"><div class="uk-width-5-5 p-kanban-card"><hr /></div></div>

    <div class="uk-grid p-kanban p-kanban-unused" id="p-kanban-unused">

    </div>
</div>

<div id="p-card-view-page" style="display: none;">
    <div class="uk-container uk-container-center my-uk-container" >
        <div>
            <button class="uk-button" type="button" id="p-btn-card-back">Back&nbsp;<i class="uk-icon-mail-reply"></i></button>
            <button class="uk-button" type="button" id="p-btn-card-save">Save&nbsp;<i class="uk-icon-save"></i></button>

            <div id="p-card-navigator" style="display: inline;" >
                <div class="uk-button-group">
                    <button class="uk-button" type="submit" id="p-card-navigator-right"><a href=""><i class="uk-icon-arrow-right"></i></a></button>
                    <button class="uk-button" type="submit" id="p-card-navigator-left"><a href=""><i class="uk-icon-arrow-left"></i></a></button>
                </div>
                <span id="p-card-navigator-count">40</span>&nbsp;/&nbsp;
                <span id="p-card-navigator-current">1</span>
            </div>

            <button class="uk-button pull-left" type="button" id="p-btn-card-prescription">Prescription&nbsp;<i class="uk-icon-plus"></i></button>
        </div>
        <div id="p-card-view-pages">
        </div>
    </div>
</div>

