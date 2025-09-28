<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-SurveyFormItem" >
	<input  type="hidden" id="id" name="id" class="uk-width-1-1">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="name" key="com.artonis.clinic.research.surveyFormItem.name"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="key_" key="com.artonis.clinic.research.surveyFormItem.key_"/>
			<base:testBox styleClass="small" name="datatype" key="com.artonis.clinic.research.surveyFormItem.datatype"/>
			<base:testBox styleClass="small" name="fieldCommaSep" key="com.artonis.clinic.research.surveyFormItem.fieldCommaSep"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="listLoaderUrl" key="com.artonis.clinic.research.surveyFormItem.listLoaderUrl" styleClass="larg"/>
		</div>
	
	</form>

