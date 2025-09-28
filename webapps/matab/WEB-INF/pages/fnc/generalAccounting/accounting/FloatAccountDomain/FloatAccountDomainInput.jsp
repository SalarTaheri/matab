
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li><span><%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.fnc.generalAccounting.accounting.floatAccountDomain")%></span></li>
	</ul>
	<div id="header-toolbar">
		    <base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
			<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="body-heade-save"/>
			<base:buttonPermission key="global.crud.saveAndClose" classNames="uk-button uk-button-success" id="body-heade-saveAndClose"/>
	    	<base:button key="fnc.generalAccounting.accountingDocuments.doc.view"  styleClass="uk-button uk-button-success" id="body-heade-viewFloatAccount" />
	</div>
	</div>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="floatAccountId" name="floatAccountId" >
		<div class="uk-grid uk-grid-preserve">
				<base:testBox styleClass="small" name="floatAccountCodeName" key="com.artonis.fnc.generalAccounting.accounting.floatAccountDomain.parent" disabled="true"/>
			</div>
			<div class="uk-grid uk-grid-preserve">
				<base:testBox styleClass="verysmall" name="startSerial" key="com.artonis.fnc.generalAccounting.accounting.floatAccountDomain.startSerial"/>
				<base:testBox styleClass="verysmall" name="finishSerial" key="com.artonis.fnc.generalAccounting.accounting.floatAccountDomain.finishSerial"/>
			</div>
			<div class="uk-grid uk-grid-preserve">
				<base:textArea name="desc_" key="com.artonis.fnc.generalAccounting.accounting.floatAccountDomain.description"></base:textArea>
			</div>
	</form>
</div>
<script type="text/javascript">

$(function () {
    $('#body-heade-viewFloatAccount').on("click", function (e) {
   		window.location = "${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/floatAccount/";
});
    });

</script>

