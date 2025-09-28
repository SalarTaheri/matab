<%@tag import="java.util.ResourceBundle" %>
<%@tag import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="name" required="true" rtexprvalue="true" %>
<%@ attribute name="key" required="true" rtexprvalue="true" %>
<%@ attribute name="absulotePath" required="true" rtexprvalue="true" %>
<%@ attribute name="targetValues" required="true" rtexprvalue="true" %>
<%@ attribute name="targetLabel" required="true" rtexprvalue="true" %>
<%@ attribute name="caption" required="false" rtexprvalue="true" %>

<jsp:doBody/>
			<a href="#" data-rel="back" data-role="button" data-role="button" data-icon="delete" data-theme="b"  >${caption }</a>
			<ul id="${name}" data-role="listview"  style="overflow-y: auto; max-width:280px; max-height:300px" data-filter="true" data-theme="a"  data-filter-theme="b"> <!--  data-filter="true" -->
            </ul>			
            
<script>
			$.getJSON("<c:url value='/' />" + "${absulotePath}" , function(data) {
				var x='';
				for ( var i = 0; i < data.length; i++) {
				x+="<li id='li-checkbox-${name}-"+i+"'>"+
					" <input  type='checkbox' name='checkbox-${name}-"+i+"'"+
					"   	  id='checkbox-${name}-"+i+"' "+
					"   	  data-data-point-id='"+data[i].ComboID+"'>"+
	                data[i].ComboCaption+"</input>"+
	                "</li>";
				}
				//$("#${name}").append(x);
				//$("#${name}").listview("refresh");
				$("#${name}").append(x).promise().done(function () {
				        $(this).listview("refresh");        		
    			});
    			
  
				
			});
			$('#${name}').on('click', 'li', function() {
				var chkTag=document.getElementById($(this).attr('id').replace('li-',''));
  				chkTag.checked = !chkTag.checked;
  				updateTargetLable("#${name}", "#${targetLabel}", "#${targetValues}");
    		});
    		$('#${name}').on('click', 'input', function(e) {
				e.stopPropagation();
				updateTargetLable("#${name}", "#${targetLabel}", "#${targetValues}");
				
    		});
    		
			$("#btn-close-${name}").on("click", function (e) {
    			
    
			});
			
			function updateTargetLable(ul, targetLabel, targetValues){
				var selectedLabels = [];
				var selectedValues = [];
				$("input:checked", $(ul)).each(function(){
					selectedLabels.push($(this).parent().text() );
					selectedValues.push($(this).attr("data-data-point-id") );
				});
				$(targetLabel).text(selectedLabels.join(","));
				$(targetValues).val(selectedValues.join(","));
			}
			
			
</script>