
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='com.artonis.inv.operation.directlyConsumptionReceipt.requestNum'  field="requestNum" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.operation.directlyConsumptionReceipt.date'  field="date" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.operation.directlyConsumptionReceipt.state'  field="state" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.operation.directlyConsumptionReceipt.type'  field="type" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.operation.directlyConsumptionReceipt.description'  field="description" width="50px"/>


        <base:my-grid-schema-field name="requestNum" type="string"/>
        <base:my-grid-schema-field name="date" type="string"/>
        <base:my-grid-schema-field name="state" type="string"/>
        <base:my-grid-schema-field name="type" type="string"/>
        <base:my-grid-schema-field name="consumerProjectCenter" type="string"/>
        <base:my-grid-schema-field name="consumerPerson" type="string"/>
        <base:my-grid-schema-field name="consumerProject" type="string"/>
        <base:my-grid-schema-field name="description" type="string"/>
</base:my-grid>
<base:footer/>
