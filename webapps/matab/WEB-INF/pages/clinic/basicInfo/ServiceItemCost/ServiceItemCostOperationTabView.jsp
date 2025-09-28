<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="ServiceItemCostOperation"/>

<base:my-grid-item name="ServiceItemCostOperation" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="service_item_cost_id">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostOperation.serviceitem_id'  field="operation_serviceitem_text" width="30px"/>
	<%--<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostOperation.rvuCode'  field="rvuCode" width="30px"/>--%>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostOperation.cost'  field="operation_cost" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostOperation.professional_ka_cost'  field="operation_professional_ka_cost" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostOperation.technical_ka_cost'  field="operation_technical_ka_cost" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostOperation.quantity'  field="operation_quantity" width="30px"/>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostOperation.total'  field="operation_totalCost" width="50px"/>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostOperation.isPrimaryOperation'  field="isPrimaryOperation" width="20px" isCombo="true"/>
    <%--<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostOperation.technicalPercent'  field="technicalPercent" width="20px"/>--%>
    <%--<base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostOperation.professionalPercent'  field="professionalPercent" width="20px" />--%>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostOperation.showFishPrint'  field="service_item_cost_group_operation_txt" width="50px"/>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.serviceItemCostOperation.showBillPrint'  field="service_item_cost_group_bill_operation_txt" width="50px"/>

    <%--<base:my-grid-schema-field name="operation_serviceitem_text" type="string"/>--%>
    <%--<base:my-grid-schema-field name="operation_cost_txt" type="long"/>--%>
    <base:my-grid-schema-field name="operation_quantity" type="string"/>
    <base:my-grid-schema-field name="operation_totalCost_txt" type="string"/>
    <%--<base:my-grid-schema-field name="isPrimaryOperation" type="boolean"/>--%>
    <%--<base:my-grid-schema-field name="technicalPercent" type="string"/>--%>
    <%--<base:my-grid-schema-field name="professionalPercent" type="string"/>--%>
    <base:my-grid-schema-field name="service_item_cost_group_operation_txt" type="string"/>
    <base:my-grid-schema-field name="service_item_cost_group_bill_operation_txt" type="string"/>
</base:my-grid-item>

<base:footer/>