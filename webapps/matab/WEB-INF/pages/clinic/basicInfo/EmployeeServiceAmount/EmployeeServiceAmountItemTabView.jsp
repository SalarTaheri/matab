<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="EmployeeServiceAmountItem"/>

<base:my-grid-item name="EmployeeServiceAmountItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="employeeServiceAmount_id">
	<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeServiceAmountItem.service_id'  field="serviceName" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeServiceAmountItem.surgeryRole'  field="surgeryRoleText" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeServiceAmountItem.price'  field="price" width="50px"/>
	
	<base:my-grid-schema-field name="price" type="long"/>
</base:my-grid-item>

<base:footer></base:footer>
