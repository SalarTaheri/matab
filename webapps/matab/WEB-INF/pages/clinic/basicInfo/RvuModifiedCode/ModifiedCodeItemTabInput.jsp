<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<%--<base:pageHeader/>--%>
<%--<base:pageInputHeader/>--%>
<%--<base:buttonPermission key="com.artonis.clinic.basicInfo.rvu.import" classNames="uk-button uk-button-success" id="import-rvu"/>--%>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form2-ModifiedCodeItem" >
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="code" key="com.artonis.clinic.basicInfo.modifiedCode.code"/>
			<base:testBox styleClass="small" name="name" key="com.artonis.clinic.basicInfo.modifiedCode.name"/>
			<base:testBoxNumericEx styleClass="small" name="percent" key="com.artonis.clinic.basicInfo.modifiedCode.percent"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBoxNumericEx styleClass="small" name="unit" key="com.artonis.clinic.basicInfo.modifiedCode.unit"/>
			<base:checkbox  name="isChange" key="com.artonis.clinic.basicInfo.modifiedCode.isChange"  divLableStyle="width:10%" divCheckBoxStyle="width:20%"/>
			<%--<base:checkbox  name="isChange" key="com.artonis.clinic.basicInfo.modifiedCode.isChange"/>--%>
			<base:multiSelect serverFilter="true" name="rvu_components" styleClass="small" multiSelectLoaderUrl="combo/loadRvuPart" key="com.artonis.clinic.basicInfo.modifiedCode.rvu_components" />

		</div>

	</form>
</div>
<script type="text/javascript">

	function callback_after_serialize(tmp){

		tmp.rvu_components=$("#rvu_components_multiSelect").val();
		return tmp;
	}

	function callback_deserialize_ModifiedCodeItem(data){

		var multiSelect = $("#rvu_components_multiSelect").data("kendoMultiSelect");
		multiSelect.value(data.rvu_components);

	}


</script>
