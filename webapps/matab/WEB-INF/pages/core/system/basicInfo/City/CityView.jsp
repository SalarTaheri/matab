<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='system.basicInfo.city.name'  field="name" width="50px"/>
	<base:my-grid-column title='system.basicInfo.city.province'  field="provinceName" width="50px"/>
	<base:my-grid-column title='system.basicInfo.city.code'  field="code" width="50px"/>
	<base:my-grid-column title='system.basicInfo.city.telephoneCode'  field="phoneCode" width="50px"/>
	<%--<base:my-grid-column title=''  field="type" width="50px"/>--%>


</base:my-grid>
<base:footer/>
