<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=ResourceBoundleHolder.resourceBundle.getString("fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.viewChequeBooklet")%></span></li>
	</ul>
	  <div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
	   </div>
</div>

<div class="uk-container uk-container-center my-uk-container" >
<form class="uk-form" id="mainForm">
	<div class="uk-grid uk-grid-preserve">

		    <base:comboBoxAutoComplete name="bank_id" styleClass="small" key="fnc.treasury.basicInfo.bankAndBranch.bank.name" comboLoaderUrl="combo/loadAllBank" dataTextField="name" dataValueField="id" minLength="0"
                    hasTemplate="true" headerTemplateComaSep="fnc.treasury.basicInfo.bankAndBranch.bank.name" templateComaSep="name"/>       
	        <base:cascadeComboBox selectIndex="0" styleClass="small" name="branch_id" key="fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.branch" cascadeCombo="bank_id" comboLoaderUrl="combo/loadAllBranch"/>
		    <base:cascadeComboBox selectIndex="0" styleClass="small" name="bankAccount_Id" key="fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.bankAccount" cascadeCombo="branch_id" comboLoaderUrl="combo/loadAllBankAccount"/>	
		
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="number" key="fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.number"/>
			<base:testBox styleClass="small" name="beginSerial" key="fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.beginSerial"/>			
			<base:testBox styleClass="small" name="endSerial" key="fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.endSerial"/>			
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="serial" key="fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.serial"/>				
			<base:comboBox name="count" value="name" key="fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.count" comboLoaderUrl="combo/loadAllChequeBookletCount" styleClass="small" />
	   </div>
	<base:my-grid-search >
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.bank'  field="bank_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.branch'  field="branch_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.bankAccount'  field="bankAccount_number" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.number'  field="number" width="30px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.count'  field="count" width="25px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.beginSerial'  field="beginSerial" width="25px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.endSerial'  field="endSerialText" width="25px"/>
    <base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.state'   field="stateStr" width="25px"/>
    <base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.activeInactive' isFlag="true" flagIconUrl="/resources/images/black/button-check.png" flagDestinationUrl="activeInActiveChequeBooklet"  field="activeInactive" width="30px"/>

        <base:my-grid-schema-field name="bank_name" type="string"/>
        <base:my-grid-schema-field name="branch_name" type="string"/>
        <base:my-grid-schema-field name="bankAccount_number" type="string"/>
        <base:my-grid-schema-field name="number" type="string"/>
        <base:my-grid-schema-field name="count" type="string"/>
        <base:my-grid-schema-field name="beginSerial" type="string"/>
        <base:my-grid-schema-field name="endSerialText" type="string"/>
        <base:my-grid-schema-field name="stateStr" type="string"/>
        <base:my-grid-function text="fnc.treasury.basicInfo.bankAndBranch.chequeBooklet.view" functionClick="grid_onGoToChequeBookletView"  name="visit"/>
</base:my-grid-search>
   </form>
   </div>
   <base:footer/>
<script >
          function grid_onGoToChequeBookletView(e){
     
			    	var data = this.dataItem($(e.target).closest("tr"));
			        window.location = getBaseUrl() + "/search/chequeBookletItemView/" + data.id;
		  }
			function getSearchObject(){
					var chequeBookletVar = {};
					chequeBookletVar.bank_id=$("#bank_id").val();
					chequeBookletVar.branch_id=$("#branch_id").val();
					chequeBookletVar.bankAccount_id=$("#bankAccount_id").val();
					chequeBookletVar.beginSerial=$("#beginSerial").val();
					chequeBookletVar.number=$("#number").val();
					chequeBookletVar.count=$("#count").val();
					chequeBookletVar.endSerial=$("#endSerial").val();
					return chequeBookletVar;
			}
</script>

