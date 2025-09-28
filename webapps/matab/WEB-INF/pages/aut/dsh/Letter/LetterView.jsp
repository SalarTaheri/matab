
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='com.artonis.aut.dsh.letter.letter'  field="letter" width="50px"/>
	<base:my-grid-column title='com.artonis.aut.dsh.letter.date'  field="date" width="50px"/>
	<base:my-grid-column title='com.artonis.aut.dsh.letter.subject'  field="subject" width="50px"/>


        <base:my-grid-schema-field name="letter" type="string"/>
        <base:my-grid-schema-field name="date" type="string"/>
        <base:my-grid-schema-field name="subject" type="string"/>
</base:my-grid>
<base:footer/>
