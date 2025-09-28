<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>
<base:pageHeader></base:pageHeader>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="multiple">
    <base:my-grid-column title='hrm.employee.employeeGroup.name' field="name" width="50px"/>
    <base:my-grid-column title='hrm.employee.employeeGroup.code' field="code" width="50px"/>
    <base:my-grid-column title='hrm.employee.employeeGroup.description' field="description" width="50px"/>

    <base:my-grid-schema-field name="id" type="string"/>
    <base:my-grid-schema-field name="name" type="string"/>
    <base:my-grid-schema-field name="code" type="string"/>
    <base:my-grid-schema-field name="description" type="string"/>
</base:my-grid>
<base:footer></base:footer>
