
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
	String jsFileName = pageContext.getPage().getClass().getName();
	jsFileName = jsFileName.substring(jsFileName.lastIndexOf(".") + 1).replace("_jsp", ".js");
%>
<base:pageHeader></base:pageHeader>
<base:mehrSys-grid-mongo name="grid" transportReadUrl="${basePath}/grid-read" >
    <base:my-grid-column title='system.logManagement.authenticationLog.userName'  field="userName" width="50px"/>
    <base:my-grid-column title='system.logManagement.authenticationLog.password'  field="pass" width="50px"/>
    <base:my-grid-column title='system.logManagement.authenticationLog.date'  field="persianDate" width="50px"/>
    <base:my-grid-column title='system.logManagement.authenticationLog.date'  field="time" width="50px"/>
    <base:my-grid-column title='system.logManagement.authenticationLog.ip'  field="ip" width="50px"/>
    <base:my-grid-column title='system.logManagement.authenticationLog.state'  field="state" width="50px"/>
    

    <base:my-grid-schema-field name="userName" type="string" />
    <base:my-grid-schema-field name="pass" type="string" />
    <base:my-grid-schema-field name="date" type="string" />
    <base:my-grid-schema-field name="time" type="string" />
    <base:my-grid-schema-field name="ip" type="string" />
</base:mehrSys-grid-mongo>

<base:footer/>
