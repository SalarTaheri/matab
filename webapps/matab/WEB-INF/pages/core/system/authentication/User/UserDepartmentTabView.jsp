<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="java.util.ResourceBundle"%>
<%@ page import="org.apache.commons.lang3.math.NumberUtils" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="UserDepartment"/>


<base:mehrSys-grid-item-pattern2 name="UserDepartment" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="user_id">
    <base:my-grid-column title='com.artonis.clinic.basicInfo.department.code'  field="code" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.department.name'  field="name" width="50px"/>

    <base:my-grid-schema-field name="code" type="string"/>
    <base:my-grid-schema-field name="name" type="string"/>

</base:mehrSys-grid-item-pattern2>

<base:footer></base:footer>
