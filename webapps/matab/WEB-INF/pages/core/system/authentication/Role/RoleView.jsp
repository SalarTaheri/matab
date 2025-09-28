<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader></base:pageHeader>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read">
    <base:my-grid-column title='system.authentication.role.name'  field="name" width="100px"/>
    <base:my-grid-column title='system.authentication.role.code'  field="code" width="100px"/>
    <base:my-grid-column title='system.authentication.role.sessiontimeout'  field="sessionTimeout" width="100px"/>
    <base:my-grid-column title='system.authentication.role.notShowOnOtherUserForDef'  field="notShowOnOtherUserForDef" width="100px" isCombo="true"/>

    <base:my-grid-schema-field name="name" type="string" />
    <base:my-grid-schema-field name="sessionTimeout" type="number" />

</base:my-grid>

<base:footer></base:footer>







