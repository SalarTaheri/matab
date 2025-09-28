
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    String basePath = request.getContextPath();
	String gridUrl = basePath+"/generalAccounting/accounting/floatAccountRelatedFloatAccountGroup/grid-relatedFloatAccountGroup-read/";
%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li><span><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.chequeState")%></span></li>
	</ul>
</div>
<div id="header-toolbar">	    	
	<base:button key="fnc.generalAccounting.accountingDocuments.doc.view"  styleClass="uk-button uk-button-success" id="body-heade-viewFloatAccount" />
</div>
<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="receiptPaymentType" name="receiptPaymentType" >
		<div class="uk-grid uk-grid-preserve">
				<base:testBox styleClass="small" name="chequeSerial" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.chequeSerial" disabled="true"/>
				<base:testBox styleClass="small" name="bankAccountName" key="com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.bankAccountName" disabled="true"/>
		</div>
        <div>
			<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single" noDeleteButton="true" noEditButton="true">
					<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.state'  field="stateTxt" width="50px"/>
				    <base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.date_'  field="date_" width="50px"/>
					<base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.accountCodingName'  field="accountCodingName" width="50px"/>
				    <base:my-grid-column title='com.artonis.fnc.treasury.treasuryDocs.receiptCheque.receiptCheque.docNumber'  field="docNumber" width="50px"/>
				    
				   <base:my-grid-schema-field name="stateTxt" type="string"/>
				   <base:my-grid-schema-field name="date_" type="string"/>
				   <base:my-grid-schema-field name="accountCodingName" type="string"/>
				   <base:my-grid-schema-field name="docNumber" type="string"/>
				   <base:my-grid-function text="com.artonis.fnc.reports.books.accountBook.viewDocument"  functionClick="viewDocument" name="viewDocument"/>
				   
			</base:my-grid>
		</div>
	</form>
</div>
<script type="text/javascript">

$(function () {
    $('#body-heade-viewFloatAccount').on("click", function (e) {
    	if ($("#receiptPaymentType").val() == "1")
   			window.location = "${pageContext.request.contextPath}"+"/fnc/treasury/treasuryDocs/receiptCheque/";
   		else
   			window.location = "${pageContext.request.contextPath}"+"/fnc/treasury/treasuryDocs/paymentCheque/";
	});
});
function viewDocument(e){
	var data = this.dataItem($(e.target).closest("tr"));
	var url="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accountingDocuments/document/edit/"+data.documentId;
	window.open(url,'_blank');	  
}

</script>

