<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>
<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
	<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="fromSerial" key="com.artonis.fnc.treasury.payment.cashPermission.fromSerial"/>
			<base:testBox styleClass="midsmall" name="toSerial"  key="com.artonis.fnc.treasury.payment.cashPermission.toSerial"/>
			<base:mDatePicker styleClass="midsmall" name="fromRegisterDate" key="com.artonis.fnc.treasury.payment.cashPermission.fromRegisterDate"/>
		    <base:mDatePicker styleClass="midsmall" name="toRegisterDate" key="com.artonis.fnc.treasury.payment.cashPermission.toRegisterDate"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="registrant" value="name" key="com.artonis.fnc.treasury.payment.cashPermission.registrant" comboLoaderUrl="combo/loadAllEmployee" styleClass="midsmall" minLength="0"/>
			<base:comboBox styleClass="midsmall" name="type" comboLoaderUrl="combo/loadAllCashRequestType" key="com.artonis.fnc.treasury.payment.cashPermission.type"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
	</div>
<base:my-grid-search showMultipleDelete="false">
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermission.serial'  field="serial" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermission.registerDate'  field=" registerDate" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermission.state'  field="stateStr" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermission.registrant'  field="registrantFullName" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermission.type'  field="typeStr" width="50px"/>

    <base:my-grid-schema-field name="serial" type="string"/>
    <base:my-grid-schema-field name="registerDate" type="string"/>
    <base:my-grid-schema-field name="stateStr" type="string"/>
    <base:my-grid-schema-field name="registrantFullName" type="string"/>
    <base:my-grid-schema-field name="typeStr" type="string"/>

    <base:my-grid-search-operation name="register" key="com.artonis.fnc.treasury.payment.cashPermission.state.register" style="width: 120px"/>
</base:my-grid-search>
	<div style="padding-top: 5px;" align="center">
		 		<base:searchGridMultipleDelete style="width: 120px"/>
		 		<base:searchGridMultipleOperation key="global.crud.back" operationName="backState" style="width: 120px" />
				<base:searchGridMultipleOperation key="global.crud.save" operationName="toRegisterState" style="width: 120px" />
	
	</div>
</form>
</div>

<base:footer/>
<<script type="text/javascript">


function getSearchObject(){
		var cashPermissionVar = {};
		cashPermissionVar.fromSerial=$("#fromSerial").val();
		cashPermissionVar.toSerial=$("#toSerial").val();
		cashPermissionVar.fromRegisterDate=$("#fromRegisterDate").val();
		cashPermissionVar.toRegisterDate=$("#toRegisterDate").val();
		cashPermissionVar.registrant=$("#registrant").val();
		cashPermissionVar.type=$("#type").val();
		return cashPermissionVar;
}
</script>