<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

    <form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="fromDocNumber" key="fnc.generalAccounting.accountingDocuments.doc.fromDocNumber" styleClass="verySmall"/>
			<base:testBox name="toDocNumber" key="fnc.generalAccounting.accountingDocuments.doc.toDocNumber" styleClass="verySmall" />
			<base:testBox name="fromReferenceNumber" key="fnc.generalAccounting.accountingDocuments.doc.fromReferenceNumber" styleClass="verySmall"/>
			<base:testBox name="toReferenceNumber" key="fnc.generalAccounting.accountingDocuments.doc.toReferenceNumber" styleClass="verySmall" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="normal" name="fromDate" key="fnc.generalAccounting.accountingDocuments.doc.fromDate"/>
			<base:mDatePicker styleClass="normal" name="toDate" key="fnc.generalAccounting.accountingDocuments.doc.toDate"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumeric styleClass="normal" format="#,0" name="fromAmount" key="fnc.generalAccounting.accountingDocuments.doc.fromAmount"/>
			<base:testBoxNumeric styleClass="normal" format="#,0" name="toAmount" key="fnc.generalAccounting.accountingDocuments.doc.toAmount"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox  name="type" value="name" key="fnc.generalAccounting.accountingDocuments.doc.Type" comboLoaderUrl="combo/loadAllDocumentType" styleClass="normal"/>
			<base:comboBox  name="currencyType" value="name" key="fnc.generalAccounting.accountingDocuments.doc.currencyType" comboLoaderUrl="combo/loadAllCurrencyType" styleClass="normal"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox  name="state" value="name" key="fnc.generalAccounting.accountingDocuments.doc.State" comboLoaderUrl="combo/loadAllDocumentState" styleClass="normal"/>
			<base:comboBox  name="source" value="name" key="fnc.generalAccounting.accountingDocuments.doc.source" comboLoaderUrl="combo/loadAllDocumentSource" styleClass="normal"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
             <base:comboBox styleClass="normal" name="financeYear_Id" key="hrm.basicinfo.salaryperiod.financeYear" value="financeYearName" comboLoaderUrl="combo/loadAllFinanceYear"/>
             <base:comboBox  name="balanceStateId" value="name" key="fnc.generalAccounting.accountingDocuments.doc.State" comboLoaderUrl="combo/loadAllBalanceState" styleClass="normal"/>
        </div>
		<base:my-grid-search isPopup="true" showMultipleDelete="false" showCheckboxSelector="true">
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.docNumber'  field="docNumber" width="30px"/>
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.referenceNumber'  field="referenceNumber" width="30px"/>
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.Date'  field="date" width="40px"/>
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.createDate'  field="createDate" width="40px"/>
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.Type'  field="typeStr" width="30px"/>
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.State'  field="stateStr" width="30px"/>
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.currencyType'  field="currencyTypeStr" width="30px"/>
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.amount'  field="documentAmount" width="40px"/>
			<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.State'  field="balanceStateText" width="30px"/>
		
	        <base:my-grid-schema-field name="docNumber" type="string"/>
	        <base:my-grid-schema-field name="referenceNumber" type="string"/>
	        <base:my-grid-schema-field name="date" type="string"/>
	        <base:my-grid-schema-field name="createDate" type="string"/>
	        <base:my-grid-schema-field name="typeStr" type="string"/>
	        <base:my-grid-schema-field name="stateStr" type="string"/>
	        <base:my-grid-schema-field name="currencyTypeStr" type="string"/>
	        <base:my-grid-schema-field name="balanceStateText" type="string"/>
	        <base:my-grid-schema-field name="documentAmount" type="long"/>
		</base:my-grid-search>
	</form>
<script>
function getSearchObject(){
		var docVar = {};
		docVar.fromDocNumber=$("#fromDocNumber").val();
		docVar.toDocNumber=$("#toDocNumber").val();
		docVar.fromReferenceNumber=$("#fromReferenceNumber").val();
		docVar.toReferenceNumber=$("#toReferenceNumber").val();
		docVar.fromDate=$("#fromDate").val();
		docVar.toDate=$("#toDate").val();
		docVar.fromAmount=$("#fromAmount").val();
		docVar.toAmount=$("#toAmount").val();
		docVar.type=$("#type").val();
		docVar.currencyType=$("#currencyType").val();
		docVar.state=$("#state").val();
		docVar.source=$("#source").val();
		docVar.financeYear_Id=$("#financeYear_Id").val();
		docVar.balanceStateId=$("#balanceStateId").val();
		return docVar;
}
</script>