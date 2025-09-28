
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
	String jsFileName = pageContext.getPage().getClass().getName();
	jsFileName = jsFileName.substring(jsFileName.lastIndexOf(".") + 1).replace("_jsp", ".js");
%>
<base:pageHeader/>
<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 4px; ">
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="name" key="hrm.basicinfo.salaryperiod.name"/>
			<base:testBox styleClass="midsmall" name="code" key="hrm.basicinfo.salaryperiod.code"/>
			<base:mDatePicker name="startDate" styleClass="midsmall" key="fnc.generalAccounting.basicinfo.financeyear.startdate"/>
		</div>

		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker name="endDate" styleClass="midsmall" key="fnc.generalAccounting.basicinfo.financeyear.enddate"/>
			<base:comboBox name="state"  key="fnc.generalAccounting.basicinfo.financeyear.state" comboLoaderUrl="combo/loadAllStateForSearch" styleClass="midsmall" minLength="0" />
		</div>

	</form>
</div>


	<base:my-grid-search >
	    <base:my-grid-column title='hrm.basicinfo.salaryperiod.name'  field="name" width="50px"/>
	    <base:my-grid-column title='hrm.basicinfo.salaryperiod.code' field="code"  width="50px"/>
	    <base:my-grid-column title='fnc.generalAccounting.basicinfo.financeyear.startdate' field="startDate"  width="50px"/>
	    <base:my-grid-column title='fnc.generalAccounting.basicinfo.financeyear.enddate' field="endDate"  width="50px"/>
	    <base:my-grid-column title='fnc.generalAccounting.basicinfo.financeyear.state' field="stateStr"   width="50px"/>
	    <base:my-grid-column title='fnc.generalAccounting.basicinfo.financeyear.closed' field="closedStr"   width="50px"/>
	    <base:my-grid-column isFlag="true" title='inventory.m169.basicInfo.seasonVat.activeInactive' field="activation" width="40px"
								flagIconUrl="/resources/images/black/button-check.png" flagDestinationUrl="activate" dialogConfirmName="activation" dialogConfirmKey="fnc.generalAccounting.basicinfo.financeyear.changeYear.confirm"/>
	
	    <base:my-grid-schema-field name="name" type="string" />
	    <base:my-grid-schema-field name="code" type="string" />
	    <base:my-grid-schema-field name="startDate" type="string" />
	    <base:my-grid-schema-field name="endDate" type="string" />
	    <base:my-grid-schema-field name="state" type="string" />
	    <base:my-grid-schema-field name="closed" type="string" />	

</base:my-grid-search>

<base:footer></base:footer>
<script type="text/javascript">
	function getSearchObject(){
					var financeYearVar = {};
					financeYearVar.name=$("#name").val();
				//	financeYearVar.code=$("#code").val();
					financeYearVar.startDate=$("#startDate").val();
					financeYearVar.endDate=$("#endDate").val();
					financeYearVar.state=$("#state").val();
					return financeYearVar;
			}

	function doAfterClearAndSearch(){
        $("#state_Comb").data("kendoComboBox").text();
	}
</script>

