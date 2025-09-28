
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader></base:pageHeader>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="multiple">n	<base:my-grid-column title='com.artonis.clinic.cash.cashVisitItemType.id'  field=id width="50px"/>n	<base:my-grid-column title='com.artonis.clinic.cash.cashVisitItemType.title'  field=title width="50px"/>n	<base:my-grid-column title='com.artonis.clinic.cash.cashVisitItemType.type'  field=type width="50px"/>n

<base:my-grid-schema-field name="id" type="string" />n<base:my-grid-schema-field name="title" type="string" />n<base:my-grid-schema-field name="type" type="string" />n<base:footer></base:footer>
