<div class="toggler" id="chiefComplaintDiv" style="display:none; height:100%">
    	<h3 id="chiefComplaintHeader" class="ui-widget-header ui-corner-all">Chief Complaint</h3>
    	<button class="uk-button" type="button" id="chiefComplaintDivBackBtn">
    		Back&nbsp;
	    	<i class="uk-icon-mail-reply"></i>
    	</button>	
		<div class="uk-width-1-1" id="chiefComplaint-kanban-static" style=" height:100%">
			<textarea name="p-descript" id="p-descript" style="width:100% !important; height:400px; direction: ltr; text-align: left"  >&nbsp;</textarea>
    	</div>
</div>	
<script type="text/javascript">

$( "#chiefComplaintDivBackBtn" ).click(function() {
	saveFormActual(-1);
    var fromDiv="chiefComplaintDiv";
    var toDiv="p-kanban-view-page";
    runEffect(fromDiv,toDiv);
    return false;
});

$( "#chiefComplaintHeader" ).click(function() {
      var fromDiv="chiefComplaintDiv";
      var toDiv="p-kanban-view-page";
      runEffect(fromDiv,toDiv);
      return false;
});

$(function(){    
    initChiefComplaintAutocomplate();
});
    
function initChiefComplaintAutocomplate(){
	$("#p-descript").textcomplete([{
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
