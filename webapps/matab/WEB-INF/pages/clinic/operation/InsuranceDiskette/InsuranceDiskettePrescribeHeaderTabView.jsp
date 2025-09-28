<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="InsuranceDiskettePrescribeHeader" />

<base:my-grid-item name="InsuranceDiskettePrescribeHeader" masterIdStr="insuranceDisketteId" isPopup="true" noDeleteButton="true" operationColumnWidth="55px"
		transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" >

	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.header.number' field="number" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.header.prescriptionDate' field="prescriptionDate" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.header.serviceDate' field="serviceDate" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.header.prescriptionValidityDate' field="prescriptionValidityDate" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.header.insuranceType' field="insuranceType" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.header.bookletType' field="bookletType" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.header.bookletSerialNumber' field="bookletSerialNumber" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.header.bookletPageSerialNumber' field="bookletPageSerialNumber" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.header.sex' field="sex" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.header.doctorGroup' field="doctorGroup" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.header.serviceRequesterMedicalCouncilCode' field="serviceRequesterMedicalCouncilCode" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.header.medicalCouncilCode' field="medicalCouncilCode" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.header.prescriptionPrice' field="prescriptionPrice" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.header.amountPaidByPatient' field="amountPaidByPatient" width="30px" />
	<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.header.amountPaidByIsurance' field="amountPaidByIsurance" width="30px" />

	<base:my-grid-function name="showBody" functionClick="showBodyOnClick" text="com.artonis.clinic.operation.insuranceDiskette.header.showBody"/>
</base:my-grid-item>

<base:footer />

<div id="item-modals-showBody">
</div>

<script type="text/javascript">
	function showBodyOnClick(e){
		var data = this.dataItem($(e.target).closest("tr"));
		jQuery.ajax({
            url:getBaseUrl() + "getShowBodyPage/" + data.id,
            success:function(data){
                $("#item-modals-showBody").empty();
                $("#item-modals-showBody").append('<div id="myShowBodyPage" class="uk-modal">');
                $("#myShowBodyPage").append(data);
    	        var modal = new $.UIkit.modal.Modal("#myShowBodyPage");
    	        $("#myShowBodyPage").on(
    	                {
    	                    'uk.modal.hide': function(){
    	                        $("#item-modals-showBody").empty();
    	                    }
    	                }
    	        );
    	        modal.show();
            },
            async :false
        });
	}
</script>