
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='com.artonis.inv.m169.reports.infoType'  field="infoType" width="35px"/>
	<base:my-grid-column title='com.artonis.inv.m169.reports.year'  field="year" width="35px"/>
	<base:my-grid-column title='inventory.m169.operation.purchaseOperation.season'  field="season" width="20px"/>
	<base:my-grid-column title='com.artonis.inv.m169.reports.count'  field="countSaleOperation" width="20px"/>
	<base:my-grid-column title='com.artonis.inv.m169.reports.price'  field="price" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.m169.reports.tax'  field="tax" width="55px"/>
	<base:my-grid-column title='com.artonis.inv.m169.reports.toll'  field="toll" width="45px"/>
	<base:my-grid-column title='com.artonis.inv.m169.reports.backingPrice'  field="backingPrice" width="45px"/>
	<base:my-grid-column title='com.artonis.inv.m169.reports.backingSeasonVat'  field="backingSeasonVat" width="55px"/>
	<base:my-grid-column title='com.artonis.inv.m169.reports.backingToll'  field="backingToll" width="45px"/>
	<base:my-grid-column title='com.artonis.inv.m169.basicInfo.companyPerson.personCompanyName'  field="personCompanyName" width="65px"/>
	<base:my-grid-column title='com.artonis.inv.m169.basicInfo.companyPerson.nationalId'  field="nationalId" width="45px"/>


        <base:my-grid-schema-field name="infoType" type="string"/>
        <base:my-grid-schema-field name="year" type="string"/>
        <base:my-grid-schema-field name="season" type="string"/>
        <base:my-grid-schema-field name="countSaleOperation" type="string"/>
        <base:my-grid-schema-field name="price" type="long"/>
        <base:my-grid-schema-field name="tax" type="long"/>
        <base:my-grid-schema-field name="toll" type="long"/>
        <base:my-grid-schema-field name="backingPrice" type="long"/>
        <base:my-grid-schema-field name="backingSeasonVat" type="long"/>
        <base:my-grid-schema-field name="backingToll" type="long"/>
        <base:my-grid-schema-field name="personCompanyName" type="string"/>
        <base:my-grid-schema-field name="nationalId" type="string"/>
   
        
</base:my-grid>
<base:footer/>
