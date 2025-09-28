<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<input name="loadedId" type="hidden" id="loadedId" />
 
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
		<div id="body-heade-save-div" style="display:none;">
			<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create" onClick="javascript:ajax_new_reload()"/>
			<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="body-heade-save" />
			<base:buttonPermission key="global.crud.view" classNames="uk-button uk-button-success" id="body-heade-view" onClick="javascript:goToView()"/>
			<base:buttonPermission key="global.crud.back" classNames="uk-button uk-button-success" id="backCashPermissionBtn" onClick="javascript:changeCashPermissionState(1)"/>
			<base:aPermission classNames="uk-button uk-button-danger" id="breadcrumb-main-section-cancel" key="global.crud.cancel" />
		</div>
	</div>
</div>

<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id">
		<input type="hidden" id="state" name="state">
		<input type="hidden" id="registrant" name="registrant">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="serial" key="com.artonis.fnc.treasury.payment.cashPermission.serial"/>
			<base:mDatePicker styleClass="small" name="registerDate" key="com.artonis.fnc.treasury.payment.cashPermission.registerDate"/>
			<base:testBox styleClass="small" name="stateStr" key="com.artonis.fnc.treasury.payment.cashPermission.state" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="registrantText" key="com.artonis.fnc.treasury.payment.cashPermission.registrant" disabled="true"/>
			<base:comboBox styleClass="small" name="type" comboLoaderUrl="combo/loadAllCashRequestType" key="com.artonis.fnc.treasury.payment.cashPermission.type"/>
		</div>
	<div class="uk-grid uk-grid-preserve">
	</div>
		<div class="uk-grid uk-grid-preserve" align="center">
		    <base:buttonPermission key="com.artonis.fnc.treasury.payment.cashPermission.saveCashPermission" classNames="uk-button uk-button-success" id="saveCashPermissionBtn" onClick="javascript:saveCashPermission()" style="background-color: rgb(175,214,101);width: 10%;"/>
		</div>
	</form>
	<base:itemForm titleKeys="com.artonis.fnc.treasury.payment.cashPermissionReceiver,com.artonis.fnc.treasury.payment.cashPermissionPayer"
				   formItemTabViewJspFiles="CashPermissionReceiverItemTabView.jsp,CashPermissionPayerItemTabView.jsp"
				   formItemTabInputs="CashPermissionReceiverItemTabInput,CashPermissionPayerItemTabInput"
	 			   insertWithoutPopup="true" masterIdStr="cashPermission_id"/>
</div>
<script type="text/javascript">
function saveCashPermission(){
      save();
}
function callback_save_success(){
	$.getJSON(getBaseUrl() + '/load/' + document.getElementById("loadedId").value, function(data) {
		$('#mainForm').deserialize(data);
	});
}
function callback_deserialize(data){
	
}
function changeCashPermissionState(newState){
	if ($("#id").val()!=null && $("#id").val()>0){
		var cashPermission = {};
		cashPermission.id=$("#id").val();
		cashPermission.state=newState;
		$.ajax({
			url: '${pageContext.request.contextPath}'+'/fnc/treasury/payment/cashPermission/changeCashPermissionState',
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(cashPermission),
			dataType: 'json',
			type: 'POST',
			success: function (data, success, xhr) {
	            if (data.state == "error") {
	                for (var i = 0; i < data.errors.length; i++) {
	                    if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
	                        alertify.error($("label[for='" + data.errors[i].Field + "']").text() + "  " + data.errors[i].Message);
	                    } else {
	                        alertify.error(data.errors[i].Field + "  " + data.errors[i].Message);
	                    }
	                }
	            }else{
					$('#state').val(data.newStateValue);
					$('#stateStr').val(data.newStateText);
				}
			},
			error: function (e) {
				alert('Error: ' + e.responseText);
			}
		});
	}else{
		alert(":\ ابتدا درخواست  را ذخیره کنید");
	}
}
function goToView(){
	window.location = "${pageContext.request.contextPath}"+"/fnc/treasury/payment/cashPermission/";
}
</script>