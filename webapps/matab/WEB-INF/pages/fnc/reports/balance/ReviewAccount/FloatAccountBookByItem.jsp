<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%><%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!--<div class="body-header">-->
<!--	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">-->
<!--		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>-->
<!--	</ul>-->
<!--</div>-->

<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
   <div class="uk-grid uk-grid-preserve">
	   	<base:testBox name="accountCodeName" disabled="true" styleClass="normal" key="fnc.generalAccounting.accounting.accountCoding.name"></base:testBox>
		<base:testBox name="floatAccountCodeName" disabled="true" styleClass="small" key="com.artonis.fnc.reports.books.accountBook.floatAccountCodeName"></base:testBox>
	</div>
		<div align="center" style="padding-top: 1px">
			<button class="uk-button uk-button-success" type="button" onclick="javascript:printAccountBook()" id="printBtn">
				<%=ResourceBoundleHolder.resourceBundle.getString("fnc.btn.print")%>
			</button>
		</div>
	<div id="gridButton"  >
		<base:mehrSys-sql-grid  sqlQueryKey="floatAccountBookItem" pageSize="10" name="floatAccountBookByItemGrid" selectable="multiple" isPopup="true"
	transportReadUrl="${basePath}sql-grid-read"   >
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.docNumber' field="docNumber" width="50px" />
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.referenceNumber' field="referenceNumber" width="50px" />
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.date_' field="date_" width="100px" />
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.accountCodeName' field="accountCodeName" width="200px" />
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.floatAccount1CodeName' field="floatAccountLevel1CodeName" width="200px" />
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.floatAccount2CodeName' field="floatAccountLevel2CodeName" width="40px" />
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.floatAccount3CodeName' field="floatAccountLevel3CodeName" width="40px" />
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.floatAccount4CodeName' field="floatAccountLevel4CodeName" width="40px" />
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.description' field="description" width="200px" />
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.bedehkar' field="bedehkar" width="100px" />
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.bestankar' field="bestankar" width="100px" />
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.mandeh' field="mandeh" width="100px" />
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.cumulativeMandeh' field="cumulativeMandeh" width="100px" />

	<base:my-grid-schema-field name="docNumber" type="string" />
	<base:my-grid-schema-field name="referenceNumber" type="string" />
	<base:my-grid-schema-field name="date_" type="string" />
	<base:my-grid-schema-field name="accountCodeName" type="string" />
	<base:my-grid-schema-field name="floatAccountLevel1CodeName" type="string" />
	<base:my-grid-schema-field name="floatAccountLevel2CodeName" type="string" />
	<base:my-grid-schema-field name="floatAccountLevel3CodeName" type="string" />
	<base:my-grid-schema-field name="floatAccountLevel4CodeName" type="string" />
	<base:my-grid-schema-field name="description" type="string" />
	<base:my-grid-schema-field name="bedehkar" type="long" />
	<base:my-grid-schema-field name="bestankar" type="long" />
	<base:my-grid-schema-field name="mandeh" type="long" />
	<base:my-grid-schema-field name="cumulativeMandeh" type="long" />
    <base:my-grid-function text="com.artonis.fnc.reports.books.accountBook.viewDocument"  functionClick="viewDocument" name="viewDocument"/>
	
</base:mehrSys-sql-grid>
</div>
</form>
	<div class="uk-grid uk-grid-preserve" style="border-style: double;margin-right: 0px;padding-top: 5px;padding-bottom: 5px;">
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx disabled="true" name="debitSum" styleClass="small" key="com.artonis.fnc.reports.books.accountBook.debitSum"/>
			<base:testBoxNumericEx disabled="true" name="creditSum" styleClass="small" key="com.artonis.fnc.reports.books.accountBook.creditSum"/>
			<base:testBoxNumericEx disabled="true" name="mandeSum" styleClass="small" key="com.artonis.fnc.reports.books.accountBook.mandeSum"/>
		</div>
	</div>
</div>

