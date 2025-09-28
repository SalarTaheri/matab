<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
        String basePath = request.getAttribute("controllerBasePath").toString();
%>

<base:pageHeader/>

<div class="uk-container uk-container-center my-uk-container" >

<form class="uk-form" id="mainForm">
		<div id="modal-copyItem" style="display: inline;">
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="insuranceOrganizationId" comboLoaderUrl="/combo/loadInsuranceOrganization" minLength="0" styleClass="small"
					key="com.artonis.clinic.basicInfo.insuranceContract.insuranceOrganizationId"/>
			<base:mDatePicker styleClass="small" name="fromDate" key="com.artonis.clinic.basicInfo.insuranceContract.fromDate"/>
			<base:mDatePicker styleClass="small" name="toDate" key="com.artonis.clinic.basicInfo.insuranceContract.toDate"/>
		</div>
		
		<base:my-grid-search >
			<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContract.insuranceOrganizationId'  field="insuranceOrganizationName" width="50px"/>
			<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContract.fromDate'  field="fromDate" width="50px"/>
			<base:my-grid-column title='com.artonis.clinic.basicInfo.insuranceContract.toDate'  field="toDate" width="50px"/>
			
			<base:my-grid-function  name="insuranceContractCopy" styleClass="uk-button-primary" functionClick="grid_copyItem" 
					text="com.artonis.clinic.basicInfo.insuranceContract.copyItem"/>
		</base:my-grid-search>
</form>

</div>

<base:footer/>

<script type="text/javascript">
function getSearchObject(){
	var jsobj = {};
	jsobj.insuranceOrganizationId=$("#insuranceOrganizationId").val();
	jsobj.fromDate=$("#fromDate").val();
	jsobj.toDate=$("#toDate").val();
	return jsobj;
}

function grid_copyItem(e){
	var data = this.dataItem($(e.target).closest("tr"));
	var ic_id = data.id;
    if (e) {
		var modal ;
	    $(function() {
            var popUpUrl = '<%=basePath%>' + "/popup/copyInsuranceContract";
            $.get(popUpUrl , function (data) {
                $("#modal-copyItem").empty();
                var id = "modal-copyItem_popup";
                $("#modal-copyItem").append('<div id="' + id + '" class="uk-modal" data-insuranceContractId="' + ic_id + '">');
                $("#" + id).append(data);
                modal = new $.UIkit.modal.Modal("#" + id);
                $("#" + id).on(
                    {
                        'uk.modal.hide':function () {
                            $("#modal-copyItem").empty();
                        }
                    }
                );
                modal.show();
            });
	    });
    }
}
</script>