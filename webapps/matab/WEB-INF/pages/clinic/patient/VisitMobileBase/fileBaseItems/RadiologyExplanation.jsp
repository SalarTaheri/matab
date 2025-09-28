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

$("#radiologyExplanation-for-test-inner").css("max-height",$(window).height()-($(".body-header").height()*6)) ;

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
    $.getJSON("<c:url value='/' />" + "clinic/patient/visitMobileBase/loadByPatient/" + ${patientId} + "/" + filterType, function(data) {
    	var radiologyExplanationData = data.data;
    	if(radiologyExplanationData != undefined){
    		radiologyExplanationData = radiologyExplanationData.replace(/\patientFile/g, "radiologyExplanation");
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
        checkForBlink(visitId, isSonographyOnTop);
    });
}

function emptyradiologyExplanation(){
    $("#p-radiologyExplanationContainer").empty();
    $("#radiologyExplanation-for-test-inner").empty();
}

function checkForBlink(visitId, isSonographyOnTop){
	 if((visitId == null || visitId == "0") && (isSonographyOnTop == true)){//page in new mode
		 if($("#radiologyExplanation-for-test-inner").children().size() > 0){
			blink(true);
		 }
	 }
}

function blink(flag){
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
				 $("li[aria-controls='radiologyExplanation']").addClass("rightTabLiColor");
				 $("li[aria-controls='radiologyExplanation']").children().css("color", "white");
		    }
		 }, 700);
}

$("a[href='#radiologyExplanation']").click(function() {
	sonographyWasSeen = true;
});

</script>