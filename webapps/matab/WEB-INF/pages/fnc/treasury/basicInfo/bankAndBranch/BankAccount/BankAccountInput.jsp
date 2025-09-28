<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
        <base:comboBoxAutoComplete name="bank_id" styleClass="midsmall" key="fnc.treasury.basicInfo.bankAndBranch.bank.name" comboLoaderUrl="/combo/loadAllBank" dataTextField="name" dataValueField="id" minLength="0"
                    hasTemplate="true" headerTemplateComaSep="fnc.treasury.basicInfo.bankAndBranch.bank.name" templateComaSep="name" iscomboLoaderUrlRelative="true"/>
		    		<base:cascadeComboBox selectIndex="0" styleClass="midsmall" name="branch_id" key="fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.branch" cascadeCombo="bank_id" comboLoaderUrl="combo/loadAllBranch"/>
		    		<base:testBox styleClass="midsmall" name="number" key="fnc.treasury.basicInfo.bankAndBranch.bankAccount.number"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="type" value="name" key="fnc.treasury.basicInfo.bankAndBranch.bankAccount.currencyType" comboLoaderUrl="combo/loadAllCurrencyType" styleClass="midsmall" />
			<base:comboBox name="accountType" value="name" key="fnc.treasury.basicInfo.bankAndBranch.bankAccount.type" comboLoaderUrl="combo/loadAllBankAccounTypes" styleClass="midsmall" />
		</div>
	
	</form>
</div>
<script type="text/javascript">
//function callback_change_bank_id(e){
//	    $("#branch_id").val('');
//        var kendoComboBox=$("#branch_id_Comb").data("kendoComboBox");
//        kendoComboBox.dataSource.read({
//            filter: { field: "bank_id", operator: "eq", value: e.sender._old },
//            page : 1,
//            pageSize : 1
//        });
//}
</script>
