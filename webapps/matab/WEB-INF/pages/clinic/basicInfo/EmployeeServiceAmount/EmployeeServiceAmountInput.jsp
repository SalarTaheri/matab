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
			<base:comboBox name="employee_id" value="name" key="com.artonis.clinic.basicInfo.employeeServiceAmount.employee_id" comboLoaderUrl="combo/loadAllEmployee" styleClass="small" />
			<base:mDatePicker styleClass="verysmall" name="fromDate" key="com.artonis.clinic.basicInfo.employeeServiceAmount.fromDate" direction="ltr"/>
			<base:mDatePicker styleClass="verysmall" name="toDate" key="com.artonis.clinic.basicInfo.employeeServiceAmount.toDate" direction="ltr"/>
		</div>
	</form> 
	<base:itemForm titleKeys="com.artonis.clinic.basicInfo.employeeServiceAmountItem" formItemTabViewJspFiles="EmployeeServiceAmountItemTabView.jsp"
				formItemTabInputs="EmployeeServiceAmountItemTabInput" masterIdStr="employeeServiceAmount_id" insertWithoutPopup="true"/>
</div>
