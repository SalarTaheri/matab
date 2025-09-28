<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form" id="popupForm">
	<div class="uk-grid uk-grid-preserve formContainer">
		<base:multiSelect serverFilter="true" name="serviceGroupIds" styleClass="small" multiSelectLoaderUrl="/multiselect/loadAllServiceGroup"
				 key="com.artonis.clinic.operation.insuranceDiskette.popup.serviceGroup" />
	
		<base:testBox styleClass="small" name="fileName" key="com.artonis.clinic.operation.insuranceDiskette.popup.fileName"  styledivLabel="margin-right: 50px;"/>
	</div>
</form>

<base:footer />

<script type="text/javascript">
	$("#fileName").val('${defaultFileName}');
	//
	var footer = document.querySelector('.my-popup-footer');
	
	var button = document.createElement('button');
	button.id = 'createDisketteBtn';
	button.type = 'button';
	button.className = 'uk-button uk-button-success';
	button.innerHTML = '${disketteBtnTitle}';
	
	footer.appendChild(button);
	//
	$("#createDisketteBtn").on("click", function(){
		var fileName = $("#fileName").val();
		if(fileName == null || fileName.trim().length < 1){
			fileName = "unknown";
		}
		var serviceGroupIdsArray = $("#serviceGroupIds_multiSelect").val();
		var ids = "-1";
		if(serviceGroupIdsArray != null || serviceGroupIdsArray != undefined){
			for(i=0; i<serviceGroupIdsArray.length; i++){
				ids += "," + serviceGroupIdsArray[i];
			}
		}
		window.location.href = basePath + '/createInsuranceDisketteFile/' + ${entityId} + '/' + ids + '/' + fileName;
		//
		$("#cancel-button").click();
	});
</script>

<style type="text/css">
	.uk-modal-dialog {
		right: 0px;
		margin-right: 0px;
		width: 100%;
		padding: 0px;
		top: 5%;
	}
	.formContainer{
		background: linear-gradient(to bottom, rgba(160, 188, 197, 1) 0%,rgba(190, 201, 206, 1) 37%,rgba(166, 186, 190, 1) 100%);
 		padding-top: 35px;
		padding-bottom: 35px;
	    border: 1px solid #c8c8d3;
	}
	.my-popup-body{
		padding: 0px !important;
	}
	.my-popup-footer{
		direction: ltr;
	}
</style>
