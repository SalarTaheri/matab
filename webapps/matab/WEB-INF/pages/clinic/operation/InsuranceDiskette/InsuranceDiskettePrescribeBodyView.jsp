<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<script type="text/javascript">
	function _grid_onEdit(e){
	}
	function _grid_onDelete(e){
	}
	function _grid_requestEnd(e){
	}
</script>

<c:set var="myTransportReadUrl" value="${pageContext.request.contextPath}/clinic/operation/insuranceDiskette/item-grid-read/InsuranceDiskettePrescribeBody/${entityId}" />

<base:my-grid transportReadUrl="${myTransportReadUrl}" name="grid" selectable="none" showOperation="false">
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.body.serviceTypeCode' field="serviceTypeCode" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.body.serviceCode' field="serviceCode" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.body.countOfServiceRequest' field="countOfServiceRequest" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.body.countOfServiceSupply' field="countOfServiceSupply" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.body.servicePrice' field="servicePrice" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.body.amountPaidByPatient' field="amountPaidByPatient" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.body.amountPaidByInsurance' field="amountPaidByInsurance" width="30px" />
</base:my-grid>

<base:footer />

<style type="text/css">
    .uk-modal-dialog{
        right:0px;
        margin-right: 0px;
        width: 100%;
        padding:0px;
        top: 5%;
    }
</style>