<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-ExpenditurefundExpenditureItem">
	<input type="hidden" id="id" name="id" >
	<base:accountAndFloatAccountPicker accountCodingFieldName="expenditureAccountCoding_id"
			floatAccount1FieldName="expenditureFloatAccountLevel1_id" floatAccount2FieldName="expenditureFloatAccountLevel2_id"
			floatAccount3FieldName="expenditureFloatAccountLevel3_id" floatAccount4FieldName="expenditureFloatAccountLevel4_id"
			accountCodingFieldKey="fnc.treasury.basicInfo.expenditure.expenditurefundExpenditureItem.expenditureAccountCoding_id"
			 />
	<div class="uk-grid uk-grid-preserve">
		<base:textArea name="description" key="fnc.treasury.basicInfo.expenditure.expenditurefundExpenditureItem.description" height="25"/>
	<div>
</form>