<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/lib/jquery.mousewheel-3.0.6.pack.js' />"></script>
<link rel="stylesheet" href="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/jquery.fancybox.css?v=2.1.5' />" type="text/css"/>
<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/jquery.fancybox.pack.js?v=2.1.5' />"></script>
<link rel="stylesheet" href="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-buttons.css?v=1.0.5' />" type="text/css"/>
<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-buttons.js?v=1.0.5' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-media.js?v=1.0.6' />"></script>
<link rel="stylesheet" href="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7' />" type="text/css"/>
<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7' />"></script>



	<div id="p-scanPatientFile" style="width: 70%" class="ui-dialog-content ui-widget-content" scrolltop="0" scrollleft="0">
		<br>
			<ui>
				<li id="li-images">
					<%--<a class="fancybox" rel="gallery1" href="/prjResource/patientFile/196449-69622-P1200594.JPG" title="1">--%>
						<%--&lt;%&ndash;<img src="/prjResource/patientFile/111999/b6ea95a5-de0b-4478-9830-bcec2055ce5c.png" style=" width: 8%;  " />&ndash;%&gt;--%>
						<%--<img src="/prjResource/patientFile/196449-69622-P1200594.JPG" style=" width: 8%;  " />--%>
					<%--</a>--%>
					<%--<a class="fancybox" rel="gallery1" href="/prjResource/patientFile/111999/854d6024-4643-4821-963e-ada5e9c3c763.png" title="2">--%>
						<%--<img src="/prjResource/patientFile/111999/854d6024-4643-4821-963e-ada5e9c3c763.png" style=" width: 8%;height:80px; " />--%>
					<%--</a>--%>
					<%--<a class="fancybox" rel="gallery1" href="/prjResource/patientFile/111999/94f9e795-985c-4b85-a602-3c97ab8a97e4.png" title="3">--%>
						<%--<img src="/prjResource/patientFile/111999/94f9e795-985c-4b85-a602-3c97ab8a97e4.png" style=" width: 8%;height:80px; " />--%>
					<%--</a>--%>
					<%--<a class="fancybox" rel="gallery1" href="/prjResource/patientFile/111999/75fcbe83-1421-4192-b383-d782ef3e23c3.png" title="4">--%>
						<%--<img src="/prjResource/patientFile/111999/75fcbe83-1421-4192-b383-d782ef3e23c3.png" style=" width: 8%;height:80px; " />--%>
					<%--</a>--%>
					<%--<a class="fancybox" rel="gallery1" href="/prjResource/patientFile/111999/46b89020-bc43-4e76-9ba0-071291c6fb1b.png" title="5">--%>
						<%--<img src="/prjResource/patientFile/111999/46b89020-bc43-4e76-9ba0-071291c6fb1b.png" style=" width: 8%;height:80px;  " />--%>
					</a>
				</li>
			</ui>
	</div>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $.getJSON("${pageContext.request.contextPath}/clinic/patientr/patientr/edit/fileLoad/"+${patientId}, function (data) {
//                var result = $.parseJSON(data);
            $.each(data, function(name, val){
                $.each(val, function (filename, url) {


                    var imgTag = document.createElement("img");
                    imgTag.id = "showImage-" + filename;
                    imgTag.style.width = "100px";
                    imgTag.style.height = "75px";
                    imgTag.style.paddingRight = "5px";

                    var aTag = document.createElement("a");
                    aTag.className = "fancybox";
                    aTag.rel = "gallery1";
                    aTag.href = url;
                    aTag.appendChild(imgTag);


                    $("#li-images").append(aTag);
//                $("#li-images").append(aTag);

                    $("#showImage-" + filename).attr('src', url);
                });
            });
        });
        var wWidth = $(window).width();
        /* var wHeight = $(window).height(); */
        var dWidth = wWidth * 0.8;
        /* var dHeight = wHeight * 0.3; */
        $("#p-scanPatientFile").dialog({
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

    $( "#p-scanPatientFile-id" ).click(function() {
      $( "#p-scanPatientFile" ).dialog( "open" );
    });
    $( "#p-scanPatientFile-id-txt" ).click(function() {
      $( "#p-scanPatientFile" ).dialog( "open" );
    });


			$(".fancybox").fancybox({
				openEffect	: 'none',
				closeEffect	: 'none'
			});
		});
    jQuery('body')
            .bind(
            'click',
            function (e) {
                if (
                        jQuery('#p-scanPatientFile').dialog('isOpen')
                                && !jQuery(e.target).is('.ui-dialog, a')
                                && !jQuery(e.target).closest('.ui-dialog').length
                                && event.target.nodeName!="H2"
                        ) {
                    jQuery('#p-scanPatientFile').dialog('close');
                }
            }
    );
</script>

