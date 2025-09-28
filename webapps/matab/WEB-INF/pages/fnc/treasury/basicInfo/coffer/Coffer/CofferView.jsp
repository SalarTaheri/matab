
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%><%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=ResourceBoundleHolder.resourceBundle.getString("fnc.treasury.basicInfo.coffer.coffer.view")%></span></li>
	</ul>
	  <div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
	   </div>
</div>

<div class="uk-container uk-container-center my-uk-container"  style="margin-bottom: 4px; ">
    <form class="uk-form" id="mainForm">
	    <div class="uk-grid uk-grid-preserve">
				<base:testBox styleClass="small" name="name" key="fnc.treasury.basicInfo.coffer.coffer.name"/>
				<base:testBox styleClass="small" name="code" key="fnc.treasury.basicInfo.coffer.coffer.code"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			    <base:comboBox name="type" value="name" key="fnc.treasury.basicInfo.coffer.coffer.type" comboLoaderUrl="combo/loadAllCurrencyType" styleClass="small" />
				<base:comboBox name="expenditureCoffer" value="name" key="fnc.treasury.basicInfo.coffer.coffer.expenditureCoffer" comboLoaderUrl="combo/loadAllEmployee" styleClass="small" minLength="0"/>
		</div>
		
	</form>
</div>
<base:my-grid-search>
			<base:my-grid-column title='fnc.treasury.basicInfo.coffer.coffer.name'  field="name" width="50px"/>
			<base:my-grid-column title='fnc.treasury.basicInfo.coffer.coffer.code'  field="code" width="50px"/>
			<base:my-grid-column title='fnc.treasury.basicInfo.coffer.coffer.type'  field="typeText" width="50px"/>
			<base:my-grid-column title='fnc.treasury.basicInfo.coffer.coffer.expenditureCoffer'  field="expenditureCofferFullName" width="50px"/>
	
	        <base:my-grid-schema-field name="name" type="string"/>
	        <base:my-grid-schema-field name="code" type="string"/>
	        <base:my-grid-schema-field name="type" type="string"/>
	        <base:my-grid-schema-field name="expenditureCofferFullName" type="string"/>
		</base:my-grid-search>
<script type="text/javascript">
function getSearchObject(){
		var cofferVar = {};
		cofferVar.name=$("#name").val();
		cofferVar.code=$("#code").val();
		cofferVar.type=$("#type").val();
		cofferVar.expenditureCoffer=$("#expenditureCoffer").val();
		return cofferVar;
}
</script>
<base:footer/>
