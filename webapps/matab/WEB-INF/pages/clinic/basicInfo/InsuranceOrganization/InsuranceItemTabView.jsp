<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="InsuranceItem"/>

<base:my-grid-item name="InsuranceItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="insurance_id">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceItem.serviceitem_id'  field="nameOrGoodsName" width="90px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.rvu'  field="rvu_value" width="100px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceItem.rvu_code'  field="rvu_code" width="30px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceItem.technicalPercent'  field="technicalPercent" width="20px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceItem.technical_ka_id'  field="technical_ka_price" width="40px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceItem.professionalPercent'  field="professionalPercent" width="20px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceItem.professional_ka_id'  field="professional_ka_price" width="40px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceItem.type'  field="itemTypeCaption" width="40px"/>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractVisit.generic_code'  field="generic_code" width="30px"/>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractVisit.dosage'  field="dosage" width="30px"/>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractVisit.franshiz_percent'  field="franshiz_percent" width="40px"/>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractVisit.cost'  field="cost" width="50px"/>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractVisit.limit'  field="limit" width="30px"/>

	<base:my-grid-schema-field name="serviceItemName" type="string"/>
	<base:my-grid-schema-field name="rvu_value" type="string"/>
	<base:my-grid-schema-field name="ka_price" type="long"/>
	<base:my-grid-schema-field name="itemName" type="string"/>
	<base:my-grid-schema-field name="nameBussines" type="string"/>
	<base:my-grid-schema-field name="dosage" type="string"/>
	<base:my-grid-schema-field name="franshiz_percent" type="string"/>
	<base:my-grid-schema-field name="cost" type="long"/>
	<base:my-grid-schema-field name="professionalPercent" type="string"/>
	<base:my-grid-schema-field name="technicalPercent" type="string"/>

	<base:my-grid-function text="com.artonis.clinic.basicInfo.insuranceItem.editRelatedServiceItemCost"
						   functionClick="editRelatedServiceItemCostBtnOnClick" name="editRelatedServiceItemCost"/>
</base:my-grid-item>

<base:footer/>