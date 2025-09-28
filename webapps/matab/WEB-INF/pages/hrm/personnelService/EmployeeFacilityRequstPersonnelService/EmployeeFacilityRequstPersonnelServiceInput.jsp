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
			<base:testBox name="lastName" key="hrm.employee.personnle" disabled="true"/>
			<base:testBox name="personnelCode" key="hrm.employee.personnleCode" disabled="true"/>
		</div>	
		<div class="uk-grid uk-grid-preserve">
			<base:suggest name="welfareFacility_id" key="hrm.welfare.welfareFacility.name" suggestLoaderController="suggest/loadAllActiveWelfareFacility" fieldNames="id,code,fileAddress" tagNames="welfareFacility_id,code,photos" />
			<base:testBox name="code" key="hrm.welfare.welfareFacility.code" disabled="true"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<div class="uk-width-4-10 k-rtl" >
				<p id="photos" />
			</div>
		</div>
	</form>
</div>