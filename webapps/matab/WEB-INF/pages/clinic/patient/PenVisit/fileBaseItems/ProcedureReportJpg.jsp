<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="procedureReport-table" style="width: 100%" class="ui-dialog-content ui-widget-content" scrolltop="0" scrollleft="0">
	<br>
	<ui>
		<li id="li-pdf" style="list-style: none;">
			</a>
		</li>
	</ui>
</div>

<script type="text/javascript" charset="utf-8">
	var procedureReportWasSeen = false;
	$(document).ready(function () {
		$.getJSON("${pageContext.request.contextPath}/clinic/patient/penVisit/loadProcedureReportJpgAddress/"+${patientId}, function (result) {
			$.each(result, function(name, val){
				$.each(val, function (filename, url) {
					var imgTag = document.createElement("img");
					imgTag.id = "showPdf-" + filename;
					imgTag.style.width = "200px";
					imgTag.style.height = "200px";
					imgTag.style.paddingRight = "5px";
					imgTag.style.border = "thin solid";
					imgTag.style.margin = "5px";

					var aTag = document.createElement("a");
					aTag.className = "fancybox_procedure";
					aTag.rel = "gallery_procedure";
					aTag.href = url;
					aTag.appendChild(imgTag);

					$("#li-pdf").append(aTag);

					$("#showPdf-" + filename).attr('src', url);
					//
					activeGreenShinyProcedureReport();
				});
			});
			//
			var visitId = "${visitId}";
			var hasNewProcedureReport = result.hasNewProcedureReport;
			checkForBlinkProcedureReport(visitId, hasNewProcedureReport);
		});

		var wWidth = $(window).width();
		var dWidth = wWidth * 0.7;
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

		$( "#p-procedureReport-id" ).click(function() {
			$( "#procedureReport-table" ).dialog( "open" );
		});

		$( "#p-procedureReport-id-txt" ).click(function() {
			$( "#procedureReport-table" ).dialog( "open" );
		});

		$(".fancybox_procedure").fancybox({
			'width':$(window).width() * 0.80,
			'height':$(window).height() * 0.85,
			'autoDimensions':false,
			'type':'iframe',
			'autoSize':false,
			'mouseWheel': false,
			afterShow: function() {
				this.content[0].contentDocument.body.children[0].style = "width: 100%";
			}
		});

	});

	jQuery('body').bind('click', function (e) {
				if (jQuery('#procedureReport-table').dialog('isOpen') && !jQuery(e.target).is('.ui-dialog, a')
						&& !jQuery(e.target).closest('.ui-dialog').length && event.target.nodeName != "H2") {
					jQuery('#procedureReport-table').dialog('close');
				}
			}
	);

	function checkForBlinkProcedureReport(visitId, hasNewProcedureReport){
		if((visitId == null || visitId == "0") && (hasNewProcedureReport == true)){//page in new mode
			if($("#li-pdf").children().size() > 0){
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
	.fancybox-nav {
		width: 8%;
		margin: 20px;
	}
</style>