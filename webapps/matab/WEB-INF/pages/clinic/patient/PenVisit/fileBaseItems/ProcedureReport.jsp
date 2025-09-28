<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="procedureReport-table" style="width: 70%" class="ui-dialog-content ui-widget-content" scrolltop="0" scrollleft="0">
	<table border="3" style="border: 1px solid black; width:100%; height: 100%;" >
		<tr id="procedureReport-tableRow"></tr>	
	</table>
</div>

<script type="text/javascript" charset="utf-8">

var procedureReportWasSeen = false;
 $(document).ready(function () {
    	
    	$.getJSON("<c:url value='/' />" + "clinic/patient/penVisit/loadProcedureReportAddress/" + ${patientId} , function(result) {
    		var data = result.address;
    		   if(data != ""){
	               var tdTag = document.createElement("td");
	
	               var embedTag = document.createElement("embed");
	               embedTag.src = data;
	               embedTag.type= "application/pdf";
	               embedTag.width = "95%";
	               embedTag.height = "95%";
	               
	               var aTag = document.createElement("a");
	               aTag.href = data;
	               aTag.target= "_blank";
	               
	               var imgTag = document.createElement("img");
	               imgTag.src = "<c:url value='/resources/images/green/zoom-in.png'/>";
	               imgTag.width = "30";
	               imgTag.height = "30";
	               
	               aTag.appendChild(imgTag);
	               tdTag.appendChild(embedTag);
	               tdTag.appendChild(aTag);
	               $("#procedureReport-tableRow").append(tdTag);
	               
	               //
	               activeGreenShinyProcedureReport();
    		   }
            //
            var visitId = "${visitId}";
    	 	var hasNewProcedureReport = result.hasNewProcedureReport;
            checkForBlinkProcedureReport(visitId, hasNewProcedureReport);
        });
        
        var wWidth = $(window).width();
        var dWidth = wWidth * 0.6;
        var wHeight = $(window).height();
        var dHeight = wHeight * 0.8;
        $("#procedureReport-table").dialog({
            autoOpen:false,
            width:dWidth,
            height:dHeight,
            show:{
                effect:"blind",
                duration:500
            },
            hide:{
                effect:"slide",
                duration:500
            },
            position: { my: "center", at: "center", of: window },
			open: function(){
				$(".greenShine a").css("color","black");
			},
			close: function(e){
				$("#right-tabs").tabs("option", "active", 0);
				$(".greenShine a").css("color","white");
			}
        });

    $( "#procedureReport-id" ).click(function() {
      $( "#procedureReport" ).dialog( "open" );
    });
    $( "#procedureReport-id-txt" ).click(function() {
      $( "#procedureReport" ).dialog( "open" );
    });

	jQuery('body').bind('click',
			function(e) {
				if (jQuery('#procedureReport-table').dialog('isOpen')
						&& !jQuery(e.target).is('.ui-dialog, a')
						&& !jQuery(e.target).closest('.ui-dialog').length
						&& event.target.nodeName != "H2") {
					jQuery('#procedureReport-table').dialog('close');
				}
			});
});
    
function checkForBlinkProcedureReport(visitId, hasNewProcedureReport){
	 if((visitId == null || visitId == "0") && (hasNewProcedureReport == true)){//page in new mode
		 if($("#procedureReport-tableRow").children().size() > 0){
			blinkProcedureReport(true);
		 }
	 }
}

function blinkProcedureReport(flag){
	disableGreenShinyProcedureReport();
	setTimeout(function() {
		   if(flag){
			   $("li[aria-controls='procedureReport']").addClass("fieryTab");
			   $("li[aria-controls='procedureReport']").children().css("color", "white");
			}else{
			   $("li[aria-controls='procedureReport']").removeClass("fieryTab");
			   $("li[aria-controls='procedureReport']").children().css("color", "black");
			}
		    if (!procedureReportWasSeen) {
		       blinkProcedureReport(!flag);
		    }else{
				 $("li[aria-controls='procedureReport']").addClass("fieryTab");
				 $("li[aria-controls='procedureReport']").children().css("color", "white");
		    }
		 }, 700);
}

$("a[href='#procedureReport']").click(function() {
	procedureReportWasSeen = true;
});

function activeGreenShinyProcedureReport() {
	$("li[aria-controls='procedureReport']").addClass("greenShine");
	$(".greenShine a").css("color","white");
}
function disableGreenShinyProcedureReport() {
	$("li[aria-controls='procedureReport']").removeClass("greenShine");
	$(".greenShine a").css("color","black");
}
</script>

<style>
.greenShine{
    /*background: -webkit-gradient(linear,left top,left bottom,color-stop(0%,rgb(15, 66, 8)),color-stop(70%,#4CAF50),color-stop(80%,#8BC34A),color-stop(100%,#CDDC39))!important;*/
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(rgb(255, 244, 180)), to(rgb(251, 122, 83))) !important;
}
.fieryTab{
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(rgb(255, 244, 180)), to(rgb(251, 122, 83))) !important;
}
</style>