<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
	<%
	String x="popupVisitId="+(String)request.getParameter("popupVisitId");
 %>
<%--	<base:mehrSys-grid-4-popup name="grid" transportReadUrl="${basePath}/grid-read?${x}" destroyUrl="${basePath}/grid-read" inlineEditing="true" showOperation="false" updateUrl="${basePath}/saveAndUpdate">--%>
<%--		<base:my-grid-column title='his.clinic.visit.labTestResult.testName'  field="testName" width="50px"/>--%>
<%--		<base:my-grid-column title='his.clinic.visit.labTestResult.value'  field="value" width="50px"/>--%>
<%--       --%>
<%--		<base:my-grid-schema-field name="testName" type="string" />--%>
<%--		<base:my-grid-schema-field name="value" type="string" />--%>
<%--	</base:mehrSys-grid-4-popup>--%>
	
	
<c:url value="/clinic/patient/visitMobileBase/popup/saveAndUpdate" var="createUrl" />
<c:url value="/clinic/patient/visitMobileBase/popup/grid-read" var="readUrl" />
<c:url value="/clinic/patient/visitMobileBase/popup/saveAndUpdate" var="updateUrl" />
<c:url value="${basePath}/grid-read" var="destroyUrl" />


<base:fileUploader uploadedFileAddress="" fileRemoveUrl="" name="image" key="aut.dsh.sender.date" fileSaveUrl=""></base:fileUploader>