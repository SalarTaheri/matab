var Common = new function () {
	this.postJSON = function(url, data, success){
		jQuery.ajax ({
		    url: url,
		    type: "POST",
		    data: data,
		    dataType: "json",
		    contentType: "application/json; charset=utf-8",
		    success: function(result){
		        if(typeof(success) == "function"){
		        	handleResult(result);
		        	success(result);
		        }else
		        	handleResult(result);
		    }
		});
	};
	
	var handleResult = function(result){
		if(result.state == "error"){
        	for(var i=0; i<result.errors.length; i++){
        		alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
        	}
        }
        if(result.state == "success"){
    		alertify.success(result.message);
        }		
	};
	
};

