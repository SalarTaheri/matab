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
			<base:comboBox name="group_id" comboLoaderUrl="combo/loadAllGroup" key="com.artonis.clinic.basicInfo.service.group_id" styleClass="small" minLength="0" />
			<base:comboBox name="serviceGroupId" comboLoaderUrl="combo/loadAllServiceGroup" key="com.artonis.clinic.basicInfo.service.serviceGroup" styleClass="small" minLength="0" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="code" key="com.artonis.clinic.basicInfo.service.code" styleClass="small"/>
			<base:testBox name="name" key="com.artonis.clinic.basicInfo.service.name"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="appointmentable" comboLoaderUrl="combo/loadAllAppointmentable" key="com.artonis.clinic.basicInfo.service.appointmenable" styleClass="small" minLength="0" />
			<base:testBox name="appointmentTitle" key="com.artonis.clinic.basicInfo.service.appointmenTitle"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="nickName" key="com.artonis.clinic.basicInfo.service.nickName" styleClass="small"/>
			<base:testBoxNumericEx name="priority" key="com.artonis.clinic.basicInfo.service.priority" styleClass="small"/>
		</div>
	</form>
	
	<base:itemForm  masterIdStr="service_id" insertWithoutPopup="true"
			titleKeys="com.artonis.clinic.basicInfo.serviceDepartment.department,com.artonis.clinic.basicInfo.service.serviceParentService"
			formItemTabViewJspFiles="ServiceDepartmentTabView.jsp,ServiceParentServiceTabView.jsp"
			formItemTabInputs="ServiceDepartmentTabInput,ServiceParentServiceTabInput" />
</div>
