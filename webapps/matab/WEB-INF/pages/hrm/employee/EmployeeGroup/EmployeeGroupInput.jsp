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
			<base:testBox styleClass="small" name="name" key="hrm.employee.employeeGroup.name"/>
			<base:testBox styleClass="small" name="code" key="hrm.employee.employeeGroup.code" disabled="true"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:textArea name="description" key="hrm.employee.employeeGroup.description"/>
        </div>
	</form>
</div>
