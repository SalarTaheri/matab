<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="sonographyPdf-table" style="width: 70%" class="ui-dialog-content ui-widget-content" scrolltop="0" scrollleft="0">
	<table border="3" style="border: 1px solid black; width:100%; height: 100%;" >
		<tr id="sonographyPdf-tableRow"></tr>
	</table>
</div>

<script type="text/javascript" charset="utf-8">

var sonographyPdfWasSeen = false;
 $(document).ready(function () {
    	
    	$.getJSON("<c:url value='/' />" + "clinic/patient/configurablePatientRecord/loadSonographyPdfAddress/" + ${patientId} , function(result) {
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
	               $("#sonographyPdf-tableRow").append(tdTag);
	               
	               //
	               activeGreenShinysonographyPdf();
    		   }
            //
            var visitId = "${visitId}";
    	 	var hasNewsonographyPdf = result.hasNewSonography;
            checkForBlinksonographyPdf(visitId, hasNewsonographyPdf);
        });
        
        var wWidth = $(window).width();
        var dWidth = wWidth * 0.6;
        var wHeight = $(window).height();
        var dHeight = wHeight * 0.8;
        $("#sonographyPdf-table").dialog({
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
            position: { my: "center", at: "center", of: window }
        });

    $( "#sonographyPdf-id" ).click(function() {
      $( "#sonographyPdf" ).dialog( "open" );
    });
    $( "#sonographyPdf-id-txt" ).click(function() {
      $( "#sonographyPdf" ).dialog( "open" );
    });


	
	jQuery('body').bind('click',
			function(e) {
				if (jQuery('#sonographyPdf-table').dialog('isOpen')
						&& !jQuery(e.target).is('.ui-dialog, a')
						&& !jQuery(e.target).closest('.ui-dialog').length
						&& event.target.nodeName != "H2") {
					jQuery('#sonographyPdf-table').dialog('close');
				}
			});
});
    
function checkForBlinksonographyPdf(visitId, hasNewsonographyPdf){
	 if((visitId == null || visitId == "0") && (hasNewsonographyPdf == true)){//page in new mode
		 if($("#sonographyPdf-tableRow").children().size() > 0){
			blinksonographyPdf(true);
		 }
	 }
}

function blinksonographyPdf(flag){
	disableGreenShinysonographyPdf();
	setTimeout(function() {
		   if(flag){
				 $("li[aria-controls='Sonography']").removeClass("rightTabLiColor");
				 $("li[aria-controls='Sonography']").children().css("color", "black");
			}else{
				 $("li[aria-controls='Sonography']").addClass("rightTabLiColor");
				 $("li[aria-controls='Sonography']").children().css("color", "white");
			}
		    if (!sonographyPdfWasSeen) {
		       blinksonographyPdf(!flag);
		    }else{
                activeGreenShinysonographyPdf();
		    }
		 }, 700);
}

$("a[href='#Sonography']").click(function() {
	sonographyPdfWasSeen = true;
});

function activeGreenShinysonographyPdf() {
	 $("li[aria-controls='Sonography']").addClass("greenShine");
}
function disableGreenShinysonographyPdf() {
	 $("li[aria-controls='Sonography']").removeClass("greenShine");
}
</script>

<style>
.greenShine{
    background: -webkit-gradient(linear,left top,left bottom,color-stop(0%,rgb(15, 66, 8)),color-stop(70%,#4CAF50),color-stop(80%,#8BC34A),color-stop(100%,#CDDC39))!important;
}
</style>