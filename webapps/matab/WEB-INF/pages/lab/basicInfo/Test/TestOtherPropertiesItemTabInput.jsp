<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-TestOtherPropertiesItem">
	<input type="hidden" id="id" name="id"/>

	<div class="uk-grid uk-grid-preserve">
		<base:checkbox divLableStyle="width:90%; text-align:right; padding:0;" divCheckBoxStyle="width:50px;" name="receptionPage" key="com.artonis.lab.basicInfo.test.receptionPage"/>
		<br/>
		<base:checkbox divLableStyle="width:90%; text-align:right; padding:0;" divCheckBoxStyle="width:50px;" name="hasLmpDefinition" key="com.artonis.lab.basicInfo.test.hasLmpDefinition"/>
		<br/>
		<base:checkbox divLableStyle="width:90%; text-align:right; padding:0;" divCheckBoxStyle="width:50px;" name="nonNormalValuesInInsuranceDiskette" key="com.artonis.lab.basicInfo.test.nonNormalValuesInInsuranceDiskette"/>
		<br/>
		<base:checkbox divLableStyle="width:90%; text-align:right; padding:0;" divCheckBoxStyle="width:50px;" name="laboratorySurveillanceSystem" key="com.artonis.lab.basicInfo.test.laboratorySurveillanceSystem"/>
		<br/>
		<base:checkbox divLableStyle="width:90%; text-align:right; padding:0;" divCheckBoxStyle="width:50px;" name="qualitative" key="com.artonis.lab.basicInfo.test.qualitative"/>
		<br/>
		<base:checkbox divLableStyle="width:90%; text-align:right; padding:0;" divCheckBoxStyle="width:50px;" name="textualResponse" key="com.artonis.lab.basicInfo.test.textualResponse"/>
		<br/>
		<base:checkbox divLableStyle="width:90%; text-align:right; padding:0;" divCheckBoxStyle="width:50px;" name="autoInactiveReception" key="com.artonis.lab.basicInfo.test.autoInactiveReception"/>
		<br/>
		<base:checkbox divLableStyle="width:90%; text-align:right; padding:0;" divCheckBoxStyle="width:50px;" name="dependsOnThePatientsHistoryUnit" key="com.artonis.lab.basicInfo.test.dependsOnThePatientsHistoryUnit"/>
		<br/>
		<base:checkbox divLableStyle="width:90%; text-align:right; padding:0;" divCheckBoxStyle="width:50px;" name="onlyWebReception" key="com.artonis.lab.basicInfo.test.onlyWebReception"/>
		<br/>
		<base:checkbox divLableStyle="width:90%; text-align:right; padding:0;" divCheckBoxStyle="width:50px;" name="notShownInReceipt" key="com.artonis.lab.basicInfo.test.notShownInReceipt"/>
		<br/>
		<base:checkbox divLableStyle="width:90%; text-align:right; padding:0;" divCheckBoxStyle="width:50px;" name="needsAuthentication" key="com.artonis.lab.basicInfo.test.needsAuthentication"/>
	</div>
</form>
<style>
	form.uk-form2-TestOtherPropertiesItem .uk-grid div {
		float: left;
	}
</style>
<script>
	function callback_validation_before_save_TestOtherPropertiesItem(data) {
		data['id'] = document.getElementById("loadedId").value;
		return true;
	}
</script>