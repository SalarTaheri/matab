<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader></base:pageHeader>

<%--private String name;
private Time start_time;
private Time end_time;
private Date date;
private String desc;--%>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read">
    <base:my-grid-column title='thinkroom.sessionmanagent.session.name'  field="name" width="50px"/>
    <base:my-grid-column title='thinkroom.sessionmanagent.session.startTime' field="start_time"  width="50px"/>
    <base:my-grid-column title='thinkroom.sessionmanagent.session.endTime' field="end_time"  width="50px"/>
    <base:my-grid-column title='thinkroom.sessionmanagent.session.date' field="date"  width="50px"/>
    <base:my-grid-column title='thinkroom.sessionmanagent.session.desc' field="description"  width="50px"/>


    <base:my-grid-schema-field name="name" type="string" />
    <base:my-grid-schema-field name="start_time" type="string" />
    <base:my-grid-schema-field name="end_time" type="string" />
    <base:my-grid-schema-field name="date" type="string" />
    <base:my-grid-schema-field name="description" type="string" />

</base:my-grid>

<base:footer></base:footer>
