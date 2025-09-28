<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resources/js/select2-3.4.5/select2.css' />" type="text/css"></link>
<script type="text/javascript" src="<c:url value='/resources/js/select2-3.4.5/select2.js' />"></script>

<div class="toggler" id="diagnosisDiv" style="display:none; height:100%">
    	<h3 id="diagnosisHeader" class="ui-widget-header ui-corner-all" dir="ltr" align="left">Diagnosis</h3>
    	<button class="uk-button" type="button" id="diagnosisDivBackBtn">
    		Back&nbsp;
    		<i class="uk-icon-mail-reply"></i>
    	</button>
    	<div class="uk-width-1-1" id="diagnosis-kanban-static" style=" height:100%">	
			<select id="p-diagnosisMultiSelect" style="direction:ltr; width: 100%" multiple="multiple">
 			</select>
    	</div>
</div>	

<script type="text/javascript">

$( "#diagnosisDivBackBtn" ).click(function() {
	saveFormActual(-1);
    var fromDiv="diagnosisDiv";
    var toDiv="p-kanban-view-page";
    runEffect(fromDiv,toDiv);
    return false;
});

$( "#diagnosisHeader" ).click(function() {
      var fromDiv="diagnosisDiv";
      var toDiv="p-kanban-view-page";
      runEffect(fromDiv,toDiv);
      return false;
});

$(document).ready(function() { $("#p-diagnosisMultiSelect").select2({
    allowClear: true
	});  
});

$.getJSON("<c:url value='/' />" + "clinic/basicInfo/diagnosis/combo/loadAllDiagnosisGet" , function(data) {
		for ( var i = 0; i < data.length; i++) {
			$("#p-diagnosisMultiSelect").append(
					"<option style='direction:ltr' value='" + data[i].ComboID + "' >" + data[i].ComboCaption + "</option>")
		}
});


</script>
