<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="hasChild" name="hasChild" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" styledivLabel="width:10%;padding-right:2%" name="name" key="fnc.generalAccounting.accounting.group.name"/>
			<base:testBox styleClass="midsmall" styledivLabel="width:25%" name="code" key="fnc.generalAccounting.accounting.group.code"/>
		</div>
        <div class="uk-grid uk-grid-preserve">
        	<base:comboBox styleClass="midsmall" name="accounttype_id" key="fnc.generalAccounting.accounting.type" comboLoaderUrl="/combo/loadAllAccountCodingType"/>
            <base:comboBox styleClass="midsmall" styledivLabel="width:25%" name="nature" key="fnc.generalAccounting.accounting.nature" comboLoaderUrl="/combo/loadAllAccountCodingNature"/>
		</div>
		 <div class="uk-grid uk-grid-preserve" id="gainLossTypediv">
		    <base:comboBox styleClass="midsmall" name="gainLossType" key="fnc.generalAccounting.accounting.gainLossType" comboLoaderUrl="/combo/loadAllAccountCodingGailLossType"/>
		 </div>
	</form>
</div>
<script type="text/javascript">
function callback_change_accounttype_id(e){
	hideShowGainLossType();
}
function callback_DataBound_accounttype_id(data){
	hideShowGainLossType();
}
function hideShowGainLossType(){
	var accountTypeVal = $("#accounttype_id_Comb").data("kendoComboBox")._selectedValue;
	if (accountTypeVal != null && accountTypeVal == 2){
		$("#gainLossTypediv").show();
	}
	else
		$("#gainLossTypediv").hide();
	
}
</script>
