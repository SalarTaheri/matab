<%@ page import="java.util.ResourceBundle" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span> <%=resource.getString("fnc.treasury.basicInfo.bankAndBranch.bankAccount.view")%></span></li>
	</ul>
	  <div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
	   </div>
</div>

<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 4px; ">
    <form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
		   <base:comboBoxAutoComplete name="bank_id" styleClass="midsmall" key="fnc.treasury.basicInfo.bankAndBranch.bank.name" comboLoaderUrl="/combo/loadAllBank" dataTextField="name" dataValueField="id" minLength="0"
                    hasTemplate="true" headerTemplateComaSep="fnc.treasury.basicInfo.bankAndBranch.bank.name" templateComaSep="name" iscomboLoaderUrlRelative="true"/>
		    		<base:cascadeComboBox selectIndex="0" styleClass="midsmall" name="branch_id" key="fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.branch" cascadeCombo="bank_id" comboLoaderUrl="combo/loadAllBranch"/>
					<base:cascadeComboBox selectIndex="0" styleClass="midsmall" name="number" key="fnc.treasury.basicInfo.bankAndBranch.bankAccount.number" cascadeCombo="branch_id" comboLoaderUrl="combo/loadAllBankAccount"/>	
		 </div>

		<div class="uk-grid uk-grid-preserve">
				<base:comboBox name="type" value="name" key="fnc.treasury.basicInfo.bankAndBranch.bankAccount.currencyType" comboLoaderUrl="combo/loadAllCurrencyType" styleClass="midsmall" />
				<base:comboBox name="accountType" value="name" key="fnc.treasury.basicInfo.bankAndBranch.bankAccount.type" comboLoaderUrl="combo/loadAllBankAccounTypes" styleClass="midsmall" />
		</div>
	</form>	 
</div>
	<base:my-grid-search>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.bank.name'  field="bnak_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.branch.name'  field="branch_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.bankAccount.number'  field="number" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.bankAccount.currencyType'  field="typeText" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.bankAccount.type'  field="accountTypeText" width="50px"/>

    <base:my-grid-schema-field name="bnak_name" type="string"/>
    <base:my-grid-schema-field name="branch_name" type="string"/>
    <base:my-grid-schema-field name="number" type="string"/>
    <base:my-grid-schema-field name="typeText" type="string"/>
     <base:my-grid-schema-field name="accountTypeText" type="string"/>
</base:my-grid-search>
<base:footer/>


<script>
function getSearchObject(){
		var bankAccountVar = {};
		bankAccountVar.bank_id=$("#bank_id").val();
		bankAccountVar.branch_id=$("#branch_id").val();
		bankAccountVar.number=$("#number").val();
		bankAccountVar.type=$("#type").val();
		bankAccountVar.accountType=$("#accountType").val();
		return bankAccountVar;
}

function callback_change_bank_id(e){
	    $("#branch_id").val('');
        var kendoComboBox=$("#branch_id_Comb").data("kendoComboBox");
        kendoComboBox.dataSource.read({
            filter: { field: "bank_id", operator: "eq", value: e.sender._old },
            page : 1,
            pageSize : 1
        });
}
</script>
