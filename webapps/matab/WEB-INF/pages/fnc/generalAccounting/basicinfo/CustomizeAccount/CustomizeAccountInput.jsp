<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="loadedId" name="loadedId" >
		<input type="hidden" id="id" name="id" >
		
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="systemName" value="name" key="fnc.generalAccounting.basicinfo.customizeAccount.systemName" comboLoaderUrl="combo/loadAllSystemName" styleClass="midsmall" />
		    <base:cascadeComboBox selectIndex="0" styleClass="midsmall" name="pageName" key="fnc.generalAccounting.basicinfo.customizeAccount.pageName" cascadeCombo="systemName" comboLoaderUrl="combo/loadAllPageName"/>
		    <base:cascadeComboBox selectIndex="0" styleClass="midsmall" name="pageEntityName" key="fnc.generalAccounting.basicinfo.customizeAccount.pageEntityName" cascadeCombo="pageName" comboLoaderUrl="combo/loadAllPageEntityName"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="accountCodingType" value="name" key="fnc.generalAccounting.basicinfo.customizeAccount.accountCodingType" comboLoaderUrl="combo/loadAllAccountCodingType" styleClass="midsmall" />
		  	<base:comboBox style="midsmall" name="accountCodingId"   value="name" comboLoaderUrl="combo/loadAllLeafAccountCoding" key="fnc.generalAccounting.basicinfo.customizeAccount.accountCodingName" styleClass="small" minLength="0"/>
		</div>
		<div align="center">
             <button class="uk-button uk-button-success" type="button" onclick="javascript:saveCustomizeAccount()" id="addBtn">
		    	  <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.accountingDocuments.doc.add")%>
		    </button>	
        </div> 
	</form>
<base:Pattern3/>
<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='fnc.generalAccounting.basicinfo.customizeAccount.systemName'  field="systemNameText" width="50px"/>
	<base:my-grid-column title='fnc.generalAccounting.basicinfo.customizeAccount.pageName'  field="pageNameText" width="50px"/>
	<base:my-grid-column title='fnc.generalAccounting.basicinfo.customizeAccount.pageEntityName'  field="pageEntityNameText" width="80px"/>
	<base:my-grid-column title='fnc.generalAccounting.basicinfo.customizeAccount.accountCodingType'  field="accountCodingTypeText" width="80px"/>
	<base:my-grid-column title='fnc.generalAccounting.basicinfo.customizeAccount.accountCodingName'  field="accountCodingName" width="80px"/>

        <base:my-grid-schema-field name="systemNameText" type="string"/>
    	<base:my-grid-schema-field name="pageNameText" type="string"/>
    	<base:my-grid-schema-field name="pageEntityNameText" type="string"/>
    	<base:my-grid-schema-field name="accountCodingTypeText" type="string"/>
    	<base:my-grid-schema-field name="accountCodingName" type="string"/>
    	
</base:my-grid>
</div>
<script>
function saveCustomizeAccount(){
	var data = {};
	data.id=$("#id").val();
	data.systemName=$("#systemName").val();
	data.pageName=$("#pageName").val();
	data.pageEntityName=$("#pageEntityName").val();
	data.accountCodingType=$("#accountCodingType").val();
	data.accountCodingId=$("#accountCodingId").val();
	$.ajax({
		url: '${pageContext.request.contextPath}'+'/fnc/generalAccounting/basicinfo/customizeAccount/save',
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