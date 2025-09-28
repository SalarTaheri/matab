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
			<base:testBox styleClass="small" name="id" key="com.artonis.clinic.customize.userLabTest.id"/>
			<base:testBox styleClass="small" name="user_id" key="com.artonis.clinic.customize.userLabTest.user_id"/>
			<base:testBox styleClass="small" name="medicalTest_id" key="com.artonis.clinic.customize.userLabTest.medicalTest_id"/>
		</div>

	</form>
</div>
