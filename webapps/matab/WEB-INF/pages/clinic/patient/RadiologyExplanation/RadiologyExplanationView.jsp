<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ResourceBundle" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<link href="<c:url value='/resources/alterify/css/alertify.core.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/alterify/css/alertify.bootstrap.css'/>" rel="stylesheet" />
<script src="<c:url value='/resources/alterify/js/alertify.js' />"></script>
<%@page contentType="text/html;charset=UTF-8"%>
<%
	String patientId=(String)request.getAttribute("patientId");
	String visitQueueId=(String)request.getAttribute("visitQueueId");
	String mongoVisitId=(String)request.getAttribute("mongoVisitId");
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
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/development-bundle/themes/base/jquery-ui.css'/>" rel="stylesheet" />
  <link href="<c:url value='/resources/clinic/visitMobileBase.css'/>" rel="stylesheet" />
  <script src="<c:url value='/resources/js/jquery.sticky.js' />"></script>
  <link href="<c:url value='/resources/clinic/clinic.mobile.css'/>" rel="stylesheet" />
  <script type="text/javascript" src="<c:url value='/resources/jquery-textcomplete/jquery.textcomplete.js'/>"></script>
  <link href="<c:url value='/resources/jquery-textcomplete/jquery.textcomplete.css'/>" rel="stylesheet" />
  <script type="text/javascript" src="<c:url value='/resources/common.js' />"></script>
  <script src="<c:url value='/resources/ckeditor/ckeditor.js' />"></script>
  <link href="<c:url value='/resources/sweetalert/sweetalert.css'/>" rel="stylesheet" />
  <script src="<c:url value='/resources/sweetalert/sweetalert.min.js'/>"></script><link href="<c:url value='/resources/clinic/mergedClinicCss.css'/>" rel="stylesheet" />
</head>
<body>
<table width="100%" height="100%" bgcolor="lavender">
	<tr width="100%" height="100%" valign="top">
		<td width="40%" id="td-id" height="100%" style="background-color: #fffff0;width:44%;display:inline-block;float:right">
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
                    <li  class="rightTabLiColor"><a href="#patientFile-tab" style="color: white;">Patient File</a></li>
                    <li  class="rightTabLiColor"><a href="#scanPatientFile" style="color: white;">Scan files</a></li>
                    <!-- <li style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(50%,rgba(41,137,216,1)), color-stop(51%,rgba(32,124,202,1)), color-stop(100%,rgba(125,185,232,1)))"><a style="color: #ffffff;" href="#scanPatientFile">Scan files</a></li>
                    <li style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(50%,rgba(41,137,216,1)), color-stop(51%,rgba(32,124,202,1)), color-stop(100%,rgba(125,185,232,1)));"><a href="#labTestReport" style="color: white;">Lab Test Report</a></li>
                    <li style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(50%,rgba(41,137,216,1)), color-stop(51%,rgba(32,124,202,1)), color-stop(100%,rgba(125,185,232,1)));"><a href="#procedureReport" style="color: white;">Procedure Report</a></li> -->
                </ul>
				<div id="patientFile-tab" style="background: #2f4f4f">
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
						    color: white;    font-size: 16px !important;    padding-left: 2.2em;    padding-top: 5px;    padding-bottom: 5px">
                            Patient Files
                        </h3>
                        <div id="patientFile-for-test-inner" style="overflow: auto; border: 1px solid gray;"></div>
                    </div>
				</div>
                <div id="scanPatientFile">
                </div>
                <div id="labTestReport">
                </div>
                <div id="procedureReport">
                </div>
            </div>
		</td>
		<td width="55%" dir="ltr" align="left" height="100%" style="display:inline-block;float:left">
			<div class="body-header">
				<div id="header-toolbar">
                    <button class="uk-button uk-button-success" id="fileMobileView-save_close_btn"
						type="button">Save & exit
					</button>
					<button class="uk-button uk-button-success" id="PatientCardVisitView"
						type="button">Exit
					</button>
					<button class="uk-button uk-button-success" id="printRadiologyExplaination"
						type="button">Print
					</button>					
				</div>
			</div>
			<input id="patientIdForPopup" type="hidden" value="${patientId}"/>
			<div id="surgeryExplaination" style="height: 100%">
                <div id="surgeryTab" style="display: flex; flex-direction: row; flex-wrap: wrap; justify-content: center; align-items: center;height:30px; background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(50%,rgba(41,137,216,1)), color-stop(51%,rgba(32,124,202,1)), color-stop(100%,rgba(125,185,232,1)));">
                 	<div style="color: white; display: table; margin: 0 auto;">
                 		<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.radiology.selectTemplateAndDoctor") %>
                	</div>
                </div>
                <div style="background-color: white; border-style: solid; border-color: black; border-width: 1px; display: flex; flex-direction: column; ">
                	<div style="display: inline-flex; direction: rtl;">
						<div style="text-align: right; padding: 5px; width: 50%;" dir="rtl">
							<label style="display: inline-block;" for="headerCombo"><%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.radiology.radiologyHeader")%></label>
	                		<select id="headerCombo" onchange="changeTemplate()" style="width: 50%; margin-right: 12%;">
					    		<option value="-1"><%=ResourceBoundleHolder.resourceBundle.getString("system.combo.pleaseSelect")%></option>
							</select>
						</div>
						<div class="uk-grid uk-grid-preserve" style="display: none;width: 50%; padding: 5px;" >
							<base:comboBoxAutoComplete-buttonNew name="doctorId" key="clinic.patient.radiology.doctor" dataTextField="fullName"  styleClass="larg"
									iscomboLoaderUrlRelative="true" comboLoaderUrl="combo/loadAllAgentDoctor" dataValueField="id" minLength="0" styledivLabel="width: 25%;"
									hasTemplate="false" popupUrl="popup/doctorInput" relativeSaveUrl="/popupDoctor/save" stylediv="padding-right: 0px;"/>
						</div>
					</div>
					<div style="text-align: right; padding: 5px; display: flex; direction: rtl; padding-bottom: 10px;">
                        <base:multiSelect serverFilter="true" name="templateCombo" styleClass="normal" multiSelectLoaderUrl="combo/loadAllTemplate" stylediv="width: 90%;"
                                          key="clinic.patient.radiology.radiologyTemplate" styledivLabel="width: 120px; text-align: right;" isBoundInOpen="true"/>
					</div>
                </div>
                <div id="surgeryTab" style="display: flex; flex-direction: row; flex-wrap: wrap; justify-content: center; align-items: center;height:30px; background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(50%,rgba(41,137,216,1)), color-stop(51%,rgba(32,124,202,1)), color-stop(100%,rgba(125,185,232,1)));">
                 	<div style="color: white; display: table; margin: 0 auto;">
                 		<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.radiology.explain") %>
                	</div>
                </div>
                <div style="background-color: white; border-style: solid; border-color: black; border-width: 1px; height: auto;">
           			<textarea name="radiologyExplanation" id="radiologyExplanation" ></textarea>
                </div>
			</div>
        </td>
	</tr>
 </table>
<jsp:include page="fileBaseItems/ScanPatientFile.jsp"/>
<%--<jsp:include page="../VisitMobileBase/fileBaseItems/ScanPatientFile.jsp"/>--%>
<jsp:include page="fileBaseItems/PatientFile.jsp"/>
<%--<jsp:include page="fileBaseItems/LabTestReport.jsp"/>--%>
<%--<jsp:include page="fileBaseItems/ProcedureReport.jsp"/>--%>
</body>
<script>
        $("#patientFile-for-test-inner").css("max-height",$(window).height()-($(".body-header").height()*6)) ;
        $("#p-chiefComplaint").val("${chiefComplaint}");
        $("#p-physicalExamination").val("${physicalExam}");
        $("#p-followUp").val(" ${followUp}");
        $("#p-recommend").val(" ${recommend}");
        $("#p-familyHistory").val(" ${familyHistory}");

  	    var cuVisitId="${visitId}";
  		(function(a){a.extend(a.fn,{bindLast:function(f,g){return this.each(function(){var e=1E6,c=f.split(".")[0];a(this).bind(f,g);var b=a(this).data("events"),d=false,h={};a.each(b[c],function(i,j){if(j===g)d=i;h[i]=1});if(d!==false){for(;h[e]==1;)e++;b[c][e]=b[c][d];delete b[c][d];a(this).data("events",b)}})}})})(jQuery);
  	    var icons = {
	      header: "ui-icon-circle-arrow-e",
	      activeHeader: "ui-icon-circle-arrow-s"
    	};
        $( "#right-tabs" ).tabs({
            activate:function (event, ui) {
                if (ui.newTab[0].children[0].text == 'Scan files') {
                    $("#p-scanPatientFile").dialog("open");
                    $("#right-tabs").tabs("option", "active", 0);
                }else if(ui.newTab[0].children[0].text == 'Lab Test Report'){
                    $( "#labTestReport-table" ).dialog( "open" );
                    $("#right-tabs").tabs("option", "active", 0);
	            }else if(ui.newTab[0].children[0].text == 'Procedure Report'){
	                $( "#procedureReport-table" ).dialog( "open" );
	                $("#right-tabs").tabs("option", "active", 0);
	            }
            }
        });

    $("#PatientCardVisitView").click(backBtnClick);
	$("#fileMobileView-save_btn").click(saveForm);
	$("#fileMobileView-save_close_btn").click(saveCloseForm);
	$("#printRadiologyExplaination").click(printRadiologyExplainationClick);

	function printRadiologyExplainationClick(){
        var myWindow = window.open("", "Radiology Explanation", "width=800, height=800");
        var re = CKEDITOR.instances.radiologyExplanation.getData();
        myWindow.document.write(re);
        myWindow.document.write("<style>p{margin: 0px; padding: 0px;}</style>");
    	myWindow.document.close();
		myWindow.focus();
		myWindow.print();
		myWindow.close();
	}
	function backBtnClick(){
            var areUShure = "<%=areUShure%>";
            alertify.confirm(areUShure, function (e) {
                if(e){
                    window.location.href ='<%= request.getHeader("referer")%>';;
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
		var data = {};
        data.radiologyExplanation = CKEDITOR.instances.radiologyExplanation.getData(); 
		data.patientId = "<%=patientId%>";
		data.visitQueueId = "<%=visitQueueId%>"; 
		data.mongoVisitId = "<%=mongoVisitId%>";
		data.doctorId = $("#doctorId").val();
		$.ajax({
			url: '${pageContext.request.contextPath}'+'/clinic/patient/radiologyExplaination/saveRadiologyExplaination',
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(data),
			dataType: 'json',
			type: 'POST',
			success: function (data, success, xhr) {
				alertify.success(data.message);
				cuVisitId=data.backVisitId;
                window.location.href ='<%= request.getHeader("referer")%>';;
			},
			error: function (e) {
				alert('Error121212: ' + e.responseText);
			}
		});
	}
	
  	var radiologyExplanationTextState = 0;
  	
  	var radiologyTemplate = "-1";

    function callback_change_templateCombo(e) {
        radiologyTemplate = "-1";
        if (e.sender._dataItems.length > 0) {
            radiologyTemplate = "";
            for (var i = 0; i < e.sender._dataItems.length; i++) {
                radiologyTemplate += e.sender._dataItems[i].ComboID + ":_:";
            }
        }
        changeTemplate();
    }

    function callback_dataBound_templateCombo(e) {
        isTemplateSelectorLoaded = true;
    }

    function loadHeaderCombo(pageInEditMode){
        $.ajax({
            url: "${pageContext.request.contextPath}"+"/clinic/patient/radiologyExplaination/combo/loadHeaderCombo",
            type:"GET",
            dataType:"json",
            contentType:"application/json; charset=utf-8",
            success: function (data) {
                $("#headerCombo").append(data.data);
                //
                isHeaderSelectorLoaded = true;
                //
                if ($("#headerCombo").children().size() == 2) {
                    if (pageInEditMode == false) {
                        $('#headerCombo option:eq(1)').attr('selected', 'selected');
                        changeTemplate(false);
                    }
                }
            },error:function(result){
                if(result.status==401){
                    top.location.href=top.location.href;
                }
            }
        });
    }
  	
    $(document).ready(function () {
    	var mongoVisitId = "<%=mongoVisitId%>";
        CKEDITOR.on("instanceReady", function(event){
            $.getJSON('${pageContext.request.contextPath}' + '/clinic/patient/radiologyExplaination/loadRadiologyExplanation/' + mongoVisitId, function (data) {

                CKEDITOR.instances.radiologyExplanation.setData(data.radiologyExplanation);

                radiologyExplanationText = data.radiologyExplanation;
                radiologyExplanationTextState = 0;
                //
                if (data.agentDoctorId != null) {
                    $("#doctorId").val('');
                    var kendoComboBox = $("#doctorId_Comb").data("kendoComboBox");
                    kendoComboBox.dataSource.read({
                        filter: {
                            logic: "or",
                            filters: [{field: "id", operator: "eq", value: data.agentDoctorId}]
                        }
                    });
                    $("#doctorId_Comb").data("kendoComboBox").value(data.agentDoctorId);
                    $("#doctorId").val(data.agentDoctorId);
                }

                //

                var pageEditMode = false;
                if(data.radiologyExplanation != null && data.radiologyExplanation != undefined && data.radiologyExplanation != ""){
                    pageEditMode = true;
                    checkForLoadTemplateSelectors();
                }

                loadHeaderCombo(pageEditMode);

            });
        });
    });

    var isHeaderSelectorLoaded = false;
    var isTemplateSelectorLoaded = false;
    function checkForLoadTemplateSelectors(){
        if (isHeaderSelectorLoaded && isTemplateSelectorLoaded) {
            fillHeaderAndTemplateSelectorItems();
        } else {
            setTimeout(function() {
                checkForLoadTemplateSelectors();
            }, 500);
        }
    }

    var radiologyExplanationText = "";
    function changeTemplate(activePrompt){
        if (activePrompt == undefined || activePrompt == null){
            activePrompt = true;
        }
        //
        if (activePrompt) {
            swal(
                {
                    title: "توجه!",
                    text: "در صورت تغییر قالب بندی تغییر میکند آیا مطمئن هستید؟",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "بله",
                    cancelButtonText: "خیر",
                    closeOnConfirm: true
                },
                function(){
                    loadRadiologyExplanationEditor();
                }
            );
        }else{
            loadRadiologyExplanationEditor();
        }
    }

    function fillHeaderAndTemplateSelectorItems(){
        var data = CKEDITOR.instances.radiologyExplanation.getData();
        if (data.indexOf("<div class=\"mehrsysPointer\"") == -1) {
            return;
        }

        data = data.replace(/  +/g, ' ');
        data = data.replace(new RegExp("</div> </div>", 'g'), "</div></div>");

        var tags = [];

        var pointer = 0;
        while(true){
            var startOfTag = data.indexOf("<div class=\"mehrsysPointer\"", pointer);
            var endOfTag = data.indexOf(">", startOfTag);

            if (startOfTag == -1) {
                break;
            }

            pointer = endOfTag;

            var tag = data.substring(startOfTag, endOfTag);
            tags.push(tag);
        }

        var header = "";

        for (var i = 0 ; i < tags.length ; i++){
            var found = false;

            var divTag = tags[i];
            var fullAddress = divTag.substring(divTag.indexOf("id=") + 4, divTag.length - 1);

            for (var j = 0 ; j < $('#headerCombo').children().size(); j++) {
                if ($('#headerCombo option:eq(' + j + ')').val() == fullAddress) {
                    $('#headerCombo option:eq(' + j + ')').attr('selected', 'selected');
                    header = fullAddress;
                    found = true;
                    break;
                }
            }

            if (found) {
                break;
            }
        }

        var templates = [];
        for (var i = 0 ; i < tags.length ; i++){

            var divTag = tags[i];
            var fullAddress = divTag.substring(divTag.indexOf("id=") + 4, divTag.length - 1);

            if (fullAddress == header) {
                continue;
            }

            templates.push(fullAddress);
        }

        var multiSelect = $("#templateCombo_multiSelect").data("kendoMultiSelect");
        multiSelect.value(templates);
    }

    function loadRadiologyExplanationEditor(){
        var templateComboValue = radiologyTemplate;
        var templateHeaderValue = $("#headerCombo").val();
        //
        templateComboValue =  templateComboValue.replace(/\\/g, ':@:').replace(/\./g, ':!:').replace(/\//g, ':@:');
        templateHeaderValue =  templateHeaderValue.replace(/\\/g, ':@:').replace(/\./g, ':!:').replace(/\//g, ':@:');
        //
        var patientId = ${patientId};
        //
        var url = '${pageContext.request.contextPath}'+'/clinic/patient/radiologyExplaination/loadRadiologyExplanationFromCombo/' +
                templateComboValue + '/' + templateHeaderValue + '/' + patientId;
        //
        $.getJSON(url, function (data) {
            var oldData = CKEDITOR.instances.radiologyExplanation.getData().replace(/(\r\n|\n|\r)/gm,"");;
            var newData = data.radiologyExplanation;

            if (oldData == "") {
                CKEDITOR.instances.radiologyExplanation.setData(newData);
            }

            if (oldData.indexOf("<div class=\"mehrsysPointer\"") == -1) {
                CKEDITOR.instances.radiologyExplanation.setData(newData);
            }

            var pointer = 0;
            for(var i = 1 ; i < newData.split("<div class=\"mehrsysPointer\"").length ; i++){
                newData = newData.replace(/  +/g, ' ');
                newData = newData.replace(new RegExp("</div> </div>", 'g'), "</div></div>");

                var startDivTagIndex = newData.indexOf("<div class=\"mehrsysPointer\"" , pointer);
                var endDivTagIndex = newData.indexOf(">", startDivTagIndex);
                var sectionIdentifier = newData.substring(startDivTagIndex, endDivTagIndex + 1);

                if (oldData.indexOf(sectionIdentifier) != -1){
                    var sectionIdentifierStart = oldData.indexOf(sectionIdentifier);
                    var sectionIdentifierEnd = oldData.indexOf("</div></div></div></div></div>", sectionIdentifierStart) + "</div></div></div></div></div>".length;
                    var targetSection = oldData.substring(sectionIdentifierStart, sectionIdentifierEnd);

                    var preSection = newData.substring(0, startDivTagIndex);
                    var postSection = newData.substring(newData.indexOf("</div></div></div></div></div>", endDivTagIndex) + "</div></div></div></div></div>".length, newData.length);

                    newData = preSection + targetSection + postSection;
                }

                pointer = endDivTagIndex + 1;
            }

            CKEDITOR.instances.radiologyExplanation.setData(newData);
        });
    }

    CKEDITOR.replace("radiologyExplanation");
    CKEDITOR.instances.radiologyExplanation.on('change', function(data) {
    	/*radiologyExplanationTextState = radiologyExplanationText.localeCompare(CKEDITOR.instances.radiologyExplanation.getData());
    	var data = [];
    	data.text = radiologyExplanationText;
    	data.newText = CKEDITOR.instances.radiologyExplanation.getData();
    	data.radiologyExplanationTextState = radiologyExplanationTextState;
   		console.log(data);*/
    });
	function callback_dataBound_doctorId(e){
		if($("#doctorId_Comb").data("kendoComboBox").dataSource.data().length == 1){
			$("#doctorId_Comb").data("kendoComboBox").select(0);			
		}
	}
</script>
<style>
    #td-id{
        background: #cedce7; /* Old browsers */
        background: -moz-linear-gradient(top,  #cedce7 0%, #a9c0d3 100%); /* FF3.6+ */
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#cedce7), color-stop(100%,#a9c0d3)); /* Chrome,Safari4+ */
        background: -webkit-linear-gradient(top,  #cedce7 0%,#a9c0d3 100%); /* Chrome10+,Safari5.1+ */
        background: -o-linear-gradient(top,  #cedce7 0%,#a9c0d3 100%); /* Opera 11.10+ */
        background: -ms-linear-gradient(top,  #cedce7 0%,#a9c0d3 100%); /* IE10+ */
        background: linear-gradient(to bottom,  #cedce7 0%,#a9c0d3 100%); /* W3C */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cedce7', endColorstr='#a9c0d3',GradientType=0 ); /* IE6-9 */
    }
    .ui-dialog{
    	direction: ltr;
    }
    a{
        color: black
    }
    ul.tabs li.ui-state-active,ul.tabs li.ui-tabs-selected {
    	background: blue
   	}
    ul.tabs li.ui-tabs-active a, ul.tabs li.ui-tabs-selected a{
    	background: blue
   	}
	select {
	    padding:3px;
	    margin: 0;
	    background: rgb(242, 242, 242);
	    color:#000;
	    outline:none;
	    display: inline-block;
	    appearance:none;
	    cursor:pointer;
	    border-radius:4px;
	    width: 30%;
	}
	#templateCombo {
	  padding: 5px;
	  border: solid 1px #A9A9A9;
	  transition: box-shadow 0.3s, border 0.3s;
	  background: rgb(242, 242, 242);
	  width: 80%;
	  border-radius:4px;
	}
	#templateCombo:focus{
	  border: solid 1px #A9A9A9;
	  box-shadow: 0 0 2px 1px #A9A9A9;
	}
	.ui-autocomplete{
		text-align: left;
	    max-height: 300px;
	    overflow-y: auto;   /* prevent horizontal scrollbar */
	    overflow-x: hidden; /* add padding to account for vertical scrollbar */
	    z-index:500 !important;
	}

</style>
</html>
