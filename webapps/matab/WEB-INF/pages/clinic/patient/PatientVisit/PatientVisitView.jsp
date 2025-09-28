<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<jsp:include page="PatientVisitViewJs.jsp"></jsp:include>
<jsp:include page="FileViewNoSql.jsp"></jsp:include>
<base:FileViewHeader masterIdStr="patientId"/>