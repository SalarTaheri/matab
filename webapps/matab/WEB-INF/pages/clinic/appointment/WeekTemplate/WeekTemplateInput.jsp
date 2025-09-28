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
			<base:comboBox name="doctorId" key="com.artonis.clinic.appointment.weekTemplate.doctor_id" comboLoaderUrl="combo/loadAllDoctor" styleClass="small" />
			<base:testBox styleClass="small" name="name" key="com.artonis.clinic.appointment.weekTemplate.name"/>
			<base:testBox styleClass="small" name="description" key="com.artonis.clinic.appointment.weekTemplate.description"/>
		</div>
	</form>
	<base:itemForm titleKeys="com.clinic.appointment.weekTemplate.weekDays" formItemTabViewJspFiles="DayItemTabView.jsp"
				   formItemTabInputs="DayItemTabInput" insertWithoutPopup="true" masterIdStr="weekTemplateId" />
</div>
