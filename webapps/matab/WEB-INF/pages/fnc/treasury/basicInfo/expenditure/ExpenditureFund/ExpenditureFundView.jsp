<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=ResourceBoundleHolder.resourceBundle.getString("fnc.treasury.basicInfo.expenditure.expenditureFund.view")%></span></li>
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
			
			</div>
			<div class="uk-grid uk-grid-preserve">
				<base:mDatePicker styleClass="midsmall" name="date" key="fnc.treasury.basicInfo.expenditure.expenditureFund.date"/>
			<base:comboBox  name="state" value="name" key="fnc.treasury.basicInfo.expenditure.expenditureFund.state"
		   comboLoaderUrl="combo/loadAllState" styleClass="midsmall"/>
			<base:comboBox  name="expenditurer_id" value="name" key="fnc.treasury.basicInfo.expenditure.expenditureFund.expenditurer_id"
			comboLoaderUrl="combo/loadAllExpenditurer" styleClass="midsmall"/>
						
	
			</div>

		<base:my-grid-search showMultipleDelete="false">
			<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditureFund.expenditurer_id'  field="expenditurerName" width="50px"/>
			<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditureFund.serial'  field="serial" width="50px"/>
			<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditureFund.date'  field="date" width="50px"/>
			<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditureFund.state'  field="stateText" width="50px"/>
			<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditureFund.registerer'  field="registererFullName" width="50px"/>
			<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditureFund.totalPrice'  field="totalPrice" width="50px"/>
		
		    <base:my-grid-schema-field name="expenditurerName" type="string"/>
		    <base:my-grid-schema-field name="serial" type="string"/>
		    <base:my-grid-schema-field name="date" type="string"/>
		    <base:my-grid-schema-field name="state" type="stateText"/>
		    <base:my-grid-schema-field name="registererFullName" type="string"/>
		    <base:my-grid-schema-field name="totalPrice" type="long"/>
		    
		</base:my-grid-search>
		<div style="padding-top: 5px;" align="center">
		 		<base:searchGridMultipleDelete style="width: 120px"/>
		 		<base:searchGridMultipleOperation key="global.crud.back" operationName="backState" style="width: 120px" />
				<base:searchGridMultipleOperation key="global.crud.save" operationName="toRegisterState" style="width: 120px" />
	
		</div>
	</form>
</div>
<base:footer/>
<script>
function getSearchObject(){
		var bbVar = {};
		bbVar.expenditurer_id = $("#expenditurer_id").val();
		bbVar.fromSerial = $("#fromSerial").val();
		bbVar.toSerial = $("#toSerial").val();
		bbVar.date = $("#date").val();
		bbVar.state = $("#state").val();
		return bbVar;
}
</script>