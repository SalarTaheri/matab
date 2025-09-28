
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%><%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=ResourceBoundleHolder.resourceBundle.getString("fnc.treasury.basicInfo.expenditure.expenditure.floatAccount.view")%></span></li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
	</div>
</div>
<div class="uk-container uk-container-center my-uk-container"   style="margin-bottom: 4px; ">
    <form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="name" key="fnc.treasury.basicInfo.expenditure.expenditure.name"/>
			<base:testBox styleClass="small" name="code" key="fnc.treasury.basicInfo.expenditure.expenditure.code"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="type" value="name" key="fnc.treasury.basicInfo.expenditure.expenditure.type" comboLoaderUrl="combo/loadAllCurrencyType" styleClass="small" />
			<base:comboBox name="expenditurerer" value="name" key="fnc.treasury.basicInfo.expenditure.expenditure.expenditurerer" comboLoaderUrl="combo/loadAllEmployee" styleClass="small" />
		</div>


	</form>
</div>
		<base:my-grid-search>
			<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditure.name'  field="name" width="50px"/>
			<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditure.code'  field="code" width="50px"/>
			<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditure.type'  field="typeText" width="50px"/>
			<base:my-grid-column title='fnc.treasury.basicInfo.expenditure.expenditure.expenditurerer'  field="expenditurererFullName" width="50px"/>
		
		    <base:my-grid-schema-field name="name" type="string"/>
		    <base:my-grid-schema-field name="code" type="string"/>
		    <base:my-grid-schema-field name="typeText" type="string"/>
		    <base:my-grid-schema-field name="expenditurererFullName" type="string"/>
		</base:my-grid-search>
<base:footer/>
<script>
function getSearchObject(){
		var expenditureVar = {};
		expenditureVar.name=$("#name").val();
		expenditureVar.code=$("#code").val();
		expenditureVar.type=$("#type").val();
		expenditureVar.expenditurerer=$("#expenditurerer").val();
		return expenditureVar;
}
</script>