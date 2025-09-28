<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="InsuranceContractDrug"/>

<base:my-grid-item name="InsuranceContractDrug" transportReadUrl="${transportReadUrl}" 
		transportRemoveUrl="${transportRemoveUrl}" masterIdStr="insuranceContractId">
		
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractDrug.genericCode'  field="genericCode" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractDrug.brandCode'  field="brandCode" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractDrug.companyCode'  field="companyCode" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractDrug.name'  field="name" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractDrug.brandName'  field="brandName" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractDrug.figure'  field="figure" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContractDrug.dosage'  field="dosage" width="50px"/>
	
</base:my-grid-item>

<base:footer/>