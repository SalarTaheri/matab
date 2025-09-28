<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@ page import="java.util.ResourceBundle" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	request.setAttribute("basePath", basePath);
	String createUrl = basePath + "create";
	String menuSysCode = String.valueOf(request.getAttribute("menuSystemCode"));
%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
		<base:buttonPermission key="hrm.employee.btn.update" classNames="uk-button uk-button-success" id="body-header-btn-update" onClick="updateEmployeeView()"/>
	</div>
</div>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="multiple">
	<base:my-grid-column title='hrm.employee.firstName' field="firstName" width="50px" />
	<base:my-grid-column title='hrm.employee.lastName' field="lastName" width="50px" />
	<base:my-grid-column title='hrm.employee.fatherName' field="fatherName" width="50px" />
	<base:my-grid-column title='hrm.employee.nationalCode' field="nationalCode" width="50px" />
	<base:my-grid-column title='hrm.employee.identityNumber' field="identityNumber" width="50px" />
	<base:my-grid-column title='hrm.employee.birthDate' field="birthDate" width="50px" />
	<base:my-grid-column title='hrm.employee.medicalCouncilCode' field="medicalCouncilCode" width="50px" />

	<base:my-grid-function text="hrm.employee.sendRecordToAppServer" functionClick="grid_onSendRecordToAppServer" name="sendRecordToAppServer" />
</base:my-grid>
		<div style="text-align: center">
			<base:buttonPermission key="hrm.employee.updateOrCreateFloatAccoun" classNames="uk-button uk-button-success" id="updateOrCreateFloatAccounts" onClick="javascript:updateOrCreateFloatAccounts()" style="background-color: rgb(175,214,101);width: 10%;"/>
        </div>
<base:footer/>

<script>
	function grid_onSendRecordToAppServer(e) {
		var data = this.dataItem($(e.target).closest("tr"));
		jQuery.ajax({
			url : "${pageContext.request.contextPath}" + "/hrm/employee/employee/sendRecordToAppServer/" + data.id,
			type : "GET",
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			success : function(result) {
				if (result.state == "success") {
					alertify.success(result.message);
				} else if (result.errorMsg == "error") {
					alertify.error(result.errorMsg);
				}
			},
			error : function(result) {
				if (result.status == 401) {
					window.location.href = "";
				}
			}
		});
	}

    function updateEmployeeView() {
        var requestUrl = "${pageContext.request.contextPath}" + "/hrm/employee/employee/updateEmployeeView";
        $.getJSON(requestUrl, function (result) {
            if (result.state == "success") {
                alertify.success(result.message);
                //
                $("#grid").data("kendoGrid").dataSource.read();
            } else if (result.errorMsg == "error") {
                alertify.error(result.errorMsg);
            }
        });
	}
    function updateOrCreateFloatAccounts(){
        var requestUrl = "${pageContext.request.contextPath}" + "/hrm/employee/employee/updateOrCreateFloatAccounts";
    	$.ajax({
    		url: requestUrl,
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
                   }else{
    					var searchJsonString = "{}";
    					var urlGrid = basePath + "search/search/grid-read/" + searchJsonString;
    					$("#grid").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
    					$("#grid").data("kendoGrid").dataSource.read();
    					alertify.success(data.message);
                   }
    		},
    		error: function (e) {
    			alert('Error: ' + e.responseText);
    		}
    	});	
    }
</script>