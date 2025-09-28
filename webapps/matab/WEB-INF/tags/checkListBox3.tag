<%@tag import="java.util.ResourceBundle" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="key" required="true" rtexprvalue="true" %>
<%@ attribute name="chkControllerPath" required="true" rtexprvalue="true" %>
<jsp:doBody/>
					<div id="${name}_chk_div" style="background: yellow;">
					</div>
<script>
	 $(document).ready(function () {
	 	var x=getBaseUrl();
	 		$.ajax({
	            url: x+"${chkControllerPath}/2/1",
    	        type:"GET",
        	    dataType:"json",
            	contentType:"application/json; charset=utf-8",
	            success: function (data) {
					var div=document.getElementById('${name}_chk_div');
					for ( var j =0; j<data.length;j++) {
							 var chk=document.createElement('input');
							 chk.type="checkbox";
							 chk.name="${name}";
							 chk.value=data[j].modelID;
							 chk.id='id_'+data[j].modelID;
							 chk.checked=data[j].checked;
							 var label = document.createElement('label');
							 label.htmlFor = 'id_'+data[j].modelID;
							 label.appendChild(document.createTextNode(data[j].modelCaption));
							 var br1=document.createElement('br');
							 div.appendChild(br1);
							 div.appendChild(chk);
							 div.appendChild(label); 
                	}
	            },error:function(result){
    	            if(result.status==401){
        	            top.location.href=top.location.href;
            	    }
            	}
        	});
		});
			
	
</script>