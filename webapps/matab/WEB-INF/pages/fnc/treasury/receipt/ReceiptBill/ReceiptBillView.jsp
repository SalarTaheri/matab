<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.fnc.treasury.receipt.receiptBill.view")%></span></li>
	</ul>
	 <div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
	 </div>
</div>	
 <div class="uk-container uk-container-center my-uk-container"   style="margin-bottom: 4px; ">
		    <form class="uk-form" id="mainForm">
		    <div class="uk-grid uk-grid-preserve">
		    		<base:testBox styleClass="midsmall" name="fromSerial" key="com.artonis.fnc.treasury.receipt.receiptBill.fromSerial"/>
			        <base:testBox styleClass="midsmall" name="toSerial"  key="com.artonis.fnc.treasury.receipt.receiptBill.toSerial"/>
		            <base:testBox styleClass="midsmall" name="fromReference" key="com.artonis.fnc.treasury.receipt.receiptBill.fromReference"/>
			        <base:testBox styleClass="midsmall" name="toReference"  key="com.artonis.fnc.treasury.receipt.receiptBill.toReference"/>
		    	    		
		    </div>
         	<div class="uk-grid uk-grid-preserve">
		    	<base:mDatePicker styleClass="midsmall" name="fromDate" key="com.artonis.fnc.treasury.receipt.receiptBill.fromDate"/>
		        <base:mDatePicker styleClass="midsmall" name="toDate" key="com.artonis.fnc.treasury.receipt.receiptBill.toDate"/>
		       <base:testBox styleClass="midsmall" name="fromPrice" key="com.artonis.fnc.treasury.receipt.receiptBill.fromPrice"/>
			   <base:testBox styleClass="midsmall" name="toPrice"  key="com.artonis.fnc.treasury.receipt.receiptBill.toPrice"/>
		  
		    </div>
		    <div class="uk-grid uk-grid-preserve">
			    <base:comboBoxAutoComplete name="coffer_Id" styleClass="midsmall" iscomboLoaderUrlRelative="true" key="com.artonis.fnc.treasury.payment.paymentBill.coffer" comboLoaderUrl="combo/loadAllOfCoffer" dataTextField="name" dataValueField="id" minLength="0"
                hasTemplate="true" headerTemplateComaSep="com.artonis.fnc.treasury.payment.paymentBill.coffer" templateComaSep="name"/>       
		      <base:comboBox name="receiptType"  value="name" key="com.artonis.fnc.treasury.payment.paymentBill.receiptType" comboLoaderUrl="combo/loadAllReceiptTypes" styleClass="midsmall" styledivLabel="margin-right:5px"  />
		      <base:comboBox name="state"  value="name" key="com.artonis.fnc.treasury.receipt.receiptBill.state" comboLoaderUrl="combo/loadReceiptBillStates" styleClass="midsmall" />    
		    </div>
		      <div class="uk-grid uk-grid-preserve">
		    	<base:accountAndFloatAccountPicker accountCodingFieldName="payerAccountCoding_Id"
					floatAccount1FieldName="payerFloatAccountLevel1_Id" floatAccount2FieldName="payerFloatAccountLevel2_Id"
					floatAccount3FieldName="payerFloatAccountLevel3_Id" floatAccount4FieldName="payerFloatAccountLevel4_Id"
					accountCodingFieldKey="com.artonis.fnc.treasury.receipt.receiptBillPayer.payerAccountCoding_Id"  />
	          </div>
	         </form>
</div>

 <base:my-grid-search showMultipleDelete="false">	
    <base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBill.serial'  field="serial" width="25px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBill.reference'  field="reference" width="25px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBill.date_'  field="date_" width="45px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBill.state'  field="stateStr" width="30px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBill.receiptType'  field="receiptTypeStr" width="40px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBill.coffer_Id'  field="cofferName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBill.totalPriceCashReceipt' format="0:#,0"  field="totalPriceCashReceipt" width="60px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBill.totalPriceBankingbill' format="0:#,0"  field="totalPriceBankingBill" width="60px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBill.totalPriceReceiptCheque' format="0:#,0"  field="totalPriceReceiptCheque" width="70px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.receipt.receiptBill.totalSum' format="0:#,0"  field="sumPriceOfItems" width="60px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.paymentBillReceiver.description'   field="description" width="70px"/>
	<base:my-grid-function text="fnc.generalAccounting.accountingDocuments.doc.print" functionClick="printReceiptBill"  name="receiptBillInput-print-btn"/>

        <base:my-grid-schema-field name="serial" type="string"/>
        <base:my-grid-schema-field name="reference" type="string"/>
        <base:my-grid-schema-field name="date_" type="string"/>
        <base:my-grid-schema-field name="stateStr" type="string"/> 
        <base:my-grid-schema-field name="receiptTypeStr" type="string"/> 
        <base:my-grid-schema-field name="cofferName" type="string"/>
        <base:my-grid-schema-field name="totalPriceCashReceipt" type="long"/>
        <base:my-grid-schema-field name="totalPriceBankingBill" type="long"/>
        <base:my-grid-schema-field name="totalPriceReceiptCheque" type="long"/>
        <base:my-grid-schema-field name="sumPriceOfItems" type="long"/>
       	<base:my-grid-schema-field name="description" type="long"/>
	</base:my-grid-search>
        <div style="padding-top: 5px;" align="center">
		 		<base:searchGridMultipleDelete style="width: 120px"/>
		 		<base:searchGridMultipleOperation key="global.crud.back" operationName="backState" style="width: 120px" />
		 		<base:searchGridMultipleOperation key="com.artonis.fnc.treasury.payment.paymentBill.register" operationName="toRegisterState" style="width: 120px" />
		</div>
<base:footer/>
<script type="text/javascript">
function getSearchObject(){
		var receiptBillVar = {};
		receiptBillVar.fromSerial=$("#fromSerial").val();
		receiptBillVar.toSerial=$("#toSerial").val();
		receiptBillVar.fromReference=$("#fromReference").val();
		receiptBillVar.toReference=$("#toReference").val();
		receiptBillVar.fromPrice=$("#fromPrice").val();
		receiptBillVar.toPrice=$("#toPrice").val();
		receiptBillVar.coffer_Id=$("#coffer_Id").val();
		receiptBillVar.receiptType=$("#receiptType").val();
		receiptBillVar.state=$("#state").val();
		return receiptBillVar;
}
function printReceiptBill(e){
    var data = this.dataItem($(e.target).closest("tr"));
    var searchJsonString = {};
    searchJsonString.receiptBill_Id=data.id;
    var baseUrl=getBaseUrl();
    searchJsonString = JSON.stringify(searchJsonString);
    searchJsonString = searchJsonString.replace(/\//g, ':@:');
    //var urlGrid = getBaseUrl() + "print/" + searchJsonString;
    var urlGrid = baseUrl + "printReceiptBill/" + searchJsonString;
    window.location = urlGrid;
}
</script>