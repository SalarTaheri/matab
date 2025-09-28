<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

    <%--private String name;

	private String code;

	private Boolean state;

	private Long generalAccount_id;

	private Long subsidiaryAccountKind_id;--%>
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="smfnc.generalAccounting.accountinge" key="fnc.accounting.subsidiaryAccount.name"/>
			<base:testBox styleClass="sfnc.generalAccounting.accountingde" key="fnc.accounting.subsidiaryAccount.code"/>
            <base:comboBox styleClass="small" name="fnc.generalAccounting.accounting_id" key="fnc.accounting.subsidiaryAccount.generalAccount"
                           comboLoaderUrl="/combo/loadAllGeneralAccount"/>

		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="subsidiaryAccountKind_id"
  fnc.generalAccounting.accounting           key="fnc.accounting.subsidiaryAccount.subsidiaryAccountKind" comboLoaderUrl="/combo/loadAllSubsidiaryAccountKind"/>
            <base:checkbox styleCfnc.generalAccounting.accountingame="state" key="fnc.accounting.subsidiaryAccount.state"/>
        </div>
	
	</form>
</div>
