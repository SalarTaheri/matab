<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

	<form class="uk-form2-ConfirmItem">
		<input type="hidden" id="operationType" name="operationType" >
		<input type="hidden" id="operationId" name="operationId" >
		<input type="hidden" id="operationIds" name="operationIds" >
		<div class="uk-grid uk-grid-preserve">
	   			<base:testBox name="rahgiriCode"  key="inventory.m169.operation.financeOperationView.rahgiriCode"  />
	    </div>
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker styleClass="normal"  name="date_" key="inventory.m169.operation.financeOperationView.date"/>
		</div>
	
	</form>

