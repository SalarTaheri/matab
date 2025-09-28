<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

 <base:pageHeader></base:pageHeader>
 <base:pageInputHeader></base:pageInputHeader>
<div class="uk-container uk-container-center my-uk-container" >
	
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:suggest name="employee_id" key="hrm.employee.personnle" fieldNames="id,personnelCode" tagNames="employee_id,personnelCode" suggestLoaderController="suggest/loadAllEmployee"/>
			<base:testBox name="personnelCode" key="hrm.employee.personnleCode" disabled="true"/>
		</div>	
		<div class="uk-grid uk-grid-preserve">
			<base:suggest name="welfareFacility_id" key="hrm.welfare.welfareFacility.name" suggestLoaderController="suggest/loadAllActiveWelfareFacility" fieldNames="id,code" tagNames="welfareFacility_id,code" />
			<base:testBox name="code" key="hrm.welfare.welfareFacility.code" disabled="true"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<img id="" src="" />
		</div>
	</form>
</div>