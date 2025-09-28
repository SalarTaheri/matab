<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="state" name="state" >
		<div class="uk-grid uk-grid-preserve">
          <base:comboBoxAutoComplete name="bank_id" styleClass="midsmall" iscomboLoaderUrlRelative="true" key="fnc.treasury.basicInfo.bankAndBranch.bank.name" comboLoaderUrl="combo/loadAllBank" dataTextField="name" dataValueField="id" minLength="0"
                    hasTemplate="true" headerTemplateComaSep="fnc.treasury.basicInfo.bankAndBranch.bank.name" templateComaSep="name"/>       
			 <base:cascadeComboBox selectIndex="0" styleClass="midsmall" name="branch_id" key="fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.branch" cascadeCombo="bank_id" comboLoaderUrl="combo/loadAllBranch"/>
			 <base:cascadeComboBox selectIndex="0" styleClass="midsmall" name="bankAccount_id" key="fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.bankAccount" cascadeCombo="branch_id" comboLoaderUrl="combo/loadAllBankAccount"/>	
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="number" key="fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.number"/>
			<base:testBox styleClass="midsmall"  name="beginSerial" key="fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.beginSerial"/>			
			<base:comboBox name="count" value="name" key="fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.count" comboLoaderUrl="combo/loadAllChequeBookletCount" styleClass="midsmall" />
			<base:testBox styleClass="verysmall" name="countNumber" key="fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.countNumber" disabled="true"/>
		
		</div>
<script type="text/javascript">
$(document).ready(function(){
	checkCustomCountState();
});

function checkCustomCountState(){
	if($('#count_Comb').val()=='0'){
		$('#countNumber').removeAttr('disabled');
		$('#countNumber').css('background','');
	}else{
		$('#countNumber').val('');
		$('#countNumber').attr('disabled','true');
		$('#countNumber').css('background','rgb(206, 215, 235)');
	}
}
function callback_change_count(e){
	checkCustomCountState();
}
function callback_DataBound_count(data){
	var countVal = $('#count_Comb').val();
	if(countVal!='10' && countVal!='25' && countVal!='40' && countVal!='50' && countVal!='100'){
		$("#count_Comb").data("kendoComboBox").select(0);
		$('#countNumber').removeAttr('disabled');
		$('#countNumber').css('background','');
		$('#countNumber').val(countVal);
	}
	checkCustomCountState();
}
</script>
