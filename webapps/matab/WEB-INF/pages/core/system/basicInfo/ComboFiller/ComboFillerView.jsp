<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageHeader></base:pageHeader>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read">

    <base:my-grid-column title='system.basicinfo.combofiller.name' field="name" width="70px"/>
    <base:my-grid-column title='system.basicinfo.combofiller.code' field="code" width="60px"/>
    <base:my-grid-column title='system.basicinfo.combofiller.parentModule' field="parentModuleName" width="60px"/>
    <base:my-grid-column title='system.basicinfo.combofiller.subModule' field="moduleName" width="100px"/>

    <base:my-grid-schema-field name="name" type="string"/>
    <base:my-grid-schema-field name="code" type="string"/>
    <base:my-grid-schema-field name="parentModuleName" type="string"/>
    <base:my-grid-schema-field name="moduleName" type="string"/>

</base:my-grid>
