<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form" id="form-popup">
	<div class="uk-grid uk-grid-preserve">
		<base:testBox styleClass="small" name="name" key="com.artonis.clinic.basicInfo.proficiency.name"/>
		<base:testBox styleClass="small" name="code" key="com.artonis.clinic.basicInfo.proficiency.code"/>
	</div>
</form>

<script type="text/javascript">
	$(".ui-dialog-title").text("تعریف تخصص");
</script>