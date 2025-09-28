<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@page import="java.util.List" %>
<%@page import="java.net.URLDecoder" %>
<%@page import="java.util.ResourceBundle" %>
<%@page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    String patientId = (String) request.getAttribute("patientId");
    String visitQueueId = (String) request.getAttribute("visitQueueId");
    String areUShure = ResourceBoundleHolder.resourceBundle.getString("clinic.patientfile.confirm.exit");
    String areUShureDeleteRow = ResourceBoundleHolder.resourceBundle.getString("clinic.patientfile.confirm.delete.row");
%>

<!doctype html>
<html lang="en" style="background: lavender">

<head>
    <meta charset='utf-8'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<c:url value='/resources/clinic/mergedClinicCss.css'/>" rel="stylesheet"/>
    <script type="text/javascript" src="<c:url value='/resources/js/jquery.min.js' />"></script>
    <script type="text/javascript" src="<c:url value='/resources/clinic/jquery.clinic.libs.min.js'/>"></script>
    <script src="<c:url value='/resources/js/jquery-ui-multiselect-widget-master/src/jquery.multiselect.filter.js' />"></script>
    <script type="application/javascript">
        var icons = {header: "ui-icon-circle-arrow-e", activeHeader: "ui-icon-circle-arrow-s"};
        var exitAfterSaving = false;
    </script>
    <script src="<c:url value='/resources/js/blockUI/blockUI.js' />"></script>
</head>

<body>

<table class="responsive-section" bgcolor="lavender">
    <tr>
        <td colspan="2">
            <jsp:include page="fileBaseItems/PageHeaderPart.jsp"/>
        </td>
    </tr>
    <tr valign="top">
        <td id="left-section">
            <input id="patientIdForPopup" type="hidden" value="${patientId}"/>
            <div id="accordion-resizer">
                <div id="tabs">
                    <ul>
                        <li>
                            <a href="#currentVisit">Current Visit</a>
                        </li>
                        <c:choose>
                            <c:when test="${setting.prc_History}">
                                <li class="tabEdgeStyle">
                                    <a href="#historyTab">History</a>
                                </li>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${setting.prc_Order}">
                                <li class="tabEdgeStyle">
                                    <a href="#orderTab">Order</a>
                                </li>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${setting.prc_FollowUp}">
                                <li class="tabEdgeStyle">
                                    <a href="#followUpTab">FollowUp</a>
                                </li>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${setting.prc_Recommendation}">
                                <li class="tabEdgeStyle">
                                    <a href="#recommendTab">Recommendation</a>
                                </li>
                            </c:when>
                        </c:choose>
                    </ul>
                    <div id="currentVisit" class="tabBodyStyle">
                        <jsp:include page="fileBaseItems/CurrentVisitTab.jsp"/>
                    </div>
                    <c:choose>
                        <c:when test="${setting.prc_History}">
                            <div id="historyTab" class="tabBodyStyle">
                                <jsp:include page="fileBaseItems/HistoryTab.jsp"/>
                            </div>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${setting.prc_Order}">
                            <div id="orderTab" class="tabBodyStyle">
                                <jsp:include page="fileBaseItems/OrderTab.jsp"/>
                            </div>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${setting.prc_FollowUp}">
                            <div id="followUpTab" class="tabBodyStyle">
                                <jsp:include page="fileBaseItems/FollowUpTab.jsp"/>
                            </div>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${setting.prc_Recommendation}">
                            <div id="recommendTab" class="tabBodyStyle">
                                <jsp:include page="fileBaseItems/RecommendationTab.jsp"/>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </td>
        <td id="right-section">
            <div id="right-tabs">
                <ul>
                    <li class="rightTabLiColor"><a href="#patientFile-tab">Patient File</a></li>
                    <c:choose>
                        <c:when test="${setting.prc_ScanFiles}">
                            <li class="rightTabLiColor"><a href="#scanPatientFile">Scanned Files</a></li>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${setting.prc_LabTestReport}">
                            <li class="rightTabLiColor"><a href="#labTestReport">Lab Test Report</a></li>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${setting.prc_ProcedureReport}">
                            <li class="rightTabLiColor"><a href="#procedureReport">Procedure Report</a></li>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${setting.prc_Sonography}">
                            <li class="rightTabLiColor"><a href="#radiologyExplanation">Sonography</a></li>
                        </c:when>
                    </c:choose> <c:choose>
                        <c:when test="${setting.prc_Sonography_pdf}">
                            <li class="rightTabLiColor"><a href="#Sonography">Sonography PDF</a></li>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${setting.prc_Pathology}">
                            <li class="rightTabLiColor"><a href="#pathology">Pathology</a></li>
                        </c:when>
                    </c:choose>
                </ul>
                <div id="patientFile-tab" class="tabBodyStyle">
                    <jsp:include page="fileBaseItems/PatientFileTab.jsp"/>
                </div>
                <c:choose>
                    <c:when test="${setting.prc_ScanFiles}">
                        <div id="scanPatientFile" class="tabBodyStyle">
                            <jsp:include page="fileBaseItems/ScanPatientFile.jsp"/>
                        </div>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${setting.prc_LabTestReport}">
                        <div id="labTestReport">
                            <jsp:include page="fileBaseItems/LabTestReport.jsp"/>
                        </div>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${setting.prc_ProcedureReport}">
                        <div id="procedureReport">
                            <c:choose>
                                <c:when test="${precedureReportFileType=='jpg'}">
                                    <jsp:include page="fileBaseItems/ProcedureReportJpg.jsp"/>
                                </c:when>
                                <c:otherwise>
                                    <jsp:include page="fileBaseItems/ProcedureReport.jsp"/>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${setting.prc_Pathology}">
                        <div id="pathology">
                            <jsp:include page="fileBaseItems/Pathology.jsp"/>
                        </div>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${setting.prc_Sonography}">
                        <div id="radiologyExplanation" class="tabBodyStyle">
                            <jsp:include page="fileBaseItems/RadiologyExplanation.jsp"/>
                        </div>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${setting.prc_Sonography_pdf}">
                        <div id="sonographypdff" class="tabBodyStyle">
                            <jsp:include page="fileBaseItems/SonographyPdf.jsp"/>
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </td>
    </tr>
</table>

</body>

<script>
//    $("#historyTab").css("max-height", $(window).height() - ($(".body-header").height() * 3));
    $("#orderTab").css("max-height", $(window).height() - ($(".body-header").height() * 3));
    $("#patientFile-for-test-inner").css("max-height", $(window).height() - ($(".body-header").height() * 3));
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

    var cuVisitId = "${visitId}";
    (function (a) {
        a.extend(a.fn, {
            bindLast: function (f, g) {
                return this.each(function () {
                    var e = 1E6, c = f.split(".")[0];
                    a(this).bind(f, g);
                    var b = a(this).data("events"), d = false, h = {};
                    a.each(b[c], function (i, j) {
                        if (j === g)d = i;
                        h[i] = 1
                    });
                    if (d !== false) {
                        for (; h[e] == 1;)e++;
                        b[c][e] = b[c][d];
                        delete b[c][d];
                        a(this).data("events", b)
                    }
                })
            }
        })
    })(jQuery);

    $("#tabs").tabs({
        activate: function (event, ui) {
            if (ui.newTab[0].children[0].text == 'History' || ui.newTab[0].children[0].text == 'Current Visit' ||
                    ui.newTab[0].children[0].text == 'Order' || ui.newTab[0].children[0].text == 'FollowUp' || ui.newTab[0].children[0].text == 'Recommendation' || ui.newTab[0].children[0].text == 'Letter') {

                ui.newTab[0].className = ui.newTab[0].className.replace(/\bui-state-default\b/, '');
                ui.newTab[0].className = ui.newTab[0].className.replace(/\bui-state-focus\b/, '');
                ui.newTab[0].style.background = "white";
                ui.newTab[0].children[0].style.color = "black";
                ui.oldTab[0].style.background = "-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(50%,rgba(41,137,216,1)), color-stop(51%,rgba(32,124,202,1)), color-stop(100%,rgba(125,185,232,1)))";
                ui.oldTab[0].children[0].style.color = "white";
                ui.oldTab[0].children[0].style.fontWeight = "normal";
            }
        }
        , create: function (event, ui) {
        }
    });

    $(document).ready(function () {
        $("#right-tabs").tabs({
            activate: function (event, ui) {
                if (ui.newTab[0].children[0].text == 'Scanned Files') {
                    emptyScanFile();
                    loadScanFile();
                } else if (ui.newTab[0].children[0].text == 'Lab Test Report') {
                    resetLabTestReportTable();
                    $("#labTestReport-table").dialog("open");
                    $("#right-tabs").tabs("option", "active", 0);
                } else if (ui.newTab[0].children[0].text == 'Procedure Report') {
                    $("#procedureReport-table").dialog("open");
                    $("#right-tabs").tabs("option", "active", 0);
                } else if (ui.newTab[0].children[0].text == 'Sonography PDF') {
                    $("#sonographyPdf-table").dialog("open");
                    $("#right-tabs").tabs("option", "active", 0);
                } else if (ui.newTab[0].children[0].text == 'Pathology') {
                    $("#pathology-table").dialog("open");
                    $("#right-tabs").tabs("option", "active", 0);
                }
            }
        });
    });

    $("#PatientCardVisitView").click(backBtnClick);
    $("#fileMobileView-save_btn").click(saveForm);
    $("#fileMobileView-save_close_btn").click(saveCloseForm);

    function backBtnClick() {
        var areUShure = "<%=areUShure%>";
        alertify.confirm(areUShure, function (e) {
            if (e) {
                <%--window.top.location.href = '<%= request.getHeader("referer")%>';--%>
                window.top.location.href = "<c:url value='/clinic/patient/doctorDashboard/' />";
            }
        });
    }

    function saveForm() {
        saveFormActual_1(cuVisitId);
    }

    function saveCloseForm() {
        exitAfterSaving = true;
        saveForm();
    }

    function isNumber(n) {
        return !isNaN(parseFloat(n)) && isFinite(n);
    }

    function saveFormActual_1(visitId) {
        if ($("#weight").val().trim().length != 0 && isNumber($("#weight").val().trim()) == false) {
            alert('Weight should be number');
            return;
        }

        $('#fileMobileView-save_close_btn').attr("disabled", true);
        var data = {};
        data.visitQueueId =${visitQueueId};
        data.visitId = visitId;
        data.patientId = ${patientId};
        data.chiefComplaint = $("#p-chiefComplaint").val();
        data.followUp = $("#p-followUp").val();
        data.followUpDate = $("#followUpDate").val();
        data.followUpDateVal = $("#yearValue").val() + "-" + $("#monthValue").val();
        data.recommend = $("#p-recommend").val();
        data.familyHistory = $("#p-familyHistory").val();

        if(typeof operationMultiSelectFD != 'undefined'){
            data.operationFullList = operationMultiSelectFD;
        }
//        if ($("#p-drugHistoryMultiSelect").val() != undefined) {
//            data.drugsHistory = $("#p-drugHistoryMultiSelect").val().split(',');
//        }
        data.labTestOrders = $("#labTestOrders_customized").val();
        data.labTestOrdersAll = $("#p-allLabTest").val();
        if(typeof allLabTestFD != 'undefined'){
            data.labTestOrdersAllFullData = allLabTestFD;
        }


        data.physicalExam = $("#p-physicalExamination").val();
        data.weight = $("#weight").val().trim();
        data.bloodPressure = $("#bloodPressure").val().trim();
        var currentLabTestWithValueArray = $('#table').parent().find('textarea');
        var currentLabTestWithValueMap = {};

        if (currentLabTestWithValueArray.length > 0) {
            for (var w = 0; w < currentLabTestWithValueArray.length; w++) {
                var value = [];
                value[0] = currentLabTestWithValueArray[w].value;
                value[1] = $('#table').parent().find('input:checkbox')[w].checked;
                value[2] = $('#table').parent().find('input:text')[w].value;
                currentLabTestWithValueMap[currentLabTestWithValueArray[w].id] = value;
            }
            data.currentLabTestWithValueMap = currentLabTestWithValueMap;
        }

        var operationOrderWithDescriptionArray = $('#tableOperation').parent().parent().find('textarea');
        var operationOrderWithDescriptionMap = {};

        if (operationOrderWithDescriptionArray.length > 0) {
            for (var w = 0; w < operationOrderWithDescriptionArray.length; w++) {
                ids = operationOrderWithDescriptionArray[w].id.split('-operation');
                var value = [];
                value[0] = operationOrderWithDescriptionArray[w].value;
                value[1] = $('#' + ids[0] + '-operation-checkbox-highlight').prop('checked');
                operationOrderWithDescriptionMap[ids[0]] = value;
            }
            data.operationOrderWithDescriptionMap = operationOrderWithDescriptionMap;
        }

        var operationCurrentArray = $('#tableCurrentOperation').parent().parent().find('textarea:not(.pathology-description)');
        var operationCurrentWithValueMap = {};

        if (operationCurrentArray.length > 0) {
            for (var k = 0; k < operationCurrentArray.length; k++) {
                operationIds = operationCurrentArray[k].id.split('-operation');
                var value = [];
                value[0] = operationCurrentArray[k].value;
                value[1] = $('#' + operationIds[0] + '-currentOperation-checkbox-highlight').prop('checked');
                value[2] = $('#' + operationIds[0] + '-operation-current-date').val();
                value[3] = $('#' + operationIds[0] + '-operation-current-pathology').val();
                value[4] = $('#' + operationIds[0] + '-operation-current-date-val').val();
                operationCurrentWithValueMap[operationIds[0]] = value;
            }
            data.operationCurrentWithValueMap = operationCurrentWithValueMap;
        }

        var chiefComplaintArray = $('#tableChiefCompliantDesc').parent().parent().find('textarea:not(#chiefCompliantTxt)')
        var chiefComplaintWithValueMap = {};

        if (chiefComplaintArray.length > 0) {
            for (var l = 0; l < chiefComplaintArray.length; l++) {
                chiefComplaintIds = chiefComplaintArray[l].id.split('-chiefcomplaint');
                var value = [];
                value[0] = chiefComplaintArray[l].value;
                value[1] = $('#' + chiefComplaintIds[0] + '-chiefComplaint-checkbox-highlight').prop('checked');
                chiefComplaintWithValueMap[chiefComplaintIds[0]] = value;
            }
            data.chiefComplaintWithValueMap = chiefComplaintWithValueMap;
        }
        data.chiefCompliantTxt = $("#chiefCompliantTxt").val();

        var physicalExaminationArray = $('#tablephysicalExaminationDesc').parent().parent().find('textarea');
        var physicalExaminationWithValueMap = {};

        if (physicalExaminationArray.length > 0) {
            for (var l = 0; l < physicalExaminationArray.length; l++) {
                physicalExaminationIds = physicalExaminationArray[l].id.split('-physicalExamination');
                var value = [];
                value[0] = physicalExaminationArray[l].value;
                value[1] = $('#' + physicalExaminationIds[0] + '-physicalExamination-checkbox-highlight').prop('checked');
                physicalExaminationWithValueMap[physicalExaminationIds[0]] = value;
            }
            data.physicalExaminationWithValueMap = physicalExaminationWithValueMap;
        }

        var diagnosisArray = $('#tablediagnosisDesc').parent().parent().find('textarea');
        var diagnosisWithValueMap = {};

        if (diagnosisArray.length > 0) {
            for (var l = 0; l < diagnosisArray.length; l++) {
                diagnosisIds = diagnosisArray[l].id.split('-diagnosis');
                var value = [];
                value[0] = diagnosisArray[l].value;
                value[1] = $('#' + diagnosisIds[0] + '-diagnosis-checkbox-highlight').prop('checked');
                diagnosisWithValueMap[diagnosisIds[0]] = value;
            }
            data.diagnosisWithValueMap = diagnosisWithValueMap;
        }

        var drugArray = $('#tabledrugDesc').parent().parent().find('textarea');
        var drugWithValueMap = {};

        if (drugArray.length > 0) {
            for (var l = 0; l < drugArray.length; l++) {
                drugIds = drugArray[l].id.split('-drug');
                var value = [];
                value[0] = drugArray[l].value;
                value[1] = $('#' + drugIds[0] + '-checkbox-highlight').prop('checked');
                drugWithValueMap[drugIds[0]] = value;
            }
            data.drugWithValueMap = drugWithValueMap;
        }

        var drugHistoryArray = $('#tabledrugHistoryDesc').parent().parent().find('textarea');
        var drugHistoryWithValueMap = {};

        if (drugHistoryArray.length > 0) {
            for (var l = 0; l < drugHistoryArray.length; l++) {
                drugHistoryIds = drugHistoryArray[l].id.split('-drug');
                var value = [];
                value[0] = drugHistoryArray[l].value;
                value[1] = $('#' + drugHistoryIds[0] + '-history-checkbox-highlight').prop('checked');
                drugHistoryWithValueMap[drugHistoryIds[0]] = value;
            }
            data.drugHistoryWithValueMap = drugHistoryWithValueMap;
        }

        var operationWithValue = $('.operation-class');
        var operationValues = {};
        for (var i = 0; i < operationWithValue.length; i++) {
            operationValues[operationWithValue[i].id] = $("[id='" + operationWithValue[i].id + "']").val();
            if (i == operationWithValue.length - 1) {
                data.operationDescs = operationValues;
            }
        }

        if (typeof hasHandwriting != 'undefined' && hasHandwriting == true) {
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

        data.pastMedicalHistoryTxt = $("#pastMedicalHistoryTxt").val();

        data.habitalHistoryTxt = $("#habitalHistoryTxt").val();

        $.ajax({
            url: '${pageContext.request.contextPath}' + '/clinic/patient/configurablePatientRecord/saveChiefComplaint/',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            dataType: 'json',
            type: 'POST',
            success: function (result, success, xhr) {
                if (result.state == "error") {
                    for (var i = 0; i < result.errors.length; i++) {
                        if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                            alert($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                        } else {
                            alert(result.errors[i].Field + ":  " + result.errors[i].Message);
                        }
                    }
                    $('#fileMobileView-save_close_btn').attr("disabled", false);
                }else{
                    alertify.success(result.message);
                    cuVisitId = result.backVisitId;
                    if (exitAfterSaving == true) {
                        window.top.location.href = '${pageContext.request.contextPath}' + '/clinic/patient/doctorDashboard/';
                    }else{
                        window.top.location.href = '${pageContext.request.contextPath}' + '/clinic/patient/configurablePatientRecord/' + data.patientId + "/"
                        + data.visitQueueId + "/" + result.backVisitId;
                    }
                }
            },
            error: function (e) {
                alert('Error121212: ' + e.responseText);
                $('#fileMobileView-save_close_btn').attr("disabled", false);
            }
        });

    }

</script>

</html>
<style>
    /*html **/
    /*{*/
        /*font-family: B Nazanin !important;*/
        /*font-size: 18px !important;*/

    /*}*/
</style>

