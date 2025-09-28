<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="procedureReport-table" style="width: 100%" class="ui-dialog-content ui-widget-content" scrolltop="0" scrollleft="0">
	<br>
	<ui>
		<li id="li-pdf">
			</a>
		</li>
	</ui>
</div>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function () {
		$.getJSON("${pageContext.request.contextPath}/clinic/patient/visitMobileBase/loadProcedureReportJpgAddress/"+${patientId}, function (data) {
//                var result = $.parseJSON(data);
			$.each(data, function(name, val){
				$.each(val, function (filename, url) {


					var imgTag = document.createElement("img");
					imgTag.id = "showPdf-" + filename;
					imgTag.style.width = "100px";
					imgTag.style.height = "75px";
					imgTag.style.paddingRight = "5px";

					var aTag = document.createElement("a");
					aTag.className = "fancybox";
					aTag.rel = "gallery1";
					aTag.href = url;
					aTag.appendChild(imgTag);


					$("#li-pdf").append(aTag);
//                $("#li-pdf").append(aTag);

					$("#showPdf-" + filename).attr('src', url);
				});
			});
		});
		var wWidth = $(window).width();
		/* var wHeight = $(window).height(); */
		var dWidth = wWidth * 0.8;
		/* var dHeight = wHeight * 0.3; */
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
			position: { my: "right bottom", at: "center", of: window }
		});

		$( "#p-procedureReport-id" ).click(function() {
			$( "#procedureReport-table" ).dialog( "open" );
		});
		$( "#p-procedureReport-id-txt" ).click(function() {
			$( "#procedureReport-table" ).dialog( "open" );
		});


		$(".fancybox").fancybox({
			openEffect	: 'none',
			closeEffect	: 'none'
//			openMethod	: 'zoomIn',
//			autoCenter:false,
//			width:850,
//			height:1050

		});
	});
	jQuery('body')
			.bind(
			'click',
			function (e) {
				if (
						jQuery('#procedureReport-table').dialog('isOpen')
						&& !jQuery(e.target).is('.ui-dialog, a')
						&& !jQuery(e.target).closest('.ui-dialog').length
						&& event.target.nodeName!="H2"
				) {
					jQuery('#procedureReport-table').dialog('close');
				}
			}
	);
</script>

<style type="text/css">
	/*.zoomContainer { z-index: 100000; }*/
	.fancybox-inner{
		width: 650px !important;;
		height: 1250px !important;;
	}
</style>