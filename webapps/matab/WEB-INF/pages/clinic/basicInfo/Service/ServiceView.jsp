<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader title="com.artonis.clinic.basicInfo.service.view"/>

<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 4px; ">
    <form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="group_id" comboLoaderUrl="combo/loadAllGroup" key="com.artonis.clinic.basicInfo.service.group_id" styleClass="small" minLength="0" />
			<base:testBox name="name" key="com.artonis.clinic.basicInfo.service.name"/>

		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="code" key="com.artonis.clinic.basicInfo.service.code" styleClass="small"/>
			<base:testBox name="nickName" key="com.artonis.clinic.basicInfo.service.nickName" styleClass="small"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx name="priority" key="com.artonis.clinic.basicInfo.service.priority" styleClass="small"/>
		</div>
	</form>	 
</div>

<base:my-grid-search>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.service.group_id'  field="groupName" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.service.name'  field="name" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.service.code'  field="code" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.service.appointmenable'  field="appointmentableTxt" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.service.appointmenTitle'  field="appointmentTitle" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.service.nickName'  field="nickName" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.basicInfo.service.priority'  field="priority" width="50px"/>

    <base:my-grid-schema-field name="groupName" type="string"/>
    <base:my-grid-schema-field name="name" type="string"/>
</base:my-grid-search>

<base:footer/>

<script type="text/javascript">
    function getSearchObject() {
        var service = {};
        service.group_id = $("#group_id").val();
        service.name = $("#name").val();
        service.code = $("#code").val();
        service.nickName = $("#nickName").val();
        service.priority = $("#priority").val();
        return service;
    }
</script>