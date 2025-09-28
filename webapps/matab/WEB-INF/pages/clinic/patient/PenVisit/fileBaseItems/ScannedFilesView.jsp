<%@page import="com.artonis.clinic.patient.model.PatientConstValue.PatientFileFilterTypeEnum"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="p-scanFile" dir="ltr">
	<br>
	<div id="p-scanFileContainer" style=" width:100%; height:100%"></div>
</div>

<script type="text/javascript">
	$("#p-scanFile").dialog({
		height : 500,
		width : 1000,
		autoOpen : false,
		show : {
			effect : "blind",
			duration : 500
		},
		hide : {
			effect : "slide",
			duration : 500
		}
	});

	$("#p-scanFile-id-txt").click(function() {
		$("#p-scanFile").dialog("open");
	});

	jQuery('body').bind('click', function(e) {
		if (jQuery('#p-scanFile').dialog('isOpen') && !jQuery(e.target).is('.ui-dialog, a') && !jQuery(e.target).closest('.ui-dialog').length && event.target.nodeName != "H2") {
			jQuery('#p-scanFile').dialog('close');
		}
	});

	loadScanFile();
	
	function loadScanFile() {
		var filterTypeScannedFile = <%=PatientFileFilterTypeEnum.SCANNED_FILES.getValue()%>;
		$.getJSON("<c:url value='/' />" + "clinic/patient/penVisit/loadByPatient/" + ${patientId} + "/" + filterTypeScannedFile, function(data) {
			$("#scanFile-for-test-inner").append(data.data);
			$("#scanFile-for-test-inner-1").append(data.data);
			$("#scanFile-for-test-inner-1").accordion({
				heightStyle : "content",
				collapsible : true
			});
			$("#scanFile-for-test-inner-1").accordion("refresh");
			$("#p-scanFileContainer").append(data.data);
			$("#p-scanFileContainer").accordion({
				heightStyle : "content",
				collapsible : true
			});
			$("#p-scanFileContainer").accordion("refresh");

			var headerArray = $('h3[id^="ui-accordion-scanFile-for-test-inner-header"]');
			for (var i = 0; i < headerArray.length; i++) {
				headerArray.eq(i).css("background", "-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(255,244,180,1)), color-stop(100%,rgba(251,221,83,1)))");
				headerArray.eq(i).css("border", "1px solid #d3d3d3");
				headerArray.eq(i).css("font-weight", "normal");
				headerArray.eq(i).css("color", "#555555");
			}
			var scanFileArray = $('#scanFile-for-test-inner [id^="accordion-patientFile-"]');
			for (var j = 0; j < scanFileArray.length; j++) {
				$("#" + scanFileArray[j].id).accordion({
					heightStyle : "content",
					collapsible : true
				});
			}
		});
	}
	
	function emptyScanFile() {
		$("#p-scanFileContainer").empty();
		$("#scanFile-for-test-inner").empty();
	}

	function imageDivFrameOnClick(t){
	}
	
	$(".scannedFileFancyBox").fancybox({
		  mouseWheel: false,
		  beforeShow: function() {
              this.element.css("width", $(window).width() * 0.85);
              this.element.css("height", $(window).height() * 0.85);
              this.element.css("background-size", "contain");
          },
		  afterShow: function() {
			  this.element.css("width", $(window).width() * 0.85);
			  this.element.css("height", $(window).height() * 0.85);
			  this.element.css("background-size", "contain");
		  },
          afterClose: function() {
			  emptyScanFile();
			  loadScanFile();
          }
	});
</script>
