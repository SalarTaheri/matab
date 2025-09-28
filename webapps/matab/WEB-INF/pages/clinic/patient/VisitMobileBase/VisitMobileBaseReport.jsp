<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ResourceBundle" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="<c:url value='/resources/alterify/css/alertify.core.css'/>" rel="stylesheet"/>
<link href="<c:url value='/resources/alterify/css/alertify.bootstrap.css'/>" rel="stylesheet"/>
<script src="<c:url value='/resources/alterify/js/alertify.js' />"></script>
<%@page contentType="text/html;charset=UTF-8" %>
<%
    String patientId = (String) request.getAttribute("patientId");
    String visitQueueId = (String) request.getAttribute("visitQueueId");


    String encoded = null;
    try {
        encoded = URLDecoder.decode(request.getAttribute("chiefComplaint").toString(), "UTF-8");
    } catch (Exception e) {

    }

    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String areUShure = resource.getString("clinic.patientfile.confirm.exit");
    String areUShureDeleteRow = resource.getString("clinic.patientfile.confirm.delete.row");

%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">-->
    <link href="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/development-bundle/themes/base/jquery-ui.css'/>"
          rel="stylesheet"/>
    <link href="<c:url value='/resources/clinic/visitMobileBase.css'/>" rel="stylesheet"/>
    <script src="<c:url value='/resources/jquery-1.9.1.js' />"></script>
    <script src="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.js' />"></script>
    <%--<link rel="stylesheet" href="/resources/demos/style.css">--%>
    <script src="<c:url value='/resources/js/jquery.sticky.js' />"></script>
    <link href="<c:url value='/resources/clinic/clinic.mobile.css'/>" rel="stylesheet"/>
    <script type="text/javascript"
            src="<c:url value='/resources/jquery-textcomplete/jquery.textcomplete.js'/>"></script>
    <link href="<c:url value='/resources/jquery-textcomplete/jquery.textcomplete.css'/>" rel="stylesheet"/>
    <script type="text/javascript" src="<c:url value='/resources/common.js' />"></script>
</head>
<body>
<table width="100%" height="100%" bgcolor="lavender">
<tr width="100%" height="100%" valign="top">
<%--<td width="40%" id="td-id" height="100%" style="background-color: #fffff0;position: fixed;">
            <div class="body-header">
                <div >
                    <button class="uk-button uk-button-success"
                            type="button" style="display: none;">Save & exit
                    </button>
                    <button class="uk-button uk-button-success"
                            type="button" style="display: none;">Exit
                    </button>
                    <div align="center">
                        <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.firstName") %>&nbsp;
                        <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.lastName") %>:
                        ${patientrName}&nbsp; ${patientrFam}
                    </div>
                    <div align="center">
                        <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.fileNumber") %>:
                        ${patientrFileNumber}
                    </div>
                </div>
            </div>
            <div id="right-tabs" style="height: 100%">
                <ul>
                    <li><a href="#patientFile-tab">Patient File</a></li>
                    <li><a href="#scanPatientFile">Scan files</a></li>
                </ul>
                <div id="patientFile-tab">
                    <div id="patientFile-for-test" dir="ltr">
                        <table height="100%" style="text-align: center;background-color: #fffff0;width: 100%;direction: rtl">

                            <tr height="10%">
                                <td>
                                    <%=ResourceBoundleHolder.resourceBundle.getString("clinic.visit.clinicalInformation.weight") %>:
                                </td>
                                <td>
                                    <input type="text" id="weight" value="${weight}" style="width: 50px"/>
                                </td>
                                <td>
                                    <%=ResourceBoundleHolder.resourceBundle.getString("clinic.visit.clinicalInformation.bloodPressure") %>:
                                </td>
                                <td>
                                    <input type="text" id="bloodPressure" value="${bloodPressure}" style="width: 50px"/>
                                </td>
                            </tr>
                            <tr height="10%" style="background: #dcdcdc">
                                <td>
                                    <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.age") %>:
                                </td>
                                <td>
                                     ${patientrOBJ.age}
                                </td>
                                <td>
                                    <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.visitCount") %>:
                                </td>
                                <td>
                                     ${visitCount}
                                </td>
                            </tr>
                            <tr height="10%">
                                <td>
                                    <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.livesIn.city") %>:
                                </td>
                                <td>
                                     ${patientrOBJ.cityName}
                                </td>
                                <td>
                                    <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.birthplace.city") %>:
                                </td>
                                <td>
                                     ${patientrOBJ.birthplaceCityName}
                                </td>
                            </tr>
                        </table>
                        <h3 class="ui-accordion-header ui-helper-reset ui-state-default ui-accordion-icons ui-corner-all" aria-selected="false" aria-expanded="true" tabindex="0" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(50%,rgba(41,137,216,1)), color-stop(51%,rgba(32,124,202,1)), color-stop(100%,rgba(125,185,232,1)));
    color: white;
    font-size: 16px !important;
    padding-left: 2.2em;
    padding-top: 5px;
    padding-bottom: 5px">

                            Patient Files
                        </h3>
                        <div id="patientFile-for-test-inner" style="overflow: auto; max-height: 400px;border: 1px solid gray;"></div>
                        &lt;%&ndash;<div id="patientFile-for-test-inner" ></div>&ndash;%&gt;
                    </div>
                </div>
                <div id="scanPatientFile">

                </div>
            </div>
        </td>--%>
<td width="60%" dir="ltr" align="left" height="100%">
    <div class="body-header">
        <div id="header-toolbar">
            <button class="uk-button uk-button-success" id="fileMobileView-report-btn"
                    type="button">Report
            </button>
            <button class="uk-button uk-button-success" id="PatientCardVisitView"
                    type="button">Exit
            </button>
        </div>
    </div>
    <input id="patientIdForPopup" type="hidden" value="${patientId}"/>

    <div id="accordion-resizer" style="height: 100%">
        <div id="tabs">
            <ul>
                <li><a href="#currentVisit">Current Visit</a></li>
            </ul>

            <div id="currentVisit" style="overflow: auto;">

                <div id="chiefComplaint">
                    <h3>Chief Complaint & Present illness</h3>

                    <div>
                        <jsp:include page="fileBaseItems/ChiefComplaint.jsp"/>
                    </div>
                </div>
                <div id="physicalExam">
                    <h3>Physical examination</h3>

                    <div>
                        <jsp:include page="fileBaseItems/PhysicalExamination.jsp"/>
                    </div>
                </div>
                <%--<div id="diagnosis">--%>
                <%-- <h3>Diagnosis</h3>
                <div >
                    <jsp:include page="fileBaseItems/Diagnosis.jsp"/>
                </div>--%>
                <%--</div>--%>
                <%--<div id="currentLab">
                    <h3>LabTest & Result</h3>
                    <div >
                        <jsp:include page="CurrentLabTestAndResult.jsp"/>
                    </div>
                </div>--%>
                <%--<div id="currentProc">
                    <h3>Procedure & Result</h3>

                    <div >
                        <jsp:include page="fileBaseItems/CurrentOperationAndResult.jsp"/>
                    </div>
                </div>--%>

            </div>
            <%--<div id="historyTab" style="overflow: auto;">--%>
            <%--    <div id="pastMedicalHistory">
                <h3>Past Medical History</h3>
                <div>
                <jsp:include page="fileBaseItems/PastMedicalHistory.jsp"/>
                </div>
            </div>

            <div id="drugHistory">
                <h3> Medicine History</h3>
                <div>

                <jsp:include page="fileBaseItems/DrugHistory.jsp"/>
                </div>
            </div>

            <div id="habitalHistory">
                <h3>Habital History</h3>
                <div>
                <jsp:include page="fileBaseItems/HabitalHistory.jsp"/>
                </div>
            </div>--%>
            <%--</div>--%>
            <%--<div id="labTestReport">--%>
            <%--</div>--%>
            <%--<div id="orderTab" style="overflow: auto;">--%>
            <%--<div id="orderDrugg">
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
            <div id="orderProc">
                <h3>Order Procedure</h3>
                <div>
                    <jsp:include page="fileBaseItems/OperationOrder.jsp"/>
                </div>
            </div>--%>
            <%--</div>--%>
            <%--<div id="followUpTab" style="overflow: auto;">--%>
            <%--     <div id="followUp">
             <h3>FollowUp</h3>
             <div >
                 <jsp:include page="fileBaseItems/FollowUp.jsp"/>
             </div>
            </div>--%>
            <%--</div>--%>
            <%--<div id="recommendTab" style="overflow: auto;">--%>
            <%--<div id="recommend">
             <h3>Recommendation</h3>
             <div >
                 <jsp:include page="fileBaseItems/Recommendation.jsp"/>
             </div>
            </div>--%>
            <%--</div>--%>
        </div>


    </div>
</td>
</tr>
<tr>
    <td>
        <div class="uk-container uk-container-center my-uk-container">
            <form class="uk-form" id="mainForm">
                <div class="uk-grid uk-grid-preserve">
                    <base:testBox name="patientPercent" key="clinic.patient.patientfile.search" styleClass="small" styledivLabel="width:30%" disabled="true" />
                    <base:testBox name="totalPatientHaveFile" key="clinic.patient.patientfile.have" styleClass="small" styledivLabel="width:20%" disabled="true"/>
                </div>

                <base:my-grid name="grid"
                              transportReadUrl="${pageContext.request.contextPath}/clinic/patientr/patientr/grid-read" noDeleteButton="true" noEditButton="true">
                    <base:my-grid-column title='clinic.patient.fileNumber' field="filenumber" width="30px"/>
                    <base:my-grid-column title='clinic.patient.firstName' field="firstname" width="30px"/>
                    <base:my-grid-column title='clinic.patient.lastName' field="lastname" width="40px"/>
                    <base:my-grid-column title='clinic.patient.fatherName' field="fathername" width="30px"/>
                    <base:my-grid-column title='clinic.patient.age' field="age" width="20px"/>
                    <%--<base:my-grid-column title='clinic.patient.birthDate' field="birthYear" width="25px"/>--%>
                    <%--<base:my-grid-column title='clinic.patient.tel1' field="tel1"  width="30px"/>--%>
                    <%--<base:my-grid-column title='clinic.patient.cellPone' field="cellphon"  width="30px"/>--%>

                    <base:my-grid-schema-field name="filenumber" type="string"/>
                    <base:my-grid-schema-field name="firstName" type="string"/>
                    <base:my-grid-schema-field name="lastName" type="string"/>
                    <base:my-grid-schema-field name="fatherName" type="string"/>
                    <base:my-grid-schema-field name="age" type="number"/>
                    <%--<base:my-grid-schema-field name="birthYear" type="int"/>--%>
                    <%--<base:my-grid-schema-field name="tel1" type="string" />--%>
                    <%--<base:my-grid-schema-field name="cellPone" type="string" />--%>

                    <base:my-grid-function text="clinic.patientfile" functionClick="grid_onPatientFile"
                                           name="patientFile"/>
                </base:my-grid>
            </form>
        </div>
    </td>

</tr>
</table>
<%--<jsp:include page="fileBaseItems/ScanPatientFile.jsp"/>
<jsp:include page="fileBaseItems/PatientFile.jsp"/>
<jsp:include page="fileBaseItems/LabTestReport.jsp"/>--%>
<div id="p-patientFile" dir="ltr">
    <br>
    <%--<div id="p-patientFileContainer"  style="overflow-y: auto; max-width:100%; max-height:400px">--%>
    <div id="p-patientFileContainer" style="overflow-y: auto; max-width:100%; max-height:400px">
        <%--<ul id="p-patientFileContainer">--%>
        <%--</ul>--%>
    </div>
</div>
</body>
<%--www.office-learning.ir--%>
<script>

$("#p-patientFile").dialog({
    height:500,
    width:1000,
    autoOpen:false,
    show:{
        effect:"blind",
        duration:500
    },
    hide:{
        effect:"slide",
        duration:500
    }, close:function (event, ui) {
        emptyPatientFile();
    }
});
jQuery('body')
        .bind(
        'click',
        function (e) {
            if (
                    jQuery('#p-patientFile').dialog('isOpen')
                            && !jQuery(e.target).is('.ui-dialog, a')
                            && !jQuery(e.target).closest('.ui-dialog').length
                            && event.target.nodeName!="H2"
                    ) {
                jQuery('#p-patientFile').dialog('close');
            }
        }
);

$("#currentVisit").css("max-height", $(window).height() * 70 / 100);
$("#historyTab").css("max-height", $(window).height() * 70 / 100);
$("#orderTab").css("max-height", $(window).height() * 70 / 100);
$("#patientFile-for-test-inner").css("max-height", $(window).height() * 60 / 100);
$("#p-chiefComplaint").val(" ");
$("#p-physicalExamination").val(" ");
$("#p-followUp").val(" ${followUp}");
$("#p-recommend").val(" ${recommend}");

var cuVisitId = "${visitId}";
(function (a) {
    a.extend(a.fn, {bindLast:function (f, g) {
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
    }})
})(jQuery);
var icons = {
    header:"ui-icon-circle-arrow-e",
    activeHeader:"ui-icon-circle-arrow-s"
};
$("#tabs").tabs({
    activate:function (event, ui) {
        /*                if(ui.newTab[0].children[0].text=='Lab Test Report'){
         $( "#labTestReport-table" ).dialog( "open" );
         ui.oldTab[0].className+=" ui-state-default";
         $( "#tabs" ).tabs( "option", "active", 0 );
         }else if(ui.newTab[0].children[0].text=='History' ||ui.newTab[0].children[0].text=='Current Visit'||
         ui.newTab[0].children[0].text=='Order' || ui.newTab[0].children[0].text=='FollowUp'|| ui.newTab[0].children[0].text=='Recommendation'){
         ui.oldTab[0].className+=" ui-state-default";
         ui.newTab[0].className=ui.newTab[0].className.replace(/\bui-state-default\b/,'');
         ui.newTab[0].className=ui.newTab[0].className.replace(/\bui-state-focus\b/,'');

         }*/
    }
});
//        $( "#tabs" ).tabs();

//        $( "#right-tabs" ).tabs({
//            activate:function (event, ui) {
//                if (ui.newTab[0].children[0].text == 'Scan files') {
//                    $("#p-scanPatientFile").dialog("open");
//                    $("#right-tabs").tabs("option", "active", 0);
//
//                }
//            }
//        });
/*$( "#mainAccordion" ).accordion({
 icons: icons,
 heightStyle: "content",
 collapsible: true
 });
 $( "#currentVisitAccordion" ).accordion({
 icons: icons,
 heightStyle: "content",
 collapsible: true
 });*/
//        $( "#historyTab" ).accordion({
//	      icons: icons,
//	      heightStyle: "content",
//	      collapsible: true
//	    });
/*$( "#pastMedicalHistory" ).accordion({
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
 */
$("#chiefComplaint").accordion({
    icons:icons,
    heightStyle:"content",
    collapsible:true
});
$("#physicalExam").accordion({
    icons:icons,
    heightStyle:"content",
    collapsible:true
});
/*$( "#diagnosis" ).accordion({
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
 $( "#orderProc" ).accordion({
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
 });*/


$("#PatientCardVisitView").click(backBtnClick);
//	$("#fileMobileView-save_btn").click(saveForm);
$("#fileMobileView-report-btn").click(reportForm);

function grid_onPatientFile(e) {
    var data = this.dataItem($(e.target).closest("tr"));
    loadPatientFile(data.id);

}

function loadPatientFile(id) {
    $.getJSON("<c:url value='/' />" + "clinic/patient/visitMobileBase/loadByPatient/" + id, function (data) {

        $("#p-patientFileContainer").append(data.data);
//            $("#p-patientFileContainer").accordion({
//                heightStyle: "content",
//                collapsible: true
//            });
//            $("#p-patientFileContainer").accordion("refresh");


        $("#p-patientFile").dialog("open");
        var patientFileArray = $('div[id^="accordion-patientFile-"]');
        for (var j = 0; j < patientFileArray.length; j++) {
            $("#" + patientFileArray[j].id).accordion({
                heightStyle:"content",
                collapsible:true
//            header: "h3"
            });
        }
    });
}

function emptyPatientFile() {
    $("#p-patientFileContainer").empty();
}

function backBtnClick() {
<%--window.location.href ="${pageContext.request.contextPath}/" +'clinic/dashboard/viditInfo/';--%>

    var areUShure = "<%=areUShure%>";
    alertify.confirm(areUShure, function (e) {
        if (e) {
        <%--window.location.href ='<%= request.getHeader("referer")%>';;--%>
            window.location.href = '${pageContext.request.contextPath}' + '/clinic/patient/visitDoctorQueue/';
        }
    });
}

/*function saveForm(){
 saveFormActual_1(cuVisitId);
 }
 function saveCloseForm(){
 saveForm();
 }*/

function reportForm() {
//        $('#fileMobileView-report-btn').attr("disabled", true);
    var data = {};
    data.chiefComplaint = $("#p-chiefComplaint").val();
    data.physicalExam = $("#p-physicalExamination").val();

    $.ajax({
        url:'${pageContext.request.contextPath}' + '/clinic/patient/visitMobileBase/reportResult/',
        contentType:"application/json; charset=utf-8",
        data:JSON.stringify(data),
        dataType:'json',
        type:'POST',
        //async: true,
        success:function (data, success, xhr) {
//                alertify.success(data.message);

            <%--window.location.href ='<%= request.getHeader("referer")%>';;--%>
            var grid = $("#grid").data("kendoGrid");
            var filterArray = [];
            var i = 1;

            $("#patientPercent").val(data["patientPercent"]);
            $("#totalPatientHaveFile").val(data["totalPatientHaveFile"]);
            while (data["patientId" + i] != undefined) {
                var filterItemMap = {};
                filterItemMap['field'] = "id";
                filterItemMap['operator'] = "eq";
                filterItemMap['value'] = data["patientId" + i];
                filterArray[i - 1] = filterItemMap;
                i++;
            }



//                grid.dataSource.read();
            grid.dataSource.read({
                filter:{logic:"or",
                    filters:filterArray
//                        filters:f
                },
                page:1,
                pageSize:10
            });

            $('#fileMobileView-report-btn').attr("disabled", false);

        },
        error:function (e) {
            alert('Error121212: ' + e.responseText);
        }
    });


}

function isNumber(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

/*function saveFormActual_1(visitId){
 if($("#weight").val().trim().length!=0 && isNumber($("#weight").val().trim())==false){
 alert('Weight should be number');
 return;
 }

 $('#fileMobileView-save_close_btn').attr("disabled", true);
 $('#labTestResultPopupId')[0].contentWindow.saveLabTest();
 var data = {};
 console.log("---------------");
 //var mainFramForSave=$("#mainF").contents();
 data.visitQueueId=${visitQueueId};
 data.visitId = visitId;//
 data.patientId = ${patientId};//
 data.chiefComplaint = $("#p-chiefComplaint").val();//
 data.followUp = $("#p-followUp").val();//
 data.recommend = $("#p-recommend").val();//

 //todo		data.operationOrderList = $("#p-operationMultiSelect").val();//
 data.operationFullList = operationMultiSelectFD;//
 data.diagnosis =$("#p-diagnosisMultiSelect").val().split(',');//
 data.drugs =$("#p-drugMultiSelect").val();//
 data.drugsFullData=drugMultiSelectFD;
 data.drCustomizedDrugList =$("#drCustomizedDrugList").val();//
 data.drugsHistory =$("#p-drugHistoryMultiSelect").val().split(',');//
 data.labTestOrders=$("#labTestOrders_customized").val();//
 data.labTestOrdersAll=$("#p-allLabTest").val();
 data.labTestOrdersAllFullData=allLabTestFD;

 data.habitalHistory=$("#p-habitalHistoryMultiSelect").val().split(',');
 data.habitalHistoryFdata=phabitalHistoryMultiSelectData;

 data.physicalExam =$("#p-physicalExamination").val();//
 data.medicalHistory =$("#p-pastMedicalHistoryMultiSelect").val().split(',');//
 data.weight =$("#weight").val().trim();
 data.bloodPressure =$("#bloodPressure").val().trim();
 //        var currentLabTestWithValueArray=$('#table').parent().find('input[type=text]');
 var currentLabTestWithValueArray=$('#table').parent().find('textarea');
 var currentLabTestWithValueMap={};

 if(currentLabTestWithValueArray.length>0){
 for(var w=0;w<currentLabTestWithValueArray.length;w++){
 currentLabTestWithValueMap[currentLabTestWithValueArray[w].id]=currentLabTestWithValueArray[w].value;
 }
 data.currentLabTestWithValueMap=currentLabTestWithValueMap;
 }

 var operationOrderWithDescriptionArray=$('#tableOperation').parent().parent().find('textarea');
 var operationOrderWithDescriptionMap={};

 if (operationOrderWithDescriptionArray.length > 0) {
 for (var w = 0; w < operationOrderWithDescriptionArray.length; w++) {
 ids=operationOrderWithDescriptionArray[w].id.split('-operation');
 operationOrderWithDescriptionMap[ids[0]] = operationOrderWithDescriptionArray[w].value;
 }
 data.operationOrderWithDescriptionMap = operationOrderWithDescriptionMap;
 }

 var operationCurrentArray=$('#tableCurrentOperation').parent().parent().find('textarea');
 var operationCurrentWithValueMap={};

 if (operationCurrentArray.length > 0) {
 for (var k = 0; k < operationCurrentArray.length; k++) {
 operationIds=operationCurrentArray[k].id.split('-operation');
 operationCurrentWithValueMap[operationIds[0]] = operationCurrentArray[k].value;
 }
 data.operationCurrentWithValueMap = operationCurrentWithValueMap;
 }


 var operationWithValue=  $('.operation-class');
 var operationValues={};
 for(var i=0;i<operationWithValue.length;i++){
 operationValues[operationWithValue[i].id]=$("[id='"+operationWithValue[i].id+"']").val() ;
 if(i==operationWithValue.length-1){
 data.operationDescs=operationValues;
 }
 }

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
<%--window.location.href ='<%= request.getHeader("referer")%>';;--%>
 window.location.href ='${pageContext.request.contextPath}'+'/clinic/patient/visitDoctorQueue/';
 },
 error: function (e) {
 alert('Error121212: ' + e.responseText);
 }
 });


 //Common.postJSON("${pageContext.request.contextPath}"+"/clinic/patient/visitMobileBase/saveChiefComplaint/" , JSON.stringify(data), function(){
 //updateVisitCount();
 //loadVisit(parseInt($("#p-visit-current").text()));
 //			console.log(data);
 //		alert(data.cccVisitId);
 //	cuVisitId=data.visitId;

 //});
 }*/

$("#lst1").click(function () {

    // $("#p-card-view-page").dialog({modal : true ,  position: "center"});
    var window1;
    childWindow = open("popupTree", null, "resizable=no,width=370,height=610,modal=yes");
    if (childWindow.opener == null) childWindow.opener = self;
});


//	$(document).ready(function() { $("#p-allLabTest").select2({
//    	allowClear: true
//		});
//	});

/*var allLabTestFD={};
 $.getJSON("<c:url value='/' />" + "clinic/medicaltest/medicalTest/loadMedicalTestChildWithoutMine" , function(data) {
 allLabTestFD=data;
 for ( var i = 0; i < data.length; i++) {
 $("#p-allLabTest").append(
 "<option style='direction:ltr' value='" + data[i].ComboID + "' >" + data[i].ComboCaption + "</option>")
 }
 $("#p-allLabTest").select2('val',${labTestIds});

 var labTestList = new Array();
<%--<%
           if(!request.getAttribute("labTestIds").toString().equals("-1")){


           List<String> list = (List)request.getAttribute("labTestIds");
           if(list!=null){
           for(int count=0; count <list.size(); count++) {
        %>
        labTestList[<%= count %>] = '<%= list.get(count) %>';
        <% } %>
        <% } %>
        <% } %>
--%>
 i = 0, size = labTestList.length;
 for(i; i < size; i++){
 $("#labTestOrders_customized").multiselect("widget").find(":checkbox[value='"+labTestList[i]+"']").attr("checked","checked");
 $("#labTestOrders_customized option[value='" + labTestList[i] + "']").attr("selected", 1);
 $("#labTestOrders_customized").multiselect("refresh");
 }

 });*/

$(function () {
//          initOperationDescAutocomplate();
});

function initOperationDescAutocomplate() {

//          var operationNamesArray = new Array();
<%--<%
             if(!request.getAttribute("operationNames").toString().equals("-1")){


             List<String> listOperationNames = (List)request.getAttribute("operationNames");
             if(listOperationNames!=null){
             for(int count=0; count <listOperationNames.size(); count++) {
          %>
          operationNamesArray[<%= count %>] = '<%= listOperationNames.get(count) %>';
          <% } %>
          <% } %>
          <% } %>
--%>

//          var operationValsArray = new Array();
<%--<%
             if(!request.getAttribute("operationValues").toString().equals("-1")){


             List<String> listOperationValues = (List)request.getAttribute("operationValues");
             if(listOperationValues!=null){
             for(int count=0; count <listOperationValues.size(); count++) {
          %>
          operationValsArray[<%= count %>] = '<%= listOperationValues.get(count) %>';
          <% } %>
          <% } %>
          <% } %>
--%>
    /*var operationDescriptionArray = $('.operation-class');
     for (var i = 0; i < operationDescriptionArray.length; i++) {

     dosomthingCool(operationDescriptionArray[i].id);

     }
     for (var j = 0; j < operationNamesArray.length; j++) {
     //              $('#' + operationNamesArray[j].trim()).val(operationValsArray[j]);
     $("[id='"+ operationNamesArray[j].trim()+"']").val(operationValsArray[j]);
     }*/
}

function dosomthingCool(id) {
//      var elem = $('#'+id);
    var elem = $("[id='" + id + "']");
    elem.textcomplete([
        {
            match:/(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
            search:function (term, callback) {
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
            replace:function (word) {
                return '$1' + word + ' ';
            }
        }
    ]);
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
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr = '#cedce7', endColorstr = '#a9c0d3', GradientType = 0); /* IE6-9 */
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
</style>


</html>