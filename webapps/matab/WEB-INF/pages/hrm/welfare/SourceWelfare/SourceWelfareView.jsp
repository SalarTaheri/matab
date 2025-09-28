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
		<base:my-grid-column title='hrm.welfare.suorceWelfare.name'  field="name" width="50px"/>
		<base:my-grid-column title='hrm.welfare.suorceWelfare.type' field="typeKey"  width="50px"/>
		<base:my-grid-column title='hrm.welfare.suorceWelfare.capacityUnit' field="capacityUnitKey"  width="50px"/>
		<base:my-grid-column title='hrm.welfare.suorceWelfare.state' field="stateKey"  width="50px"/>
		<base:my-grid-column title='hrm.welfare.suorceWelfare.description' field="description"  width="50px"/>
       
		<base:my-grid-schema-field name="name" type="string" />
		<base:my-grid-schema-field name="type" type="string" />
		<base:my-grid-schema-field name="state" type="string" />
		<base:my-grid-schema-field name="description" type="string" />
	</base:my-grid>
 
<base:footer></base:footer>