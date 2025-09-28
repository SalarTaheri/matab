<%@page import="org.springframework.web.util.UrlPathHelper"%><%@page import="java.util.ResourceBundle"%>
<%@ page import="org.apache.commons.lang3.math.NumberUtils" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="EmployeeFamilyItem"/>


<base:my-grid-item name="EmployeeFamilyItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="employee_id">
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.firstName'  field="firstName_" width="50px"/>
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.lastName'  field="lastName_" width="50px"/>
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.fatherName'  field="fatherName_" width="50px"/>
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.nationalCode'  field="nationalCode_" width="50px"/>
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.identityNumber'  field="identityNumber_" width="50px"/>
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.birthDate'  field="birthDate_" width="50px"/>
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.sex'  field="sexText" width="50px"/>
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.relation'  field="relation" width="50px"/>
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.sponsorshipType'  field="sponsorshipTypeText" width="50px"/>
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.fromDate'  field="fromDate" width="50px"/>
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.toDate'  field="toDate" width="50px"/>
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.insurance'  field="insuranceText" width="50px"/>
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.fromDateInsurance'  field="fromDateInsurance" width="50px"/>
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.toDateInsurance'  field="toDateInsurance" width="50px"/>
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.completeInsurance'  field="completeInsuranceText" width="50px"/>
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.fromDateCompleteInsurance'  field="fromDateCompleteInsurance" width="50px"/>
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.toDateCompleteInsurance'  field="toDateCompleteInsurance" width="50px"/>
	<base:my-grid-column title='hrm.employee.EmployeeFamilyItem.description'  field="description" width="50px"/>


        <base:my-grid-schema-field name="firstName_" type="string"/>
        <base:my-grid-schema-field name="lastName_" type="string"/>
        <base:my-grid-schema-field name="fatherName_" type="string"/>
        <base:my-grid-schema-field name="nationalCode_" type="string"/>
        <base:my-grid-schema-field name="identityNumber_" type="string"/>
        <base:my-grid-schema-field name="birthDate_" type="string"/>
        <base:my-grid-schema-field name="sexText" type="string"/>
        <base:my-grid-schema-field name="relation" type="string"/>
        <base:my-grid-schema-field name="sponsorshipTypeText" type="string"/>
        <base:my-grid-schema-field name="fromDate" type="string"/>
        <base:my-grid-schema-field name="toDate" type="string"/>
        <base:my-grid-schema-field name="insuranceText" type="string"/>
        <base:my-grid-schema-field name="fromDateInsurance" type="string"/>
        <base:my-grid-schema-field name="toDateInsurance" type="string"/>
        <base:my-grid-schema-field name="completeInsuranceText" type="string"/>
        <base:my-grid-schema-field name="fromDateCompleteInsurance" type="string"/>
        <base:my-grid-schema-field name="toDateCompleteInsurance" type="string"/>
        <base:my-grid-schema-field name="description" type="string"/>
</base:my-grid-item>

<base:footer></base:footer>
