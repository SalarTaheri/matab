
<%@page import="com.artonis.clinic.patientr.model.Patientr"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@page import="com.artonis.clinic.patientr.view.PatientView"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<script src="<c:url value='/resources/doT.js' />"></script>
<script src="<c:url value='/resources/clinic/clinic.js' />"></script>
<link href="<c:url value='/resources/clinic/clinic.css'/>" rel="stylesheet" />
<script src="<c:url value='/resources/jquery-textcomplete/jquery.textcomplete.js' />"></script>
<link href="<c:url value='/resources/jquery-textcomplete/jquery.textcomplete.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/jquery-textcomplete/bootstrap.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/jquery-textcomplete/main.css'/>" rel="stylesheet" />
<script src="<c:url value='/resources/js/jquery-ui.js' />"></script>

<%
	String patientId=(String)request.getAttribute("patientId");
	String patientrName=(String)request.getAttribute("patientrName");
	String patientrFam=(String)request.getAttribute("patientrFam");
	String patientrFileNumber=(String)request.getAttribute("patientrFileNumber");
	PatientView patientr=(PatientView)request.getAttribute("patientrOBJ");
	
 %>
<table  height="100%" width="100%">
	<tr height="100%">
		<td height="100%" width="20%" valign="top">
			<table height="80%">
				<tr height="16%">
					<td>
						<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.firstName") %>
					</td>
					<td>
						: <%=patientrName %>
					</td>
				</tr>
				<tr height="16%">
					<td>
						<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.lastName") %>
					</td>
					<td>
						: <%=patientrFam %>						
					</td>
				</tr>
				<tr height="16%">
					<td>
						<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.fileNumber") %>
					</td>
					<td>
						: <%=patientrFileNumber%>						
					</td>
				</tr>
				<tr height="16%">
					<td>
						<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.age") %>
					</td>
					<td>
						: <%=patientr.getAge()%>						
					</td>
				</tr>
				<tr height="16%">
					<td>
						<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.livesIn.city") %>
					</td>
					<td>
						: <%=patientr.getCityName()%>						
					</td>
				</tr>
				<tr height="16%">
					<td>
						<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.birthplace.city") %>
					</td>
					<td>
						: <%=patientr.getBirthplaceCityName()%>						
					</td>
				</tr>

				
			</table>
<%--			<div height="100%">--%>
<%--						<base:testBox disabled="true"  name="firstname" key="clinic.patient.firstName"/>--%>
<%--						<base:testBox disabled="true"  name="lastname" key="clinic.patient.lastName"/>--%>
<%--						<base:testBox disabled="true"  name="filenumber" key="clinic.patient.fileNumber"/>--%>
<%--			</div>--%>
		</td>
		<td height="100%" width="80%">
			<div class="body-header">
				<div id="header-toolbar">
					<button class="uk-button uk-button-success" id="fileMobileView-save_btn"
						type="button">Save
					</button>
					<button class="uk-button uk-button-success" id="PatientCardVisitView"
						type="button">Back
					</button>
				</div>
			</div>
			<iframe id="mainF" src="${pageContext.request.contextPath}/clinic/patient/visitMobileBase/${patientId}" width="100%" height="100%" align="middle">

			</iframe>

		</td>
	</tr>
</table>

<script>
	$("#firstname").val("${patientrName}");
	$("#lastname").val("${patientrFam}");
	$("#filenumber").val("${patientrFileNumber}");
	$("#p-btn-save").click(saveForm);
  	$("#PatientCardVisitView").click(backBtnClick);
	$("#fileMobileView-save_btn").click(saveForm111);
	
	function saveForm111(){
  			saveFormActual_1(0);
  	}
	
	function saveFormActual_1(visitId){
     
		var data = {};
		console.log("---------------");	
		var mainFramForSave=$("#mainF").contents();
		console.log(mainFramForSave.find("#tageForGetListTag").val().replace(/@/g,''));	
		var drugCheclBoxListIds=mainFramForSave.find("#tageForGetListTag").val().replace(/@/g,'');
		
		data.visitId = visitId;//
		data.patientId = ${patientId};//
		data.descript = mainFramForSave.find("#p-descript").val();//
		data.diagnosis = mainFramForSave.find("#p-diagnosisMultiSelect").val();//
		data.drugs =mainFramForSave.find("#p-drugMultiSelect").val();//
		data.drugCheclBoxList =drugCheclBoxListIds;//
		data.drugsHistory =mainFramForSave.find("#p-drugHistoryMultiSelect").val();//
		data.labTestOrders=mainFramForSave.find("#filter-menu").val()//
		data.habitalHistory=mainFramForSave.find("#p-habitalHistoryMultiSelect").val()
		
		data.physicalExam =mainFramForSave.find("#p-physicalExamination").val();//
		data.medicalHistory =mainFramForSave.find("#p-pastMedicalHistoryMultiSelect").val();//
		Common.postJSON("${pageContext.request.contextPath}"+"/clinic/patient/visitCardBase/saveChiefComplaint/" , JSON.stringify(data), function(){   
		//updateVisitCount();
			//loadVisit(parseInt($("#p-visit-current").text())); 
		 });	
	}
	function backBtnClick(){
		 window.location.href ="${pageContext.request.contextPath}/" +'clinic/dashboard/viditInfo/';
   	}
   function saveForm(){
			saveFormActual(0);
   }
  
    $( "#p-complaint" ).click(function() {
      var fromDiv="p-kanban-view-page";
      var toDiv="chiefComplaintDiv";
      	
      runEffect(fromDiv,toDiv);
      return false;
    });

    $( "#p-physicalExam" ).click(function() {
      var fromDiv="p-kanban-view-page";
      var toDiv="physicalExaminationDiv";
      	
      runEffect(fromDiv,toDiv);
      return false;
    });

    $( "#p-diagnosis-card" ).click(function() {
      var fromDiv="p-kanban-view-page";
      var toDiv="diagnosisDiv";
      	
      runEffect(fromDiv,toDiv);
      return false;
    });
    
    
    $( "#p-pastMedical" ).click(function() {
      var fromDiv="p-kanban-view-page";
      var toDiv="pastMedicalHistoryDiv";
      	
      runEffect(fromDiv,toDiv);
      return false;
    });
    
    
    $( "#p-drugHistory" ).click(function() {
      var fromDiv="p-kanban-view-page";
      var toDiv="drugHistoryDiv";
      	
      runEffect(fromDiv,toDiv);
      return false;
    });
    
    function runEffect(fDive,tDiv) {
      var selectedEffect ="blind";
      var options = {};
      $( "#"+ fDive).hide( selectedEffect, options, 400, callBack(tDiv) );
    }
    
    function callBack(tDiv) {
      $( "#"+tDiv ).effect( "shake", {}, 400,null );
    }
  
  function saveFormActual(visitId){
	var data = {};
	var mainFramForSave=$("#mainF").contents();
	var drugCheclBoxListIds=mainFramForSave.find("#tageForGetListTag").val().replace(/@/g,'');
	
	console.log(mainFramForSave.find("#tageForGetListTag").val());
	console.log(" abbas --> "+mainFramForSave.find("#filter-menu").val());

	
	data.visitId = visitId;//
	data.patientId = ${patientId};//
	data.descript = mainFramForSave.find("#p-descript").val();//
	data.diagnosis = mainFramForSave.find("#p-diagnosisMultiSelect").val();//
	data.drugs =mainFramForSave.find("#p-drugMultiSelect").val();//
	data.drugCheclBoxList =drugCheclBoxListIds;//
	data.drugsHistory =mainFramForSave.find("#p-drugHistoryMultiSelect").val();//
	data.labTestOrders=mainFramForSave.find("#filter-menu").val()//
	data.habitalHistory=mainFramForSave.find("#p-habitalHistoryMultiSelect").val()
	
	
	data.physicalExam =mainFramForSave.find("#p-physicalExamination").val();//
	data.medicalHistory =mainFramForSave.find("#p-pastMedicalHistoryMultiSelect").val();//
	//data.lebTestForSave=lebTestForSave.value;
	Common.postJSON("${pageContext.request.contextPath}"+"/clinic/patient/visitCardBase/saveChiefComplaint/" , JSON.stringify(data), function(){
		//updateVisitCount();
		//loadVisit(parseInt($("#p-visit-current").text())); 
    });	
}
  
  
  </script>

