
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader></base:pageHeader>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="multiple">
	<base:my-grid-column title='his.patient.doctorFirstName'  field="firstname" width="50px"/>
	<base:my-grid-column title='his.patient.doctorLastName'  field="lastname" width="50px"/>	
	<base:my-grid-column title='com.artonis.clinic.cash.doctorVisitCost.visitCost'  field="visitCost" width="50px"/>

	<base:my-grid-schema-field name="employee_id" type="string" />
	<base:my-grid-schema-field name="visitCost" type="string" />
</base:my-grid>
<base:footer></base:footer>
