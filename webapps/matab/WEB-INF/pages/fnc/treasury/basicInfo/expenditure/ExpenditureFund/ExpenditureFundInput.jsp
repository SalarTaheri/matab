<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=ResourceBoundleHolder.resourceBundle.getString("fnc.treasury.basicInfo.expenditure.expenditureFund.generate")%></span></li>
	</ul>
</div>
<input name="loadedId" type="hidden" id="loadedId" />

<div id="header-toolbar" align="right">
		<base:buttonPermission key="fnc.btn.new" classNames="uk-button" id="expenditureFundInput-new-btn" onClick="javascript:reload()"/>
		<base:buttonPermission key="fnc.btn.register" classNames="uk-button" id="bankingBillInput-register-btn" onClick="javascript:changeExpenditureState(2)" />
		<base:buttonPermission key="fnc.btn.back" classNames="uk-button" id="expenditureFundInput-back-btn" onClick="javascript:changeExpenditureState(1)" />
		<base:buttonPermission key="fnc.btn.delete" classNames="uk-button" id="expenditureFundInput-delete-btn" />
		<base:buttonPermission key="fnc.btn.view" classNames="uk-button" id="expenditureFundInput-view-btn" onClick="javascript:goToView()"/>
		<base:buttonPermission key="fnc.btn.print" classNames="uk-button" id="expenditureFundInput-print-btn" />
</div>

<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="state" name="state" >
		<input type="hidden" id="registerer" name="registerer" >
		
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="serial" key="fnc.treasury.basicInfo.expenditure.expenditureFund.serial" />
			<base:mDatePicker styleClass="small" name="date" key="fnc.treasury.basicInfo.expenditure.expenditureFund.date"/>
			<base:testBox styleClass="small" name="stateText" key="fnc.treasury.basicInfo.expenditure.expenditureFund.state" disabled="true"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<!--<base:comboBox  name="expenditurer_id" value="name" key="fnc.treasury.basicInfo.expenditure.expenditureFund.expenditurer_id"
						comboLoaderUrl="combo/loadAllExpenditurer" styleClass="small" /> -->
			<base:testBox styleClass="small" name="registererText" key="fnc.treasury.basicInfo.expenditure.expenditureFund.registerer" disabled="true" />
		</div>
		<div class="uk-grid uk-grid-preserve">
		</div>
	    <div align="center" style="padding-center: 80px">
	    	<base:buttonPermission key="fnc.treasury.basicInfo.expenditure.expenditureFund.save" classNames="uk-button" onClick="javascript:saveExpenditureFund();" style="background-color: rgb(175,214,101);" id="saveExpenditureFundBtn"/>
		</div>
	</form>
	<base:itemForm titleKeys="fnc.treasury.basicInfo.expenditure.expenditureFund.expenditureItem,fnc.treasury.basicInfo.expenditure.expenditureFund.expenseFundItem,fnc.treasury.basicInfo.expenditure.expenditureFund.appendixItem"
					masterIdStr="expenditurefund_id" insertWithoutPopup="true"
					formItemTabViewJspFiles="ExpenditurefundExpenditureItemTabView.jsp,ExpenditureFundExpenseFundItemTabView.jsp,ExpenditureFundAppendixItemTabView.jsp"
					formItemTabInputs="ExpenditurefundExpenditureItemTabInput,ExpenditureFundExpenseFundItemTabInput,ExpenditureFundAppendixItemTabInput"/>

</div>
<script type="text/javascript">
function saveExpenditureFund(){
	save();
}
function goToView(){
	window.location = "${pageContext.request.contextPath}"+"/fnc/basicInfo/expenditure/expenditureFund/";
}
function changeExpenditureState(newState){
	if ($("#id").val()!=null && $("#id").val()>0){
		var expenditureFund = {};
		expenditureFund.id=$("#id").val();
		expenditureFund.state=newState;
		$.ajax({
			url: '${pageContext.request.contextPath}'+'/fnc/basicInfo/expenditure/expenditureFund/changeExpenditureState',
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(expenditureFund),
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
					$('#stateText').val(data.newStateText);
				}
			},
			error: function (e) {
				alert('Error: ' + e.responseText);
			}
		});
	}else{
		alert(":\ ابتدا قبض را ذخیره کنید");
	}
}
function callback_validation_before_save_ExpenditureFundExpenseFundItem(tmp){
  return validationSavePicker_expensefundAccountCoding_id();
}

function doAfterSave_ExpenditureFundExpenseFundItem(){
    $("#expensefundAccountCoding_id").val("");
    $("#expenseFundFloatAccountLevel1_id").val("");
	$("#expenseFundFloatAccountLevel2_id").val("");
	$("#expenseFundFloatAccountLevel3_id").val("");
	$("#expenseFundFloatAccountLevel4_id").val("");
	$("#expensefundAccountCoding_id_Comb").data("kendoComboBox").value("");
	$("#expenseFundFloatAccountLevel1_id_Comb").data("kendoComboBox").value("");
	$("#expenseFundFloatAccountLevel2_id_Comb").data("kendoComboBox").value("");
	$("#expenseFundFloatAccountLevel3_id_Comb").data("kendoComboBox").value("");
	$("#expenseFundFloatAccountLevel4_id_Comb").data("kendoComboBox").value("");
   	$("#expenseFundFloatAccountLevel1_id_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%; background: rgb(206, 215, 235);"
   	$("#expenseFundFloatAccountLevel1_id_Comb").data("kendoComboBox").enable(false);
   	$("#expenseFundFloatAccountLevel2_id_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%; background: rgb(206, 215, 235);"
   	$("#expenseFundFloatAccountLevel2_id_Comb").data("kendoComboBox").enable(false);
   	$("#expenseFundFloatAccountLevel3_id_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%; background: rgb(206, 215, 235);"
   	$("#expenseFundFloatAccountLevel3_id_Comb").data("kendoComboBox").enable(false);
   	$("#expenseFundFloatAccountLevel4_id_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%; background: rgb(206, 215, 235);"
   	$("#expenseFundFloatAccountLevel4_id_Comb").data("kendoComboBox").enable(false);
  // 	checkForDisabled();
}


</script>