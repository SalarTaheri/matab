<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="TestInsuranceOrganization"/>

<base:my-grid-item name="TestInsuranceOrganization" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="testId">
	<base:my-grid-column title='com.artonis.lab.basicInfo.insurance' field="insuranceOrganizationName" width="100px"/>
	<base:my-grid-column title='com.artonis.lab.basicInfo.testInsuranceOrganization.price' field="price" width="100px"/>

	<base:my-grid-schema-field name="insuranceOrganizationName" type="string"/>
	<base:my-grid-schema-field name="price" type="string"/>
</base:my-grid-item>

<base:footer></base:footer>
