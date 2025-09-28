<%@page import="com.artonis.clinic.patient.model.PatientConstValue.PatientFileFilterTypeEnum"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="scanFile-for-test" dir="ltr">
	<div id="scanFile-for-test-inner"></div>
</div>

<script type="text/javascript">

	loadScanFile();

	function loadScanFile() {
		var filterTypeScannedFile = <%=PatientFileFilterTypeEnum.SCANNED_FILES.getValue()%>;
		$.getJSON("<c:url value='/' />" + "clinic/patient/configurablePatientRecord/loadByPatient/" + ${patientId} + "/" + filterTypeScannedFile, function(data) {
			$("#scanFile-for-test-inner").append(data.data);
			$($("#scanFile-for-test-inner").children()[0]).accordion({
				heightStyle : "content",
				collapsible : true
			});
		});
	}

	function emptyScanFile() {
		$("#p-scanFileContainer").empty();
		$("#scanFile-for-test-inner").empty();
	}

	function openNewTab(e){
	    console.log('myfunction');
        window.open(e.parentElement.children[0].currentSrc);
	}

	$(".scannedFileFancyBox").fancybox({
		mouseWheel: false,
        beforeLoad:function(){
            if(event.target.src !=undefined && event.target.src.indexOf('resources/images/green/zoom-in.png')>-1){
//                $.fancybox.cancel();
				return false;
			}
		},
		beforeShow: function() {
//			this.element.css("width", $(window).width() * 0.85);
			this.element.css("height", $(window).height() * 0.85);
			this.element.css("pointer-events",'none');
//			console.log('beforeShow');
//			this.element.css("background-size", "contain");
////			this.element.css("top", "50%");
////			this.element.css("left", "50%");
		},
		afterShow: function() {
//			this.element.css("width", $(window).width() * 0.85);
			this.element.css("height", $(window).height() * 0.85);
//			this.element.css("background-size", "contain");
////            this.element.css("top", "50%");
////            this.element.css("left", "50%");
		},
		afterClose: function() {
			emptyScanFile();
			loadScanFile();
		}
	});
</script>
