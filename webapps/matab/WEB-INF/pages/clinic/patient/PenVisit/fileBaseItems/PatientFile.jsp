<%@page import="com.artonis.clinic.patient.model.PatientConstValue.PatientFileFilterTypeEnum"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="p-patientFile" dir="ltr">
	<br>
	<div id="p-patientFileContainer" style=" width:100%; height:100%"></div>
</div>

<script type="text/javascript">
	$("#p-patientFile").dialog({
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

	$("#p-patientFile-id-txt").click(function() {
		$("#p-patientFile").dialog("open");
	});

	jQuery('body').bind('click', function(e) {
		if (jQuery('#p-patientFile').dialog('isOpen') && !jQuery(e.target).is('.ui-dialog, a') && !jQuery(e.target).closest('.ui-dialog').length && event.target.nodeName != "H2") {
			jQuery('#p-patientFile').dialog('close');
		}
	});

	loadPatientFile();
	
	function loadPatientFile() {
		var filterType = <%=PatientFileFilterTypeEnum.HANDWRITING.getValue()%>;
		$.getJSON("<c:url value='/' />" + "clinic/patient/penVisit/loadByPatient/" + ${patientId} + "/" + filterType, function(data) {
			$("#patientFile-for-test-inner").append(data.data);
			$("#patientFile-for-test-inner-1").append(data.data);
			$("#patientFile-for-test-inner-1").accordion({
				heightStyle : "content",
				collapsible : true
			});
			$("#patientFile-for-test-inner-1").accordion("refresh");
			$("#p-patientFileContainer").append(data.data);
			$("#p-patientFileContainer").accordion({
				heightStyle : "content",
				collapsible : true
			});
			$("#p-patientFileContainer").accordion("refresh");

			var headerArray = $('h3[id^="ui-accordion-patientFile-for-test-inner-header"]');
			for (var i = 0; i < headerArray.length; i++) {
				headerArray.eq(i).css("background", "-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(255,244,180,1)), color-stop(100%,rgba(251,221,83,1)))");
				headerArray.eq(i).css("border", "1px solid #d3d3d3");
				headerArray.eq(i).css("font-weight", "normal");
				headerArray.eq(i).css("color", "#555555");
			}
			var patientFileArray = $('#patientFile-for-test-inner [id^="accordion-patientFile-"]');
			for (var j = 0; j < patientFileArray.length; j++) {
				$("#" + patientFileArray[j].id).accordion({
					heightStyle : "content",
					collapsible : true
				});
			}

			fancySizeCorrection();

        });
	}

	function fancySizeCorrection(){
		$(".fancybox").each(function (item) {
			var sourceDiv = $(this);
			var divWidth = sourceDiv.width();
			var url = sourceDiv.css("background-image");
			url = url.substring(5, url.length - 2);

			var img = new Image();
			img.onload = function () {
				sourceDiv.css("background-size", img.width / 3.5 + 'px');
			};
			img.src = url;
		});
	}

    $(".fancybox").fancybox({
        'width':$(window).width() * 0.85,
        'height':$(window).height() * 0.85,
        'autoDimensions':false,
        'autoSize':false,
        'mouseWheel': false,
        afterShow: function() {
        },
        beforeShow: function() {
			this.element.css("height", "99%");

			var sourceDiv = this.element;
			var url = sourceDiv.css("background-image");
			url = url.substring(5, url.length - 2);

			var img = new Image();
			img.onload = function () {
				sourceDiv.css("background-size", img.width / 1.5 + 'px');
			};
			img.src = url;
        },
        afterClose: function() {
			$(".imageFrame div").css("display", "");
			$(".imageFrame div").css("width", "auto");
			$(".imageFrame div").css("height", "250px");
			fancySizeCorrection();
        },
        beforeClose: function(){
        }
    });

	function emptyPatientFile() {
		$("#p-patientFileContainer").empty();
		$("#patientFile-for-test-inner").empty();
	}

	function imageDivFrameOnClick(event){
	}

</script>

<style>
	.fancybox-nav {
		height: 80%;
		top: 20%;
	}
	
	.fancybox-nav span {
		top: 40%;
	}
</style>