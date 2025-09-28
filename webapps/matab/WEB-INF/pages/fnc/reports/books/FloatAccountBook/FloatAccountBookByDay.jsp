<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%><%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>

<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
	
	 <div class="uk-grid uk-grid-preserve">
	   	<base:testBox name="accountCodeName" disabled="true" styleClass="small" key="fnc.generalAccounting.accounting.accountCoding.name"></base:testBox>
		<base:testBox name="floatAccountCodeName" disabled="true" styleClass="small" key="com.artonis.fnc.reports.books.accountBook.floatAccountCodeName"></base:testBox>
	</div>

	<div id="gridButton"  >
		<base:mehrSys-sql-grid  sqlQueryKey="abbas" pageSize="10" name="grid" selectable="multiple" isPopup="true"
	transportReadUrl="${basePath}sql-grid-read"   >
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.date_' field="date_" width="40px" />
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.description' field="documentDescription" width="70px" />
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.bedehkar' field="bedehkar" width="30px" />
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.bestankar' field="bestankar" width="30px" />
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.mandeh' field="mandeh" width="30px" />
	<base:my-grid-column title='com.artonis.fnc.reports.books.accountBook.cumulativeMandeh' field="cumulativeMandeh" width="40px" />

	
	<base:my-grid-schema-field name="date_" type="string" />
	<base:my-grid-schema-field name="documentDescription" type="string" />
	<base:my-grid-schema-field name="bedehkar" type="long" />
	<base:my-grid-schema-field name="bestankar" type="long" />
	<base:my-grid-schema-field name="mandeh" type="long" />
	<base:my-grid-schema-field name="cumulativeMandeh" type="long" />
    <base:my-grid-function text="com.artonis.fnc.reports.books.accountBook.viewDocument"  functionClick="viewDocumentByDoc" name="viewDocumentByDoc"/>
	
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
<script type="text/javascript">

</script>
