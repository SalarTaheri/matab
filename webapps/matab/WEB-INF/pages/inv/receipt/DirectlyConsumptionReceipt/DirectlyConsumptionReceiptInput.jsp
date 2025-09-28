<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="registerBtn" onClick="javascript:changeDirectlyConsumptionReceiptState(2)" />
			<base:buttonPermission key="global.crud.back" classNames="uk-button uk-button-success" id="backDirectlyConsumptionReceiptBtn" onClick="javascript:changeDirectlyConsumptionReceiptState(1)"/>
			<base:buttonPermission key="global.crud.view" classNames="uk-button uk-button-success" id="body-heade-view" onClick="javascript:goToView()"/>
			<base:aPermission classNames="uk-button uk-button-danger" id="breadcrumb-main-section-cancel" key="global.crud.cancel" />
		</div>
	</div>
</div>
   <input name="loadedId" type="hidden" id="loadedId" />
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
	    <input type="hidden" id="financeYear_id" name="financeYear_id" >
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="state" name="state" >
		<input type="hidden" id="exporter" name="exporter" >
		<div class="uk-grid uk-grid-preserve">
			 <base:testBox styleClass="small"  name="docType" disabled="true" dataIgnore="true" key="com.artonis.inv.operation.beginPeriodReceipt.documentType"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="serial" key="com.artonis.inv.receipt.directlyConsumptionReceipt.serial"/>
			<base:testBox styleClass="small" name="reference" key="com.artonis.inv.receipt.directlyConsumptionReceipt.reference"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="stateStr" disabled="true" key="com.artonis.inv.receipt.directlyConsumptionReceipt.state"/>
			<base:mDatePicker styleClass="small" name="date_" key="com.artonis.inv.receipt.directlyConsumptionReceipt.date_"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small"  name="exporterText" disabled="true" dataIgnore="true" key="com.artonis.inv.operation.beginPeriodReceipt.exporter"/>
            <base:comboBoxAutoComplete styleClass="small" name="businessPartner_id"
                                       key="com.artonis.inv.receipt.purchaseReceipt.businessPartner_id"
                                       comboLoaderUrl="combo/loadAllBusinessPartner" dataTextField="nameAndFamily"
                                       dataValueField="id" minLength="0" iscomboLoaderUrlRelative="true"
                                       hasTemplate="false"
                                       headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name"
                                       templateComaSep="nameAndFamily"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
	    </div>
	   <div dir="ltr" align="center" style="background: rgb(216, 216, 216);">
		    <base:buttonPermission key="com.artonis.inv.operation.directlyConsumptionReceipt.saveDirectlyConsumption" classNames="uk-button uk-button-success" id="saveDirectlyConsumptionReceiptBtn" onClick="javascript:saveDirectlyConsumptionReceipt()" style="background-color: rgb(175,214,101);width: 10%;"/>
	   </div>
	
	</form>
	  <base:itemForm insertWithoutPopup="true" formItemTabInputs="DirectlyConsumptionReceiptGoodsItemTabInput,DirectlyConsumptionReceiptAdditionSubtractionItemTabInput" 
	  masterIdStr="directlyConsumptionReceipt_id" 
	  titleKeys="com.artonis.inv.receipt.directlyConsumptionReceiptGoods,com.artonis.inv.receipt.directlyConsumptionReceiptAdditionSubtraction" 
	  formItemTabViewJspFiles="DirectlyConsumptionReceiptGoodsItemTabView.jsp,DirectlyConsumptionReceiptAdditionSubtractionItemTabView.jsp"></base:itemForm>
	  </div>
</div>
<script type="text/javascript">

 $(document).ready(function() {
     $("#docType").css('background-color','rgb(206, 215, 235)');
     $("#stateStr").css('background-color','rgb(206, 215, 235)');
     $("#reference").css('background-color','rgb(206, 215, 235)');
     $("#exporterStr").css('background-color','rgb(206, 215, 235)');
     $("#measureUnit").css('background-color','rgb(206, 215, 235)');
     $("#subMeasureUnit").css('background-color','rgb(206, 215, 235)');
     $("#hasTax").hide();
     
    });
    
 function saveDirectlyConsumptionReceipt(){
     save();
   }
 function goToView(){
	window.location = "${pageContext.request.contextPath}"+"/inv/receipt/directlyConsumptionReceipt/";
  }
  	function changeDirectlyConsumptionReceiptState(newState){
		if ($("#id").val()!=null && $("#id").val()>0){
		var DirectlyConsumptionReceipt = {};
		DirectlyConsumptionReceipt.id=$("#id").val();
		DirectlyConsumptionReceipt.state=newState;
		$.ajax({
			url: '${pageContext.request.contextPath}'+'/inv/receipt/directlyConsumptionReceipt/changeDirectlyConsumptionReceiptState',
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(DirectlyConsumptionReceipt),
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
		alert(":\ ابتدا رسید را ذخیره کنید");
	}
}
  </script>
