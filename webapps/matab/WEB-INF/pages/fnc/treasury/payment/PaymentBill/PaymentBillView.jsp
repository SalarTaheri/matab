<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.fnc.treasury.payment.paymentBill.paymentBillview")%></span></li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
	 </div>
</div>
<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="fromSerial" key="com.artonis.fnc.treasury.payment.paymentBill.fromSerial"/>
			<base:testBox styleClass="midsmall" name="toSerial"  key="com.artonis.fnc.treasury.payment.paymentBill.toSerial"/>
		    <base:testBox styleClass="midsmall" name="fromReference" key="com.artonis.fnc.treasury.payment.paymentBill.fromReference"/>
			<base:testBox styleClass="midsmall" name="toReference"  key="com.artonis.fnc.treasury.payment.paymentBill.toReference"/>
		</div>
		    	
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="midsmall" name="fromDate" key="com.artonis.fnc.treasury.payment.paymentBill.fromDate"/>
		    <base:mDatePicker styleClass="midsmall" name="toDate" key="com.artonis.fnc.treasury.payment.paymentBill.toDate"/>
		    <base:comboBox  styleClass="midsmall"  name="cofferId" key="com.artonis.fnc.treasury.payment.paymentBill.coffer" comboLoaderUrl="combo/loadAllCoffer" />
   			<base:comboBox name="paymentType"  value="name" key="com.artonis.fnc.treasury.payment.paymentBill.paymentType" comboLoaderUrl="combo/loadAllPaymentTypes" styleClass="midsmall" />
		</div>
		    	
		<div class="uk-grid uk-grid-preserve">
			<base:comboBoxAutoComplete name="bank_Id" key="com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.bank_Id" comboLoaderUrl="combo/loadAllBank" dataTextField="name" dataValueField="id" minLength="0"
                  styleClass="midsmall" iscomboLoaderUrlRelative="true" hasTemplate="true" headerTemplateComaSep="com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.bank_Id" templateComaSep="name"/>       
			<base:cascadeComboBox  styledivLabel="margin-right:5px"  styleClass="midsmall" name="branch_Id" key="com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.branch_Id" cascadeCombo="bank_Id" comboLoaderUrl="combo/loadAllBranch"/>
		<base:cascadeComboBox selectIndex="0" styleClass="midsmall" name="bankAccount_Id" key="com.artonis.fnc.treasury.payment.paymentBillPaymentcheque.bankAccount_Id" cascadeCombo="branch_Id" comboLoaderUrl="combo/loadAllBankAccount"/>
			<base:comboBox name="state"  value="name" key="com.artonis.fnc.treasury.payment.paymentBill.state" comboLoaderUrl="combo/loadPaymentBillStates" styleClass="midsmall" styledivLabel="width:9.5%" />
		</div>
		
		<base:my-grid-search showMultipleDelete="false">			
        	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBill.serial'  field="serial" width="25px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBill.reference'  field="reference" width="25px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBill.date_'  field="date_" width="35px"/>		
	        <base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBill.cofferName'  field="cofferName" width="35px"/>		
	        <base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBill.paymentType'  field="paymentTypeStr" width="35px"/>		
	        <base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBill.state'  field="stateStr" width="30px"/>		   
	        <base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBill.totalTransfered' format="0:#,0"  field="totalPriceTransferedWithSeperator" width="50px"/>		
	        <base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBill.totalCoffer' format="0:#,0"  field="totalPriceCofferWithSeperator" width="50px"/>		
	        <base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBill.totalBankingBill' format="0:#,0"  field="totalPriceBankingBillWithSeperator" width="70px"/>		
	        <base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBill.totalPaymentCheque' format="0:#,0"  field="totalPriceChequeWithSeperator" width="70px"/>		
	        <base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBill.totalSum' format="0:#,0"  field="sumPriceOfItemsWithSeperator" width="40px"/>		
	        <base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiver.description'   field="description" width="70px"/>
			<base:my-grid-function text="fnc.generalAccounting.accountingDocuments.doc.print" functionClick="printPaymentBill"  name="paymentBillInput-print-btn"/>

	        <base:my-grid-schema-field name="serial" type="string"/>
	        <base:my-grid-schema-field name="reference" type="string"/>
	        <base:my-grid-schema-field name="date_" type="string"/>
	        <base:my-grid-schema-field name="cofferName" type="string"/>
	        <base:my-grid-schema-field name="paymentTypeStr" type="string"/>
	        <base:my-grid-schema-field name="stateStr" type="string"/>
	        <base:my-grid-schema-field name="totalPriceTransfered" type="string"/>
	        <base:my-grid-schema-field name="totalPriceCoffer" type="string"/>
	        <base:my-grid-schema-field name="totalPriceBankingBill" type="string"/>
	        <base:my-grid-schema-field name="totalPriceCheque" type="string"/>
	        <base:my-grid-schema-field name="sumPriceOfItems" type="string"/>
	        <base:my-grid-schema-field name="description" type="long"/>
		</base:my-grid-search>
		<div style="padding-top: 5px;" align="center">
		 		<base:searchGridMultipleDelete style="width: 120px"/>
		 		<base:searchGridMultipleOperation key="global.crud.back" operationName="backState" style="width: 120px" />
				<base:searchGridMultipleOperation key="com.artonis.fnc.treasury.payment.paymentBill.register" operationName="toRegisterState" style="width: 120px" />
		</div>
	</form>
</div>
<base:footer/>
<script type="text/javascript">
function getSearchObject(){
		var paymentBillVar = {};
		paymentBillVar.fromSerial=$("#fromSerial").val();
		paymentBillVar.toSerial=$("#toSerial").val();
		paymentBillVar.fromReference=$("#fromReference").val();
		paymentBillVar.toReference=$("#toReference").val();
		paymentBillVar.fromDate=$("#fromDate").val();
		paymentBillVar.toDate=$("#toDate").val();
		paymentBillVar.bank_Id=$("#bank_Id").val();
		paymentBillVar.branch_Id=$("#branch_Id").val();
		paymentBillVar.bankAccount_Id=$("#bankAccount_Id").val();
		paymentBillVar.cofferId=$("#cofferId").val();
		paymentBillVar.paymentType=$("#paymentType").val();
		paymentBillVar.state=$("#state").val();
		return paymentBillVar;
}
var icons = {
    header: "ui-icon-circle-arrow-e",
    activeHeader: "ui-icon-circle-arrow-s"
};
$( "#historyAccordion" ).accordion({
    icons: icons,
    heightStyle: "content",
    collapsible: true,
    active:false
});
function printPaymentBill(e){
    var data = this.dataItem($(e.target).closest("tr"));
    var searchJsonString = {};
    searchJsonString.paymentBillId=data.id;
    var baseUrl=getBaseUrl();
    searchJsonString = JSON.stringify(searchJsonString);
    searchJsonString = searchJsonString.replace(/\//g, ':@:');
    var urlGrid = baseUrl + "printPaymentBill/" + searchJsonString;
    window.location = urlGrid;
}
</script>
<base:footer/>
