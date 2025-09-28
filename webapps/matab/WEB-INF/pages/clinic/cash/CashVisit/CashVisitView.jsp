
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader></base:pageHeader>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="multiple">
	<base:my-grid-column title='com.artonis.clinic.cash.cashVisit.id'  field="id" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.cash.cashVisit.patient_id'  field="patient_id" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.cash.cashVisit.doctor_id'  field="doctor_id" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.cash.cashVisit.cash_id'  field="cash_id" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.cash.cashVisit.employee_id'  field="employee_id" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.cash.cashVisit.doctorCost'  field="doctorCost" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.cash.cashVisit.insurance_id'  field="insurance_id" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.cash.cashVisit.state'  field="state" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.cash.cashVisit.registerDate'  field="registerDate" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.cash.cashVisit.description'  field="description" width="50px"/>

	<base:my-grid-schema-field name="id" type="string" />
	<base:my-grid-schema-field name="patient_id" type="string" />
	<base:my-grid-schema-field name="doctor_id" type="string" />
	<base:my-grid-schema-field name="cash_id" type="string" />
	<base:my-grid-schema-field name="employee_id" type="string" />
	<base:my-grid-schema-field name="doctorCost" type="string" />
	<base:my-grid-schema-field name="insurance_id" type="string" />
	<base:my-grid-schema-field name="state" type="string" />
	<base:my-grid-schema-field name="registerDate" type="string" />
	<base:my-grid-schema-field name="description" type="string" />
</base:my-grid>	
<base:footer></base:footer>

