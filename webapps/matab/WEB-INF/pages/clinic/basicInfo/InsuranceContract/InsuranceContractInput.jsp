<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="insuranceOrganizationId" comboLoaderUrl="/combo/loadInsuranceOrganization" minLength="0" styleClass="small"
					key="com.artonis.clinic.basicInfo.insuranceContract.insuranceOrganizationId"/>
			<base:mDatePicker styleClass="small" name="fromDate" key="com.artonis.clinic.basicInfo.insuranceContract.fromDate"/>
			<base:mDatePicker styleClass="small" name="toDate" key="com.artonis.clinic.basicInfo.insuranceContract.toDate"/>
		</div>
	
	</form>
	<base:itemForm titleKeys="com.artonis.clinic.basicInfo.insuranceContractDrug,com.artonis.clinic.basicInfo.insuranceContractAccessories,com.artonis.clinic.basicInfo.insuranceContractRvu,com.artonis.clinic.basicInfo.insuranceContractVisit"
		formItemTabViewJspFiles="InsuranceContractDrugTabView.jsp,InsuranceContractAccessoriesTabView.jsp,InsuranceContractRvuTabView.jsp,InsuranceContractVisitTabView.jsp" formItemTabInputs="InsuranceContractDrugTabInput,InsuranceContractAccessoriesTabInput,InsuranceContractRvuTabInput,InsuranceContractVisitTabInput" masterIdStr="insuranceContractId" insertWithoutPopup="true"/>
			
</div>
