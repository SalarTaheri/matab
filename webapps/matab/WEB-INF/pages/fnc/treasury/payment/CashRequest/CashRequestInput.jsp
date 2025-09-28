<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>

		<div id="body-heade-save-div" style="display:none;">
			<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create" onClick="javascript:ajax_new_reload()"/>
			<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="saveCashRequestBtn" onClick="javascript:saveCashRequest()"/>
			<base:buttonPermission key="global.crud.back" classNames="uk-button uk-button-success" id="backCashReuqestBtn" onClick="javascript:changeCashRequestState(1)"/>
			<base:buttonPermission key="global.crud.saveAndClose" classNames="uk-button uk-button-success" id="body-heade-saveAndClose"/>
		</div>
	</div>
</div>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id">
		<input type="hidden" id="state" name="state" >
		<input type="hidden" id="loadedId" name="loadedId">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="verysmall" name="serial" key="com.artonis.fnc.treasury.payment.cashRequest.serial"/>
			<base:comboBox  name="demandant" value="name" key="com.artonis.fnc.treasury.payment.cashRequest.demandant"
						comboLoaderUrl="combo/loadAllExpenditurer" styleClass="small" minLength="0"/>
			<base:mDatePicker styleClass="small" name="registerDate" key="com.artonis.fnc.treasury.payment.cashRequest.registerDate"/>			
		</div>
		
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="verysmall" name="amount" key="com.artonis.fnc.treasury.payment.cashRequest.amount"/>
			<base:comboBox styleClass="small" name="requestType" comboLoaderUrl="combo/loadAllCashRequestType" key="com.artonis.fnc.treasury.payment.cashRequest.requestType"/>
			<base:testBox styleClass="small" name="stateStr" key="com.artonis.fnc.treasury.payment.cashRequest.state" disabled="true"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea name="description" divWidthVal="40" key="com.artonis.fnc.treasury.payment.cashRequest.description"/>
		</div>
		<div dir="ltr" align="center" style="background: rgb(216, 216, 216);">
		    <base:buttonPermission key="com.artonis.fnc.treasury.payment.saveCashRequest" classNames="uk-button uk-button-success" id="savepaymentBillBtn" onClick="javascript:savePaymentBill()" style="background-color: rgb(175,214,101);width: 10%;"/>
		</div>
		
	</form>
</div>
<script>
function restPageClientSide(){
	$('#amount_txt').val('');
	var combobox_state = $("#state_Comb").data("kendoComboBox");
	combobox_state.select(1);
}
function saveCashRequest(){
	var data = {};
	data.id=$("#id").val();
	data.serial=$("#serial").val();
	data.demandant=$("#demandant").val();
	data.registerDate=$("#registerDate").val();
	data.amount=$("#amount").val();
	data.requestType=$("#requestType").val();
	data.description=$("#description").val();
	data.state=1;

	$.ajax({
		url: '${pageContext.request.contextPath}'+'/fnc/treasury/payment/cashRequest/save',
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(data),
		dataType: 'json',
		type: 'POST',
		success: function (data) {
               if (data.state == "error"){
                   for (var i = 0; i < data.errors.length; i++) {
                       if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
                           alertify.error($("label[for='" + data.errors[i].Field + "']").text() + ":  " + data.errors[i].Message);
                       } else {
                           alertify.error(data.errors[i].Field + ":  " + data.errors[i].Message);
                       }
                   }
               }else{
               	alertify.success(data.message);
                  if(data.cashRequestState==1){
				
					$("#id").val(data.baseObjectId);
					$("#stateStr").val(data.stateStr);
					}
					else{
					ajax_new_reload();
					}
					
               }
		},
		error: function (e) {
			alert('Error: ' + e.responseText);
		}
	});
}
function changeCashRequestState(newState){
	if ($("#id").val()!=null && $("#id").val()>0){
		var cashRequest = {};
		cashRequest.id=$("#id").val();
		cashRequest.state=newState;
		$.ajax({
			url: '${pageContext.request.contextPath}'+'/fnc/treasury/payment/cashRequest/changeCashRequestState',
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(cashRequest),
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
</script>
