<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader title="inventory.m169.basicInfo.seasonVat.view"/>
<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="verysmall" name="name" key="inventory.m169.basicInfo.seasonVat.name"/>
			<base:testBox styleClass="verysmall" name="length" key="inventory.m169.basicInfo.seasonVat.length"/>
	    	<base:mDatePicker styleClass="verysmall" name="startDate" key="inventory.m169.basicInfo.seasonVat.startDate"/>
			<base:mDatePicker styleClass="verysmall" name="finishDate" key="inventory.m169.basicInfo.seasonVat.finishDate"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			
			<base:testBoxNumericEx styleClass="verysmall" name="complicationPercent" key="inventory.m169.basicInfo.seasonVat.complicationPercent"/>
			<base:testBoxNumericEx styleClass="verysmall" name="taxPercent" key="inventory.m169.basicInfo.seasonVat.taxPercent"/>
			<base:testBox styleClass="verysmall" name="year" key="inventory.m169.basicInfo.seasonVat.year"/>
		</div>
		<base:my-grid-search>
			<base:my-grid-column title='inventory.m169.basicInfo.seasonVat.name'  field="name" width="50px"/>
			<base:my-grid-column title='inventory.m169.basicInfo.seasonVat.length'  field="length" width="50px"/>
			<base:my-grid-column title='inventory.m169.basicInfo.seasonVat.startDate'  field="startDate" width="50px"/>
			<base:my-grid-column title='inventory.m169.basicInfo.seasonVat.finishDate'  field="finishDate" width="50px"/>
			<base:my-grid-column title='inventory.m169.basicInfo.seasonVat.complicationPercent'  field="complicationPercentText" width="50px"/>
			<base:my-grid-column title='inventory.m169.basicInfo.seasonVat.taxPercent'  field="taxPercentText" width="50px"/>
			<base:my-grid-column title='inventory.m169.basicInfo.seasonVat.year'  field="year" width="50px"/>
			<base:my-grid-column title='inventory.m169.basicInfo.seasonVat.active'  field="activeText" width="40px"/>
			<base:my-grid-column isFlag="true" title='inventory.m169.basicInfo.seasonVat.activeInactive' field="activation" width="40px"
									flagIconUrl="/resources/images/black/button-check.png" flagDestinationUrl="action/activeSeasonVat"/>
		
		    <base:my-grid-schema-field name="name" type="string"/>
		    <base:my-grid-schema-field name="length" type="string"/>
		    <base:my-grid-schema-field name="startDate" type="string"/>
		    <base:my-grid-schema-field name="finishDate" type="string"/>
		    <base:my-grid-schema-field name="complicationPercentText" type="string"/>
		    <base:my-grid-schema-field name="taxPercentText" type="string"/>
		    <base:my-grid-schema-field name="year" type="string"/>
		    <base:my-grid-schema-field name="active" type="string"/>
		</base:my-grid-search>
	</form>
</div>
<base:footer/>

<script type="text/javascript">
function getSearchObject(){
		var sessionVat4Search = {};
		sessionVat4Search.name=$("#name").val();
		sessionVat4Search.length=$("#length").val();
		sessionVat4Search.startDate=$("#startDate").val();
		sessionVat4Search.finishDate=$("#finishDate").val();
		sessionVat4Search.complicationPercent=$("#complicationPercent").val();
		sessionVat4Search.year=$("#year").val();
		return sessionVat4Search;
}
</script>