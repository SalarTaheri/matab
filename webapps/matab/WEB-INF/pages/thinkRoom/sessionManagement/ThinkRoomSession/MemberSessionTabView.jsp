<%@page import="org.springframework.web.util.UrlPathHelper"%><%@page import="java.util.ResourceBundle"%>
<%@ page import="org.apache.commons.lang3.math.NumberUtils" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="MemberSession"/>


<base:my-grid-item name="MemberSession" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="session_id" isPopup="true">
    <base:my-grid-column title='thinkroom.membermanagent.member.name'  field="name" width="50px"/>
    <base:my-grid-column title='thinkroom.membermanagent.member.lastname' field="lastname"  width="50px"/>
    <base:my-grid-column title='thinkroom.membermanagent.member.sex' field="sexStr"  width="50px"/>
    <base:my-grid-column title='thinkroom.membermanagent.member.job' field="job"  width="50px"/>
    <base:my-grid-column title='thinkroom.membermanagent.member.tel' field="tel1"  width="50px"/>
    <base:my-grid-column title='thinkroom.membermanagent.member.cellphone' field="cellphone"  width="50px"/>
    <base:my-grid-column title='thinkroom.membermanagent.member.email' field="email"  width="50px"/>
    <base:my-grid-column title='thinkroom.membermanagent.member.membercard' field="memberCardStr"  width="50px"/>
    <base:my-grid-column title='thinkroom.membermanagent.member.businesscard' field="businessCardStr"  width="50px"/>

    <base:my-grid-schema-field name="name" type="string" />
    <base:my-grid-schema-field name="lastname" type="string" />
    <base:my-grid-schema-field name="sexStr" type="string" />
    <base:my-grid-schema-field name="job" type="string" />
    <base:my-grid-schema-field name="tel1" type="string" />
    <base:my-grid-schema-field name="cellphone" type="string" />
    <base:my-grid-schema-field name="email" type="string" />
    <base:my-grid-schema-field name="memberCardStr" type="string" />
    <base:my-grid-schema-field name="businessCardStr" type="string" />
</base:my-grid-item>

<base:footer></base:footer>
