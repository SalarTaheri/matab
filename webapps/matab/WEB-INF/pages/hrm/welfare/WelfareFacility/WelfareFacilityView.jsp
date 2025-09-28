<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
	String jsFileName = pageContext.getPage().getClass().getName();
	jsFileName = jsFileName.substring(jsFileName.lastIndexOf(".") + 1).replace("_jsp", ".js");	
 %>
 <base:pageHeader></base:pageHeader>
 
 	<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read">
		<base:my-grid-column title='hrm.welfare.WelfareFacility.name'  field="name" width="50px"/>
		<base:my-grid-column title='hrm.welfare.WelfareFacility.code'  field="code" width="50px"/>
		<base:my-grid-column title='hrm.welfare.WelfareFacility.sourceName' field="sourceName"  width="50px"/>
		<base:my-grid-column title='hrm.welfare.WelfareFacility.refund' field="refund"  width="50px"/>
		<base:my-grid-column title='hrm.welfare.WelfareFacility.fromDate' field="fromDate"  width="50px"/>
		<base:my-grid-column title='hrm.welfare.WelfareFacility.toDate' field="toDate"  width="50px"/>
       
		<base:my-grid-schema-field name="name" type="string" />
		<base:my-grid-schema-field name="code" type="string" />
		<base:my-grid-schema-field name="refund" type="double" />
		<base:my-grid-schema-field name="fromDate" type="string" />
		<base:my-grid-schema-field name="toDate" type="string" />
	</base:my-grid>
 
<base:footer></base:footer>