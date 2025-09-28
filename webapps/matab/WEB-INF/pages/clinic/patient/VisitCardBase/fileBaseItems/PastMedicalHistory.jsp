<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resources/js/select2-3.4.5/select2.css' />" type="text/css"></link>
<script type="text/javascript" src="<c:url value='/resources/js/select2-3.4.5/select2.js' />"></script>

<div class="toggler" id="pastMedicalHistoryDiv" style="display:none; height:100%">
    	<h3 id="pastMedicalHistoryHeader" class="ui-widget-header ui-corner-all" dir="ltr" align="left">Past Medical History</h3>
    	<button class="uk-button" type="button" id="pastMedicalHistoryDivBackBtn">
    		Back&nbsp;
    		<i class="uk-icon-mail-reply"></i>
    	</button>
    	<div class="uk-width-1-1" id="pastMedicalHistory-kanban-static" style=" height:100%">	
			<select id="p-pastMedicalHistoryMultiSelect" style="direction:ltr; width: 100%" multiple="multiple">
 			</select>
    	</div>
</div>	

<script type="text/javascript">

$( "#pastMedicalHistoryDivBackBtn" ).click(function() {
	saveFormActual(-1);
    var fromDiv="pastMedicalHistoryDiv";
    var toDiv="p-kanban-view-page";
    runEffect(fromDiv,toDiv);
    return false;
});

$( "#pastMedicalHistoryHeader" ).click(function() {
      var fromDiv="pastMedicalHistoryDiv";
      var toDiv="p-kanban-view-page";
      runEffect(fromDiv,toDiv);
      return false;
});

$(document).ready(function() { $("#p-pastMedicalHistoryMultiSelect").select2({
    allowClear: true
	});  
});

$.getJSON("<c:url value='/' />" + "clinic/basicInfo/diagnosis/combo/loadAllDiagnosisGet" , function(data) {
		for ( var i = 0; i < data.length; i++) {
			$("#p-pastMedicalHistoryMultiSelect").append(
					"<option style='direction:ltr' value='" + data[i].ComboID + "' >" + data[i].ComboCaption + "</option>")
		}
});
	
</script>
