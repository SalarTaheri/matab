<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@page import="java.util.ResourceBundle"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="<c:url value='/resources/alterify/css/alertify.core.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/alterify/css/alertify.bootstrap.css'/>" rel="stylesheet" />
<script src="<c:url value='/resources/alterify/js/alertify.js' />"></script>

<%
    String patientId=(String)request.getAttribute("patientId");
    String visitQueueId=(String)request.getAttribute("visitQueueId");
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String areUShure=resource.getString("clinic.patientfile.confirm.exit");
    String areUShureDeleteRow=resource.getString("clinic.patientfile.confirm.delete.row");
%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/development-bundle/themes/base/jquery-ui.css'/>" rel="stylesheet" />
	<link href="<c:url value='/resources/clinic/visitMobileBase.css'/>" rel="stylesheet" />
	<script src="<c:url value='/resources/jquery-1.9.1.js' />"></script>
	<script src="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.js' />"></script>
	<link href="<c:url value='/resources/clinic/clinic.mobile.css'/>" rel="stylesheet" />
	<script type="text/javascript" src="<c:url value='/resources/common.js' />"></script>

	<link rel="stylesheet" href="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/jquery.fancybox.css?v=2.1.5' />" type="text/css"/>
	<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/jquery.fancybox.pack.js?v=2.1.5' />"></script>
	<link rel="stylesheet" href="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-buttons.css?v=1.0.5' />" type="text/css"/>
	<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-buttons.js?v=1.0.5' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-media.js?v=1.0.6' />"></script>
</head>
<body>
	<table class="responsive-section" >
		<tr valign="top">
			<td id="left-section">
            	<div class="body-header">
		            <div id="header-toolbar">
						<!-- <button class="uk-button uk-button-success" id="fileMobileView-save_close_btn" type="button">Save & exit</button> -->
						<button class="uk-button uk-button-success" id="PatientCardVisitView" type="button">Exit</button>
					</div>
				</div>
				<input id="patientIdForPopup" type="hidden" value="${patientId}" />
				<div id="currentVisit">
					<div id="handwriting">
						<jsp:include page="fileBaseItems/Handwriting.jsp" />
					</div>
					<div>
						<jsp:include page="fileBaseItems/Diagnosis.jsp" />
					</div>
				</div>
			</td>
			<td id="right-section" style="background-color: #fffff0;">
				<div class="body-header">
					<div>
						<div align="right" id="patientDescription">
							<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.firstName") %>&nbsp;
							<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.lastName") %>: ${patientrName} ${patientrFam} &nbsp; - &nbsp;
							<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.age") %>: ${patientrOBJ.age} &nbsp; - &nbsp;
							<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.birthplace.city") %>: ${patientrOBJ.birthplaceCityName} &nbsp; - &nbsp;
							<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.livesIn.city") %>: ${patientrOBJ.cityName} &nbsp; - &nbsp;
							<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.fileNumber") %>: ${patientrFileNumber} &nbsp; - &nbsp;
							<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.visitCount") %>: ${visitCount}
						</div>
					</div>
				</div>
				<div id="right-tabs">
					<ul>
						<li><a href="#patientFile-tab">Handwriting</a></li>
						<li><a href="#diagnosis-tab">Diagnosis</a></li>
						<li><a href="#scanFile-tab">Scanned Files</a></li>
						<li><a href="#procedureReport">Procedure Report</a></li>
					</ul>
					<div id="patientFile-tab" style="background: #2f4f4f">
						<div id="patientFile-for-test" dir="ltr">
							<div id="patientFile-for-test-inner" style="overflow: auto; border: 1px solid gray;"></div>
						</div>
					</div>
					<div id="diagnosis-tab" style="background: #2f4f4f">
						<div id="diagnosis-for-test" dir="ltr">
							<div id="diagnosis-for-test-inner" style="overflow: auto; border: 1px solid gray;"></div>
						</div>
					</div>
					<div id="scanFile-tab" style="background: #2f4f4f">
						<div id="scanFile-for-test" dir="ltr">
							<div id="scanFile-for-test-inner" style="overflow: auto; border: 1px solid gray;"></div>
						</div>
					</div>
					<div id="procedureReport-tab" style="background: #2f4f4f">
						<div id="procedureReport-for-test" dir="ltr">
							<div id="procedureReport-for-test-inner" style="overflow: auto; border: 1px solid gray;"></div>
						</div>
					</div>
				</div>
			</td>
		</tr>
	</table>
	<jsp:include page="fileBaseItems/PatientFile.jsp" />
	<jsp:include page="fileBaseItems/DiagnosisItemView.jsp" />
	<jsp:include page="fileBaseItems/ScannedFilesView.jsp" />
	<c:choose>
		<c:when test="${precedureReportFileType=='jpg'}">
			<jsp:include page="fileBaseItems/ProcedureReportJpg.jsp"/>
		</c:when>
		<c:otherwise>
			<jsp:include page="fileBaseItems/ProcedureReport.jsp"/>
		</c:otherwise>
	</c:choose>

</body>
<script>

    $("#patientFile-for-test-inner").css("max-height", $(window).height() * 0.7) ;

    var cuVisitId="${visitId}";
    (function(a){a.extend(a.fn,{bindLast:function(f,g){return this.each(function(){var e=1E6,c=f.split(".")[0];a(this).bind(f,g);var b=a(this).data("events"),d=false,h={};a.each(b[c],function(i,j){if(j===g)d=i;h[i]=1});if(d!==false){for(;h[e]==1;)e++;b[c][e]=b[c][d];delete b[c][d];a(this).data("events",b)}})}})})(jQuery);
    var icons = {
        header: "ui-icon-circle-arrow-e",
        activeHeader: "ui-icon-circle-arrow-s"
    };
    $( "#right-tabs" ).tabs({
        activate:function (event, ui) {
			if (ui.newTab[0].children[0].text == 'Handwriting') {
				emptyPatientFile();
				loadPatientFile();
			}else if (ui.newTab[0].children[0].text == 'Diagnosis') {
				emptyPatientFile();
				emptyDiagnosis();
				loadDiagnosis();
			}else if (ui.newTab[0].children[0].text == 'Scanned Files') {
				emptyScanFile();
				loadScanFile();
			}else if (ui.newTab[0].children[0].text == 'Procedure Report') {
				$( "#procedureReport-table" ).dialog( "open" );
			}
        }
    });

    $("#PatientCardVisitView").click(backBtnClick);
    $("#fileMobileView-save_btn").click(saveForm);
    $("#fileMobileView-save_close_btn").click(saveCloseForm);

    function backBtnClick(){
        var areUShure = "<%=areUShure%>";
        alertify.confirm(areUShure, function (e) {
            if(e){
                window.location.href = '${pageContext.request.contextPath}'+'/clinic/patient/visitDoctorQueue/';
            }
        });
    }

    function saveForm(){
        saveFormActual_1(cuVisitId);
    }

    function saveCloseForm(){
        saveForm();
    }

    function isNumber(n) {
        return !isNaN(parseFloat(n)) && isFinite(n);
    }

    function saveFormActual_1(visitId){
        $('#fileMobileView-save_close_btn').attr("disabled", true);
        var data = {};
        data.visitId = visitId;
        data.patientId = ${patientId};
        data.visitQueueId=${visitQueueId};

        if (hasHandwriting) {
        	var dataURL = canvasHandwritingTemp;
        	var imageName = "";
        	if(editMode){
        		imageName = editedImageName;	
        	}
        	var handwritingImageObj = {};
        	handwritingImageObj.data = dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
        	handwritingImageObj.imageName = imageName;
            data.handwritingImage = handwritingImageObj;
        }
        
        $.ajax({
            url: '${pageContext.request.contextPath}'+'/clinic/patient/penVisit/saveHandwriting/',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            dataType: 'json',
            type: 'POST',
            success: function (data, success, xhr) {
                alertify.success(data.message);
                cuVisitId = data.backVisitId;
                callbackSaveSuccess();
            },
            error: function (e) {
                alert('Error: ' + e.responseText);
            }
        });
	}
    
</script>

<style>
#td-id {
	background: #cedce7; /* Old browsers */
	background: -moz-linear-gradient(top, #cedce7 0%, #a9c0d3 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #cedce7), color-stop(100%, #a9c0d3)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #cedce7 0%, #a9c0d3 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #cedce7 0%, #a9c0d3 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, #cedce7 0%, #a9c0d3 100%); /* IE10+ */
	background: linear-gradient(to bottom, #cedce7 0%, #a9c0d3 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cedce7', endColorstr='#a9c0d3', GradientType=0); /* IE6-9 */
}

.ui-dialog {
	direction: ltr;
}

a {
	color: black
}

ul.tabs li.ui-state-active, ul.tabs li.ui-tabs-selected {
	background: blue
}

ul.tabs li.ui-tabs-active a, ul.tabs li.ui-tabs-selected a {
	background: blue
}

.responsive-section {
	width: 100%;
}

#left-section {
	width: 49%;
	text-align: left;
	direction: ltr;
	display: inline-block;
	float: left;
}

#right-section {
	width: 50%;
	display: inline-block;
	float: right;
}

@media screen and (max-width: 992px) {
	#left-section {
		width: 100%;
	}
	#right-section {
		width: 100%;
	}
}
.ui-tabs-active {
	background: beige !important;
}
</style>

</html>