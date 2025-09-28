<%@page import="java.util.ResourceBundle"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:sortableClinicItem categoryListPlaceHolder="Add diagnosis category" 
		categoryNameItem="addDiagnosisName" operationAllUrl="clinic/customize/diagnosisCustomization/combo/loadAllDiagnosisGet" 
		saveUrl="clinic/customize/diagnosisCustomization/save" />