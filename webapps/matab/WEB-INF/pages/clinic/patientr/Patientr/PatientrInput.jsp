<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.artonis.clinic.patient.service.util.PatientServiceUtil"%>
<%@page import="com.artonis.clinic.core.model.Patientr"%>
<%@ page import="com.artonis.clinic.core.service.util.ClinicCoreServiceUtil" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

  <link rel="stylesheet" type="text/css" media="all" href="<c:url value='/resources/lightBox/css/styles.css'/>">
  <link rel="stylesheet" type="text/css" media="all" href="<c:url value='/resources/lightBox/css/jquery.lightbox-0.5.css'/>">
  <script type="text/javascript" src="<c:url value='/resources/lightBox/js/jquery.lightbox-0.5.min.js'/>"></script>
  
<%
    String basePath = (String) request.getAttribute("basePath");
    String controllerBasePath = (String) request.getAttribute("controllerBasePath");
//    int posCreate = basePath.indexOf("/create");

    String comboAutoCompleteProvince="";
    String comboAutoCompleteCity="";

    comboAutoCompleteProvince=controllerBasePath+"/combo/loadAllProvince";
    comboAutoCompleteCity=controllerBasePath+"/combo/loadCascadeCity";

    String[] attachFileArray = null;
    String attachFileListBarSep = "";
	Integer patientId = (Integer) request.getAttribute("id");
	if(patientId!=null && patientId.longValue()>0){
        Patientr patientr = ClinicCoreServiceUtil.loadPatient(patientId.longValue());
        attachFileListBarSep = patientr.getAttachFileListBarSep();
        if(attachFileListBarSep==null){
            attachFileListBarSep="";
        }
        attachFileArray = attachFileListBarSep.split("\\|");
	}
%>

<%--<base:pageHeader></base:pageHeader>--%>
<base:pageHeaderWithPrint/>

<base:pageInputHeader></base:pageInputHeader>
<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id" >
        <input type="hidden" id="currentYear" name="currentYear" data-ignore="true">
        <input type="hidden" id="attachFileListBarSep" name="attachFileListBarSep" >
        <input type="hidden" id="cameFromFactorPage" name="cameFromFactorPage" data-ignore="true">
        <input type="hidden" id="appointmentId" name="appointmentId" data-ignore="true">

        <div class="uk-grid uk-grid-preserve">
            <base:comboBox styleClass="small" name="doctor_id" key="his.patient.doctorName" value="doctorFullName" minLength="0" comboLoaderUrl="combo/loadAllDoctor" isMandatory="true"/>
            <base:mDatePicker name="date" key="clinic.patient.date" styleClass="small" />
            <base:testBox styleClass="small" name="filenumber" key="clinic.patient.fileNumber" isMandatory="true"/>
        </div>

        <div class="uk-grid uk-grid-preserve checkingFields">
            <base:testBox styleClass="small" name="firstname" key="clinic.patient.firstName" isMandatory="true"/>
            <base:testBox styleClass="small" name="lastname" key="clinic.patient.lastName" isMandatory="true"/>
            <base:testBoxNumeric styleClass="small" name="age" key="clinic.patient.age" isMandatory="true"/>
        </div>
        <div class="uk-grid uk-grid-preserve checkingFields">
            <base:testBoxNumeric  direction="ltr" styleClass="small" name="birthYear" key="clinic.patient.birthYear" isMandatory="true"/>
            <%--<base:comboBox styleClass="small" name="job_id" key="clinic.patient.job" isListConstant="true" comboLoaderUrl="combo/loadJob"/>--%>
            <base:comboBox-buttonNew styleClass="small" name="job_id" key="clinic.patient.job" isListConstant="true" comboLoaderUrl="combo/loadJob"
                                     popupUrl="/popup/job" relativeSaveUrl="/job/save"/>
            <base:testBox styleClass="small" name="fathername" key="clinic.patient.fatherName" isMandatory="true"/>



        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:comboBoxAutoComplete styleClass="small" name="birthplace_province_id" key="clinic.patient.birthplace.province" comboLoaderUrl="<%=comboAutoCompleteProvince%>"
                                       dataTextField="name" dataValueField="id" minLength="0" pageSize="40"/>
            <%--<base:cascadeComboBox styleClass="small" name="birthplace_city_id" key="clinic.patient.birthplace.city" cascadeCombo="birthplace_province_id" comboLoaderUrl="combo/loadCascadeCity"/>--%>
            <base:comboBoxAutoComplete styleClass="small" name="birthplace_city_id" key="clinic.patient.birthplace.city"  comboLoaderUrl="<%=comboAutoCompleteCity%>" dataTextField="name" dataValueField="id" minLength="1"/>

            <base:comboBoxAutoComplete styleClass="small" name="province_id" key="clinic.patient.livesIn.province" comboLoaderUrl="<%=comboAutoCompleteProvince%>"
                                       dataTextField="name" dataValueField="id" minLength="1" pageSize="40"/>

        </div>
        <div class="uk-grid uk-grid-preserve">
            <%--<base:cascadeComboBox styleClass="small" name="city_id" key="clinic.patient.livesIn.city" cascadeCombo="province_id" comboLoaderUrl="combo/loadCascadeCity"/>--%>
            <base:comboBoxAutoComplete styleClass="small" name="city_id" key="clinic.patient.livesIn.city"  comboLoaderUrl="<%=comboAutoCompleteCity%>"
                                       dataTextField="name" dataValueField="id" minLength="1" pageSize="40"/>
            <base:testBox styleClass="small" name="cellphon" key="clinic.patient.cellPhone" isMandatory="true"/>
            <base:testBox styleClass="small" name="tel1" key="clinic.patient.tel1"/>


        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="tel2" key="clinic.patient.tel2"/>
            <base:comboBox styleClass="small" name="sex" key="clinic.patient.sex" comboLoaderUrl="combo/loadAllSex" isListConstant="true"  isMandatory="true"/>
            <base:comboBox styleClass="small" name="maritalstatus" key="clinic.patient.maritalStatus" comboLoaderUrl="combo/loadAllMarriage" isListConstant="true"/>
        </div>
        
        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="nationalCode" key="clinic.patient.nationalCode"  />
            <base:testBox styleClass="small" name="identitynumber" key="clinic.patient.identityNumber"/>
            <base:testBox styleClass="small" name="insuranceCode" key="clinic.patient.insuranceCode"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
        	<base:comboBox styleClass="small" name="insurance_type_1_id" key="clinic.patient.insurancePrimType" comboLoaderUrl="combo/loadAllInsuranceOrgType1" isListConstant="true"  />
            <base:testBox styleClass="small" name="insurance_type_1_num" key="clinic.patient.insurancePrimTypeNumber"/>
            <base:comboBox styleClass="small" name="insurance_type_2_id" key="clinic.patient.insuranceCompleteType" comboLoaderUrl="combo/loadAllInsuranceOrgType2" isListConstant="true"  />
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="insurance_type_2_num" key="clinic.patient.insuranceCompleteTypeNumber"/>
            <base:testBox styleClass="small" name="englishFirstName" key="clinic.patient.englishFirstName"/>
            <base:testBox styleClass="small" name="englishLastName" key="clinic.patient.englishLastName" />
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker name="birthDate" key="clinic.patient.fullBirthDate" styleClass="small" />
            <base:testBox styleClass="small" name="husbandName" key="clinic.patient.husbandName"/>
            <base:testBox styleClass="small" name="introducer" key="clinic.patient.introducer"/>

        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="cellphone2" key="clinic.patient.cellphone2"/>
            <base:testBox styleClass="small" name="husbandCellphone" key="clinic.patient.husbandCellphone"/>
            <base:checkbox styleClass="small" name="isPregnant" key="clinic.patient.isPregnant"/>


        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:textArea name="address" key="clinic.patient.address" height="60" />
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:textArea name="description" key="clinic.patient.desc" height="60" />
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:fileUploader2 fileRemoveUrl="file/fileRemove" name="files" key="com.artonis.clinic.patientr.patientFilePicture" fileSaveUrl="file/fileUpload"
                               uploadedFileAddress="attachFileListBarSep" multiple="true" valueFieldName="filenumber" urlLoadFile="fileLoad"/>
        </div>
        
		<div id="thumbnails" style="padding-right: 110px; padding-top: 10px;">
		    <ul class="clearfix" id="clearfixUl"> 
		    </ul>
		</div>
        <div class="uk-grid uk-grid-preserve">

            <base:checkbox styleClass="small" name="isHide" key="clinic.patient.isHide"/>
            <base:testBox styleClass="small" name="externalId" key="clinic.patient.externalId"/>
            <base:checkbox styleClass="small" name="isSendSms" key="clinic.patient.isSendSms"/>
        </div>
        
    </form>
</div>
<script type="text/javascript">
function addImageToThumbnails(fileName){
	if(fileName=="")
		return;
	var imgElement = document.createElement("img");
	imgElement.src="/prjResource/patientFile/"+fileName;
	imgElement.className="thumbnailsImg";
	var aElement = document.createElement("a");
	aElement.href="/prjResource/patientFile/"+fileName;
	aElement.appendChild(imgElement);
	var liElement = document.createElement("li");
	liElement.appendChild(aElement);
	$("#clearfixUl")[0].appendChild(liElement);
	$('#thumbnails a').lightBox();
}

$(function() {
    $('#thumbnails a').lightBox();
});

    //    function cascadeToBirthYear() {
    function callback_age() {
        var age=$("#age").val();
        if(age!="" && age>-1){
            var currentYear=$("#currentYear").val();
            var birthYear=currentYear-age;
            $("#birthYear").val(birthYear);
        }else{
            $("#birthYear").val("");
            $("#age").val("");
        }
    }
    function callback_birthYear(changeVal){
        if (changeVal > 1100) {
            var currentYear = $("#currentYear").val();
            var age = currentYear - changeVal;
            if(age>-1){
                $("#age").val(age);
            }
        }else{
            $("#age").val("");

        }

    }

    function callback_close_birthplace_city_id(e){
        var selected_id=e.sender._old;
        var data=e.sender.dataSource._data;
        for(var i=0;i<data.length;i++){
            if(data[i].id==selected_id){
                var kendoComboBox=$("#birthplace_province_id_Comb").data("kendoComboBox");
                kendoComboBox.dataSource.read({
                    filter: { field: "id", operator: "eq", value: data[i].province_id },
                    page : 1,
                    pageSize : 1
                });
                birthplace_province_id_open=false;
            }
        }
    }

    function callback_close_city_id(e){
        var selected_id=e.sender._old;
        var data=e.sender.dataSource._data;
        for(var i=0;i<data.length;i++){
            if(data[i].id==selected_id){
                var kendoComboBox=$("#province_id_Comb").data("kendoComboBox");
                kendoComboBox.dataSource.read({
                    filter: { field: "id", operator: "eq", value: data[i].province_id },
                    page : 1,
                    pageSize : 1
                });
                province_id_open=false;
            }
        }
    }

    function callback_dataBound_birthplace_province_id(e){
        var kendoComboBox=$("#birthplace_province_id_Comb").data("kendoComboBox");
        if(!birthplace_province_id_open){
            kendoComboBox.select(kendoComboBox.ul.children().eq(0));
            $("#birthplace_province_id").val(e.sender.dataSource._data[0].id);
        }

    }

    function callback_dataBound_province_id(e){
        var kendoComboBox=$("#province_id_Comb").data("kendoComboBox");
        if(!province_id_open){
            kendoComboBox.select(kendoComboBox.ul.children().eq(0));
            $("#province_id").val(e.sender.dataSource._data[0].id);
        }

    }
    var  birthplace_province_id_open=false;
    function callback_open_birthplace_province_id(e){
        var kendoComboBox=$("#birthplace_province_id_Comb").data("kendoComboBox");
        birthplace_province_id_open=true;

    }

    var  province_id_open=false;
    function callback_open_province_id(e){
        var kendoComboBox=$("#province_id_Comb").data("kendoComboBox");
        province_id_open=true;

    }

    function callback_close_birthplace_province_id(e){
        $("#birthplace_city_id").val('');
        var selected_id=e.sender._old;
        var data=e.sender.dataSource._data;
        for(var i=0;i<data.length;i++){
            if(data[i].id==selected_id){
                console.log("province_id:"+data[i].id);
                var kendoComboBox=$("#birthplace_city_id_Comb").data("kendoComboBox");
                kendoComboBox.dataSource.read({
                    filter: { field: "province_id", operator: "eq", value: data[i].id },
                    page : 1,
                    pageSize : 1
                });

            }
        }
    }
    function callback_close_province_id(e){
        $("#city_id").val('');
        var selected_id=e.sender._old;
        var data=e.sender.dataSource._data;
        for(var i=0;i<data.length;i++){
            if(data[i].id==selected_id){
                var kendoComboBox=$("#city_id_Comb").data("kendoComboBox");
                kendoComboBox.dataSource.read({
                    filter: { field: "province_id", operator: "eq", value: data[i].id },
                    page : 1,
                    pageSize : 1
                });

            }
        }
    }

    function callback_saveClose(){
        if($("#cameFromFactorPage").val()=="true"){
            window.location = "${pageContext.request.contextPath}"+"/clinic/operation/factor/returnFromPatient/"+$("#loadedId").val()+"/"+'<%=request.getAttribute("appointmentId")%>';
        }else{
            var refere='<%= request.getHeader("referer")%>';
            if(refere.indexOf('login')>-1){
                window.location.href = getBaseUrl();
            }else{
                window.location.href=refere;
            }
        }
    }


    $(document).ready(function () {
	    if(window.location.href.indexOf("/createNewPatientWithReturnToFactor") >0){
	    	createMode();
	    	$.getJSON(getBaseUrl() + 'create/reset/' + 0, function(data) {
				$('#mainForm').deserialize(data);
			});
			$("#cameFromFactorPage").val("true");
	    }else if(window.location.href.indexOf("editWP/patientId=")>-1){
            $("#cameFromFactorPage").val("true");
            BindToEntityQueue();
        }
        $("#age").bind('change keypress keyup', function () {
//                    setTimeout(cascadeToBirthYear, 500);
                }
        );
        
		//////////////////////////
        var attachFileListBarSep = '<%= attachFileListBarSep%>';
        var fileNames = attachFileListBarSep.substring(0, attachFileListBarSep.length - 1).split("|");
        for(i=0; i<fileNames.length ;i++){
        	addImageToThumbnails(fileNames[i]);
        }
        
    });
    
function RemoveClearfixUlChild(){
	var myNode = document.getElementById("clearfixUl");
	while (myNode.firstChild) {
	    myNode.removeChild(myNode.firstChild);
	}
}
function callback_save_success(e){
/* 	var requestUrl = "${pageContext.request.contextPath}"+"/clinic/patientr/patientr/loadPatientAttachFileList/"+$("#id").val();
	$.getJSON(requestUrl, function (data) {
        var attachFileListBarSep = data.attachFileListBarSep;
        var fileNames = attachFileListBarSep.substring(0, attachFileListBarSep.length - 1).split("|");
        for(i=0; i<fileNames.length ;i++){
        	addImageToThumbnails(fileNames[i]);
        }
	}); */
	RemoveClearfixUlChild();
	reset_files();
	if($("#cameFromFactorPage").val()=="true"){
		window.location = "${pageContext.request.contextPath}"+"/clinic/operation/factor/returnFromPatient/"+$("#loadedId").val()+"/"+'<%=request.getAttribute("appointmentId")%>';
	}
}
function callback_onSuccess_files(e){
	if(e.operation == "remove"){
		var newAttachFileListBarSep = $('#attachFileListBarSep').val();
		$("#clearfixUl").html("");
	    var fileNames = newAttachFileListBarSep.substring(0, newAttachFileListBarSep.length - 1).split("|");
	    for(i=0; i<fileNames.length ;i++){
	    	addImageToThumbnails(fileNames[i]);
	    }		
	}
}

var checkDuplicateInsertInPatientPage = ${checkDuplicateInsertInPatientPage};
$(".checkingFields input[type='text']").not(".k-input").focusout(function() {
	if(checkDuplicateInsertInPatientPage){
		if($("#firstname").val().trim().length > 0 && $("#lastname").val().trim().length > 0 && $("#fathername").val().trim().length > 0){
			 var myData = {};
			 myData.firstname = $("#firstname").val().trim();
			 myData.lastname = $("#lastname").val().trim();
			 myData.fathername = $("#fathername").val().trim();
			 myData.loadedId = $("#id").val();
		     jQuery.ajax ({
				    url: getBaseUrl() + "checkDuplication",
				    type: "POST",
				    data: JSON.stringify(myData),
				    dataType: "json",
				    contentType: "application/json; charset=utf-8",
				    success: function(result){
				    	if(result.state == "nothingFound"){
				    		console.log("patient is unique");
				    	}else if(result.state == "singleFound"){
				    		var err = "بیماری به شماره پرونده " + result.patientFileNumber + " با این مشخصات وجود دارد";
				    		alertify.alert(err, function(){
				    			//checkDuplicateInsertInPatientPage = false;
			    			});
				    	}else if(result.state == "multiFound"){
				    		var err = "چند بیمار با مشخصات وارد شده در سیستم تعریف شده است لطفا بررسی نمایید";
				    		alertify.alert(err, function(){
				    			//checkDuplicateInsertInPatientPage = false;
			    			});
				    	}else{
				    		alertify.error("Something is not good! O_o");
				    	}
				    },
		            error:function(result){
		            	alertify.error("Something is not good! O_o");
		            }
		      });
		}		
	}
});
</script>

<style type="text/css" >
.thumbnailsImg {
	height: 200px;
}
</style>