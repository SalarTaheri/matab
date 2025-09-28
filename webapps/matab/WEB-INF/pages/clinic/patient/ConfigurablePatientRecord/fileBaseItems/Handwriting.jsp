<%@page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@page import="com.artonis.core.system.config.service.util.ConfigServiceUtil"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@page import="java.io.File"%>
<%@ page import="com.artonis.clinic.patient.model.PatientConstValue" %>
<%@ page import="com.artonis.clinic.basicInfo.service.util.BasicInfoServiceUtil" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>

<link href="<c:url value='/resources/literallyCanvas/_assets/literallycanvas.css'/>" rel="stylesheet">
<script src="<c:url value='/resources/literallyCanvas/_js_libs/literallycanvas-core.js' />"></script>

<script src="<c:url value='/resources/js/blockUI/blockUI.js' />"></script>

<%
    String areUShure = ResourceBoundleHolder.resourceBundle.getString("clinic.patientfile.confirm.exit");
    File[] handwritingFiles = (File[]) request.getAttribute("handwritingFiles");
    String patientId = (String) request.getAttribute("patientId");
%>
<base:dialogConfirm name="dialogconfirmRemovePen" key="action.alert.areYouSure.delete"
                    yesFunction="confirmRemovePen" noFunction="confirmNoRemovePen"/>
<div style="width: 100%;">

    <div align="center">
        <div>
            <button class="uk-button uk-button-primary" id="startHandwriting" type="button" style="width: 50%; height: 50px;">
                <strong>Write New Prescription</strong>
            </button>
        </div>
    </div>

    <div class="fs-container" >
        <div class="literally"></div>

        <div class="toolset">
            <a href="javascript:void(0);" class='tool' id="open-image">Open image</a>
            <a href="javascript:void(0);" class='tool' id="change-size">Change size</a>
            <a href="javascript:void(0);" class='tool' id="reset-size">Reset size</a>
            <a href="javascript:void(0);" class='tool' id="hide-lc">Teardown</a>
            <a href="javascript:void(0);" class='tool' id="show-lc">Setup</a>
            <a href="javascript:void(0);" class='tool' id="clear-lc">Clear</a>
            <a href="javascript:void(0);" class='tool' id="tool-pencil">Pencil</a>
            <a href="javascript:void(0);" class='tool' id="tool-eraser">Eraser</a>
            <a href="javascript:void(0);" class='tool' id="tool-text">Text</a>
            <a href="javascript:void(0);" class='tool' id="tool-line">Line</a>
            <a href="javascript:void(0);" class='tool' id="tool-arrow">Arrow</a>
            <a href="javascript:void(0);" class='tool' id="tool-dashed">Dashed Line</a>
            <a href="javascript:void(0);" class='tool' id="tool-ellipse">Ellipse</a>
            <a href="javascript:void(0);" class='tool' id="tool-rectangle">Rectangle</a>
            <a href="javascript:void(0);" class='tool' id="tool-polygon">Polygon</a>
            <a href="javascript:void(0);" class='tool' id="tool-select">Select</a>
            <a href="javascript:void(0);" class='tool' id="colorTool-black">Black</a>
            <a href="javascript:void(0);" class='tool' id="colorTool-blue">Blue</a>
            <a href="javascript:void(0);" class='tool' id="colorTool-red">Red</a>
        </div>
        <br>
        <div class="svg-container" style="display: inline-block; border: 1px solid yellow"></div>
    </div>

    <button class="uk-button uk-button-success handwritingSaveHotspot " onclick="handwritingSaveOnClick()" type="button">Save</button>
    <button class="uk-button uk-button-danger handwritingBackHotspot" onclick="handwritingBackBtnOnClick()" type="button">Cancel</button>
</div>

<div class="myLiterallyToolbar">
    <div class="lc-picker1" >
        <div class="lc-picker-contents1" >
            <div class="lc-pick-tool1 toolbar-button1 thin-button1 toolbar-button-selected1 pencil" style="background-image:url('<c:url value='/resources/literallyCanvas/_assets/lc-images/pencil.png'/>');" title="Pencil"></div>
            <div class="lc-pick-tool1 toolbar-button1 thin-button1 eraser" style="background-image:url('<c:url value='/resources/literallyCanvas/_assets/lc-images/eraser.png'/>');" title="Eraser" ></div>
            <div class="color-well1" >
                <div class="color-well-color-container1" style="margin-top: 5px;">
                    <div class="color-well-checker1 color-well-checker-top-left1" ></div>
                    <div class="color-well-checker1 color-well-checker-bottom-right1" style="left:50%;top:50%;" ></div>
                    <div class="color-well-color1 black" style="background-color:black;" > </div>
                </div>
                <div class="color-well-color-container1" >
                    <div class="color-well-checker1 color-well-checker-top-left1" ></div>
                    <div class="color-well-checker1 color-well-checker-bottom-right1" style="left:50%;top:50%;" ></div>
                    <div class="color-well-color1 red" style="background-color:red" > </div>
                </div>
                <div class="color-well-color-container1" >
                    <div class="color-well-checker1 color-well-checker-top-left1" ></div>
                    <div class="color-well-checker1 color-well-checker-bottom-right1" style="left:50%;top:50%;" ></div>
                    <div class="color-well-color1 blue" style="background-color:blue;" > </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $.support.cors = true;

    var clearCanvas;
    var getLcImage;
    var setImage;
    var lc = null;
    var tools;
    var strokeWidths;
    var colors;
    var setCurrentByName;
    var findByName;

    var containerOne = document.getElementsByClassName('literally')[0];

    var showLC = function() {
        lc = LC.init(containerOne, {
            snapshot: JSON.parse(localStorage.getItem('drawing')),
            defaultStrokeWidth: 1.5,
            strokeWidths: [10, 20, 50],
            secondaryColor: 'transparent'
        });
        window.demoLC = lc;

        var save = function() {
            localStorage.setItem('drawing', JSON.stringify(lc.getSnapshot()));
        }

        lc.on('drawingChange', save);
        lc.on('pan', save);
        lc.on('zoom', save);
        lc.on('drawStart', function() {
            hasHandwriting = true;
        });

        clearCanvas = function(){
            lc.clear();
        };

        getLcImage = function(){
            return lc.getImage().toDataURL();
        }

        setImage = function(src){
            var newImage = new Image();
            newImage.src = src;
            lc.saveShape(LC.createShape('Image', {x: 0, y: 0, image: newImage}));
        }

        // Set up our own tools...
        tools = [
            {
                name: 'pencil',
                el: document.getElementById('tool-pencil'),
                tool: new LC.tools.Pencil(lc)
            },{
                name: 'eraser',
                el: document.getElementById('tool-eraser'),
                tool: new LC.tools.Eraser(lc)
            },{
                name: 'text',
                el: document.getElementById('tool-text'),
                tool: new LC.tools.Text(lc)
            },{
                name: 'line',
                el: document.getElementById('tool-line'),
                tool: new LC.tools.Line(lc)
            },{
                name: 'arrow',
                el: document.getElementById('tool-arrow'),
                tool: function() {
                    arrow = new LC.tools.Line(lc);
                    arrow.hasEndArrow = true;
                    return arrow;
                }()
            },{
                name: 'dashed',
                el: document.getElementById('tool-dashed'),
                tool: function() {
                    dashed = new LC.tools.Line(lc);
                    dashed.isDashed = true;
                    return dashed;
                }()
            },{
                name: 'ellipse',
                el: document.getElementById('tool-ellipse'),
                tool: new LC.tools.Ellipse(lc)
            },{
                name: 'tool-rectangle',
                el: document.getElementById('tool-rectangle'),
                tool: new LC.tools.Rectangle(lc)
            },{
                name: 'tool-polygon',
                el: document.getElementById('tool-polygon'),
                tool: new LC.tools.Polygon(lc)
            },{
                name: 'tool-select',
                el: document.getElementById('tool-select'),
                tool: new LC.tools.SelectShape(lc)
            }
        ];

        strokeWidths = [
            {
                name: 10,
                el: document.getElementById('sizeTool-1'),
                size: 10
            },{
                name: 20,
                el: document.getElementById('sizeTool-2'),
                size: 20
            },{
                name: 50,
                el: document.getElementById('sizeTool-3'),
                size: 50
            }
        ];

        colors = [
            {
                name: 'black',
                el: document.getElementById('colorTool-black'),
                color: '#000000'
            },{
                name: 'blue',
                el: document.getElementById('colorTool-blue'),
                color: '#0000ff'
            },{
                name: 'red',
                el: document.getElementById('colorTool-red'),
                color: '#ff0000'
            }
        ];

        setCurrentByName = function(ary, val) {
            ary.forEach(function(i) {
                $(i.el).toggleClass('current', (i.name == val));
            });
        };

        findByName = function(ary, val) {
            var vals;
            vals = ary.filter(function(v){
                return v.name == val;
            });
            if ( vals.length == 0 )
                return null;
            else
                return vals[0];
        };

        // Wire tools
        tools.forEach(function(t) {
            $(t.el).click(function() {
                var sw;

                lc.setTool(t.tool);
                setCurrentByName(tools, t.name);
                setCurrentByName(strokeWidths, t.tool.strokeWidth);
                $('#tools-sizes').toggleClass('disabled', (t.name == 'text'));
            });
        });
        setCurrentByName(tools, tools[0].name);

        // Wire Stroke Widths
        // NOTE: This will not work until the stroke width PR is merged...
        strokeWidths.forEach(function(sw) {
            $(sw.el).click(function() {
                lc.trigger('setStrokeWidth', sw.size);
                setCurrentByName(strokeWidths, sw.name);
            })
        })
        setCurrentByName(strokeWidths, strokeWidths[0].name);

        // Wire Colors
        colors.forEach(function(clr) {
            $(clr.el).click(function() {
                lc.setColor('primary', clr.color)
                setCurrentByName(colors, clr.name);
            })
        })
        setCurrentByName(colors, colors[0].name);

    };

    $(document).ready(function() {
        // disable scrolling on touch devices so we can actually draw
        $(document).bind('touchmove', function(e) {
            if (e.target === document.documentElement) {
                return e.preventDefault();
            }
        });
        showLC();
        //
        $(".fs-container").css("width", screen.width);
        $(".fs-container").css("height", screen.height);
        $(".fs-container").css("display", "none");
        //
        initPage();
    });

    $('#hide-lc').click(function() {
        if (lc) {
            lc.teardown();
            lc = null;
        }
    });

    $('#show-lc').click(function() {
        if (!lc) { showLC(); }
    });

    //
    var hasHandwriting = false;
    var editMode = false;
    var canvasHandwritingTemp = "";
    var editedImageName = "";
    //

    function initPage(){
        hasHandwriting = false;
        editMode = false;
        canvasHandwritingTemp = "";
        editedImageName = "";
        $(".fancybox-close").click();
        //
        clearCanvas();
    }

    function fullScreen(){
        var el = parent.document.documentElement , rfs = el.requestFullScreen || el.webkitRequestFullScreen || el.mozRequestFullScreen;
        rfs.call(el);
    }

    var handwritingAppType = <%=ConfigServiceUtil.loadSetting().getHandwritingType()%>;
    $("#startHandwriting").click(function(){
        if (handwritingAppType == 1) {
            webBaseHandritingAction();
        } else {
            lockPage();
            callPenApplicationWebService(null, "", "");
        }
    });

    function callPenApplicationWebService(imageNameParam, imageBase64Content, fileContentISF){
        var imageName = imageNameParam;
        if(imageNameParam == null){
            imageName = "null";
        }
        //
        var patientId = ${patientId};
        var doctorId = "<%=GlobalVariable.getEmployee().getId()%>";
        var userId = "<%=GlobalVariable.getUser().getId()%>";
        //
        var fileName = cuVisitId + "@${patientId}@${visitQueueId}@" + imageName + "@" + doctorId + "@" + userId;
        //
        var penApplicationWebServiceAddress = '<%=ConfigServiceUtil.loadSetting().getPenApplicationWebServiceAddress()%>';
        //
        var patientDescriptionText = $("#patientDescription").text().replace(/\n/g,' ').replace(/\	+/g,' ').replace(/\ +/g,' ').replace(/<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.configurablePatientRecord.label.birthPlaceCity")%>/g,'<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.configurablePatientRecord.label.birthPlace")%>').replace(/<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.configurablePatientRecord.label.livingPlaceCity")%>/g,'<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.configurablePatientRecord.label.livingPlace")%>').replace(/<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.configurablePatientRecord.label.countOfVisit")%>/g,'<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.configurablePatientRecord.label.previousVisits")%>');
        //
        var penBackground = '<%=BasicInfoServiceUtil.getPenCurrentBackground()%>';
        //
        var data = {};
        data.fileName = fileName;
        data.fileContent = imageBase64Content;
        data.fileContentISF = fileContentISF;
        data.patientDescription = patientDescriptionText;
        data.patientId = patientId;
        data.background = penBackground;
        data.doctorId = doctorId;
        //
        $.ajax({
            url: penApplicationWebServiceAddress,
            data: JSON.stringify(data),
            crossDomain: true,
            type: 'POST',
            success: function (data, success, xhr) {
            },
            error: function (jqXHR) {
                if (jqXHR.status === 0) {
                    setTimeout(function() {
                        alertify.alert("<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.penVisit.error.canNotConnectToApp")%>", function () {
                            window.top.location = "${pageContext.request.contextPath}" + "/clinic/patient/configurablePatientRecord/${patientId}/${visitQueueId}/${mongoVisitId}";
                        });
                    }, 5000);
                }
            }
        });
        //
        callSSE();
    }

    function newPrescriptionForThisPatientFile(t){
        lockPage();
        var imageName = "null";
        //
        var patientId = ${patientId};
        var doctorId = "<%=GlobalVariable.getEmployee().getId()%>";
        var userId = "<%=GlobalVariable.getUser().getId()%>";
        var visitQueueId=t.id.split('-')[1];
        var mongoVisitId=t.name;
        //
        var fileName = mongoVisitId+"@${patientId}@"+visitQueueId+"@" + imageName + "@" + doctorId + "@" + userId;
        //
        var penApplicationWebServiceAddress = '<%=ConfigServiceUtil.loadSetting().getPenApplicationWebServiceAddress()%>';
        //
        var patientDescriptionText = $("#patientDescription").text().replace(/\n/g,' ').replace(/\	+/g,' ').replace(/\ +/g,' ').replace(/<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.configurablePatientRecord.label.birthPlaceCity")%>/g,'<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.configurablePatientRecord.label.birthPlace")%>').replace(/<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.configurablePatientRecord.label.livingPlaceCity")%>/g,'<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.configurablePatientRecord.label.livingPlace")%>').replace(/<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.configurablePatientRecord.label.countOfVisit")%>/g,'<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.configurablePatientRecord.label.previousVisits")%>');
        //
        var penBackground = '<%=BasicInfoServiceUtil.getPenCurrentBackground()%>';
        //
        var data = {};
        data.fileName = fileName;
        data.fileContent = "";
        data.fileContentISF = "";
        data.patientDescription = patientDescriptionText;
        data.patientId = patientId;
        data.background = penBackground;
        data.doctorId = doctorId;
        //
        $.ajax({
            url: penApplicationWebServiceAddress,
            data: JSON.stringify(data),
            crossDomain: true,
            type: 'POST',
            success: function (data, success, xhr) {
            },
            error: function (jqXHR) {
                if (jqXHR.status === 0) {
                    setTimeout(function() {
                        alertify.alert("<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.appointment.penVisit.error.canNotConnectToApp")%>", function () {
                            window.top.location = "${pageContext.request.contextPath}" + "/clinic/patient/configurablePatientRecord/${patientId}/${visitQueueId}/${mongoVisitId}";
                        });
                    }, 5000);
                }
            }
        });
        //
        callSSE(true);
    }

    function webBaseHandritingAction(){
        fullScreen();
        //
        editMode = false;
        hasHandwriting = false;
        //
        var appMenu = parent.document.getElementById("myIframe");
        appMenu.style.position = "fixed";
        appMenu.style.top = "0";
        //
        $(".handwritingSaveHotspot").css("display","flex");
        $(".handwritingBackHotspot").css("display","flex");
        //
        $(".fs-container").css("display", "");
        $(".fs-container").addClass("fullScreenPaint");
        //
        showToolbar();
    }

    function handwritingSaveOnClick(){
        $(".fancybox-close").click();
        //
        canvasHandwritingTemp = $(".lc-drawing canvas")[1].toDataURL();
        //
        var appMenu = parent.document.getElementById("myIframe");
        appMenu.style.position = "";
        appMenu.style.top = "";
        //
        $(".handwritingSaveHotspot").css("display","none");
        $(".handwritingBackHotspot").css("display","none");
        //
        $(".fs-container").removeClass("fullScreenPaint");
        $(".fs-container").css("display", "none");
        //
        hideToolbar();
        //
        saveForm();
    }

    var isEditButtonPen=false;
    function imageEditHotspotOnClick(t){
        console.log('imageEditHotspotOnClick');
        isEditButtonPen=true;
        if (handwritingAppType == 1) {
            webBasseHandwritingEdit(t);
        } else {
            callPenApplicationWebServiceForEdit(t);
        }
    }

    var isDeleteButtonPen=false;
    function removePenOnClick(t){
        isDeleteButtonPen=true;
        $("#dialogconfirmRemovePen").data('contents', t).dialog("open");

    }

    function confirmNoRemovePen(e) {
        callbackSaveSuccess();
    }

    function confirmRemovePen(e) {

        var requestUrl = "${pageContext.request.contextPath}" + "/clinic/patient/configurablePatientRecord/removePatientFile?patientId=" + <%=patientId%>
            + "&imgName=" + e.data('contents').id ;
        jQuery.ajax({
            url: requestUrl,
            type: "GET",
            dataType: "json",
            success: function (result) {
                if (result.state == "success") {
                    alertify.success(result.message);
                    callbackSaveSuccess();

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

    function callPenApplicationWebServiceForEdit(t){
//        setInterval(function(){
//            $("div.fancybox-overlay.fancybox-overlay-fixed").hide();
//            $("div.fancybox-wrap.fancybox-desktop.fancybox-type-inline.fancybox-opened").hide();
//        }, 50);

        lockPage();

        var image = new Image();
        var date = new Date();
        var time = date.getTime();

        image.onload = function () {
            var canvas = document.createElement('canvas');
            canvas.width = this.naturalWidth; // or 'width' if you want a special/scaled size
            canvas.height = this.naturalHeight; // or 'height' if you want a special/scaled size

            canvas.getContext('2d').drawImage(this, 0, 0);

            var requestUrl = "${pageContext.request.contextPath}" + "/clinic/patient/configurablePatientRecord/loadHandwritingFileContentISF?patientId=" + <%=patientId%>
                + "&imgName=" + t.id + "&t=" + time;
            $.getJSON(requestUrl, function (result) {
                callPenApplicationWebService(t.id, canvas.toDataURL('image/png').replace(/^data:image\/(png|jpg);base64,/, ''), result.fileContentISF);
            });
        };

        image.src = "${pageContext.request.contextPath}" + "/clinic/patient/configurablePatientRecord/loadHandwritingImage?patientId=" + <%=patientId%> + "&imgName="
                            + t.id + "&imgType=" + <%=PatientConstValue.PatientFilesFileTypeEnum.PEN_IMAGE_FILE.getValue()%> + "&t=" + time;
    }

    function lockPage(){
        /*$("#body-table").block({ message: '<div><button class="uk-button uk-button-primary" style="margin: 20px;" onclick="refreshBtnOnClick()" type="button"><%=ResourceBoundleHolder.resourceBundle.getString("clinic.penVisit.returnBack")%></button></div>'});*/
        $("#body").block({ message: '<div><img  style="padding: 5px;" src="<c:url value='/resources/images/loader.gif'/>" /> </div>'});
    }

    function webBasseHandwritingEdit(t){
        $("a:contains('Current Visit')").click();
        $("#handwriting .ui-accordion-header[aria-selected='false']").click();
        //
        $("#startHandwriting").click();
        //
        var date = new Date();
        var time = date.getTime();
        setImage("${pageContext.request.contextPath}" + "/clinic/patient/configurablePatientRecord/loadHandwritingImage?patientId=" + <%=patientId%> + "&imgName="
            + t.id + "&imgType=" + <%=PatientConstValue.PatientFilesFileTypeEnum.WEB_BASE_PEN_IMAGE_FILE.getValue()%> + "&t=" + time);
        //
        editMode = true;
        editedImageName = t.id;
    }

    function callbackSaveSuccess(){
        initPage();
        emptyPatientFile();
        loadPatientFile();
    }

    function handwritingBackBtnOnClick(){
        var areUShure = "<%=areUShure%>";
        alertify.confirm(areUShure, function (e) {
            if(e){
                initPage();
                //
                var appMenu = parent.document.getElementById("myIframe");
                appMenu.style.position = "";
                appMenu.style.top = "";
                //
                $(".handwritingSaveHotspot").css("display","none");
                $(".handwritingBackHotspot").css("display","none");
                //
                $(".fs-container").removeClass("fullScreenPaint");
                $(".fs-container").css("display", "none");
                //
                hideToolbar();
            }
        });
    }

    $(".toolbar-button1").click(function(){
        $(".toolbar-button1").removeClass("toolbar-button-selected1");
        this.className += " toolbar-button-selected1";
    });

    $(".myLiterallyToolbar .pencil").click(function(){
        $("#tool-pencil").click();
        $(".fullScreenPaint").removeClass("eraserCursor");
    });

    $(".myLiterallyToolbar .eraser").click(function(){
        $("#tool-eraser").click();
        demoLC.tool.strokeWidth = 20;
        $(".fullScreenPaint").addClass("eraserCursor");
    });

    $(".color-well-color1.black").click(function(){
        $("#colorTool-black").click();
    });

    $(".color-well-color1.red").click(function(){
        $("#colorTool-red").click();
    });

    $(".color-well-color1.blue").click(function(){
        $("#colorTool-blue").click();
    });

    function showToolbar(){
        $(".myLiterallyToolbar").css("display","block");
        $("#tool-pencil").click();
        $("#colorTool-black").click();
        $(".fullScreenPaint").removeClass("eraserCursor");
        $(".toolbar-button1").removeClass("toolbar-button-selected1");
        $(".toolbar-button1")[0].className += " toolbar-button-selected1";
    }

    function hideToolbar(){
        $(".myLiterallyToolbar").css("display","none");
    }

    function callSSE(previousVisit){
        if(typeof(EventSource) !== "undefined") {
            var target = '${pageContext.request.contextPath}'+'/clinic/patient/configurablePatientRecord/findVisitIdState/${patientId}';
            var source = new EventSource(target);
            source.onmessage = function(event) {
                console.log("event occurred = " + event.data);
                console.log('callSSE')
//                $(".fancybox-close").trigger("click");
                if(event.data != null && event.data != undefined && event.data.length > 0){
                    if (event.data == "-1") {
                        <%--window.location = "${pageContext.request.contextPath}" + "/clinic/patient/configurablePatientRecord/${patientId}/${visitQueueId}/${mongoVisitId}";--%>
                        if("${mongoVisitId}"=="null" && cuVisitId=="" ){
                            cuVisitId = "";

                        }else if( cuVisitId==""){
                            cuVisitId = "${mongoVisitId}";
                        }
                        emptyPatientFile();
                        loadPatientFile();
                        $("#body").unblock()
                    }else{
                        <%--window.location = "${pageContext.request.contextPath}" + "/clinic/patient/configurablePatientRecord/${patientId}/${visitQueueId}/" + event.data;--%>
                        if(!previousVisit){
                            cuVisitId = event.data;
                        }
                        emptyPatientFile();
                        loadPatientFile();
                        $("#body").unblock()
                    }
                    source.close();
                }
            };
        } else {
            alert("Sorry, your browser does not support server-sent events...");
        }
    }

</script>

<style>
    .fullScreenPaint{
        z-index: 99997 !important;
        position: fixed !important;
        float: left !important;
        margin: 0 !important;
        left: 0 !important;
        top: 0 !important;
        background-color: white !important;
        cursor: url(<c:url value='/resources/images/cursor/cursor-pencil.png'/>) 9 9 , auto;
    }

    .handwritingSaveHotspot {
        width: 100px;
        height: 40px;
        z-index: 99998 !important;
        top: 20px;
        right: 20px;
        display: none;
        position: fixed;
        direction: rtl;
        padding-right: 37px;
    }

    .handwritingBackHotspot {
        width: 100px;
        height: 40px;
        display: none;
        z-index: 99999 !important;
        position: fixed;
        top: 20px;
        right: 130px;
        direction: rtl;
        padding-right: 33px;
    }

    .literally {
        width: 100%;
        height: 100%;
        background-color: white;
    }

    .literally img.background, .literally > canvas {
        position: absolute;
    }

    .toolset {
        margin: 1rem;
    }

    .tool {
        background: hsla(199, 26%, 44%, 0.5);
        padding: 0.25rem;
        margin: 0.25rem;
        border-radius: 0.25rem;
        color: #000;
        text-align: center;
        text-decoration: none;
        position: relative; // give after context later
    }

    .tool.current {
        color: #fff;
        background: hsla(199, 26%, 44%, 1);
    }

    .tool:hover {
        text-decoration: underline;
        background: hsla(199, 26%, 44%, 0.75);
    }

    .toolLabel {
        font-size: 1.25rem;
    }

    #tools-sizes.disabled .tool:after {
        content: ' ';
        background: hsla(0, 100%, 100%, 0.75);
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        border-radius: 0.25rem;
    }

    .toolbar-button1{
        width: 20px;
        height: 20px;
        background-size: 100% 100%;
        background-repeat: no-repeat;
        line-height: 26px;
        margin: 2px;
        padding: 0;
        cursor: pointer;
        text-align: center;
        border: 2px solid transparent;
        border-radius: 3px;
    }

    .color-well1 {
        font-size: 10px;
    }

    .color-well-color-container1 .color-well-color1 {
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        border-radius: 3px;
    }

    .color-well-color-container1 {
        border: 2px solid transparent;
        border-radius: 3px;
        border: 1px solid #aaa;
        position: relative;
        width: 28px;
        height: 28px;
        margin: 1px auto;
        overflow: visible;
        float: left;
    }

    .color-well-color-container1 .color-well-checker-top-left1 {
        border-top-left-radius: 3px;
    }

    .color-well-color-container1 .color-well-checker-bottom-right1 {
        border-bottom-right-radius: 3px;
    }

    .lc-picker1 .toolbar-button1:hover:not(.disabled) {
        border-color: #a1d9fe;
    }

    .toolbar-button-selected1{
        background-color: #a1d9fe;
    }

    .color-well-color1:HOVER {
        border-width: thin;
        border-style: solid;
        border-color: yellow;
        cursor: pointer;
    }

    .myLiterallyToolbar{
        background-color: #9E9E9E;
        width: 30px;
        padding: 1px;
        border-width: thin;
        border-style: solid;
        border-radius: 3px;
        right: 20px;
        top: 100px;
        z-index: 999999;
        display: none;
        position: fixed;
    }

    .eraserCursor{
        cursor: url(<c:url value='/resources/images/cursor/eraser.png'/>) 9 9 , auto !important;
    }

</style>