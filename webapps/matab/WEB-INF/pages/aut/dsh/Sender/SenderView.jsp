
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read-current-user" selectable="single">

	<%--<base:my-grid-column title='com.artonis.aut.dsh.sender.letter_id'  field="letter_id" width="50px"/>--%>
    <base:my-grid-column title='aut.dsh.sender.date'  field="date" width="50px"/>
    <base:my-grid-column title='aut.dsh.sender.subject'  field="subject" width="50px"/>
    <base:my-grid-column title='aut.dsh.sender.userList'  field="usernames" width="50px"/>
    <base:my-grid-column title='aut.dsh.sender.letter'  field="abstractLetter" width="50px"/>


    <base:my-grid-schema-field name="date" type="string"/>
    <base:my-grid-schema-field name="subject" type="string"/>
    <base:my-grid-schema-field name="usernames" type="string"/>
    <base:my-grid-schema-field name="abstractLetter" type="string"/>
</base:my-grid>
<base:footer/>
