<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id">
		<input type="hidden" id="systemCode" name="systemCode">
		<input type="hidden" id="parent_id" name="parent_id">
		<input type="hidden" id="hasChild" name="hasChild">

		 <div class="uk-grid uk-grid-preserve">
            <%--<base:comboBox name="medicalTestGroup" key="his.clinic.medicalTest.medicalTestGroup" comboLoaderUrl="combo/loadMedicalTestGroup" styleClass="small" value="medicalTestGroupName"/>--%>
            <base:testBox name="name" key="clinic.medicalTestName" styleClass="small"/>
            <%--<base:testBox styleClass="small" name="coding" key="his.clinic.medicalTest.coding"/>--%>
            <base:comboBox styleClass="small" name="status" isListConstant="true"
                               key="his.clinic.medicalTest.status" comboLoaderUrl="combo/loadAllMedicalTestStatus" />
			<base:comboBox styleClass="small" name="type" isListConstant="true"
                               key="his.clinic.medicalTest.type" comboLoaderUrl="combo/loadAllMedicalTestType" />
        </div>
	</form>
</div>
