<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	String gridUrl = new UrlPathHelper().getOriginatingRequestUri(request);
	gridUrl = request.getContextPath() + "/clinic/operation/factorDoctorClinicPortion/grid-read-detail-patient";
%>

<div>
	<form class="uk-form">
		<base:my-grid name="gridDetial" isPopup="true" transportReadUrl="<%=gridUrl%>" showOperation="false">
			<base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fullName' field="patientFullName" width="25px" />
			<base:my-grid-column title='com.artonis.clinic.operation.factor.patient_fileNumber' field="patientFileNumber" width="20px" />
			<base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.service_id' field="serviceItemName" width="70px" />
			<base:my-grid-column title='com.artonis.clinic.operation.factor.serviceItemBasicAmount' field="serviceItemBasicAmount" width="25px" />
			<base:my-grid-column title='com.artonis.clinic.operation.factor.quantity' field="quantity" width="10px" />
			<base:my-grid-column title='com.artonis.clinic.operation.factor.serviceItemAmount' field="serviceItemAmount" width="20px" />
			<base:my-grid-column title='com.artonis.clinic.operation.factor.insuranceAmount' field="insuranceAmount" width="20px" />
			<base:my-grid-column title='com.artonis.clinic.operation.factor.discountAmount' field="discountAmount" width="20px" />
			<base:my-grid-column title='com.artonis.clinic.operation.factor.paymentableAmount' field="paymentableAmount" width="20px" />
		</base:my-grid>
	</form>
</div>