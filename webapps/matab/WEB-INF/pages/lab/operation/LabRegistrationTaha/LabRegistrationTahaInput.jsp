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
			<base:testBox styleClass="midsmall" name="nationalCode" key="lab.operation.labRegistration.nationalCode"/>
			<base:testBox styleClass="midsmall" name="fileNumber" key="lab.operation.labRegistration.fileNumber"/>
			<base:testBox styleClass="midsmall" name="subscriptionNumber" key="lab.operation.labRegistration.subscriptionNumber"/>
			<base:testBox styleClass="midsmall" name="suppInsuranceContractNumber" key="lab.operation.labRegistration.suppInsuranceContractNumber"/>
		</div>

		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="insuranceContractNumber" key="lab.operation.labRegistration.insuranceContractNumber"/>
			<base:testBox styleClass="midsmall" name="lastName" key="lab.operation.labRegistration.lastName"/>
			<base:testBox styleClass="midsmall" name="firstName" key="lab.operation.labRegistration.firstName"/>
			<base:testBox styleClass="midsmall" name="sex" key="lab.operation.labRegistration.sex"/>
		</div>

		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="fatherName" key="lab.operation.labRegistration.fatherName"/>
			<base:testBox styleClass="midsmall" name="birthDate" key="lab.operation.labRegistration.birthDate"/>
			<base:testBox styleClass="midsmall" name="age" key="lab.operation.labRegistration.age"/>
			<base:testBox styleClass="midsmall" name="cellphone" key="lab.operation.labRegistration.cellphone"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="bookPage" key="lab.operation.labRegistration.bookPage"/>
			<base:testBox styleClass="midsmall" name="bookNumber" key="lab.operation.labRegistration.bookNumber"/>
			<base:testBox styleClass="midsmall" name="doctorId" key="lab.operation.labRegistration.doctorId"/>
			<base:testBox styleClass="midsmall" name="prefix" key="lab.operation.labRegistration.prefix"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="doctorCode" key="lab.operation.labRegistration.doctorCode"/>
			<base:testBox styleClass="midsmall" name="specialtyName" key="lab.operation.labRegistration.specialtyName"/>
			<base:testBox styleClass="midsmall" name="doctorName" key="lab.operation.labRegistration.doctorName"/>
		</div>
	</form>
</div>






