<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    String jsFileName = pageContext.getPage().getClass().getName();
    jsFileName = jsFileName.substring(jsFileName.lastIndexOf(".") + 1).replace("_jsp", ".js");
%>
<base:pageHeader></base:pageHeader>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single" >
    <base:my-grid-column title='login.userName'  field="username" width="50px"/>
    <base:my-grid-column title='hrm.employee.firstName'  field="firstname" width="50px"/>
    <base:my-grid-column title='hrm.employee.lastName'  field="lastname" width="50px"/>
    <base:my-grid-column title='hrm.employee.personnleCode'  field="personnelCode" width="50px"/>
    
    <%--<base:my-grid-column title='login.active'  field="active" width="100px"/>--%>

    <base:my-grid-schema-field name="userName" type="string" />
    <base:my-grid-schema-field name="firstName" type="string" />
    <base:my-grid-schema-field name="lastName" type="string" />
    <base:my-grid-schema-field name="personnelCode" type="string" />
    <%--<base:my-grid-schema-field name="active" type="boolean" />--%>
</base:my-grid>

<base:footer></base:footer>

