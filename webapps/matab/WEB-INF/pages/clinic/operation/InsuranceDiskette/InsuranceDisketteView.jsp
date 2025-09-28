<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader />

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="name" key="com.artonis.clinic.operation.insuranceDiskette.name" />
			<base:testBox styleClass="small" name="diskettenumber" key="com.artonis.clinic.operation.insuranceDiskette.diskettenumber" />
			<base:comboBox name="insurance_id" key="com.artonis.clinic.operation.insuranceDiskette.insurance_id" comboLoaderUrl="combo/loadAllInsurance" styleClass="small" />
		</div>
		<div class="uk-grid uk-grid-preserve" style="margin-bottom: 20px;">
			<base:mDatePicker styleClass="small" name="fromdate" key="com.artonis.clinic.operation.insuranceDiskette.fromdate" />
			<base:mDatePicker styleClass="small" name="todate" key="com.artonis.clinic.operation.insuranceDiskette.todate" />
			<base:mDatePicker styleClass="small" name="registerdate" key="com.artonis.clinic.operation.insuranceDiskette.registerdate" />
		</div>

		<base:my-grid-search operationColumnwidth="200px">
			<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.name' field="name" width="50px" />
			<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.fromdate' field="fromdate" width="50px" />
			<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.todate' field="todate" width="50px" />
			<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.registerdate' field="registerdate" width="50px" />
			<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.diskettenumber' field="diskettenumber" width="50px" />
			<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.insurance_id' field="insuranceName" width="50px" />
			<base:my-grid-column title='com.artonis.clinic.operation.insuranceDiskette.prescriptionCout' field="prescriptionCount" width="50px" />

			<base:my-grid-function name="createInsuranceDiskette" functionClick="grid_createInsuranceDisketteFile" styleClass="uk-button-primary"
					 text="com.artonis.clinic.operation.insuranceDiskette.createInsuranceDisketteFile" />
		</base:my-grid-search>
	</form>
</div>

<base:footer />

<div id="createDiskette-modals">
</div>

<script type="text/javascript">
	$("#printBtn").attr("disabled","disabled");
	
	function getSearchObject() {
		var jsobj = {};
		jsobj.name = $("#name").val();
		jsobj.diskettenumber = $("#diskettenumber").val();
		jsobj.insurance_id = $("#insurance_id").val();
		jsobj.fromdate = $("#fromdate").val();
		jsobj.todate = $("#todate").val();
		jsobj.registerdate = $("#registerdate").val();
		return jsobj;
	}
	
	function grid_createInsuranceDisketteFile(e) {
		var data = this.dataItem($(e.target).closest("tr"));
		jQuery.ajax({
            url:getBaseUrl() + "getCreateDiskettePopupPage/" + data.id + "/" + data.insurance_id,
            success:function(data){
                $("#createDiskette-modals").empty();
                $("#createDiskette-modals").append('<div id="myInsuranceDisketteDetailPopup" class="uk-modal">');
                $("#myInsuranceDisketteDetailPopup").append(data);
    	        var modal = new $.UIkit.modal.Modal("#myInsuranceDisketteDetailPopup");
    	        $("#myInsuranceDisketteDetailPopup").on(
    	                {
    	                    'uk.modal.hide': function(){
    	                        $("#createDiskette-modals").empty();
    	                    }
    	                }
    	        );
    	        modal.show();
            },
            async :false
        });
	}
</script>
