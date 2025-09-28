<%@page import="org.springframework.web.util.UrlPathHelper"%><%@page import="java.util.ResourceBundle"%>
<%@ page import="org.apache.commons.lang3.math.NumberUtils" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="AccountOwnersItem"/>

<base:my-grid-item name="AccountOwnersItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="accountowners_id" >
    <base:my-grid-column title='fnc.generalAccounting.accounting.name'  field="accountCoding_name" width="50px"/>
    <base:my-grid-column title='fnc.generalAccounting.accounting.code' field="accountCoding_code"  width="50px"/>
    <base:my-grid-column title='fnc.generalAccounting.accounting.level' field="level"  width="50px"/>

    <base:my-grid-schema-field name="accountCoding_name" type="string" />
    <base:my-grid-schema-field name="accountCoding_code" type="string" />
    <base:my-grid-schema-field name="level" type="string" />
    
</base:my-grid-item>

<base:footer></base:footer>
