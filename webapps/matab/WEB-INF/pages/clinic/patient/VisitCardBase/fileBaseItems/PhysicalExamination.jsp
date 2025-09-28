<div class="toggler" id="physicalExaminationDiv" style="display:none; height:100%">
    	<h3 id="physicalExaminationHeader" class="ui-widget-header ui-corner-all">Physical Examination</h3>
    	<button class="uk-button" type="button" id="physicalExaminationDivBackBtn">
    		Back&nbsp;
    		<i class="uk-icon-mail-reply"></i>
    	</button>
		<div class="uk-width-1-1" id="physicalExaminationDiv-kanban-static" style=" height:100%">
			<textarea name="p-physicalExamination" id="p-physicalExamination" style="width:100% !important; height:400px; direction: ltr; text-align: left"  >&nbsp;</textarea>
    	</div>
</div>	
<script type="text/javascript">

$("#physicalExaminationDivBackBtn" ).click(function() {
	saveFormActual(-1);
    var fromDiv="physicalExaminationDiv";
    var toDiv="p-kanban-view-page";
    runEffect(fromDiv,toDiv);
    return false;
});

$( "#physicalExaminationHeader" ).click(function() {
      var fromDiv="physicalExaminationDiv";
      var toDiv="p-kanban-view-page";
      runEffect(fromDiv,toDiv);
      return false;
});

$(function(){    
    initPhysicalExaminationAutocomplate();
});
    
function initPhysicalExaminationAutocomplate(){
	$("#p-physicalExamination").textcomplete([{
			match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
			search: function (term, callback) {
				Common.postJSON("${pageContext.request.contextPath}"+"/clinic/patient/visitCardBase/autocomplete/" , JSON.stringify({token: term}), function(data){
					var tokens = [];
				    for(var i = 0; i< data.length; i++)
				    	tokens.push(data[i].token);
				    callback(tokens);
			    });
			},
			replace: function (word) {
				return '$1' + word + ' ';
			}			
	}]);
}
    
</script>
