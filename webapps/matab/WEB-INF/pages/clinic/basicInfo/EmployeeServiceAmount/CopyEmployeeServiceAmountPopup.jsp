<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<div id="employeeServiceAmountCopyPopup" style="border: 1">
    <h3 style="">کپی مبلغ خدمات پرسنل</h3>
    <div id="employeeServiceAmountCopyPopup_back">
        <div  class="uk-container uk-container-center my-uk-container" style="margin-top: 5px; margin-bottom: 5px;padding-top: 5px;padding-bottom: 5px;">
            <form class="uk-form" id="popupForm">
                <div class="uk-grid uk-grid-preserve">
					<base:mDatePicker styleClass="small" name="fromDate" key="com.artonis.clinic.basicInfo.employeeServiceAmount.fromDate"/>
					<base:mDatePicker styleClass="small" name="toDate" key="com.artonis.clinic.basicInfo.employeeServiceAmount.toDate"/>
					<button class="uk-button uk-button-success uk-modal-close" type="button" onclick="javascript:popupCopy()" id="copyBtn" style="margin-right: 15%; padding-right: 5%; padding-left: 5%">
						<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.employeeServiceAmount.copyItem")%>
					</button>
                </div>
            </form>
		</div>
    </div>
</div>
<style>
	.uk-modal-dialog{
		padding-top: 2px;
		padding-bottom: 5px;
		top: 100px;
		padding-right: 5px;
		padding-left: 5px;
		width: 45%;
	}
	.my-popup-title{
		display: none;
	}
	.my-popup-body{
		padding-top: 5px;
		padding-bottom: 5px;
		padding-right: 5px;
		padding-left: 5px;
	}
	.my-uk-container{
		margin-top: 5px;
		margin-bottom: 5px;
		padding-top: 5px;
		padding-bottom: 5px;
		margin-right: 0px;
		margin-left: 0px;
		padding-right: 2px;
		padding-left: 2px;
	}
</style>
<script>
function popupCopy(){
	var fromDate = $("#popupForm input[name='fromDate']").val().replace(/\//g, ':@:');
	var toDate = $("#popupForm input[name='toDate']").val().replace(/\//g, ':@:');
	var employeeServiceAmountId = $("#modal-copyItem_popup")[0].getAttribute("data-employeeServiceAmountid");
	if(fromDate != "" && toDate != ""){
		var requestUrl = "${pageContext.request.contextPath}"+"/clinic/basicInfo/employeeServiceAmount/employeeServiceAmountCopy/" 
				+ employeeServiceAmountId + "/" + fromDate + "/" + toDate ;
		$.getJSON(requestUrl, function (result) {
			 if (result.state == "error") {
             	alertify.error(result.message);
             }
             if (result.state == "success") {
                alertify.success(result.message);
                $("#grid").data("kendoGrid").dataSource.read();
             }
		});
	}else{
         alertify.error("فیلدهای از تاریخ و تا تاریخ باید مقداردهی شوند");
	}
}
</script>