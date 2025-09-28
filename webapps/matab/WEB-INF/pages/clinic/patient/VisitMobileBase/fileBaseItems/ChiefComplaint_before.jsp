<div class="uk-width-1-1" id="chiefComplaint-kanban-static" style="z-index:-1; height:100%">
		<textarea rows="5" name="p-chiefComplaint" id="p-chiefComplaint" style="overflow-y: auto;overflow-x:auto; width: 100%; width:100% !important; height:100%; direction: ltr; text-align: left"  >&nbsp;</textarea>
    </div>

<script type="text/javascript">
$(function(){    
    initChiefComplaintAutocomplate();
});
    
function initChiefComplaintAutocomplate(){
	$("#p-chiefComplaint").textcomplete([{
			match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
			search: function (term, callback) {
				Common.postJSON("${pageContext.request.contextPath}"+"/clinic/patient/visitMobileBase/chiefComplaintAutoComplete/" , JSON.stringify({token: term}), function(data){
					var tokens = [];
                    tokens.push(term);
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