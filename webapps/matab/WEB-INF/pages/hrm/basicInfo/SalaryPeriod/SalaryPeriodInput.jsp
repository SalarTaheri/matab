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
            <base:testBox name="name" styleClass="small" key="hrm.basicinfo.salaryperiod.name"/>
            <base:testBox name="code" styleClass="small" key="hrm.basicinfo.salaryperiod.code"/>
            <base:mDatePicker name="startDate" styleClass="small" key="hrm.basicinfo.salaryperiod.startDate"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker styleClass="small" name="endDate" key="hrm.basicinfo.salaryperiod.endDate"/>
            <base:comboBox styleClass="small" name="financeYear_id" key="hrm.basicinfo.salaryperiod.financeYear" value="financeYearName" comboLoaderUrl="/combo/loadAllFinanceYear"/>
            <base:comboBox styleClass="small" name="priorSalaryPeriod_id" key="hrm.basicinfo.salaryperiod.priorSalaryPeriod" value="priorSalaryPeriodName" comboLoaderUrl="/combo/loadAllPrio"/>

        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker styleClass="small" name="insuranceStartDate" key="hrm.basicinfo.salaryperiod.insuranceStartDate"/>
            <base:mDatePicker styleClass="small" name="insuranceEndDate" key="hrm.basicinfo.salaryperiod.insuranceEndDate"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:checkbox styleClass="small" name="activeFlg" key="hrm.basicinfo.salaryperiod.activeFlg"/>
            <base:checkbox styleClass="small" name="closeFlg" key="hrm.basicinfo.salaryperiod.closeFlg"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:textArea name="description" key="hrm.basicinfo.salaryperiod.description"/>
        </div>
    </form>
</div>
