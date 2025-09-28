<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resources/js/select2-3.4.5/select2.css' />" type="text/css"></link>
<script type="text/javascript" src="<c:url value='/resources/js/select2-3.4.5/select2.js' />"></script>

<div class="toggler" id="drugHistoryDiv" style="display:none; height:100%">
    	<h3 id="drugHistoryHeader" class="ui-widget-header ui-corner-all" dir="ltr" align="left">Drug History</h3>
    	<button class="uk-button" type="button" id="drugHistoryDivBackBtn">
    		Back&nbsp;
    		<i class="uk-icon-mail-reply"></i>
    	</button>
    	<div class="uk-width-1-1" id="drugHistory-kanban-static" style=" height:100%">	
			<select id="p-drugHistoryMultiSelect" style="direction:ltr; width: 100%" multiple="multiple">
 			</select>
    	</div>
</div>	

<script type="text/javascript">

$( "#drugHistoryDivBackBtn" ).click(function() {
	saveFormActual(-1);
    var fromDiv="drugHistoryDiv";
    var toDiv="p-kanban-view-page";
    runEffect(fromDiv,toDiv);
    return false;
});

$( "#drugHistoryHeader" ).click(function() {
      var fromDiv="drugHistoryDiv";
      var toDiv="p-kanban-view-page";
      runEffect(fromDiv,toDiv);
      return false;
});

$(document).ready(function() { $("#p-drugHistoryMultiSelect").select2({
    allowClear: true
	});  
});

$.getJSON("<c:url value='/' />" + "clinic/drug/drug/combo/loadDrugGet" , function(data) {
		for ( var i = 0; i < data.length; i++) {
			$("#p-drugHistoryMultiSelect").append(
					"<option style='direction:ltr' value='" + data[i].ComboID + "' >" + data[i].ComboCaption + "</option>")
		}
});


</script>
