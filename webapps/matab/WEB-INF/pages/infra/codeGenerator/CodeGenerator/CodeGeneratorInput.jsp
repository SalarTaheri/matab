<%@page import="com.artonis.infra.codeGenerator.model.CodeGeneratorConstValue.PatternEnum"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve" style="padding-bottom: 8px;">
			<base:comboBox name="patternType" comboLoaderUrl="combo/loadAllPattern" key="infra.codeGenerator.pattern" styleClass="small" />
		</div>
		<div id="masterFields">
			<div class="uk-grid uk-grid-preserve">
				<base:testBox name="path" key="infra.codeGenerator.path" />
				<base:testBox name="packageName" key="infra.codeGenerator.packageName" />
			</div>
			<div class="uk-grid uk-grid-preserve">
				<base:suggest name="tableName" key="infra.codeGenerator.tableName" suggestLoaderController="suggest/loadAllTableName" fieldNames="table_name" tagNames="tableName" />
				<base:testBox name="modelName" key="infra.codeGenerator.modelName" />
			</div>
			<div class="uk-grid uk-grid-preserve">
				<base:suggest name="viewName" key="infra.codeGenerator.viewName" suggestLoaderController="suggest/loadAllViewName" fieldNames="view_name" tagNames="viewName" />
				<base:testBox name="viewModelName" key="infra.codeGenerator.viewModelName" />
			</div>
		</div>
		<div id="itemFields">
			<div class="uk-grid uk-grid-preserve">
				<base:testBox name="workspacePath" key="infra.codeGenerator.path" />
				<base:testBox name="masterPackageName" key="infra.codeGenerator.packageName" />
			</div>
			<div class="uk-grid uk-grid-preserve">
				<base:testBox name="masterModelName" key="infra.codeGenerator.masterModelName" />
			</div>
			<div class="uk-grid uk-grid-preserve">
				<base:suggest name="itemTableName" key="infra.codeGenerator.tableName" suggestLoaderController="suggest/loadAllTableName" fieldNames="table_name" tagNames="itemTableName" />
				<%-- <base:comboBox name="itemTableName" comboLoaderUrl="suggest/loadAllTableName" key="infra.codeGenerator.tableName" minLength="0" /> --%>
				<base:testBox name="itemModelName" key="infra.codeGenerator.modelName" />
			</div>
			<div class="uk-grid uk-grid-preserve">
				<base:suggest name="itemViewName" key="infra.codeGenerator.viewName" suggestLoaderController="suggest/loadAllViewName" fieldNames="view_name" tagNames="viewName" />
				<base:testBox name="itemViewModelName" key="infra.codeGenerator.viewModelName" />
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
var pattern2Master = <%=PatternEnum.PATTERN2_MASTER.getValue()%>;
var pattern2Item = <%=PatternEnum.PATTERN2_ITEM.getValue()%>;
var pattern2AndSearchMaster = <%=PatternEnum.PATTERN2_AND_SEARCH_MASTER.getValue()%>;
var pattern2AndSearchItem = <%=PatternEnum.PATTERN2_AND_SEARCH_ITEM.getValue()%>;
function callback_change_patternType(e){
	if(e.sender._old==pattern2Item || e.sender._old==pattern2AndSearchItem){
		$("#masterFields").hide();
		$("#itemFields").show();
	}else{
		$("#itemFields").hide();
		$("#masterFields").show();
	}
}
$(document).ready(function(){
	$("#masterFields").hide();
	$("#itemFields").hide();
});
</script>