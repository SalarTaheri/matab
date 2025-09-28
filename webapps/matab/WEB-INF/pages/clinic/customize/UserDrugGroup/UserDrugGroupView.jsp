<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader></base:pageHeader>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read">
    <%--    <base:my-grid-column title='inventory.m169.factor.factorNumber'  field="factorNumber" width="60px"/>--%>
    <%--    <base:my-grid-column title='inventory.m169.factor.documentNumber' field="atf" width="100px"/>--%>
    <base:my-grid-column title='clinic.customize.userDrugGroup.name'  field="name" width="100px"/>

    <base:my-grid-schema-field name="name" type="string" />
</base:my-grid>
