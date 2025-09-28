<%@page import="com.artonis.clinic.patient.model.PatientConstValue.PatientFileFilterTypeEnum"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="p-patientFile" dir="ltr">
    <br>
    <div id="p-patientFileContainer" style=" width:100%; height:100%"></div>
</div>

<div id="patientFile-zoom-table" style="width: 100%" class="ui-dialog-content ui-widget-content" scrolltop="0" scrollleft="0">
    <table border="3" style="border: 1px solid black; width:100%; height: 100%;" >
        <tr id="patientFile-zoom-tableRow" style=" font-size: 25px !important; font-weight: bold; "></tr>
    </table>
</div>

<base:dialogConfirm name="dialogconfirmRemovePatientFile" key="action.alert.areYouSure.delete"
                    yesFunction="confirmRemovePatientFile" noFunction="confirmNoRemovePatientFile"/>

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

    var wWidth = $(window).width();
    var dWidth = wWidth * 0.8;
    var wHeight = $(window).height();
    var dHeight = wHeight * 0.9;

    $("#patientFile-zoom-table").dialog({
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
                if (jQuery('#patientFile-zoom-table').dialog('isOpen')
                        && !jQuery(e.target).is('.ui-dialog, a')
                        && !jQuery(e.target).closest('.ui-dialog').length
                        && event.target.nodeName != "BUTTON") {
                    jQuery('#patientFile-zoom-table').dialog('close');
                }
    });

    loadPatientFile();

    function loadPatientFile() {
        var filterType = <%=PatientFileFilterTypeEnum.SHOW_All.getValue()%>;
        if($(".patientFileFilterBtnGroup .uk-active")[0].id == "patientFileFilterBtn_Diagnosis"){
            filterType = <%=PatientFileFilterTypeEnum.DIAGNOSIS.getValue()%>;
        }
        $.getJSON("<c:url value='/' />" + "clinic/patient/configurablePatientRecord/loadByPatient/" + ${patientId} + "/" + filterType, function(data) {
            $("#patientFile-for-test-inner").append(data.data);
            $("#patientFile-for-test-inner-1").append(data.data);
            $("#patientFile-for-test-inner-1").accordion({
                heightStyle : "content",
                collapsible : true
            });
            $("#patientFile-for-test-inner-1").accordion("refresh");

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
            if (sourceDiv.hasClass("handwritingFancybox")) {
                var divWidth = sourceDiv.width();
                var url = sourceDiv.css("background-image");
                url = url.substring(5, url.length - 2);

                var img = new Image();
                img.onload = function () {
                    sourceDiv.css("background-size", img.width / 3.5 + 'px');
                };
                img.src = url;
            }
        });
    }

    $(".fancybox").fancybox({
        'width':$(window).width() * 0.85,
        'height':$(window).height() * 0.85,
        'autoDimensions':false,
        'autoSize':false,
        'mouseWheel': false,
        beforeLoad: function(instance, current) {
            //console.log('beforeLoad');
//            console.info( 'Clicked element:' );
            if(isEditButtonPen){
                isEditButtonPen=false;
                return false;
            }
            if(isDeleteButtonPen){
                isDeleteButtonPen=false;
                return false;
            }
        },
        afterShow: function() {
           // console.log('afterShow');
        },
        beforeShow: function() {
            this.element.css("height", "98%");

            var sourceDiv = this.element;
            if (sourceDiv.hasClass("handwritingFancybox")) {
                var url = sourceDiv.css("background-image");
                url = url.substring(5, url.length - 2);

                var img = new Image();
                img.onload = function () {
                    sourceDiv.css("background-size", img.width / 1.5 + 'px');
                };
                img.src = url;
            }
            //console.log('beforeShow');
        },
        afterClose: function() {
            $(".imageFrame div").css("display", "");
            $(".imageFrame div").css("width", "auto");
            $(".imageFrame div").css("height", "250px");
            fancySizeCorrection();
            resetHandwritingTextTitle();
            //console.log('afterClose');
        },
        beforeClose: function(){
           // console.log('beforeClose');
        }
    });

    function resetHandwritingTextTitle(){
        $("#handwritingTextTitle").css("height","auto");
        $("#convertedHandwritingTextTitle").css("height","auto");
    }

    function emptyPatientFile() {
        $("#p-patientFileContainer").empty();
        $("#patientFile-for-test-inner").empty();
    }

    function imageDivFrameOnClick(event){
    }

    function zoomPatientFile(param){
        $("#patientFile-zoom-tableRow").empty();
        for(var i=1;i<param.parentElement.children.length;i++){
            var cl=param.parentElement.children[i].cloneNode(true);
            if(cl.className=="imageFrame" || cl.id.indexOf("newPrescreption")>-1){
                continue;
            }
            $("#patientFile-zoom-tableRow").append(cl);
            var element = cl.children;
            for(var j=0;j<element.length;j++){
                element[j].setAttribute('style', 'font-size:25px !important');
                if(element[j].children!=undefined && element[j].children.length>0 && element[j].id!="handwritingTextTitle"){
                    var ee=element[j].children;
                    for(var w=0;w<ee.length;w++){
                        ee[w].setAttribute('style', ee[w].getAttribute('style')+'; font-size:25px !important');
                        var innerElement=ee[w].children;
                        if(ee[w].children!=undefined && ee[w].children.length>0){
                            for(var z=0;z<innerElement.length;z++){
//                                innerElement[z].setAttribute('style', 'font-size:25px !important');
                                innerElement[z].setAttribute('style', innerElement[z].getAttribute('style')+'; font-size:25px !important');
                            }
                        }
                    }
                }
            }
        }
        $("#patientFile-zoom-table").dialog("open");

    }

    function deletePatientFile(param){
        console.log(param);
        $("#dialogconfirmRemovePatientFile").data('contents', param).dialog("open");
    }

    function confirmRemovePatientFile(e){
        var mongoId=e.data('contents');
        var requestUrl = "${pageContext.request.contextPath}" + "/clinic/patient/configurablePatientRecord/removeTotalPatientFileByMongoId?mongoId=" + mongoId ;
        jQuery.ajax({
            url: requestUrl,
            type: "GET",
            dataType: "json",
            success: function (result) {
                if (result.state == "success") {
                    alertify.success(result.message);
                    if(window.top.location.href.split('/')[window.top.location.href.split('/').length-1]==mongoId){
                        window.top.location.href=window.top.location.href.replace(mongoId,'null');
                    }else{
                        callbackSaveSuccess();
                    }

                } else {
                    for (var i = 0; i < result.errors.length; i++) {
                        if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                            alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                        } else {
                            alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                        }
                    }
                    callbackSaveSuccess();
                }

            },
            error: function (result) {

                callbackSaveSuccess();
            }
        });
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