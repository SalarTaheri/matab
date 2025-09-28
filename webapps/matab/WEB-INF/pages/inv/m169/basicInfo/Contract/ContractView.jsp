<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader title="inventory.m169.basicInfo.contract.view"/>
<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="type" styleClass="verySmall" comboLoaderUrl="combo/loadAllType" key="inventory.m169.basicInfo.contract.type" />
			<base:comboBox name="person" styleClass="small" comboLoaderUrl="combo/loadAllPerson" key="inventory.m169.basicInfo.contract.person" />
			<base:mDatePicker styleClass="verySmall" name="startDate" key="inventory.m169.basicInfo.contract.startDate" />
			<base:mDatePicker styleClass="verySmall" name="finishDate" key="inventory.m169.basicInfo.contract.finishDate"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="verySmall" name="price" key="inventory.m169.basicInfo.contract.price"/>
		    <base:testBox name="description" styleClass="normal"  key="inventory.m169.basicInfo.contract.description"/>
	
		</div>

		<base:my-grid-search>
			<base:my-grid-column title='inventory.m169.basicInfo.contract.type'  field="typeText" width="50px"/>
			<base:my-grid-column title='inventory.m169.basicInfo.contract.person'  field="personName" width="50px"/>
			<base:my-grid-column title='inventory.m169.basicInfo.contract.startDate'  field="startDate" width="50px"/>
			<base:my-grid-column title='inventory.m169.basicInfo.contract.finishDate'  field="finishDate" width="50px"/>
			<base:my-grid-column title='inventory.m169.basicInfo.contract.price'  field="price" width="50px" format="0:#,0"/>
		
		    <base:my-grid-schema-field name="type" type="string"/>
		    <base:my-grid-schema-field name="person" type="string"/>
		    <base:my-grid-schema-field name="startDate" type="string"/>
		    <base:my-grid-schema-field name="finishDate" type="string"/>
		    <base:my-grid-schema-field name="price" type="long"/>
		</base:my-grid-search>
	</form>
</div>
<base:footer/>
<script>
function getSearchObject(){
		var contract4Search = {};
		contract4Search.type=$("#type").val();
		contract4Search.person=$("#person").val();
		contract4Search.startDate=$("#startDate").val();
		contract4Search.finishDate=$("#finishDate").val();
		contract4Search.price=$("#price").val();
		contract4Search.description=$("#description").val();
		return contract4Search;
}
</script>