
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='com.artonis.clinic.operation.factorPayment.factor_id'  field="factor_id" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factorPayment.type'  field="type" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factorPayment.amount'  field="amount" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factorPayment.pos_id'  field="pos_id" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factorPayment.posName'  field="posName" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factorPayment.billNumber'  field="billNumber" width="50px"/>


        <base:my-grid-schema-field name="factor_id" type="string"/>
        <base:my-grid-schema-field name="type" type="string"/>
        <base:my-grid-schema-field name="amount" type="string"/>
        <base:my-grid-schema-field name="pos_id" type="string"/>
        <base:my-grid-schema-field name="posName" type="string"/>
        <base:my-grid-schema-field name="billNumber" type="string"/>
</base:my-grid>
<base:footer/>
