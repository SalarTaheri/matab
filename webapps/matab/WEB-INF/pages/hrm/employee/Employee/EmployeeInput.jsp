<%@page import="java.util.ResourceBundle"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader/>
<%--<base:pageInputHeader/>--%>

<%
    String basePath = (String) request.getAttribute("basePath");
    int posEdit = basePath.indexOf("/edit/");
    int posCreate = basePath.indexOf("/create");

    String comboAutoCompleteProvince="";
    String comboAutoCompleteCity="";


    if(posEdit < 0 &&posCreate>-1){
        comboAutoCompleteProvince=basePath.substring(0, posCreate)+"/combo/loadAllProvince";
        comboAutoCompleteCity=basePath.substring(0, posCreate)+"/combo/loadAllCity";
    }else if(posEdit >-1 && posCreate<0){
        comboAutoCompleteProvince=basePath.substring(0, posEdit)+"/combo/loadAllProvince";
        comboAutoCompleteCity=basePath.substring(0, posEdit)+"/combo/loadAllCity";
    }
%>
<!-- <div class="uk-container uk-container-center my-uk-container" style="overflow-y: auto;overflow-x:hidden; width: 100%; height: 485px;" dir="ltr"> -->
	<%--<div class="uk-container uk-container-center my-uk-container"  style="overflow-y: auto; width: 100%; height: 98%;" dir="ltr">--%>
	<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="attachFileListCommaSep" name="attachFileListCommaSep" >
		<input type="hidden" id="floatAccount_Id" name="floatAccount_Id" >
		
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="workingGroup" isListConstant="true" key="hrm.employee.workingGroup" comboLoaderUrl="combo/loadAllEmployeeWorkingGroup" />
			<base:testBox styleClass="small" name="personnelCode" key="hrm.employee.personnleCode" />
            <base:testBox styleClass="small" name="firstName" key="hrm.employee.firstName" />
		</div>
		
		<div class="uk-grid uk-grid-preserve">

			<base:testBox styleClass="small" name="lastName" key="hrm.employee.lastName" />
            <base:testBox styleClass="small" name="fatherName" key="hrm.employee.fatherName" />
            <base:testBox styleClass="small" name="nationalCode" key="hrm.employee.nationalCode" />
		</div>
		
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="identityNumber" key="hrm.employee.identityNumber" />
			<base:mDatePicker styleClass="small" name="birthDate" key="hrm.employee.birthDate" direction="ltr"/>
            <base:comboBox styleClass="small" name="sex" isListConstant="true" key="hrm.employee.sex" comboLoaderUrl="combo/loadAllSex" />
		</div>
		
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="marriage" isListConstant="true" key="hrm.employee.marriage" comboLoaderUrl="combo/loadAllMarriage" />
            <base:comboBox styleClass="small" name="nationality_id" isListConstant="true" key="hrm.employee.nationality" comboLoaderUrl="combo/nationality" />
            <base:mDatePicker styleClass="small" name="workingStartDate" key="hrm.employee.workingStartDate" direction="ltr"/>
		</div>

        <div class="uk-grid uk-grid-preserve">
            <base:comboBoxAutoComplete styleClass="small" name="birthProvince_id" key="system.province" comboLoaderUrl="<%=comboAutoCompleteProvince%>"
                                       dataTextField="name" dataValueField="id" minLength="0" pageSize="40"/>
        <%--<base:comboBoxAutoComplete name="province_id" key="system.province" comboLoaderUrl="combo/loadAllProvince"--%>
            <base:cascadeComboBox styleClass="small" name="birthCity_id" key="system.city" cascadeCombo="birthProvince_id" comboLoaderUrl="combo/loadCascadeCity"/>
            <%--<base:comboBoxAutoComplete styleClass="small" name="birthCity_id" key="system.city" comboLoaderUrl="<%=comboAutoCompleteCity%>"--%>
                                       <%--dataTextField="name" dataValueField="id" minLength="1"/>--%>
            <base:mDatePicker styleClass="small" name="identityIssuanceDate" key="hrm.employee.identityIssuanceDate" direction="ltr"/>
        </div>
        <div class="uk-grid uk-grid-preserve">

            <base:testBox styleClass="small" name="identitySerial" key="hrm.employee.identityNumber" />
            <base:comboBox styleClass="small" isListConstant="true" name="religious_id"  key="hrm.employee.religious" comboLoaderUrl="combo/religious" />
            <base:comboBoxAutoComplete styleClass="small" name="issuanceCity_id" key="hrm.employee.issuanceCity" comboLoaderUrl="<%=comboAutoCompleteCity%>"
                                       dataTextField="name" dataValueField="id" minLength="1"/>
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="insuranceNumber" key="hrm.employee.insuranceNumber" />
            <base:testBox styleClass="small" name="email" key="hrm.employee.email" />
            <base:comboBox styleClass="small" name="militaryState_id" isListConstant="true" key="hrm.employee.militaryState" comboLoaderUrl="combo/militarystate"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="tel" key="hrm.employee.tel" />
            <base:testBox styleClass="small" name="mobile" key="hrm.employee.mobile" />
            <base:comboBox styleClass="small" name="operatingUnit_id" key="hrm.employee.operatingUnit" comboLoaderUrl="combo/loadAllOperatingUnit"/>
		</div>
        <div class="uk-grid uk-grid-preserve medicalField">
			<base:testBox styleClass="small" name="prefix" key="hrm.employee.prefix" />
        	<base:comboBox styleClass="small" name="doctorGroup" isListConstant="true" key="hrm.employee.doctorGroup" comboLoaderUrl="combo/loadAllDoctorGroup"/>
        	<base:testBox styleClass="small" name="medicalCouncilCode" key="hrm.employee.medicalCouncilCode" />
        </div>
        <div class="uk-grid uk-grid-preserve medicalField">
	        <base:multiSelect name="proficiency" styleClass="normal" multiSelectLoaderUrl="combo/loadAllProficiency"
					key="com.artonis.clinic.basicInfo.proficiency.name" />
			<base:checkbox styleClass="small" name="isEndlessConnection" key="hrm.employee.isEndlessConnection"/>
        </div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea name="address" key="hrm.employee.address" height="60"/>
		</div>
        <div class="uk-grid uk-grid-preserve">
            <base:fileUploader fileRemoveUrl="file/fileRemove" name="files" key="hrm.employee.picture" fileSaveUrl="file/fileUpload"
                               uploadedFileAddress="attachFileListCommaSep" multiple="false" valueFieldName="personnelCode"/>
			<img alt="No Pic" src="" id="showImage" width="100px" height="220px" style="margin-right: 20px">
        </div>
				
	</form>
	<base:itemForm titleKeys="hrm.employee.familyInfo" formItemTabViewJspFiles="EmployeeFamilyItemTabView.jsp"
					formItemTabInputs="EmployeeFamilyItemTabInput" masterIdStr="employee_id" insertWithoutPopup="true"/>
	
</div>
<script type="text/javascript">
$(document).ready(function(){
	checkShowHideMedicalFields();
});
function callback_deserialize(data){
	checkShowHideMedicalFields();
	///////////////
	if($.isNumeric(data.id)){
		var requestUrl = "${pageContext.request.contextPath}"+"/hrm/employee/employee/loadProficiencies/" + data.id;
		$.getJSON(requestUrl, function (data) {
			var proficiencies = data.employeeProficiencies.split(",");
			var multiSelect = $("#proficiency_multiSelect").data("kendoMultiSelect");
			multiSelect.value(proficiencies);
		});
	}
}
function checkShowHideMedicalFields(){
	if($("#workingGroup").val()==1){
		$(".medicalField").show();
	}else{
		$(".medicalField").hide();
	}
}
function callback_change_workingGroup(e){
	checkShowHideMedicalFields();
}
function callback_save_success(){
		var EmployeeRroficiencyRel = {};
		EmployeeRroficiencyRel.employee_id = $("#id").val();
		if($("#workingGroup").val()==1){
			EmployeeRroficiencyRel.proficiencyValues = $("#proficiency_multiSelect").val();
		}
		$.ajax({
			url: '${pageContext.request.contextPath}'+'/hrm/employee/employee/saveProficiencyRel',
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(EmployeeRroficiencyRel),
			dataType: 'json',
			type: 'POST',
			success: function (data, success, xhr) {
	            if (data.state == "error") {
	                for (var i = 0; i < data.errors.length; i++) {
	                    if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
	                        alertify.error($("label[for='" + data.errors[i].Field + "']").text() + "  " + data.errors[i].Message);
	                    } else {
	                        alertify.error(data.errors[i].Field + "  " + data.errors[i].Message);
	                    }
	                }
	            }else{
				}
			},
			error: function (e) {
//				alert('Error: ' + e.responseText);
			}
		});
}
function callback_saveClose() {
    callback_save_success();
    window.location.href = getBaseUrl();
}

</script>