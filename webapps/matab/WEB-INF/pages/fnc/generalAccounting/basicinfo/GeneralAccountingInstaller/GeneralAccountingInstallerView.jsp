
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>
<div class="uk-container uk-container-center my-uk-container" >

    <form class="uk-form" id="mainForm">
     <div style="text-align: center">
	     <button class="uk-button uk-button-success" type="button" onclick="javascript:createAccountLyr();" id="createAccountLayer">
		      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.basicinfo.generalAccountingInstaller.createAccountLayer")%>
	     </button>
	      <button class="uk-button uk-button-success" type="button" onclick="javascript:createAccountCoding()" id="createAccountCoding">
		      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.basicinfo.generalAccountingInstaller.createAccountCoding")%>
	     </button>
	 </div>
	  <div class="uk-grid uk-grid-preserve"></div>
	  <div class="uk-grid uk-grid-preserve"><div>
	  <div style="text-align: center">
	     <button class="uk-button uk-button-success" type="button" onclick="javascript:createFloatAccountGrp()" id=createFloatAccountGroup>
		      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.basicinfo.generalAccountingInstaller.createFloatAccountGroup")%>
	     </button>
	      <button class="uk-button uk-button-success" type="button" onclick="javascript:createFloatAccount()" id="createFloatAccount">
		      <%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.basicinfo.generalAccountingInstaller.createFloatAccount")%>
	     </button>
	 </div>
     </div>
	</form>
</div>
<script>
function createAccountLyr(){
$.ajax({
	url: '${pageContext.request.contextPath}'+'/generalAccounting/basicinfo/generalAccountingInstaller/createAccountLayer',
	contentType: "application/json; charset=utf-8",
	dataType: 'json',
	type: 'POST',
	success: function (data, success, xhr) {
           if (data.state == "error") {
               for (var i = 0; i < data.errors.length; i++) {
                   if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
                       alertify.error($("label[for='" + data.errors[i].Field + "']").text() + ":  " + data.errors[i].Message);
                   } else {
                       alertify.error(data.errors[i].Field + ":  " + data.errors[i].Message);
                   }
               }
           }
				alertify.success(data.message);
           },
	error: function (e) {
		alert('Error: ' + e.responseText);
	}
});
}
//////////////////////
function createFloatAccountGrp(){
$.ajax({
	url: '${pageContext.request.contextPath}'+'/generalAccounting/basicinfo/generalAccountingInstaller/createFloatAccountGroup',
	contentType: "application/json; charset=utf-8",
	dataType: 'json',
	type: 'POST',
	success: function (data, success, xhr) {
           if (data.state == "error") {
               for (var i = 0; i < data.errors.length; i++) {
                   if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
                       alertify.error($("label[for='" + data.errors[i].Field + "']").text() + ":  " + data.errors[i].Message);
                   } else {
                       alertify.error(data.errors[i].Field + ":  " + data.errors[i].Message);
                   }
               }
           }
				alertify.success(data.message);
           },
	error: function (e) {
		alert('Error: ' + e.responseText);
	}
});
}
</script>