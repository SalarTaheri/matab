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
            <base:testBox name="name" key="fnc.generalAccounting.basicinfo.financeyear.name" styleClass="midsmall"/>
            <base:mDatePicker name="startDate" key="fnc.generalAccounting.basicinfo.financeyear.startdate" styleClass="midsmall"/>
            <base:mDatePicker name="endDate" key="fnc.generalAccounting.basicinfo.financeyear.enddate" styleClass="midsmall"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:testBoxNumeric name="toll" styleClass="midsmall" key="fnc.generalAccounting.basicinfo.financeyear.toll" step="0.1"/>
            <base:testBoxNumeric name="tax" styleClass="midsmall" key="fnc.generalAccounting.basicinfo.financeyear.tax" step="0.1"/>
            <base:comboBox name="state" value="name" key="fnc.generalAccounting.basicinfo.financeyear.state" comboLoaderUrl="combo/loadAllState" styleClass="midsmall"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:checkbox name="closed" key="fnc.generalAccounting.basicinfo.financeyear.closed" styleClass="small" style="width: 15px; margin-right: 10px"/> 
        </div>

    </form>
</div>
