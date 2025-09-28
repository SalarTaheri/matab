
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='com.artonis.inv.m169.operation.financeOperationHistory.operationType'  field="operationTypeTxt" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.operation.financeOperationHistory.operationDate'  field="operationDate" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.operation.financeOperationHistory.operationTime'  field="operationTime" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.operation.financeOperationHistory.operationSate'  field="operationStateTxt" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.operation.financeOperationHistory.employee_id'  field="employeeFullName" width="50px"/>


        <base:my-grid-schema-field name="operationTypeTxt" type="string"/>
        <base:my-grid-schema-field name="operationDate" type="string"/>
        <base:my-grid-schema-field name="operationTime" type="string"/>
        <base:my-grid-schema-field name="operationStateTxt" type="string"/>
        <base:my-grid-schema-field name="employeeFullName" type="string"/>
</base:my-grid>
<base:footer/>
