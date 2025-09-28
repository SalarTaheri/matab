<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ResourceBundle" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    String patientId=(String)request.getAttribute("patientId");
    String visitQueueId=(String)request.getAttribute("visitQueueId");
    String encoded = null;
    try {
        encoded = URLDecoder.decode(request.getAttribute("chiefComplaint").toString(), "UTF-8");
    } catch (Exception e) {
    }
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String areUShure=resource.getString("clinic.patientfile.confirm.exit");
    String areUShureDeleteRow=resource.getString("clinic.patientfile.confirm.delete.row");
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset='utf-8'>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<c:url value='/resources/clinic/mergedClinicCss.css'/>" rel="stylesheet" />
	<script type="text/javascript" src="<c:url value='/resources/js/jquery.min.js' />" ></script>
</head>
<body>
<table class="responsive-section" bgcolor="lavender">
    <tr valign="top">
        <td id="left-section">
            <div class="body-header">
                <div id="header-toolbar">
                    <button class="uk-button uk-button-success" id="fileMobileView-save_close_btn" type="button">Save & exit</button>
                    <button class="uk-button uk-button-success" id="PatientCardVisitView" type="button">Exit</button>
                </div>
            </div>
            <input id="patientIdForPopup" type="hidden" value="${patientId}"/>
            <div id="accordion-resizer">
                <div id="tabs">
                    <ul>
                        <li><a href="#currentVisit">Current Visit</a></li>
                        <li style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(50%,rgba(41,137,216,1)), color-stop(51%,rgba(32,124,202,1)), color-stop(100%,rgba(125,185,232,1)));"><a href="#historyTab" style="color: white;">History</a></li>
                        <li style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(50%,rgba(41,137,216,1)), color-stop(51%,rgba(32,124,202,1)), color-stop(100%,rgba(125,185,232,1)));"><a href="#orderTab" style="color: white;">Order</a></li>
                        <li style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(50%,rgba(41,137,216,1)), color-stop(51%,rgba(32,124,202,1)), color-stop(100%,rgba(125,185,232,1)));"><a href="#followUpTab" style="color: white;">FollowUp</a></li>
                        <li style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(50%,rgba(41,137,216,1)), color-stop(51%,rgba(32,124,202,1)), color-stop(100%,rgba(125,185,232,1)));"><a href="#recommendTab" style="color: white;">Recommendation</a></li>
                    </ul>
                    <div id="currentVisit" style="overflow: auto;background: #2f4f4f" >

                        <div id="handwriting">
                            <h3>Handwriting</h3>

                            <div>
                                <jsp:include page="fileBaseItems/Handwriting.jsp"/>
                            </div>
                        </div>
                        <div id="chiefComplaint" >
                            <h3>Chief Complaint & Present illness</h3>
                            <div >
                                <jsp:include page="fileBaseItems/ChiefComplaint.jsp"/>
                            </div>
                        </div>
                        <div id="physicalExam" >
                            <h3>Physical examination</h3>
                            <div >
                                <jsp:include page="fileBaseItems/PhysicalExamination.jsp"/>
                            </div>
                        </div>
                        <div id="diagnosis">
                            <h3>Diagnosis</h3>
                            <div >
                                <jsp:include page="fileBaseItems/Diagnosis.jsp"/>
                            </div>
                        </div>
                        <div id="currentLab">
                            <h3>LabTest & Result</h3>
                            <div >
                                <jsp:include page="CurrentLabTestAndResult.jsp"/>
                            </div>
                        </div>
                        <div id="currentProc">
                            <h3>Procedure & Result</h3>

                            <div >
                                <jsp:include page="fileBaseItems/CurrentOperationAndResult.jsp"/>
                            </div>
                        </div>
                        <div id="sendToResearch">
                            <h3>Send to the research department</h3>

                            <div >
                                <jsp:include page="fileBaseItems/SendToResearch.jsp"/>
                            </div>
                        </div>
                    </div>
                    <div id="historyTab" style="overflow: auto;background: #2f4f4f">
                        <div id="pastMedicalHistory">
                            <h3>Past Medical History</h3>
                            <div>
                                <jsp:include page="fileBaseItems/PastMedicalHistory.jsp"/>
                            </div>
                        </div>

                        <div id="drugHistory">
                            <h3> Drug History</h3>
                            <div>

                                <jsp:include page="fileBaseItems/DrugHistory.jsp"/>
                            </div>
                        </div>

                        <div id="habitalHistory">
                            <h3>Habital History</h3>
                            <div>
                                <jsp:include page="fileBaseItems/HabitalHistory.jsp"/>
                            </div>
                        </div>
                        <div id="familyHistory">
                            <h3>Family History</h3>
                            <div>
                                <jsp:include page="fileBaseItems/FamilyHistory.jsp"/>
                            </div>
                        </div>
                    </div>
                    <%--<div id="labTestReport">--%>
                    <%--</div>--%>
                    <div id="orderTab" style="overflow: auto;background: #2f4f4f">
                        <div id="orderDrugg">
                            <h3>Order  medicine</h3>
                            <div>
                                <jsp:include page="fileBaseItems/Drug.jsp"/>
                            </div>
                        </div>
                        <div id="orderLab">
                            <h3>Order LabTest</h3>
                            <div>
                                <jsp:include page="fileBaseItems/LabTestOrder.jsp"/>
                            </div>
                        </div>
                    </div>
                    <div id="followUpTab" style="overflow: auto;background: #2f4f4f">
                        <div id="followUp">
                            <h3>FollowUp</h3>
                            <div >
                                <jsp:include page="fileBaseItems/FollowUp.jsp"/>
                            </div>
                        </div>
                    </div>
                    <div id="recommendTab" style="overflow: auto;background: #2f4f4f">
                        <div id="recommend">
                            <h3>Recommendation</h3>
                            <div >
                                <jsp:include page="fileBaseItems/Recommendation.jsp"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </td>
        <td id="right-section" style="background-color: #fffff0;">
            <div class="body-header">
                <div>
                    <div align="right">
                        <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.firstName") %>&nbsp;
                        <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.lastName") %>:
                        ${patientrName} ${patientrFam} &nbsp; 
                         - &nbsp; <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.age") %>: ${patientrOBJ.age} &nbsp;  
                         - &nbsp; <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.birthplace.city") %>: ${patientrOBJ.birthplaceCityName}
                    </div>
                    <div align="right" style="margin-top: 2px;">
                        <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.livesIn.city") %>: ${patientrOBJ.cityName} &nbsp; 
                        - &nbsp; <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.fileNumber") %>: ${patientrFileNumber} &nbsp;  
                        - &nbsp; <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.visitCount") %>: ${visitCount}
                    </div>
                </div>
            </div>
            <div id="right-tabs">
                <ul>
					<li class="rightTabLiColor"><a href="#patientFile-tab" style="color: white;">Patient File</a></li>                    
                    <li class="rightTabLiColor"><a href="#scanPatientFile" style="color: white;">Scan files</a></li>
                    <li class="rightTabLiColor"><a href="#labTestReport" style="color: white;">Lab Test Report</a></li>
                    <li class="rightTabLiColor"><a href="#procedureReport" style="color: white;">Procedure Report</a></li>
                    <li class="rightTabLiColor"><a href="#radiologyExplanation" style="color: white;">Sonography</a></li>
                </ul>
                <div id="patientFile-tab" style="background: #2f4f4f">
	                <div dir="ltr" style="width: 100%; margin-bottom: 10px; display: inline-flex;">
	                	<div style="color: yellow; width: 50%;" dir="ltr">
	                		Filter:
							<div class="uk-button-group patientFileFilterBtnGroup" dir="rtl" style="margin-left: 40%" >
							    <button id="patientFileFilterBtn_Diagnosis" onclick="resetPatientFile(this);" class="uk-button uk-button-mini uk-button-success" style="width: 100%;">Diagnosis</button>
							    <button id="patientFileFilterBtn_All" onclick="resetPatientFile(this);" class="uk-button uk-button-mini uk-button-success uk-active" style="width: 100%;">All</button>
							</div> 
	                	</div>
						<div style="width: 50%;" dir="rtl">
	                        <table height="100%" style="text-align: center;color: white; direction: rtl">
	                            <tr height="10%">
	                                <td>
	                                    <%=ResourceBoundleHolder.resourceBundle.getString("clinic.visit.clinicalInformation.weight") %>:
	                                </td>
	                                <td>
	                                    <input type="text" id="weight" value="${weight}" style="width: 50px"/>
	                                </td>
	                                <td>
	                                	&nbsp; &nbsp;
	                                </td>
	                                <td>
	                                    <%=ResourceBoundleHolder.resourceBundle.getString("clinic.visit.clinicalInformation.bloodPressure") %>:
	                                </td>
	                                <td>
	                                    <input type="text" id="bloodPressure" value="${bloodPressure}" style="width: 50px"/>
	                                </td>
	                            </tr>
                            </table>
						</div>
	                </div>
                    <div id="patientFile-for-test" dir="ltr">
                        <div id="patientFile-for-test-inner" style="overflow: auto; border: 1px solid gray;"></div>
                    </div>
                </div>
                <div id="scanPatientFile">
                </div>
                <div id="labTestReport">
                </div>
                <div id="procedureReport">
                </div>
                <div id="radiologyExplanation" style="background: #2f4f4f">
                	<jsp:include page="fileBaseItems/RadiologyExplanation.jsp"/>
                </div>
            </div>
        </td>
    </tr>
</table>

<jsp:include page="fileBaseItems/ScanPatientFile.jsp"/>
<jsp:include page="fileBaseItems/PatientFile.jsp"/>
<jsp:include page="fileBaseItems/LabTestReport.jsp"/>

<c:choose>
    <c:when test="${precedureReportFileType=='jpg'}">
        <jsp:include page="fileBaseItems/ProcedureReportJpg.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="fileBaseItems/ProcedureReport.jsp"/>
    </c:otherwise>
</c:choose>




</body>

<script type="text/javascript" src="<c:url value='/resources/clinic/jquery.clinic.libs.min.js'/>" ></script>
<script src="<c:url value='/resources/js/jquery-ui-multiselect-widget-master/src/jquery.multiselect.filter.js' />"></script>

<script>
    $("#historyTab").css("max-height",$(window).height()-($(".body-header").height()*3)) ;
    $("#orderTab").css("max-height",$(window).height()-($(".body-header").height()*3)) ;
    $("#patientFile-for-test-inner").css("max-height",$(window).height()-($(".body-header").height()*6)) ;
    $("#p-chiefComplaint").val("${chiefComplaint}");
    $("#chiefCompliantTxt").val("${chiefCompliantTxtStr}");
    $("#p-physicalExamination").val("${physicalExam}");
    $("#p-followUp").val(" ${followUp}");
    $("#followUpDate").val("${followUpDate}");
    $("#followUpDateVal").val("${followUpDateVal}");
    $("#p-recommend").val(" ${recommend}");
    $("#p-familyHistory").val(" ${familyHistory}");
    $("#pastMedicalHistoryTxt").val("${pastMedicalHistoryTxtStr}");
    $("#habitalHistoryTxt").val("${habitalHistoryTxtStr}");

 	$.ajax({
            url: '${pageContext.request.contextPath}'+'/clinic/patient/visitMobileBase/loadDepartments',
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            type: 'GET',
            success: function (data, success, xhr) {
    			$.each(data, function (i, item) {
    				$('#depId4Send').append($('<option>', { 
        				value: item.key,
        				text : item.title 
    				}));
				});
            },
            error: function (e) {
                alert('Error load departments : ' + e.responseText);
            }
    });

    var cuVisitId="${visitId}";
    (function(a){a.extend(a.fn,{bindLast:function(f,g){return this.each(function(){var e=1E6,c=f.split(".")[0];a(this).bind(f,g);var b=a(this).data("events"),d=false,h={};a.each(b[c],function(i,j){if(j===g)d=i;h[i]=1});if(d!==false){for(;h[e]==1;)e++;b[c][e]=b[c][d];delete b[c][d];a(this).data("events",b)}})}})})(jQuery);
    var icons = {
        header: "ui-icon-circle-arrow-e",
        activeHeader: "ui-icon-circle-arrow-s"
    };
    //        var tabBackGround=-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(50%,rgba(41,137,216,1)), color-stop(51%,rgba(32,124,202,1)), color-stop(100%,rgba(125,185,232,1)));
    $( "#tabs" ).tabs({
        activate: function(event, ui){

            /*if(ui.newTab[0].children[0].text=='Lab Test Report'){
             $( "#labTestReport-table" ).dialog( "open" );
             ui.oldTab[0].className+=" ui-state-default";
             $( "#tabs" ).tabs( "option", "active", 0 );
             ui.oldTab[0].style.background="-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(50%,rgba(41,137,216,1)), color-stop(51%,rgba(32,124,202,1)), color-stop(100%,rgba(125,185,232,1)))";
             ui.oldTab[0].children[0].style.color="white";
             ui.oldTab[0].children[0].style.fontWeight="normal";
             }*/
            if(ui.newTab[0].children[0].text=='History' ||ui.newTab[0].children[0].text=='Current Visit'||
                    ui.newTab[0].children[0].text=='Order' || ui.newTab[0].children[0].text=='FollowUp'||ui.newTab[0].children[0].text=='Recommendation' ||ui.newTab[0].children[0].text=='Letter'){
//                    ui.oldTab[0].className+=" ui-state-default";
                ui.newTab[0].className=ui.newTab[0].className.replace(/\bui-state-default\b/,'');
                ui.newTab[0].className=ui.newTab[0].className.replace(/\bui-state-focus\b/,'');
                ui.newTab[0].style.background="white";
                ui.newTab[0].children[0].style.color="black";
                ui.oldTab[0].style.background="-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(50%,rgba(41,137,216,1)), color-stop(51%,rgba(32,124,202,1)), color-stop(100%,rgba(125,185,232,1)))";
                ui.oldTab[0].children[0].style.color="white";
                ui.oldTab[0].children[0].style.fontWeight="normal";


            }
        }
        ,create: function( event, ui ){


        }
    });
    $(document).ready(function(){
    	$( "#right-tabs" ).tabs({
            activate:function (event, ui) {
                if (ui.newTab[0].children[0].text == 'Scan files') {
                    $("#p-scanPatientFile").dialog("open");
                    $("#right-tabs").tabs("option", "active", 0);
                }else if(ui.newTab[0].children[0].text == 'Lab Test Report'){
                    resetLabTestReportTable();
                    $( "#labTestReport-table" ).dialog( "open" );
                    $("#right-tabs").tabs("option", "active", 0);
                }else if(ui.newTab[0].children[0].text == 'Procedure Report'){
                    $( "#procedureReport-table" ).dialog( "open" );
                    $("#right-tabs").tabs("option", "active", 0);
                }
            }
        });
    });
    $( "#mainAccordion" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });
    $( "#currentVisitAccordion" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });
    $( "#pastMedicalHistory" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });
    $( "#drugHistory" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });
    $( "#habitalHistory" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });
    $( "#familyHistory" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });
    $( "#orderAccordion" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });

    $( "#resultAccordion" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });

    $( "#operationAccordion" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });

    $( "#chiefComplaint" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });
    $( "#physicalExam" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });
    $( "#diagnosis" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });
    $( "#currentLab" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });
    $( "#currentProc" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });
    $( "#sendToResearch" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });
    $( "#handwriting" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true,
        active: false
    });
    $( "#orderLab" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });
    $( "#orderDrugg" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });
    $( "#followUp" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });
    $( "#recommend" ).accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true
    });




    $("#PatientCardVisitView").click(backBtnClick);
    $("#fileMobileView-save_btn").click(saveForm);
    $("#fileMobileView-save_close_btn").click(saveCloseForm);

    function backBtnClick(){
        <%--window.location.href ="${pageContext.request.contextPath}/" +'clinic/dashboard/viditInfo/';--%>

        var areUShure = "<%=areUShure%>";
        alertify.confirm(areUShure, function (e) {
            if(e){
                window.location.href ='<%= request.getHeader("referer")%>';;
                <%--window.location.href ='${pageContext.request.contextPath}'+'/clinic/patient/visitDoctorQueue/';--%>
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
        if($("#weight").val().trim().length!=0 && isNumber($("#weight").val().trim())==false){
            alert('Weight should be number');
            return;
        }
        
        $('#fileMobileView-save_close_btn').attr("disabled", true);
        //$('#labTestResultPopupId')[0].contentWindow.saveLabTest();
        var data = {};
        console.log("---------------");
        //var mainFramForSave=$("#mainF").contents();
        data.visitQueueId=${visitQueueId};
        data.visitId = visitId;//
        data.patientId = ${patientId};//
        data.chiefComplaint = $("#p-chiefComplaint").val();//
        data.followUp = $("#p-followUp").val();//
        data.followUpDate = $("#followUpDate").val();
        data.followUpDateVal = $("#yearValue").val()+"-"+$("#monthValue").val();
        data.recommend = $("#p-recommend").val();//
        data.familyHistory = $("#p-familyHistory").val();//

//todo		data.operationOrderList = $("#p-operationMultiSelect").val();//
        data.operationFullList = operationMultiSelectFD;//
//		data.diagnosis =$("#p-diagnosisMultiSelect").val().split(',');//
//		data.drugs =$("#p-drugMultiSelect").val();//
//		data.drugsFullData=drugMultiSelectFD;
//		data.drCustomizedDrugList =$("#drCustomizedDrugList").val();//
        data.drugsHistory =$("#p-drugHistoryMultiSelect").val().split(',');//
        data.labTestOrders=$("#labTestOrders_customized").val();//
        data.labTestOrdersAll=$("#p-allLabTest").val();
        data.labTestOrdersAllFullData=allLabTestFD;

        data.physicalExam =$("#p-physicalExamination").val();//
        data.weight = $("#weight").val().trim();
        data.bloodPressure = $("#bloodPressure").val().trim();
        var currentLabTestWithValueArray=$('#table').parent().find('textarea');
        var currentLabTestWithValueMap={};

        if(currentLabTestWithValueArray.length>0){
            for(var w=0;w<currentLabTestWithValueArray.length;w++){
                var value=[];
                value[0]=currentLabTestWithValueArray[w].value;
                value[1]=$('#'+currentLabTestWithValueArray[w].id+'-currentLabtest-checkbox-highlight').prop('checked');
                currentLabTestWithValueMap[currentLabTestWithValueArray[w].id]=value;
            }
            data.currentLabTestWithValueMap=currentLabTestWithValueMap;
        }

        var operationOrderWithDescriptionArray=$('#tableOperation').parent().parent().find('textarea');
        var operationOrderWithDescriptionMap={};

        if (operationOrderWithDescriptionArray.length > 0) {
            for (var w = 0; w < operationOrderWithDescriptionArray.length; w++) {
                ids=operationOrderWithDescriptionArray[w].id.split('-operation');
                var value=[];
                value[0]=operationOrderWithDescriptionArray[w].value;
                value[1]=$('#'+ids[0]+'-operation-checkbox-highlight').prop('checked');
                operationOrderWithDescriptionMap[ids[0]] = value;
            }
            data.operationOrderWithDescriptionMap = operationOrderWithDescriptionMap;
        }

        var operationCurrentArray=$('#tableCurrentOperation').parent().parent().find('textarea:not(.pathology-description)');
        var operationCurrentWithValueMap={};

        if (operationCurrentArray.length > 0) {
            for (var k = 0; k < operationCurrentArray.length; k++) {
                operationIds=operationCurrentArray[k].id.split('-operation');
                var value=[];
                value[0] = operationCurrentArray[k].value;
                value[1] = $('#'+operationIds[0]+'-currentOperation-checkbox-highlight').prop('checked');
                value[2] = $('#'+operationIds[0]+'-operation-current-date').val();
                value[3] = $('#'+operationIds[0]+'-operation-current-pathology').val();
                operationCurrentWithValueMap[operationIds[0]] = value;
            }
            data.operationCurrentWithValueMap = operationCurrentWithValueMap;
        }

        var chiefComplaintArray=$('#tableChiefCompliantDesc').parent().parent().find('textarea:not(#chiefCompliantTxt)')
        var chiefComplaintWithValueMap={};

        if (chiefComplaintArray.length > 0) {
            for (var l = 0; l < chiefComplaintArray.length; l++) {
                chiefComplaintIds=chiefComplaintArray[l].id.split('-chiefcomplaint');
                var value=[];
                value[0]=chiefComplaintArray[l].value;
                value[1]=$('#'+chiefComplaintIds[0]+'-chiefComplaint-checkbox-highlight').prop('checked');
//                chiefComplaintWithValueMap[chiefComplaintIds[0]] = chiefComplaintArray[l].value;
                chiefComplaintWithValueMap[chiefComplaintIds[0]] = value;
            }
            data.chiefComplaintWithValueMap = chiefComplaintWithValueMap;
        }
        data.chiefCompliantTxt = $("#chiefCompliantTxt").val();
		
        var physicalExaminationArray=$('#tablephysicalExaminationDesc').parent().parent().find('textarea');
        var physicalExaminationWithValueMap={};

        if (physicalExaminationArray.length > 0) {
            for (var l = 0; l < physicalExaminationArray.length; l++) {
                physicalExaminationIds=physicalExaminationArray[l].id.split('-physicalExamination');
                var value=[];
                value[0]=physicalExaminationArray[l].value;
                value[1]=$('#'+physicalExaminationIds[0]+'-physicalExamination-checkbox-highlight').prop('checked');
//                chiefComplaintWithValueMap[chiefComplaintIds[0]] = chiefComplaintArray[l].value;
                physicalExaminationWithValueMap[physicalExaminationIds[0]] = value;
            }
            data.physicalExaminationWithValueMap = physicalExaminationWithValueMap;
        }

        var diagnosisArray=$('#tablediagnosisDesc').parent().parent().find('textarea');
        var diagnosisWithValueMap={};

        if (diagnosisArray.length > 0) {
            for (var l = 0; l < diagnosisArray.length; l++) {
                diagnosisIds=diagnosisArray[l].id.split('-diagnosis');
                var value=[];
                value[0]=diagnosisArray[l].value;
                value[1]=$('#'+diagnosisIds[0]+'-diagnosis-checkbox-highlight').prop('checked');
//                chiefComplaintWithValueMap[chiefComplaintIds[0]] = chiefComplaintArray[l].value;
                diagnosisWithValueMap[diagnosisIds[0]] = value;
            }
            data.diagnosisWithValueMap = diagnosisWithValueMap;
        }

        var drugArray=$('#tabledrugDesc').parent().parent().find('textarea');
        var drugWithValueMap={};

        if (drugArray.length > 0) {
            for (var l = 0; l < drugArray.length; l++) {
                drugIds=drugArray[l].id.split('-drug');
                var value=[];
                value[0]=drugArray[l].value;
                value[1]=$('#'+drugIds[0]+'-checkbox-highlight').prop('checked');
//                chiefComplaintWithValueMap[chiefComplaintIds[0]] = chiefComplaintArray[l].value;
                drugWithValueMap[drugIds[0]] = value;
            }
            data.drugWithValueMap = drugWithValueMap;
        }
//        var chiefComplaintHighlightArray=$('#tableChiefCompliantDesc').parent().parent().find('input[type=checkbox]:checked');
//        var chiefComplaintHighlightMap={};
//        if(chiefComplaintHighlightArray.length>0){
//            for(var p=0;p<chiefComplaintHighlightArray.length;p++){
//                chiefComplaintHighlightMap[chiefComplaintHighlightArray[p].id.split('-checkbox-highlight')[0]];
//            }
//        }


        var operationWithValue=  $('.operation-class');
        var operationValues={};
        for(var i=0;i<operationWithValue.length;i++){
            operationValues[operationWithValue[i].id]=$("[id='"+operationWithValue[i].id+"']").val() ;
            if(i==operationWithValue.length-1){
                data.operationDescs=operationValues;
            }
        }

        if (hasHandwriting) {
        	var handwritingImageValues = {};
        	for(i=1; i<=$(".handwritingCanvas").size(); ++i){
        		var canvas = $(".handwritingCanvas[data-pagenumber='"+ i +"']")[0];
        		var dataURL = canvas.toDataURL();
        		handwritingImageValues[i] = dataURL.replace(/^data:image\/(png|jpg);base64,/, ""); 
        	}
            data.handwritingImage = handwritingImageValues;
        }
        
        data.pastMedicalHistoryTxt = $("#pastMedicalHistoryTxt").val();
        //
        data.habitalHistoryTxt = $("#habitalHistoryTxt").val();

        $.ajax({
            url: '${pageContext.request.contextPath}'+'/clinic/patient/visitMobileBase/saveChiefComplaint/',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            dataType: 'json',
            type: 'POST',
            //async: true,
            success: function (data, success, xhr) {
                alertify.success(data.message);
                cuVisitId=data.backVisitId;
//                backBtnClick();
                window.location.href ='<%= request.getHeader("referer")%>';;
                <%--window.location.href ='${pageContext.request.contextPath}'+'/clinic/patient/visitDoctorQueue/';--%>
            },
            error: function (e) {
                alert('Error121212: ' + e.responseText);
            }
        });

    }

    $( "#lst1" ).click(function() {

        // $("#p-card-view-page").dialog({modal : true ,  position: "center"});
        var window1;
        childWindow=open("popupTree",null,"resizable=no,width=370,height=610,modal=yes");
        if (childWindow.opener == null) childWindow.opener = self;
    });


    $(function(){
        initOperationDescAutocomplate();
    });

    function initOperationDescAutocomplate(){

        var operationNamesArray = new Array();
        <%
           if(!request.getAttribute("operationNames").toString().equals("-1")){


           List<String> listOperationNames = (List)request.getAttribute("operationNames");
           if(listOperationNames!=null){
           for(int count=0; count <listOperationNames.size(); count++) {
        %>
        operationNamesArray[<%= count %>] = '<%= listOperationNames.get(count) %>';
        <% } %>
        <% } %>
        <% } %>


        var operationValsArray = new Array();
        <%
           if(!request.getAttribute("operationValues").toString().equals("-1")){


           List<String> listOperationValues = (List)request.getAttribute("operationValues");
           if(listOperationValues!=null){
           for(int count=0; count <listOperationValues.size(); count++) {
        %>
        operationValsArray[<%= count %>] = '<%= listOperationValues.get(count) %>';
        <% } %>
        <% } %>
        <% } %>

        var operationDescriptionArray = $('.operation-class');
        for (var i = 0; i < operationDescriptionArray.length; i++) {

            dosomthingCool(operationDescriptionArray[i].id);

        }
        for (var j = 0; j < operationNamesArray.length; j++) {
//              $('#' + operationNamesArray[j].trim()).val(operationValsArray[j]);
            $("[id='"+ operationNamesArray[j].trim()+"']").val(operationValsArray[j]);
        }
    }

    function dosomthingCool(id){
//      var elem = $('#'+id);
        var elem = $("[id='"+ id+"']");
        elem.textcomplete([{
            match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
            search: function (term, callback) {
                Common.postJSON("${pageContext.request.contextPath}" +
                        "/clinic/patient/visitMobileBase/operationAutoComplete/" + id, JSON.stringify({token:term}),
                        function (data) {
                            var tokens = [];
                            tokens.push(term);
                            for (var j = 0; j < data.length; j++)
                                tokens.push(data[j].token);
                            callback(tokens);
                        });
            },
            replace: function (word) {
                return '$1' + word + ' ';
            }
        }]);
    }

    $('#handwriting').click(function () {
    	var active = $('#handwriting').accordion("option", "active");
    	if (active !== false) {
    		$("#left-section").css("width", "100%");
    		$("#right-section").css("width", "100%");
    	} else {
    		$("#left-section").css("width", "55%");
    		$("#right-section").css("width", "44%");
    	}
    });
    
    function resetPatientFile(btn){
    	$(".patientFileFilterBtnGroup > button").removeClass("uk-active");
    	btn.classList.add("uk-active");
    	emptyPatientFile();
    	loadPatientFile();
    }
</script>

</html>