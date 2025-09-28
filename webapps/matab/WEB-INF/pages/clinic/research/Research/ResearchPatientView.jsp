<%@page import="org.springframework.web.util.UrlPathHelper" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageHeader></base:pageHeader>

<base:my-grid-nosql name="grid" pageName="research" transportReadUrl="${basePath}/grid-read-nosql">
    <base:my-grid-column title='hrm.employee.firstName' field="firstname" width="50px"/>
    <base:my-grid-column title='hrm.employee.lastName' field="lastname" width="50px"/>
    <base:my-grid-column title='hrm.employee.fatherName' field="fathername" width="50px"/>
    <base:my-grid-column title='hrm.employee.nationalCode' field="socialsecuritynumber" width="50px"/>
    <base:my-grid-column title='hrm.employee.identityNumber' field="identityNumber" width="50px"/>
    <base:my-grid-column title='hrm.employee.birthDate' field="birthDate" width="50px"/>

    <base:my-grid-schema-field name="firstname" type="string"/>
    <base:my-grid-schema-field name="lastname" type="string"/>
    <base:my-grid-schema-field name="fathername" type="string"/>
    <base:my-grid-schema-field name="socialsecuritynumber" type="string"/>
    <base:my-grid-schema-field name="identityNumber" type="string"/>
    <base:my-grid-schema-field name="birthDate" type="date"/>
</base:my-grid-nosql>

<base:footer></base:footer>

