<%@page import="com.artonis.clinic.patient.model.PatientConstValue.PatientFileFilterTypeEnum"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resources/js/select2-3.4.5/select2.css' />" type="text/css"></link>
<script type="text/javascript" src="<c:url value='/resources/js/select2-3.4.5/select2.js' />"></script>

		<div id="p-patientFile" dir="ltr">
			<br>
			<%--<div id="p-patientFileContainer"  style="overflow-y: auto; max-width:100%; max-height:400px">--%>
			<div id="p-patientFileContainer"  style=" width:100%; height:100%">
				<%--<ul id="p-patientFileContainer">--%>
				<%--</ul>--%>
			</div >
		</div> 
<script type="text/javascript">

	$( "#p-patientFile" ).dialog({
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

//    $( "#p-patientFile-id" ).click(function() {
//      $( "#p-patientFile" ).dialog( "open" );
//    });
    $( "#p-patientFile-id-txt" ).click(function() {
        $("#p-patientFile").dialog("open");
    });

    jQuery('body')
            .bind(
            'click',
            function (e) {
                if (
                        jQuery('#p-patientFile').dialog('isOpen')
                                && !jQuery(e.target).is('.ui-dialog, a')
                                && !jQuery(e.target).closest('.ui-dialog').length
                                && event.target.nodeName!="H2"
                        ) {
                    jQuery('#p-patientFile').dialog('close');
                }
            }
    );



//    $("#p-patientFile-id").accordion({
//        collapsible: true
//    });
//    $("#p-patientFile").accordion({
//        collapsible: true
//    });
$("#p-patientFile-id").on("click", function (e) {

});
	<%--$.getJSON("<c:url value='/' />" + "clinic/patient/visitMobileBase/loadByPatient/" + ${patientId} , function(data) {--%>
		<%--$("#p-patientFileContainer").append(data.data);--%>
        <%--$("#p-patientFileContainer").accordion({--%>
            <%--heightStyle: "content",--%>
            <%--collapsible: true--%>
<%--//            header: "h3"--%>
        <%--});--%>
	<%--});--%>
    loadPatientFile();
    function loadPatientFile(){
    	var filterType = <%=PatientFileFilterTypeEnum.SHOW_All.getValue()%>;
        $.getJSON("<c:url value='/' />" + "clinic/patient/visitMobileBase/loadByPatient/" + ${patientId} + "/" + filterType, function(data) {
            $("#patientFile-for-test-inner").append(data.data);
            $("#patientFile-for-test-inner-1").append(data.data);
//            $("#patientFile-for-test-inner").accordion({
//                heightStyle: "content",
//                collapsible: true
////            header: "h3"
//            });
            $("#patientFile-for-test-inner-1").accordion({
                heightStyle: "content",
                collapsible: true
//            header: "h3"
            });
//            $("#patientFile-for-test-inner").accordion("refresh");
            $("#patientFile-for-test-inner-1").accordion("refresh");

            $("#p-patientFileContainer").append(data.data);
            $("#p-patientFileContainer").accordion({
                heightStyle: "content",
                collapsible: true
//            header: "h3"
            });
            $("#p-patientFileContainer").accordion("refresh");

            <%--$('h3[id^="ui-accordion-patientFile-for-test-inner-header"]').eq(0).css("background","rgba(251,221,83,1)")--%>
            var headerArray=$('h3[id^="ui-accordion-patientFile-for-test-inner-header"]');
            for(var i=0;i<headerArray.length;i++){
                headerArray.eq(i).css("background","-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(255,244,180,1)), color-stop(100%,rgba(251,221,83,1)))");
                headerArray.eq(i).css("border","1px solid #d3d3d3");
                headerArray.eq(i).css("font-weight","normal");
                headerArray.eq(i).css("color","#555555");
            }
            var patientFileArray=$('div[id^="accordion-patientFile-"]');
            for(var j=0;j<patientFileArray.length;j++){
                $("#"+patientFileArray[j].id).accordion({
                    heightStyle: "content",
                    collapsible: true
//            header: "h3"
                });
            }
        });
    }
    function emptyPatientFile(){
        $("#p-patientFileContainer").empty();
        $("#patientFile-for-test-inner").empty();
    }

</script>
