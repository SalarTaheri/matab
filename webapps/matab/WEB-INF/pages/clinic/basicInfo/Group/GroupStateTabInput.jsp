<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-GroupState">
	<input type="hidden" id="id" name="id" >
	<div class="uk-grid uk-grid-preserve">
		<base:comboBox name="state_id" value="name" key="com.artonis.clinic.basicInfo.serviceState"
				 comboLoaderUrl="combo/loadAllState" styleClass="small" />
        <base:testBoxNumericEx styleClass="small" name="priority" key="com.artonis.clinic.basicInfo.serviceState.priority"/>
        <base:checkbox name="isFinal" styleClass="small" key="com.artonis.clinic.basicInfo.serviceState.isFinal"/>

	</div>
    <div class="uk-grid uk-grid-preserve">
        <base:checkbox name="isVisit" styleClass="small" key="com.artonis.clinic.basicInfo.serviceState.isVisit"/>
    </div>
</form>