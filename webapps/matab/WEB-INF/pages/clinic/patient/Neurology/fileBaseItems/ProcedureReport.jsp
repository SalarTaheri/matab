<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/lib/jquery.mousewheel-3.0.6.pack.js' />"></script>
<link rel="stylesheet" href="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/jquery.fancybox.css?v=2.1.5' />" type="text/css"/>
<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/jquery.fancybox.pack.js?v=2.1.5' />"></script>
<link rel="stylesheet" href="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-buttons.css?v=1.0.5' />" type="text/css"/>
<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-buttons.js?v=1.0.5' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-media.js?v=1.0.6' />"></script>
<link rel="stylesheet" href="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7' />" type="text/css"/>
<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7' />"></script>

<div id="procedureReport-table" style="width: 70%" class="ui-dialog-content ui-widget-content" scrolltop="0" scrollleft="0">
	<table border="3" style="border: 1px solid black; width:100%" >
		<tr id="procedureReport-tableRow"></tr>	
	</table>
</div>
<script type="text/javascript" charset="utf-8">
 $(document).ready(function () {
    	
    	$.getJSON("<c:url value='/' />" + "clinic/patient/neurology/loadProcedureReportAddress/" + ${patientId} , function(data) {
    		for(var i=0;i<=data.length;i++){
    			if(data[i]==null)
    				continue;
		
               var tdTag = document.createElement("td");

               var embedTag = document.createElement("embed");
               embedTag.src = data[i];
               embedTag.type= "application/pdf";
               
               var aTag = document.createElement("a");
               aTag.href = data[i];
               aTag.target= "_blank";
               
               var imgTag = document.createElement("img");
               imgTag.src = "<c:url value='/resources/images/green/zoom-in.png'/>";
               imgTag.width = "30";
               imgTag.height = "30";
               
               aTag.appendChild(imgTag);
               tdTag.appendChild(embedTag);
               tdTag.appendChild(aTag);
               $("#procedureReport-tableRow").append(tdTag);
    		}
        });
        
        var wWidth = $(window).width();
        var dWidth = wWidth * 0.8;
        $("#procedureReport-table").dialog({
            autoOpen:false,
            width:dWidth,
            show:{
                effect:"blind",
                duration:500
            },
            hide:{
                effect:"slide",
                duration:500
            },
            position: { my: "center", at: "center", of: window }
        });

    $( "#procedureReport-id" ).click(function() {
      $( "#procedureReport" ).dialog( "open" );
    });
    $( "#procedureReport-id-txt" ).click(function() {
      $( "#procedureReport" ).dialog( "open" );
    });

	$(".fancybox").fancybox({ openEffect : 'none' , closeEffect : 'none' });
});
    
jQuery('body').bind(
		'click',
		function(e) {
			if (jQuery('#procedureReport-table').dialog('isOpen')
					&& !jQuery(e.target).is('.ui-dialog, a')
					&& !jQuery(e.target).closest('.ui-dialog').length
					&& event.target.nodeName != "H2") {
				jQuery('#procedureReport-table').dialog('close');
			}
		});
</script>