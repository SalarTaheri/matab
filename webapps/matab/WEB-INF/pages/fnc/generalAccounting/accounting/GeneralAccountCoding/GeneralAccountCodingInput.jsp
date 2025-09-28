<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="name" key="fnc.generalAccounting.accounting.generalAccount.name"/>
			<base:testBox styleClass="small" name="code" key="fnc.generalAccounting.accounting.generalAccount.code"/>
            <base:comboBox styleClass="small" isListConstant="true" name="accountGroup_id" key="fnc.generalAccounting.accounting.generalAccount.accountGroup" comboLoaderUrl="/combo/loadAllAccountCodingGroup"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:comboBox styleClass="small" isListConstant="true" name="generalAccountKind" key="fnc.generalAccounting.accounting.generalAccount.generalAccountKind" comboLoaderUrl="/combo/loadAllGeneralAccountCodingKind"/>
            <base:checkbox styleClass="small" name="state" key="fnc.generalAccounting.accounting.generalAccount.state"/>
        </div>
	
	</form>
</div>
