<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-ExpenditureFundAppendixItem">
	<input type="hidden" id="id" name="id" >
	<div class="uk-grid uk-grid-preserve">
		<base:testBox styleClass="small" name="fileAddress" key="fnc.treasury.basicInfo.expenditure.expenditureFundAppendixItem.fileAddress"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:textArea name="description" key="fnc.treasury.basicInfo.expenditure.expenditureFundAppendixItem.description" height="25"/>
	</div>
</form>