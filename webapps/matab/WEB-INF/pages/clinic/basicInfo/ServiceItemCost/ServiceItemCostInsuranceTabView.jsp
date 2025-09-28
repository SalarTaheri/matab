<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="ServiceItemCostInsurance"/>

<base:my-grid-item name="ServiceItemCostInsurance" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="service_item_cost_id">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostInsurance.insuranceorganization_id'  field="insuranceName" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostInsurance.off_precent'  field="off_precent" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostInsurance.original_cost'  field="original_cost" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostInsurance.insurance_cost'  field="insurance_cost" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostInsurance.fromDate'  field="fromDate" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostInsurance.toDate'  field="toDate" width="50px"/>

    <base:my-grid-schema-field name="insuranceorganization_text" type="string"/>
    <base:my-grid-schema-field name="off_precent" type="string"/>
    <base:my-grid-schema-field name="original_cost" type="long"/>
    <base:my-grid-schema-field name="insurance_cost" type="long"/>
    <base:my-grid-schema-field name="fromDate" type="string"/>
    <base:my-grid-schema-field name="toDate" type="string"/>
</base:my-grid-item>

<base:footer/>