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
			<base:comboBox styleClass="small" name="employee_id" key="his.patient.doctorName" value="doctorFullName" comboLoaderUrl="combo/loadAllDoctor"/>
			<base:testBoxNumeric styleClass="small" name="visitCost" key="com.artonis.clinic.cash.doctorVisitCost.visitCost"/>
		</div>
	
	</form>
</div>
