<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="layerName" name="layerName" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall"   name="layerNameText" key="fnc.generalAccounting.setting.accountcodesetting.layerName" disabled="true"/>
			<base:testBox styleClass="midsmall" styledivLabel="width:15%"  name="codeLength" key="fnc.generalAccounting.setting.accountcodesetting.codeLength"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:checkbox name="lastLayer" key="fnc.generalAccounting.setting.accountcodesetting.lastLayer" styleClass="small" style="width: 15px; margin-right: 10px"></base:checkbox>
		</div>
	
	</form>
</div>
