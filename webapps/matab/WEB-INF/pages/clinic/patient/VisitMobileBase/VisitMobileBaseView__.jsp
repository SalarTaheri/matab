
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ResourceBundle" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="<c:url value='/resources/alterify/css/alertify.core.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/alterify/css/alertify.bootstrap.css'/>" rel="stylesheet" />
<script src="<c:url value='/resources/alterify/js/alertify.js' />"></script>
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
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<!--  <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">-->
  <link href="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/development-bundle/themes/base/jquery-ui.css'/>" rel="stylesheet" />
  <link href="<c:url value='/resources/clinic/visitMobileBase.css'/>" rel="stylesheet" />
  <script src="<c:url value='/resources/jquery-1.9.1.js' />"></script>
  <script src="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.js' />"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="<c:url value='/resources/js/jquery.sticky.js' />"></script>
  <link href="<c:url value='/resources/clinic/clinic.mobile.css'/>" rel="stylesheet" />
  <script type="text/javascript" src="<c:url value='/resources/jquery-textcomplete/jquery.textcomplete.js'/>"></script>
  <link href="<c:url value='/resources/jquery-textcomplete/jquery.textcomplete.css'/>" rel="stylesheet" />
  <script type="text/javascript" src="<c:url value='/resources/common.js' />"></script>

</head>
<body>
<table width="100%" height="100%" bgcolor="lavender">
	<tr width="100%" height="100%" valign="top">
		<td width="20%" id="td-id" height="100%" style="background-color: #fffff0;position: fixed;">
						<table height="100%" style="text-align: center;">
							<tr height="10%">
								<td>
									<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.firstName") %>
								</td>
								<td>
									: ${patientrName}
								</td>
							</tr>
							<tr height="10%">
								<td>
									<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.lastName") %>
								</td>
								<td>
									: ${patientrFam}
								</td>
							</tr>
							<tr height="10%">
								<td>
									<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.fileNumber") %>
								</td>
								<td>
									: ${patientrFileNumber}
								</td>
							</tr>
                            <tr height="10%">
                                <td>
                                    <%=ResourceBoundleHolder.resourceBundle.getString("clinic.visit.clinicalInformation.weight") %>
                                </td>
                                <td>
                                    :<input type="text" id="weight" value="${weight}"/>
                                </td>
                            </tr>
                            <tr height="10%">
                                <td>
                                    <%=ResourceBoundleHolder.resourceBundle.getString("clinic.visit.clinicalInformation.bloodPressure") %>
                                </td>
                                <td>
                                    :<input type="text" id="bloodPressure" value="${bloodPressure}"/>
                                </td>
                            </tr>
							<tr height="10%">
								<td>
									<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.age") %>
								</td>
								<td>
									: ${patientrOBJ.age}
								</td>
							</tr>


							<tr height="10%">
								<td>
									<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.visitCount") %>
								</td>
								<td>
									: ${visitCount}
								</td>
							</tr>
							<tr height="10%">
								<td>
									<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.livesIn.city") %>
								</td>
								<td>
									: ${patientrOBJ.cityName}
								</td>
							</tr>
							<tr height="10%">
								<td>
									<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.birthplace.city") %>
								</td>
								<td>
									: ${patientrOBJ.birthplaceCityName}
								</td>
							</tr>
						</table>

		</td>
		<td width="80%" dir="ltr" align="left" height="100%">
			<div class="body-header">
				<div id="header-toolbar">
					<%--<button class="uk-button uk-button-success" id="fileMobileView-save_btn"--%>
						<%--type="button">Save--%>
					<%--</button>--%>
                    <button class="uk-button uk-button-success" id="fileMobileView-save_close_btn"
						type="button">Save & exit
					</button>
					<button class="uk-button uk-button-success" id="PatientCardVisitView"
						type="button">Exit
					</button>
				</div>
			</div>
			<input id="patientIdForPopup" type="hidden" value="${patientId}"/>

			<div id="accordion-resizer" style="height: 80%">
                <div id="patientFile-for-test" >
                    <%--<h3 class="ui-accordion-header ui-helper-reset ui-state-default ui-state-active ui-corner-top">--%>
                    <%--<h3 class="ui-accordio-header ui-helper-reset ui-state-default ui-accordion-header-active ui-state-active ui-corner-top ui-accordion-icons">--%>
                        <h3 class="ui-accordion-header ui-helper-reset ui-state-default ui-accordion-icons ui-corner-all" aria-selected="false" aria-expanded="true" tabindex="0" style="background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(30,87,153,1)), color-stop(50%,rgba(41,137,216,1)), color-stop(51%,rgba(32,124,202,1)), color-stop(100%,rgba(125,185,232,1)));
    color: white;
    font-size: 16px !important;
    padding-left: 2.2em;
    padding-top: 5px;
    padding-bottom: 5px">
                        <%--<span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>--%>
                              <%--&nbsp;&nbsp;&nbsp;&nbsp; Patient Files--%>
                              Patient Files
                    </h3>
                    <div id="patientFile-for-test-inner" style="overflow: auto; max-height: 200px;"></div>
                </div>
				<div id="mainAccordion" style="height: 100%">
				  <h3>Past Visit</h3>
				  <div>
					    <%--<ul >--%>
					      <%--<li>--%>
                           <table>
                             <tr>
                                 <td>
                                     <a href="#" id="p-scanPatientFile-id" >
                                         <img src="<c:url value='/resources/images/folder-documents-3.png' />" alt='' align='left' />
                                     </a>
                                 </td>
                                 <td>
                                     <a href="#" id="p-scanPatientFile-id-txt" >
                                         <h2>پرونده اسکن شده بیمار </h2>
                                     </a>
                                 </td>
                                 <td style=" width: 20%; ">

                                 </td>


					      <%--</li>--%>
					      <%--<li>--%>

                                    <td>
                                        <a href="#" id="p-patientFile-id">
                                            <img src="<c:url value='/resources/images/folder-documents-3.png' />" alt='' align='left' />
                                        </a>
                                    </td>
                                    <td>
                                        <a href="#" id="p-patientFile-id-txt">
                                            <h2>پرونده بیمار </h2>
                                        </a>
                                    </td>

                                 <td style=" width: 20%; ">

                                 </td>

					      <%--</li>--%>
					      <%--<li>--%>

                                    <td>
                                        <a href="#" id="labTestReport-table-id">
                                            <img src="<c:url value='/resources/images/library-icon5.png' />" alt='' align='left' />
                                         </a>
                                    </td>
                                    <td>
                                        <a href="#" id="labTestReport-table-id-txt">
                                            <h2> گزارش آزمایشها  </h2>
                                        </a>
                                    </td>
                                </tr>

                            </table>
					      <%--</li>--%>
					     <!--  <li><a href="#standard" data-rel="dialog">Genenral Information</a></li> -->
				   		 <%--</ul>--%>

				  </div>
                    <h3>History</h3>
                    <div id="historyAccordion">
                        <h3>Past Medical History</h3>
                        <div>
                            <jsp:include page="fileBaseItems/PastMedicalHistory.jsp"/>
                        </div>
                        <h3>Drug History</h3>
                        <div>
                            <jsp:include page="fileBaseItems/DrugHistory.jsp"/>
                        </div>
                        <h3>Habital History</h3>
                        <div>
                            <jsp:include page="fileBaseItems/HabitalHistory.jsp"/>
                        </div>
                    </div>
				  <h3>Current Visit</h3>
				  <div>
					  <div id="currentVisitAccordion">
						<h3>Chief Complaint & Present illness</h3>
						<div>
						   <jsp:include page="fileBaseItems/ChiefComplaint.jsp"/>
						 </div>
	  				     <h3>Physical examination</h3>
						 <div>
						 	<jsp:include page="fileBaseItems/PhysicalExamination.jsp"/>
						 </div>
						 <h3>Diagnosis</h3>
						 <div>
						   		<jsp:include page="fileBaseItems/Diagnosis.jsp"/>
						 </div>
                          <h3>Current LabTest</h3>
						 <div>
						   		<jsp:include page="CurrentLabTestAndResult.jsp"/>
                         </div>
                          <h3>Current procedure</h3>
						 <div>
						   		<jsp:include page="fileBaseItems/CurrentOperationAndResult.jsp"/>
                         </div>


					  </div>
				  </div>
				  <h3>Order</h3>
				  <div id="orderAccordion">
				  	<h3>Lab Test</h3>
					<div>
                        <jsp:include page="fileBaseItems/LabTestOrder.jsp"/>
                        <%--<div>--%>
                            <%--<select id="p-allLabTest"  style="direction:ltr; width: 100%; height:100% " multiple="multiple">--%>
                            <%--</select>--%>
                        <%--</div>--%>
                        <%--<div>--%>
                            <%--<base:optiion widthValue="70" absulotePath="clinic/customize/userLabTest/combo/loadSelectedLabTestGet" name="labTestOrders_customized" key="" noneSelectedText="select lab test">--%>
                            <%--</base:optiion>--%>
                        <%--</div>--%>
                        <%--<div>--%>
                            <%--<base:optiion widthValue="70" absulotePath="clinic/customize/userLabTestGroup/combo/loadSelectedLabTestGet" name="labTestOrders_customized2" key="" noneSelectedText="select group lab test">--%>
                            <%--</base:optiion>--%>
                        <%--</div>--%>



				  	</div>
                    <h3>Drug</h3>
                    <div data-role="controlgroup" data-type="vertical">
                       <jsp:include page="fileBaseItems/Drug.jsp"/>
                    </div>
				  	<h3>Procedure</h3>
				  	<div>
                          <jsp:include page="fileBaseItems/OperationOrder.jsp"/>
				    </div>
				  </div>
				  <h3>Result</h3>
				  <div id="resultAccordion">
				  	<h3>Lab Test</h3>
					<div>
					<%--<div id="labTestResultPopupId" width="100%" height="450px" align="middle">--%>
						<%--<iframe id="labTestResultPopupId" src="${pageContext.request.contextPath}/clinic/patient/visitMobileBase/popup/${visitQueueId}" width="100%" height="450px" align="middle">--%>
						<iframe id="labTestResultPopupId" src="${pageContext.request.contextPath}/clinic/patient/visitMobileBase/popup/${patientId}" width="100%" height="450px" align="middle">

						</iframe>
				  	</div>
                      <h3>Procedure Description</h3>
                      <div id="operationAccordion">
                          <jsp:include page="fileBaseItems/OperationDecription.jsp"/>
                      </div>
				  	<%--<h3>Imaging Result</h3>--%>
				  	<%--<div>--%>
						<%--<iframe id="labTestResultPopupId2" src="${pageContext.request.contextPath}/clinic/patient/visitMobileBase/imagingResult/${patientId}" width="100%" height="450px" align="middle">--%>

						<%--</iframe>--%>
					<%--</div>--%>
				  </div>
				  <%--<h3>Questionnaire</h3>--%>
				  <%--<div>--%>
						<%--<jsp:include page="fileBaseItems/Questionnaire.jsp"/>--%>

				  <%--</div>--%>
				</div>
			</div>
		</td>
	</tr>
 </table>
 <jsp:include page="fileBaseItems/ScanPatientFile.jsp"/>
<jsp:include page="fileBaseItems/PatientFile.jsp"/>
<jsp:include page="fileBaseItems/LabTestReport.jsp"/>
</body>

  <script>
      <%--$.get('${pageContext.request.contextPath}/clinic/patient/visitMobileBase/popup/${patientId}', function(data) {--%>
//          $('#labTestResultPopupId').html(data);
//      });
      /*var mapToArray={};
      $("#labTestOrders_customized2").on("multiselectclick", function(event, ui) {

          isChecked=ui.checked;
          value=ui.value;
          var array;

          array=$("#p-allLabTest").select2('val');
          var arrayLength=array.length;
          console.log(array);
          if(isChecked==false && value in mapToArray){
               delete mapToArray[value];
          }


          $.getJSON("<c:url value='/' />" + "clinic/customize/userLabTestGroup/loadLabTestGroupItem/"+ui.value , function(data,ui) {

//              for(var i=0;i<data.length;i++){
//                  $("#labTestOrders_customized").multiselect("widget").find(":checkbox[value='"+data[i]+"']").attr("checked","checked");
//                  $("#labTestOrders_customized option[value='" + data[i] + "']").attr("selected", 1);
//                  $("#labTestOrders_customized").multiselect("refresh");
//              }
              if(isChecked==true){
                  mapToArray[value]=data;
              }

              for(var i=0;i<data.length;i++){

                  $("#labTestOrders_customized").multiselect("widget").find(":checkbox").each(function(){
                      if(this.value==data[i]){
                          if(isChecked==true || this.checked==true){
                              isFound=false;
                              for(var key in mapToArray){
                                  if(key==value){
                                      continue;
                                  }
                                  ar=mapToArray[key];
                                  for(var j=0;j<ar.length;j++){
                                      if(ar[j]==data[i]){
                                          isFound=true;
                                          break;
                                      }
                                  }
                                  if(isFound==true){
                                      break;

                                  }

                              }
                              if(isFound==false){
                                  this.click();
                              }

                          }
                      }
                  });

                  if(isChecked==true){
                      array[arrayLength+i]=data[i];
                  }else{
                      isFound=false;
                      for(var key in mapToArray){
                          if(key==value){
                              continue;
                          }
                          ar=mapToArray[key];
                          for(var j=0;j<ar.length;j++){
                               if(ar[j]==data[i]){
                                   isFound=true;
                                   break;
                               }
                          }
                          if(isFound==true){
                              break;

                          }

                      }
                      if(isFound==false){
                          index=array.indexOf(data[i]);
                          if(index>-1){
                              array.splice(index, 1);
                          }
                      }
                  }

              }

              $("#p-allLabTest").select2('val',array);

          });
      });*/

      $("#p-chiefComplaint").val("${chiefComplaint}");
      $("#p-physicalExamination").val("${physicalExam}");

  	var cuVisitId="${visitId}";
  		(function(a){a.extend(a.fn,{bindLast:function(f,g){return this.each(function(){var e=1E6,c=f.split(".")[0];a(this).bind(f,g);var b=a(this).data("events"),d=false,h={};a.each(b[c],function(i,j){if(j===g)d=i;h[i]=1});if(d!==false){for(;h[e]==1;)e++;b[c][e]=b[c][d];delete b[c][d];a(this).data("events",b)}})}})})(jQuery);
  	    var icons = {
	      header: "ui-icon-circle-arrow-e",
	      activeHeader: "ui-icon-circle-arrow-s"
    	};
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
	    $( "#historyAccordion" ).accordion({
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




    $("#PatientCardVisitView").click(backBtnClick);
	$("#fileMobileView-save_btn").click(saveForm);
	$("#fileMobileView-save_close_btn").click(saveCloseForm);

	function backBtnClick(){
		 <%--window.location.href ="${pageContext.request.contextPath}/" +'clinic/dashboard/viditInfo/';--%>

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
                window.location.href ='<%= request.getHeader("referer")%>';;
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
	}

		  $( "#lst1" ).click(function() {

			 // $("#p-card-view-page").dialog({modal : true ,  position: "center"});
			 var window1;
						childWindow=open("popupTree",null,"resizable=no,width=370,height=610,modal=yes");
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
        <%
           if(!request.getAttribute("labTestIds").toString().equals("-1")){


           List<String> list = (List)request.getAttribute("labTestIds");
           if(list!=null){
           for(int count=0; count <list.size(); count++) {
        %>
        labTestList[<%= count %>] = '<%= list.get(count) %>';
        <% } %>
        <% } %>
        <% } %>

        i = 0, size = labTestList.length;
        for(i; i < size; i++){
            $("#labTestOrders_customized").multiselect("widget").find(":checkbox[value='"+labTestList[i]+"']").attr("checked","checked");
            $("#labTestOrders_customized option[value='" + labTestList[i] + "']").attr("selected", 1);
            $("#labTestOrders_customized").multiselect("refresh");
        }

    });*/

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
</style>


</html>