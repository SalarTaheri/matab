<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader title="com.artonis.clinic.basicInfo.group.view"/>

<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 4px; ">
    <form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="name" key="com.artonis.clinic.basicInfo.group.name" styleClass="small"/>
		</div>
	</form>	 
</div>

<base:my-grid-search>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.group.name'  field="name" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.group.code'  field="code" width="50px"/>
	<base:my-grid-schema-field name="name" type="string"/>
</base:my-grid-search>

<base:footer/>

<script type="text/javascript">
function getSearchObject(){
		var group = {};
		group.name=$("#name").val();
		return group;
}
</script>