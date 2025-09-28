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
			<base:testBox styleClass="small" name="name" key="com.artonis.clinic.basicInfo.insuranceOrganization.name"/>
			<base:testBox styleClass="small" name="code" key="com.artonis.clinic.basicInfo.insuranceOrganization.code"/>
			<base:comboBox name="type" value="name" key="com.artonis.clinic.basicInfo.insuranceOrganization.type" comboLoaderUrl="combo/loadAllType" styleClass="small"/>
		</div>
        <div class="uk-grid uk-grid-preserve">
        	<base:testBox styleClass="small" name="franshiz" key="com.artonis.clinic.basicInfo.insuranceOrganization.franshiz"/>
        	<base:testBox styleClass="small" name="fileName" key="com.artonis.clinic.basicInfo.insuranceOrganization.fileName"/>
            <base:checkbox styleClass="verysmall" name="active" key="com.artonis.clinic.basicInfo.insuranceOrganization.state"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="small" name="fromDate" key="com.artonis.clinic.basicInfo.employeeContract.fromDate"/>
			<base:mDatePicker styleClass="small" name="toDate" key="com.artonis.clinic.basicInfo.employeeContract.toDate"/>
			<base:checkbox styleClass="verysmall" name="calaBaseOnList" key="com.artonis.clinic.basicInfo.insuranceOrganization.calcBaseOnList"/>
        </div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox styleClass="verysmall" name="applyFromFreeIns" key="com.artonis.clinic.basicInfo.insuranceOrganization.applyFromFreeIns"/>
			<base:checkbox styleClass="verysmall" name="notCalculateBasedOnFreeIns" key="com.artonis.clinic.basicInfo.insuranceOrganization.notCalculateBasedOnFreeIns"/>
		</div>
	</form>
	
	<base:itemForm masterIdStr="insurance_id" insertWithoutPopup="true"
		titleKeys="com.artonis.clinic.research.surveyFormItem,com.artonis.clinic.basicInfo.insuranceOrganization.insuranceBookletType,com.artonis.clinic.basicInfo.insuranceOrganization.insuranceSexType,com.artonis.clinic.basicInfo.insuranceOrganization.insuranceProficiency,com.artonis.clinic.basicInfo.insuranceOrganization.insuranceDoctorType,com.artonis.clinic.basicInfo.insuranceOrganization.insuranceParaclinicType,com.artonis.clinic.basicInfo.insuranceOrganization.insurancePrescriptionType,com.artonis.clinic.basicInfo.insuranceOrganization.insuranceLimit"
		formItemTabViewJspFiles="InsuranceItemTabView.jsp,InsuranceBookletTypeTabView.jsp,InsuranceSexTypeTabView.jsp,InsuranceProficiencyTabView.jsp,InsuranceDoctorTypeTabView.jsp,InsuranceParaclinicTypeTabView.jsp,InsurancePrescriptionTypeTabView.jsp,InsuranceLimitTabView.jsp"
		formItemTabInputs="InsuranceItemTabInput,InsuranceBookletTypeTabInput,InsuranceSexTypeTabInput,InsuranceProficiencyTabInput,InsuranceDoctorTypeTabInput,InsuranceParaclinicTypeTabInput,InsurancePrescriptionTypeTabInput,InsuranceLimitTabInput" />
	
</div>
<script type="text/javascript">
	if($("#id").val()==1){
		$("#applyFromFreeIns").hide();
		$("#notCalculateBasedOnFreeIns").hide();
	}
</script>
