<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%--<base:pageHeader/>--%>

<div class="body-header">
    <ul class="uk-breadcrumb uk-h3" id="breadcrumb">
        <li id="breadcrumb-main-section"><span>${pageTitle}</span>
        </li>
    </ul>
    <div id="header-toolbar">
    	<base:buttonPermission key="clinic.patient.visitQueue.refresh" classNames="uk-button uk-button-success" id="resiverView-refresh-btn" onClick="javascript:refreshClick()"/>

        <%--<div id="body-heade-save-div" style="display:none;">--%>
            <%--<button class="uk-button uk-button-success" id="body-heade-save" type="button">--%>
                <%--<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.save")%>--%>
            <%--</button>--%>

            <%--/ <a href="" id="breadcrumb-main-section-cancel"><%=ResourceBoundleHolder.resourceBundle.getString("global.crud.cancel")%></a>--%>
        <%--</div>--%>
    </div>
</div>
<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read-current-user" selectable="single" editLabel="action.show">
	<base:my-grid-column title='aut.dsh.sender.date'  field="date" width="50px"/>
	<base:my-grid-column title='aut.dsh.receiver.username'  field="username" width="50px"/>
	<base:my-grid-column title='aut.dsh.sender.subject'  field="subject" width="50px"/>
	<base:my-grid-column title='aut.dsh.sender.letter'  field="abstractLetter" width="50px"/>
	<base:my-grid-column title='aut.dsh.receiver.hasRead'  field="hasRead" width="50px"/>


        <base:my-grid-schema-field name="date" type="string"/>
        <base:my-grid-schema-field name="username" type="string"/>
        <base:my-grid-schema-field name="subject" type="string"/>
        <base:my-grid-schema-field name="abstractLetter" type="string"/>
        <base:my-grid-schema-field name="hasRead" type="string"/>
</base:my-grid>
<base:footer/>
<script type="text/javascript">

    function refreshClick(){
        grid = $("#grid").data("kendoGrid");
        grid.dataSource.query();
    }
</script>
