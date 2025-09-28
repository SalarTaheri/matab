
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    String basePath = request.getContextPath();
	System.out.println("basePath Is :"+basePath);
	String gridUrl = basePath+"/generalAccounting/accounting/floatAccountRelatedFloatAccountGroup/grid-relatedFloatAccountGroup-read/";
%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li><span><%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.accounting.relatedGroup")%></span></li>
	</ul>
</div>
<div id="header-toolbar">
 				<button class="uk-button uk-button-success" type="button" onclick="javascript:saveRelatedFloatAccountGrp()" id="addBtn">
		    	  <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.accountingDocuments.doc.add")%>
		    	</button>	    	
		    	<base:button key="fnc.generalAccounting.accountingDocuments.doc.view"  styleClass="uk-button uk-button-success" id="body-heade-viewFloatAccount" />
	</div>
<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="floatAccountId" name="floatAccountId" >
		<div class="uk-grid uk-grid-preserve">
				<base:testBox styleClass="small" name="floatAccountGroupCodeName" key="com.artonis.fnc.generalAccounting.accounting.floatAccountDomain.parent" disabled="true"/>
		</div>
	    <div class="uk-grid uk-grid-preserve">
            	 <base:comboBoxAutoComplete name="floatAccountGroupId"  styleClass="normal" key="fnc.generalAccounting.accounting.relatedGroup" comboLoaderUrl="/combo/loadAllFloatAccountGroup" dataTextField="name" dataValueField="id" minLength="0"
                    hasTemplate="true" headerTemplateComaSep="fnc.generalAccounting.accounting.account.name" templateComaSep="name" iscomboLoaderUrlRelative="true"/>
        </div>
        <div>
			<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
					<base:my-grid-column title='fnc.generalAccounting.accounting.floatAccountGroup'  field="floatAccountGroupcodeName" width="50px"/>
				    <base:my-grid-schema-field name="floatAccountGroupcodeName" type="string"/>
			</base:my-grid>
		</div>
	</form>
</div>
<script type="text/javascript">

$(function () {
    $('#body-heade-viewFloatAccount').on("click", function (e) {
   		window.location = "${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/floatAccount/";
	});
});
function saveRelatedFloatAccountGrp(){
	var data = {};
	data.floatAccountId=$("#floatAccountId").val();
	data.floatAccountGroupId=$("#floatAccountGroupId").val();
	$.ajax({
		url: '${pageContext.request.contextPath}'+'/generalAccounting/accounting/floatAccountRelatedFloatAccountGroup/saveRelatedFloatAccountGroup',
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(data),
		dataType: 'json',
		type: 'POST',
		success: function (data) {
            if (data.state == "error") {
                for (var i = 0; i < data.errors.length; i++) {
                    if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
                        alertify.error($("label[for='" + data.errors[i].Field + "']").text() + ":  " + data.errors[i].Message);
                    } else {
                        alertify.error(data.errors[i].Field + ":  " + data.errors[i].Message);
                    }
                }
            }else{
				$("#grid").data("kendoGrid").dataSource.read();
				alertify.success(data.message);
                document.getElementById("loadedId").value = data.baseObjectId;
            }
		},
		error: function (e) {
			alert('Error: ' + e.responseText);
		}
	});
}    
</script>

