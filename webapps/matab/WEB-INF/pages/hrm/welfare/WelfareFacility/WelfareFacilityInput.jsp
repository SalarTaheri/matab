<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	String jsFileName = pageContext.getPage().getClass().getName();
	jsFileName = jsFileName.substring(jsFileName.lastIndexOf(".") + 1).replace("_jsp", ".js");
 %>
 <base:pageHeader></base:pageHeader>
<div class="uk-container uk-container-center my-uk-container" >
	
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="name" key="hrm.welfare.WelfareFacility.name"/>
			<base:testBox name="code" key="hrm.welfare.WelfareFacility.code"/>
		</div>	
		<div class="uk-grid uk-grid-preserve">
			<base:suggest name="sourceWalfare_id" key="hrm.welfare.WelfareFacility.sourceName" suggestLoaderController="combo/loadAllSourceWelfare" fieldNames="sourceWelfareId,sourceWelfareCode,capacityUnit" tagNames="sourceWalfare_id,sourceCode,limitType"/>
			<base:testBox name="sourceCode" key="hrm.welfare.WelfareFacility.sourceCode" disabled="true"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="refund" key="hrm.welfare.WelfareFacility.refund" comboLoaderUrl="combo/loadAllRefund"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="fromDate" key="hrm.welfare.WelfareFacility.fromDate" />
			<base:testBox name="toDate" key="hrm.welfare.WelfareFacility.toDate"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="capacity" key="hrm.welfare.WelfareFacility.limit"/>
			<base:testBox name="limitType" key="hrm.welfare.WelfareFacility.limitType" disabled="true"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="employeeLimit" key="hrm.welfare.WelfareFacility.employeeLimit"/>
			<base:comboBox name="employeeLimitType" key="hrm.welfare.WelfareFacility.employeeLimitType" comboLoaderUrl="combo/loadAllEmployeeLimitationUnit"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="employeeLimitTypeDuration" key="hrm.welfare.WelfareFacility.employeeLimitTypeDuration" comboLoaderUrl="combo/loadAllEmployeeLimitTypeDuration"/>
		</div>
	</form>
</div>