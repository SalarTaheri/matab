<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.artonis.clinic.patient.model.PatientConstValue.PatientFileFilterTypeEnum"%>

<%
	boolean showRadiologyExplanationSeparately = (Boolean) request.getAttribute("showRadiologyExplanationSeparately");
	String patientId = (String) request.getAttribute("patientId");
%>

<div id="radiologyExplanation-for-test" dir="ltr">
	<div id="radiologyExplanation-for-test-inner" style="overflow: auto; border: 1px solid gray;">
	</div>
</div>
<div id="p-radiologyExplanation" dir="ltr">
	<br>
	<div id="p-radiologyExplanationContainer"  style=" width:100%; height:100%">
	</div >
</div>

<div id="radiologyExplanation-table" style="width: 100%" class="ui-dialog-content ui-widget-content" scrolltop="0" scrollleft="0">
	<table border="3" style="border: 1px solid black; width:100%; height: 100%;" >
		<tr id="radiologyExplanation-tableRow" style=" font-size: 25px !important; font-weight: bold; "></tr>
	</table>
</div>

<script type="text/javascript" charset="utf-8">
var sonographyWasSeen = false;
$(document).ready(function () {
	 var showRadiologyExplanationSeparately = <%=showRadiologyExplanationSeparately%>;
	 if(showRadiologyExplanationSeparately){
		 fillRadiologyExplanation();
	 }else{
		 $("li[aria-controls='radiologyExplanation']").hide();
	 }
});

$("#radiologyExplanation-for-test-inner").css("max-height",$(window).height()-($(".body-header").height()*3)) ;

$(document).ready(function(){
	$( "#p-radiologyExplanation" ).dialog({
	     height:500,
	     width:1000,
	     autoOpen: false,
	     show: {
	       effect: "blind",
	       duration: 500
	     },
	     hide: {
	       effect: "slide",
	       duration: 500
	     }
	});
	var wWidth = $(window).width();
	var dWidth = wWidth * 0.8;
	var wHeight = $(window).height();
	var dHeight = wHeight * 0.9;

	$("#radiologyExplanation-table").dialog({
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
	jQuery('body').bind('click',
			function(e) {
				if (jQuery('#radiologyExplanation-table').dialog('isOpen')
						&& !jQuery(e.target).is('.ui-dialog, a')
						&& !jQuery(e.target).closest('.ui-dialog').length
						&& event.target.nodeName != "BUTTON") {
					jQuery('#radiologyExplanation-table').dialog('close');
				}
			});
});

$( "#p-radiologyExplanation-id-txt" ).click(function() {
    $("#p-radiologyExplanation").dialog("open");
});

jQuery('body').bind('click',function (e) {
		if (jQuery('#p-radiologyExplanation').dialog('isOpen') && !jQuery(e.target).is('.ui-dialog, a') 
				&& !jQuery(e.target).closest('.ui-dialog').length && event.target.nodeName!="H2") {
	                jQuery('#p-radiologyExplanation').dialog('close');
	    }
  	}
);

function fillRadiologyExplanation(){
   	var filterType = <%=PatientFileFilterTypeEnum.RADIOLOGY_EXPLANATION.getValue()%>;
    $.getJSON("<c:url value='/' />" + "clinic/patient/configurablePatientRecord/loadByPatient/" + ${patientId} + "/" + filterType, function(data) {
    	var radiologyExplanationData = data.data;
    	if(radiologyExplanationData != undefined && radiologyExplanationData.length>0){
    		radiologyExplanationData = radiologyExplanationData.replace(/\patientFile/g, "radiologyExplanation");
			activeGreenShinyRadiologyExplanation();
    	}
        $("#radiologyExplanation-for-test-inner").append(radiologyExplanationData);
        $("#radiologyExplanation-for-test-inner-1").append(radiologyExplanationData);
        $("#radiologyExplanation-for-test-inner-1").accordion({
            heightStyle: "content",
            collapsible: true
        });
        $("#radiologyExplanation-for-test-inner-1").accordion("refresh");
        $("#p-radiologyExplanationContainer").append(radiologyExplanationData);
        $("#p-radiologyExplanationContainer").accordion({
            heightStyle: "content",
            collapsible: true
        });
        $("#p-radiologyExplanationContainer").accordion("refresh");
        var headerArray=$('h3[id^="ui-accordion-radiologyExplanation-for-test-inner-header"]');
        for(var i=0;i<headerArray.length;i++){
            headerArray.eq(i).css("background","-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(255,244,180,1)), color-stop(100%,rgba(251,221,83,1)))");
            headerArray.eq(i).css("border","1px solid #d3d3d3");
            headerArray.eq(i).css("font-weight","normal");
            headerArray.eq(i).css("color","#555555");
        }
        var radiologyExplanationArray=$('div[id^="accordion-radiologyExplanation-"]');
        for(var j=0;j<radiologyExplanationArray.length;j++){
            $("#"+radiologyExplanationArray[j].id).accordion({
                heightStyle: "content",
                collapsible: true
            });
        }

        //
        var visitId = "${visitId}";
	 	var isSonographyOnTop = data.isSonographyOnTop;
	 	var hasPatientNewSonography = data.hasPatientNewSonography;
        checkForBlink(visitId, hasPatientNewSonography);
    });
}

function emptyradiologyExplanation(){
    $("#p-radiologyExplanationContainer").empty();
    $("#radiologyExplanation-for-test-inner").empty();
}

function checkForBlink(visitId, hasPatientNewSonography){
	 if((visitId == null || visitId == "0") && (hasPatientNewSonography == true)){//page in new mode
		 if($("#radiologyExplanation-for-test-inner").children().size() > 0){
			blink(true);
		 }
	 }
}

function blink(flag){
	disableGreenShinyradiologyExplanation();
	setTimeout(function() {
		   if(flag){
				 $("li[aria-controls='radiologyExplanation']").removeClass("rightTabLiColor");
				 $("li[aria-controls='radiologyExplanation']").children().css("color", "black");
			}else{
				 $("li[aria-controls='radiologyExplanation']").addClass("rightTabLiColor");
				 $("li[aria-controls='radiologyExplanation']").children().css("color", "white");
			}
		    if (!sonographyWasSeen) {
		       blink(!flag);              
		    }else{
//				 $("li[aria-controls='radiologyExplanation']").addClass("rightTabLiColor");
//				 $("li[aria-controls='radiologyExplanation']").children().css("color", "white");
                activeGreenShinyRadiologyExplanation();
		    }
		 }, 700);
}

function activeGreenShinyRadiologyExplanation() {
	$("li[aria-controls='radiologyExplanation']").addClass("greenShine");
}
function disableGreenShinyradiologyExplanation() {
	$("li[aria-controls='radiologyExplanation']").removeClass("greenShine");
}

$("a[href='#radiologyExplanation']").click(function() {
	sonographyWasSeen = true;
});

function zoom(param){
	$("#radiologyExplanation-tableRow").empty();
	$("#radiologyExplanation-tableRow").append(param);
	$("#radiologyExplanation-table").dialog("open");
}


</script>