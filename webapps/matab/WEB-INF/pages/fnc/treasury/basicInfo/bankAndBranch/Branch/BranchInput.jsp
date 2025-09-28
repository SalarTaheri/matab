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
		     <base:comboBoxAutoComplete name="bank_id" key="fnc.treasury.basicInfo.bankAndBranch.bank.name" comboLoaderUrl="combo/loadAllBank" dataTextField="name" dataValueField="id" minLength="0"
                    hasTemplate="true" headerTemplateComaSep="fnc.treasury.basicInfo.bankAndBranch.bank.name" templateComaSep="name"/>       
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="branchName" key="fnc.treasury.basicInfo.bankAndBranch.branch.name"/>
			<base:testBox styleClass="small" name="code" key="fnc.treasury.basicInfo.bankAndBranch.branch.code"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="telephone" key="fnc.treasury.basicInfo.bankAndBranch.branch.telephone"/>
		     <base:testBox name="address" key="fnc.treasury.basicInfo.bankAndBranch.branch.address" height="60" styleClass="normal" />
		
		</div>
 
	</form>
</div>
