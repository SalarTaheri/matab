<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<script src="<c:url value='/resources/js/blockUI/blockUI.js' />"></script>

<base:pageHeader />
<base:pageInputHeader />

<div class="uk-container uk-container-center my-uk-container">

	<form class="uk-form" id="mainForm" style="margin-bottom: 15px;">
		<input type="hidden" id="id" name="id">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="name" key="com.artonis.clinic.operation.insuranceDiskette.name" />
			<base:testBox styleClass="small" name="diskettenumber" key="com.artonis.clinic.operation.insuranceDiskette.diskettenumber" />
			<base:comboBox name="insurance_id" key="com.artonis.clinic.operation.insuranceDiskette.insurance_id" comboLoaderUrl="combo/loadAllInsurance" styleClass="small" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="small" name="fromdate" key="com.artonis.clinic.operation.insuranceDiskette.fromdate" />
			<base:mDatePicker styleClass="small" name="todate" key="com.artonis.clinic.operation.insuranceDiskette.todate" />
			<base:mDatePicker styleClass="small" name="registerdate" key="com.artonis.clinic.operation.insuranceDiskette.registerdate" />
		</div>
	</form>
	
	<base:itemForm titleKeys="com.artonis.clinic.operation.insuranceDiskette.insuranceDiskettePrescribeHeader" masterIdStr="insuranceDisketteId" insertWithoutPopup="true"
			formItemTabViewJspFiles="InsuranceDiskettePrescribeHeaderTabView.jsp" formItemTabInputs="InsuranceDiskettePrescribeHeaderTabInput"/>

</div>

<script type="text/javascript">
	function callback_validation_before_save(){
		$("#body-table").block({ message: '<div><img  style="padding: 5px;" src="<c:url value='/resources/images/loader.gif'/>" /> لطفا  تا تکمیل فرآیند ساخت دیسکت بیمه صبر کنید ...</div>'});
		return true;
	} 
	
	function disableIfInEditMode(){
		var id = document.getElementById("id").value;
		if($.isNumeric(id) && id > 0){
			$("#insurance_id_Div *").attr("disabled", "disabled").off("click");
			$("#fromdate").attr("disabled", "disabled");
			$("#todate").attr("disabled", "disabled");
		}
	}

	function callback_save_success(result){
		$("#body-table").unblock();
		disableIfInEditMode();
		//
		var urlGrid=$("#InsuranceDiskettePrescribeHeader").data("kendoGrid").dataSource.transport.options.read.url;
        var indexnumber = urlGrid.valueOf().lastIndexOf("/");
        var subUrlGrid = urlGrid.valueOf().substring(0, indexnumber);
        urlGrid = subUrlGrid.valueOf()+"/" + document.getElementById("id").value;
        $("#InsuranceDiskettePrescribeHeader").data("kendoGrid").dataSource.transport.options.read.url = urlGrid;
		$("#InsuranceDiskettePrescribeHeader").data("kendoGrid").dataSource.read();
	}
	
	function callback_save_error(result){
		$("#body-table").unblock();
		disableIfInEditMode();
	}
	
	function callback_deserialize(){
		disableIfInEditMode();
	}
	
	function callback_afterSerialize(tmp){
		tmp.insurance_id = $("input[id='insurance_id']").val();
		tmp.fromdate = $("input[id='fromdate']").val();
		tmp.todate = $("input[id='todate']").val();
		return tmp;
	}
</script>

<style>
	.item-input-background{
		display: none;
	}
</style>