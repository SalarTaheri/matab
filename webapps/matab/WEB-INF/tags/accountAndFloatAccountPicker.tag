<%@tag import="com.artonis.fnc.generalAccounting.basicinfo.service.util.BasicInfoServiceUtil"%>
<%@tag import="com.artonis.fnc.generalAccounting.basicinfo.model.GeneralAccountingConfig"%>
<%@tag import="java.util.ResourceBundle" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>

<%@attribute name="accountCodingFieldName" required="true" rtexprvalue="true" %>
<%@attribute name="floatAccount1FieldName" required="true" rtexprvalue="true" %>
<%@attribute name="floatAccount2FieldName" required="true" rtexprvalue="true" %>
<%@attribute name="floatAccount3FieldName" required="true" rtexprvalue="true" %>
<%@attribute name="floatAccount4FieldName" required="true" rtexprvalue="true" %>
<%@attribute name="accountCodingFieldKey" required="false" rtexprvalue="true" %>
<%@attribute name="floatAccount1FieldKey" required="false" rtexprvalue="true" %>
<%@attribute name="floatAccount2FieldKey" required="false" rtexprvalue="true" %>
<%@attribute name="floatAccount3FieldKey" required="false" rtexprvalue="true" %>
<%@attribute name="floatAccount4FieldKey" required="false" rtexprvalue="true" %>
<%@attribute name="accountCodingLoadUrl" required="false" rtexprvalue="true" %>
<%@attribute name="disabled" required="false" rtexprvalue="true" %>
<%@ attribute name="ignore" required="false" rtexprvalue="true" %>
<%@ attribute name="styleClass" required="false" rtexprvalue="true" %>
<%@ attribute name="style" required="false" rtexprvalue="true" %>
<%@ attribute name="stylediv" required="false" rtexprvalue="true" %>
<%@ attribute name="styledivLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="styleLabel" required="false" rtexprvalue="true" %>
<%@ attribute name="accountCodingDynamicURL" required="false" rtexprvalue="true" %>

<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	Integer activeLevels = 4;
	GeneralAccountingConfig generalAccountingConfig = BasicInfoServiceUtil.loadGeneralAccountingConfig();
	if (generalAccountingConfig != null){
		activeLevels = generalAccountingConfig.getNumberActiveLevels();
	}
	if(accountCodingFieldKey==null || accountCodingFieldKey.length()<1)
		accountCodingFieldKey = "fnc.generalAccounting.accountingDocuments.doc.accountName";
	if(floatAccount1FieldKey==null || floatAccount1FieldKey.length()<1)
		floatAccount1FieldKey = "fnc.generalAccounting.accounting.doc.float1";
	if(floatAccount2FieldKey==null || floatAccount2FieldKey.length()<1)
		floatAccount2FieldKey = "fnc.generalAccounting.accounting.doc.float2";
	if(floatAccount3FieldKey==null || floatAccount3FieldKey.length()<1)
		floatAccount3FieldKey = "fnc.generalAccounting.accounting.doc.float3";
	if(floatAccount4FieldKey==null || floatAccount4FieldKey.length()<1)
		floatAccount4FieldKey = "fnc.generalAccounting.accounting.doc.float4";
	
	ignore = (ignore == null || ignore.equals("")) ? "false" : "true";
%>

<jsp:doBody/>
<div style="padding-bottom: 10px; padding-top: 10px;">
<div class="uk-grid uk-grid-preserve">
<%if(accountCodingLoadUrl==null || accountCodingLoadUrl.length()<1){ %>
	<base:comboBoxWithCustomURL style="<%=style%>"  stylediv="<%=stylediv%>" styledivLabel="<%=styledivLabel%>" styleLabel="<%=styleLabel%>" name="${accountCodingFieldName}" value="name" key="<%=accountCodingFieldKey%>" comboLoaderFullUrl="bas/generalAccounting/accountingDocuments/combo/loadAllAccount" styleClass="small" minLength="0" ignore="<%=ignore%>"/>
<%}else{ %>
	<base:comboBox style="<%=style%>"  stylediv="<%=stylediv%>" styledivLabel="<%=styledivLabel%>" styleLabel="<%=styleLabel%>" name="${accountCodingFieldName}"   value="name" comboLoaderUrl="<%=accountCodingLoadUrl%>" key="<%=accountCodingFieldKey%>" styleClass="small" minLength="0"/>
<%} %>
</div>
<div class="uk-grid uk-grid-preserve">
	<%if (activeLevels >=1){ %>
		<base:cascadeComboBoxWithCustomURL style="<%=style%>"  stylediv="<%=stylediv%>" styledivLabel="<%=styledivLabel%>" styleLabel="<%=styleLabel%>"  cascadeCombo="${accountCodingFieldName}" name="${floatAccount1FieldName}"  key="<%=floatAccount1FieldKey%>" comboLoaderFullUrl="bas/generalAccounting/accountingDocuments/combo/loadAllFloatAccount1" styleClass="small" minLength="0" ignore="<%=ignore%>"/>
	<%} %>
	<%if (activeLevels >=2){ %>
	 	<base:cascadeComboBoxWithCustomURL style="<%=style%>"  stylediv="<%=stylediv%>" styledivLabel="<%=styledivLabel%>" styleLabel="<%=styleLabel%>" cascadeCombo="${accountCodingFieldName}" name="${floatAccount2FieldName}"  key="<%=floatAccount2FieldKey%>" comboLoaderFullUrl="bas/generalAccounting/accountingDocuments/combo/loadAllFloatAccount2" styleClass="small" minLength="0" ignore="<%=ignore%>"/>
    <%} %>
</div>
<div class="uk-grid uk-grid-preserve">
    <%if (activeLevels >=3){ %>
		<base:cascadeComboBoxWithCustomURL style="<%=style%>"  stylediv="<%=stylediv%>" styledivLabel="<%=styledivLabel%>" styleLabel="<%=styleLabel%>" cascadeCombo="${accountCodingFieldName}" name="${floatAccount3FieldName}"  key="<%=floatAccount3FieldKey%>" comboLoaderFullUrl="bas/generalAccounting/accountingDocuments/combo/loadAllFloatAccount3" styleClass="small" minLength="0" ignore="<%=ignore%>"/>
	<%} %>
	<%if (activeLevels >=4){ %>
		<base:cascadeComboBoxWithCustomURL style="<%=style%>"  stylediv="<%=stylediv%>" styledivLabel="<%=styledivLabel%>" styleLabel="<%=styleLabel%>" cascadeCombo="${accountCodingFieldName}" name="${floatAccount4FieldName}"  key="<%=floatAccount4FieldKey%>" comboLoaderFullUrl="bas/generalAccounting/accountingDocuments/combo/loadAllFloatAccount4" styleClass="small" minLength="0" ignore="<%=ignore%>"/>
    <%} %>
</div>
</div>
<script language="JavaScript" type="text/javascript">

var ${floatAccount1FieldName}_isEnable;
var ${floatAccount2FieldName}_isEnable;
var ${floatAccount3FieldName}_isEnable;
var ${floatAccount4FieldName}_isEnable;
var activeLevels;
$(document).ready(function(){
	checkForDisabled();
	activeLevels=<%=activeLevels%>;
});
function checkForDisabled(){
	if("${disabled}"=="true"){
		$("#${accountCodingFieldName}_Comb").data("kendoComboBox").enable(false);
		$("#${floatAccount1FieldName}_Comb").data("kendoComboBox").enable(false);
		${floatAccount1FieldName}_isEnable=false;
		$("#${floatAccount2FieldName}_Comb").data("kendoComboBox").enable(false);
		${floatAccount2FieldName}_isEnable=false;
		$("#${floatAccount3FieldName}_Comb").data("kendoComboBox").enable(false);
		${floatAccount3FieldName}_isEnable=false;
		$("#${floatAccount4FieldName}_Comb").data("kendoComboBox").enable(false);
		${floatAccount4FieldName}_isEnable=false;
	}
}
function callback_DataBound_${floatAccount1FieldName}(data){
	var enteredText = $("#${floatAccount1FieldName}_Comb").data('kendoComboBox')._prev;
	if(enteredText === undefined || enteredText.length == 0){
	    <%--var lenghtFDA1 = $("#${floatAccount1FieldName}_Comb").data("kendoComboBox").dataSource._total;--%>
	    var lenghtFDA1 = $("#${floatAccount1FieldName}_Comb").data("kendoComboBox").dataSource._data.length;
	    if(lenghtFDA1 > 0){
	    	$("#${floatAccount1FieldName}_Comb").data("kendoComboBox").enable(true);
	    	${floatAccount1FieldName}_isEnable=true;
	    	$("#${floatAccount1FieldName}_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%;"
	    }else{
	    	$("#${floatAccount1FieldName}_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%; background: rgb(206, 215, 235);"
	    	$("#${floatAccount1FieldName}_Comb").data("kendoComboBox").enable(false);
	    	${floatAccount1FieldName}_isEnable=false;
	    }
    }
    checkForDisabled();
}
function callback_DataBound_${floatAccount2FieldName}(data){
	var enteredText = $("#${floatAccount2FieldName}_Comb").data('kendoComboBox')._prev;
	if(enteredText === undefined || enteredText.length == 0){
	    var lenghtFDA2 = $("#${floatAccount2FieldName}_Comb").data("kendoComboBox").dataSource._total;
	    if(lenghtFDA2 > 0){
	    	$("#${floatAccount2FieldName}_Comb").data("kendoComboBox").enable(true);
	    	${floatAccount2FieldName}_isEnable=true;
	    	$("#${floatAccount2FieldName}_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%;"
	    }else{
	    	$("#${floatAccount2FieldName}_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%; background: rgb(206, 215, 235);"
	    	$("#${floatAccount2FieldName}_Comb").data("kendoComboBox").enable(false);
	    	${floatAccount2FieldName}_isEnable=false;
	    }
    }
    checkForDisabled();
}
function callback_DataBound_${floatAccount3FieldName}(data){
	var enteredText = $("#${floatAccount3FieldName}_Comb").data('kendoComboBox')._prev;
	if(enteredText === undefined || enteredText.length == 0){
	    var lenghtFDA3 = $("#${floatAccount3FieldName}_Comb").data("kendoComboBox").dataSource._total;
	    if(lenghtFDA3 > 0){
	    	$("#${floatAccount3FieldName}_Comb").data("kendoComboBox").enable(true);
	    	${floatAccount3FieldName}_isEnable=true;
	    	$("#${floatAccount3FieldName}_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%;"
	    }else{
	    	$("#${floatAccount3FieldName}_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%; background: rgb(206, 215, 235);"
	    	$("#${floatAccount3FieldName}_Comb").data("kendoComboBox").enable(false);
	    	${floatAccount3FieldName}_isEnable=false;
	    }
    }
    checkForDisabled();
}
function callback_DataBound_${floatAccount4FieldName}(data){
	var enteredText = $("#${floatAccount4FieldName}_Comb").data('kendoComboBox')._prev;
	if(enteredText === undefined || enteredText.length == 0){
	    var lenghtFDA4 = $("#${floatAccount4FieldName}_Comb").data("kendoComboBox").dataSource._total;
	    if(lenghtFDA4 > 0){
	    	$("#${floatAccount4FieldName}_Comb").data("kendoComboBox").enable(true);
	    	${floatAccount4FieldName}_isEnable=true;
	    	$("#${floatAccount4FieldName}_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%;"
	    }else{
	    	$("#${floatAccount4FieldName}_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%; background: rgb(206, 215, 235);"
	    	$("#${floatAccount4FieldName}_Comb").data("kendoComboBox").enable(false);
	    	${floatAccount4FieldName}_isEnable=false;
	    }
    }
    checkForDisabled();
}
function resetAccountAndFloatAccountPicker(){
	$("#${accountCodingFieldName}").val("");
	$("#${floatAccount1FieldName}").val("");
	$("#${floatAccount2FieldName}").val("");
	$("#${floatAccount3FieldName}").val("");
	$("#${floatAccount4FieldName}").val("");
	$("#${accountCodingFieldName}_Comb").data("kendoComboBox").value("");

	if(activeLevels>=1){
		$("#${floatAccount1FieldName}_Comb").data("kendoComboBox").value("");
		$("#${floatAccount1FieldName}_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%; background: rgb(206, 215, 235);"
		$("#${floatAccount1FieldName}_Comb").data("kendoComboBox").enable(false);
		${floatAccount1FieldName}_isEnable=false;
	}

	if(activeLevels>=2){
		$("#${floatAccount2FieldName}_Comb").data("kendoComboBox").value("");
		$("#${floatAccount2FieldName}_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%; background: rgb(206, 215, 235);"
		$("#${floatAccount2FieldName}_Comb").data("kendoComboBox").enable(false);
		${floatAccount2FieldName}_isEnable=false;
	}

	if(activeLevels>=3){
		$("#${floatAccount3FieldName}_Comb").data("kendoComboBox").value("");
		$("#${floatAccount3FieldName}_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%; background: rgb(206, 215, 235);"
		$("#${floatAccount3FieldName}_Comb").data("kendoComboBox").enable(false);
		${floatAccount3FieldName}_isEnable=false;
	}

	if(activeLevels>=4){
		$("#${floatAccount4FieldName}_Comb").data("kendoComboBox").value("");
		$("#${floatAccount4FieldName}_Comb").data("kendoComboBox").input[0].style.cssText="width: 100%; background: rgb(206, 215, 235);"
		$("#${floatAccount4FieldName}_Comb").data("kendoComboBox").enable(false);
		${floatAccount4FieldName}_isEnable=false;
	}
   	checkForDisabled();
}
function editAccountAndFloatAccountPicker(accountCodingValue, floatAccount1Value, floatAccount2Value, floatAccount3Value, floatAccount4Value){
	$("#${accountCodingFieldName}_Comb").data("kendoComboBox").value(accountCodingValue);
    $("#${floatAccount1FieldName}").val('');

    var accountCodingKendoComboBox=$("#${accountCodingFieldName}_Comb").data("kendoComboBox");
    accountCodingKendoComboBox.dataSource.read({
        filter: {
            logic: "or",
            filters:  [ { field: "id", operator: "eq", value: accountCodingValue } ]
        }
    });
    accountCodingKendoComboBox.value(accountCodingValue);

	if(activeLevels>=1){
		//floatAccount1FieldName
		var kendoComboBox=$("#${floatAccount1FieldName}_Comb").data("kendoComboBox");
		kendoComboBox.dataSource.read({
			filter: {
				logic: "or",
				filters:  [ { field: "id", operator: "eq", value: accountCodingValue } ]
			}
		});
		$("#${floatAccount1FieldName}_Comb").data("kendoComboBox").value(floatAccount1Value);
	}

	if(activeLevels>=2){
		//floatAccount2FieldName
		$("#${floatAccount2FieldName}").val('');
		var kendoComboBox=$("#${floatAccount2FieldName}_Comb").data("kendoComboBox");
		kendoComboBox.dataSource.read({
			filter: {
				logic: "or",
				filters:  [ { field: "id", operator: "eq", value: accountCodingValue } ]
			}
		});
		$("#${floatAccount2FieldName}_Comb").data("kendoComboBox").value(floatAccount2Value);
	}

	if(activeLevels>=3){
		//floatAccount3FieldName
		$("#${floatAccount3FieldName}").val('');
		var kendoComboBox=$("#${floatAccount3FieldName}_Comb").data("kendoComboBox");
		kendoComboBox.dataSource.read({
			filter: {
				logic: "or",
				filters:  [ { field: "id", operator: "eq", value: accountCodingValue } ]
			}
		});
		$("#${floatAccount3FieldName}_Comb").data("kendoComboBox").value(floatAccount3Value);
	}

	if(activeLevels>=4){
		//floatAccount4FieldName
		$("#${floatAccount4FieldName}").val('');
		var kendoComboBox=$("#${floatAccount4FieldName}_Comb").data("kendoComboBox");
		kendoComboBox.dataSource.read({
			filter: {
				logic: "or",
				filters:  [ { field: "id", operator: "eq", value: accountCodingValue } ]
			}
		});
		$("#${floatAccount4FieldName}_Comb").data("kendoComboBox").value(floatAccount4Value);
	}
    $("#${accountCodingFieldName}").val(accountCodingValue);
    $("#${floatAccount1FieldName}").val(floatAccount1Value);
    $("#${floatAccount2FieldName}").val(floatAccount2Value);
    $("#${floatAccount3FieldName}").val(floatAccount3Value);
    $("#${floatAccount4FieldName}").val(floatAccount4Value);
    checkForDisabled();
}

function validationSavePicker_${accountCodingFieldName}(){
  var isValidate=true;
  if(${floatAccount1FieldName}_isEnable==true && $("#${floatAccount1FieldName}").val()=="" ){
    alertify.error('<%=resource.getString("fnc.generalAccounting.accounting.account.levelsIsNeccessery")%>');
    isValidate=false;
  }
  if(${floatAccount2FieldName}_isEnable==true && $("#${floatAccount2FieldName}").val()=="" ){
    alertify.error('<%=resource.getString("fnc.generalAccounting.accounting.account.levelsIsNeccessery")%>');
    isValidate=false;
  }
  if(${floatAccount3FieldName}_isEnable==true && $("#${floatAccount3FieldName}").val()=="" ){
    alertify.error('<%=resource.getString("fnc.generalAccounting.accounting.account.levelsIsNeccessery")%>');
    isValidate=false;
  }
  if(${floatAccount4FieldName}_isEnable==true && $("#${floatAccount4FieldName}").val()=="" ){
    alertify.error('<%=resource.getString("fnc.generalAccounting.accounting.account.levelsIsNeccessery")%>');
    isValidate=false;
  }
  return isValidate;
}  
</script>