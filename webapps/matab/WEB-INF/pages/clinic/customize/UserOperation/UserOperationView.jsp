<%@page import="java.util.ResourceBundle"%>
<%--<%@taglib prefix="kendo" uri="/kendo-taglibs.tld"%>--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:sortableClinicItem  categoryListPlaceHolder="Add operation category" categoryNameItem="addOperationName"
                         operationAllUrl="clinic/customize/userOperation/combo/loadAllOperationGet" saveUrl="clinic/customize/userOperation/save"/>