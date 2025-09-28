<%@page import="org.springframework.web.util.UrlPathHelper"%><%@page import="java.util.ResourceBundle"%>
<%@ page import="org.apache.commons.lang3.math.NumberUtils" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="ComboFillerValue"/>


<base:my-grid-item name="ComboFillerValue" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="comboFiller_id">
    <base:my-grid-column title='system.basicinfo.combofiller.name'  field="name" width="100px"/>
    <base:my-grid-column title='system.basicinfo.combofiller.code' field="code"  width="100px"/>
    <base:my-grid-column title='system.basicinfo.combofillervalue.rank' field="rank"  width="100px"/>


    <base:my-grid-schema-field name="name" type="string" />
    <base:my-grid-schema-field name="code" type="string" />
    <base:my-grid-schema-field name="rank" type="string" />

</base:my-grid-item>

<base:footer></base:footer>
