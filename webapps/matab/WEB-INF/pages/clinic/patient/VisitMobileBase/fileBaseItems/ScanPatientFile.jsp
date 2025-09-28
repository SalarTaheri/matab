<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<div id="p-scanPatientFile" style="width: 70%" class="ui-dialog-content ui-widget-content" scrolltop="0" scrollleft="0">
		<br>
			<ui>
				<li id="li-images">
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

