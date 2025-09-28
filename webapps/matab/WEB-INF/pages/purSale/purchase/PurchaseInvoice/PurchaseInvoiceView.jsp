<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=ResourceBoundleHolder.resourceBundle.getString("pursal.purchaseInvoiceView")%></span></li>
	</ul>
	  <div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
	   </div>
</div>
<div class="uk-container uk-container-center my-uk-container">
    <form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
				<base:testBox styleClass="midsmall" name="fromSerial" key="fnc.treasury.basicInfo.expenditure.expenditureFund.fromSerial" />
			    <base:testBox styleClass="midsmall" name="toSerial" key="fnc.treasury.basicInfo.expenditure.expenditureFund.toSerial" />
				<base:mDatePicker styleClass="midsmall" name="fromDate" key="global.fromDate"/>
				<base:mDatePicker styleClass="midsmall" name="toDate" key="global.toDate"/>
			</div>
			<div class="uk-grid uk-grid-preserve">
				<base:comboBox  name="state" value="name" key="fnc.treasury.basicInfo.expenditure.expenditureFund.state" minLength="0"
								comboLoaderUrl="combo/loadAllState" styleClass="midsmall"/>
				<base:comboBoxAutoComplete styleClass="midsmall" name="businessPartnerId" key="pursal.purchaseInvoice.businessPartner"
							   comboLoaderUrl="combo/loadAllBusinessPartner" dataTextField="nameAndFamily" dataValueField="id" minLength="0"
							   templateComaSep="nameAndFamily" iscomboLoaderUrlRelative="true" hasTemplate="false" />
				<base:comboBox styleClass="midsmall" name="registererId" key="pursal.purchaseInvoice.registerer" comboLoaderUrl="combo/loadAllEmployee" minLength="0"/>
			</div>
	</form>
</div>

<base:my-grid-search showMultipleDelete="false">
	<base:my-grid-column title='pursal.purchaseInvoice.serial' field="serial" width="30px"/>
	<base:my-grid-column title='pursal.purchaseInvoice.date' field="date_" width="30px"/>
	<base:my-grid-column title='pursal.purchaseInvoice.businessPartner' field="businessPartnerName" width="50px"/>
	<base:my-grid-column title='pursal.purchaseInvoice.registerer' field="registererName" width="50px"/>
	<base:my-grid-column title='com.artonis.inv.receipt.purchaseReceiptGoods.sum.purePrice' field="totalPrice" width="60px"/>
	<base:my-grid-column title='pursal.purchaseInvoice.state' field="stateText" width="40px"/>
	<base:my-grid-column title='pursal.purchaseInvoice.docNumber' field="docNumber" width="50px"/>

	<base:my-grid-function text="global.crud.print" functionClick="printDocumentWithDetail" name="documentWithDetailPrintBtn"/>

	<base:my-grid-search-operation name="register" key="inv.operation.state.register" style="width: 120px"/>
	<base:my-grid-search-operation name="back" key="inv.operation.state.back" style="width: 120px" checkButtonPermission="false"/>
</base:my-grid-search>

<base:footer/>

<script>
    function getSearchObject() {
        var bbVar = {};
        bbVar.fromSerial = $("#fromSerial").val();
        bbVar.toSerial = $("#toSerial").val();
        bbVar.fromDate = $("#fromDate").val();
        bbVar.toDate = $("#toDate").val();
        bbVar.state = $("#state").val();
        bbVar.businessPartnerId = $("#businessPartnerId").val();
        bbVar.registererId = $("#registererId").val();
        return bbVar;
    }

    function printDocumentWithDetail(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        var searchJsonString = {};
        searchJsonString.purchaseInvoice_id = data.id;
        searchJsonString = JSON.stringify(searchJsonString);
        searchJsonString = searchJsonString.replace(/\//g, ':@:');
        var url = getBaseUrl() + "print/purchaseDocumentItemPrintWrapper/" + searchJsonString;
        window.location = url;
    }
</script>