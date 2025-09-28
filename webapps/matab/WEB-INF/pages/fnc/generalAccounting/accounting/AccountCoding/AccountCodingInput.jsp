<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageHeader/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<%--<input  id="hasChild" name="hasChild" >--%>
		<input type="hidden" id="parent_id" name="parent_id" >
		<input type="hidden" id="accountgroup_id" name="accountgroup_id" >
		<input type="hidden" id="isLeaf" name="isLeaf" >
		<input type="hidden" id="level" name="level" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox  name="name" styleClass="normal" key="fnc.generalAccounting.accounting.account.name"/>
			<%--<base:testBox  name="code" key="fnc.generalAccounting.accounting.code"/>--%>
			<base:textBoxTwice  name="selfCode"  nameDisable="parentCode"  key="fnc.generalAccounting.accounting.account.code" />
		</div>
         <div class="uk-grid uk-grid-preserve">
        	<base:comboBox styleClass="small" name="accountType_id" key="fnc.generalAccounting.accounting.type" comboLoaderUrl="/combo/loadAllAccountCodingType"/>
            <base:comboBox styleClass="small" styledivLabel="width:25%" name="nature" key="fnc.generalAccounting.accounting.nature" comboLoaderUrl="/combo/loadAllAccountCodingNature"/>
		</div>
		 <div class="uk-grid uk-grid-preserve" id="gainLossTypediv">
		    <base:comboBox styleClass="normal" name="gainLossType" key="fnc.generalAccounting.accounting.gainLossType" comboLoaderUrl="/combo/loadAllAccountCodingGailLossType"/>
		 </div>
		 <% if (request.getAttribute("isLeaf") != null && request.getAttribute("isLeaf").equals(true)) {;%>
				 <div class="uk-grid uk-grid-preserve">
		 				<base:comboBoxAutoComplete-buttonAddToCombo name="oppositeAccountCodingId" styleClass="normal" key="fnc.generalAccounting.accounting.accountCoding.oppositeAccountCodingId"  popupUrlIsRelative="true"
                                     comboLoaderUrl="/combo/loadAllAccountCoding" dataTextField="nameCode" iscomboLoaderUrlRelative="true"
                                     dataValueField="id" minLength="0"
                                     hasTemplate="true"
                                     headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
                                     templateComaSep="name,code" popupUrl="/popup/treeAccountCoding"/>
				</div>
				<div class="uk-grid uk-grid-preserve">
					<base:checkbox name="amountable" key="fnc.generalAccounting.accounting.amountable" styleClass="small" style="width: 15px; margin-right: 10px"></base:checkbox>
					<base:checkbox name="followUpDate" key="fnc.generalAccounting.accounting.followUpDate" styleClass="small" style="width: 15px; margin-right: 10px"></base:checkbox>
					<base:checkbox name="exchange" key="fnc.generalAccounting.accounting.exchange" styleClass="small" style="width: 15px; margin-right: 10px"></base:checkbox>
				</div>
				<div class="uk-grid uk-grid-preserve">
					<base:checkbox name="currencyExchange" key="fnc.generalAccounting.accounting.currencyExchange" styleClass="small" style="width: 15px; margin-right: 10px"></base:checkbox>
					<base:checkbox name="analysable" key="fnc.generalAccounting.accounting.analysable" styleClass="small" style="width: 15px; margin-right: 10px"></base:checkbox>
					<base:checkbox name="inActive"  key="fnc.generalAccounting.accounting.inActive" styleClass="small" style="width: 15px; margin-right: 10px"></base:checkbox>
				</div>			
				<div class="uk-grid uk-grid-preserve">
					<base:mDatePicker styleClass="small" name="inActiveDate" key="fnc.generalAccounting.accounting.inActiveDate"/>
				</div><div class="uk-grid uk-grid-preserve">
					<base:mDatePicker styleClass="small" name="inActiveDate" key="fnc.generalAccounting.accounting.inActiveDate"/>
				</div>
		 <%} %>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox name="contraryNature"  key="fnc.generalAccounting.accounting.contraryNature" styleClass="small" style="width: 15px; margin-right: 10px"/>
		</div>
	</form>
</div>

<script type="text/javascript">

    function call_back_bindToEntityById(data){
        $("#parentTitle").text(data.parentTitle);
    }

    function customSerialize(tmp){
       tmp['parentCode']= $("#parentCode").val();
       return tmp;
    }
    
	$(document).ready(function(){
		//$("#name").val= "mehdi";
	});
	function callback_change_accountType_id(e){
		hideShowGainLossType();
	}
	function callback_DataBound_accountType_id(data){
		hideShowGainLossType();
	}
	function hideShowGainLossType(){
		var accountTypeVal =  $("#accountType_id").val()		
		if (accountTypeVal != null && accountTypeVal == 2){
			$("#gainLossTypediv").show();
		}
		else
			$("#gainLossTypediv").hide();
	}

	function cancel_account_id_Callback(){

        $("#item-modals-oppositeAccountCodingId").dialog('close');
	}

</script>
