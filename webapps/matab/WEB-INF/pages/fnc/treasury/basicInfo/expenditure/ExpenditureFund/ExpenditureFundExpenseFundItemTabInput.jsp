<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-ExpenditureFundExpenseFundItem">
	<input type="hidden" id="id" name="id" >
	<base:accountAndFloatAccountPicker accountCodingFieldName="expensefundAccountCoding_id"
			floatAccount1FieldName="expenseFundFloatAccountLevel1_id" floatAccount2FieldName="expenseFundFloatAccountLevel2_id"
			floatAccount3FieldName="expenseFundFloatAccountLevel3_id" floatAccount4FieldName="expenseFundFloatAccountLevel4_id"
			accountCodingFieldKey="fnc.treasury.basicInfo.expenditure.expenditureFundExpenseFundItem.expensefundAccountCoding_id" />
	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="small" name="price" key="fnc.treasury.basicInfo.expenditure.expenditureFundExpenseFundItem.price"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:textArea height="25" name="description" key="fnc.treasury.basicInfo.expenditure.expenditureFundExpenseFundItem.description" />
	</div>
</form>