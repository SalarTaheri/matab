
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>
<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="name" key="com.artonis.clinic.research.surveyForm.name"/>
		</div>
		<base:my-grid-search>
			<base:my-grid-column title='com.artonis.clinic.research.surveyForm.name' field="name" width="50px"/>
			<base:my-grid-column title='com.artonis.clinic.research.surveyForm.code' field="code" width="50px"/>
			
		    <base:my-grid-schema-field name="name" type="string"/>
		    <base:my-grid-schema-field name="code" type="string"/>
		</base:my-grid-search>
	</form>
</div>
<base:footer/>
<script type="text/javascript">
function getSearchObject(){
	var jsobj = {};
	jsobj.xxx=$("#xxx").val();
	return jsobj;
}
</script>
