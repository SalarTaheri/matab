<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="java.util.ResourceBundle"%>
<%@ page import="org.apache.commons.lang3.math.NumberUtils" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="UserRole"/>


<base:mehrSys-grid-item-pattern2 name="UserRole" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="user_id">
    <base:my-grid-column title='system.authentication.role.name'  field="name" width="100px"/>


    <base:my-grid-schema-field name="name" type="string" />

</base:mehrSys-grid-item-pattern2>

<base:footer></base:footer>
