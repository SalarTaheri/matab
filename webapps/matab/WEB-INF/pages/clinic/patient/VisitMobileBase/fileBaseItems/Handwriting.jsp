<%@page import="java.io.File"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	File[] handwritingFiles = (File[]) request.getAttribute("handwritingFiles");
	String patientId = (String) request.getAttribute("patientId");
%>
<table style="width: 100%">
    <tr style="width: 100%">
        <td width="10%" align="center">
            <button class="uk-button uk-icon-eraser" style="color: black; font-size: 30px !important; padding: 5px 8px 5px 8px;" type="button"
                    onclick="changeHandwritingColor('white')"></button>
        </td>
        <td width="30%" align="center">
            <button class="uk-button uk-icon-pencil" style="color: black; font-size: 30px !important; padding: 5px 8px 5px 8px;" type="button"
                    onclick="changeHandwritingColor('black')"></button>
            <button class="uk-button uk-icon-pencil" style="color: blue; font-size: 30px !important; padding: 5px 8px 5px 8px;" type="button"
                    onclick="changeHandwritingColor('blue')"></button>
            <button class="uk-button uk-icon-pencil" style="color: red; font-size: 30px !important; padding: 5px 8px 5px 8px;" type="button"
                    onclick="changeHandwritingColor('red')"></button>
            <button class="uk-button uk-icon-pencil" style="color: green; font-size: 30px !important; padding: 5px 8px 5px 8px;" type="button"
                    onclick="changeHandwritingColor('green')"></button>
            <button class="uk-button uk-icon-pencil" style="color: darkorange; font-size: 30px !important; padding: 5px 8px 5px 8px;" type="button"
                    onclick="changeHandwritingColor('darkorange')"></button>
        </td>
        <td width="30%" align="center">
            <button class="uk-button uk-icon-circle" style="font-size: 5px !important; padding: 5px 14px 5px 14px;" type="button" onclick="setPenSize('2')"></button>
            <button class="uk-button uk-icon-circle" style="font-size: 9px !important; padding: 5px 12px 5px 12px;" type="button" onclick="setPenSize('5')"></button>
            <button class="uk-button uk-icon-circle" style="font-size: 14px !important; padding: 5px 10px 5px 10px;" type="button" onclick="setPenSize('10')"></button>
            <button class="uk-button uk-icon-circle" style="font-size: 24px !important; padding: 5px 8px 5px 8px;" type="button" onclick="setPenSize('20')"></button>
        </td>
    	<td width="30%" align="center">
    		<button id="handwriting_previousBtn" class="uk-button navigatorBtn" type="button" onclick="previousHandwritingPage()">
    			Previous Page
    		</button>
    		<div dir="ltr" style="display: inline-flex;">
    			<div>Page</div>&nbsp;
    			<div class="currentPageNumberDiv">1</div>&nbsp;
    			<div>From</div>&nbsp;
    			<div class="pageSizeNumberDiv">2</div> 
    		</div>
    		<button id="handwriting_nextBtn" class="uk-button navigatorBtn" type="button"onclick="nextHandwritingPage()">
    			Next Page
    		</button>
    	</td>
    </tr>
</table>

<div id="handwritingSketch">
    <div id="boxHandwritingCanvasDiv">
    </div>
</div>

<style>
	.navigatorBtn {
		color: black; 
		font-size: 12px !important;
		padding: 5px 8px 5px 8px;
		width: 100px;
	}
	
    #handwritingSketch {
        border: 3px solid black;
        position: relative;
        cursor: crosshair;
        padding: 0;
        height: 600px;
        width: 1200px;
    }

    #handwritingSketch * {
        margin: 0;
        padding: 0;
    }

    .inlineCanvas {
        position: absolute;
        left: 0;
        right: 0;
        bottom: 0;
        top: 0;
        cursor: crosshair;
        z-index: 999;
    }
</style>

<script>
var hasHandwriting = false;
var colorVar = 'blue';
var lineWidth = 2;
//-----------------

function makeHandwritingCanvas(pageNumber, imgSource){
	var boxHandwritingCanvasDiv = $("#boxHandwritingCanvasDiv")[0];
	//
	$(".handwritingCanvas").hide();
	$(".handwritingCanvas").attr("data-visiblity","hidden");
	//------- create new canvas
		var newCanvas = document.createElement("canvas");
		newCanvas.className = "handwritingCanvas";
		newCanvas.dataset.pagenumber = pageNumber;
		newCanvas.dataset.visiblity = "visible";
		if(imgSource != null && imgSource != ""){
			var imgCtx = newCanvas.getContext('2d');
			var myImg = new Image;
			myImg.onload = function() {
				imgCtx.drawImage(myImg, 0, 0);
			}
			myImg.src = imgSource;
		}
		boxHandwritingCanvasDiv.appendChild(newCanvas);
	//------------------------
	
    var width = 1200;
    var height = 600;
    var canvas = $(".handwritingCanvas[data-visiblity='visible']")[0];
    var ctx = canvas.getContext('2d');
    ctx.lineWidth = lineWidth;
    ctx.lineCap = "round";

    canvas.width = width;
    canvas.height = height;
    ctx.rect(0, 0, width, height);
    ctx.fillStyle = 'white';
    ctx.fill();

    // This will be defined on a TOUCH device such as iPad or Android, etc.
    var is_touch_device = 'ontouchstart' in document.documentElement;

    if (is_touch_device) {
        ctx.strokeStyle = 'Black';
        // create a drawer which tracks touch movements
        var drawer = {
            isDrawing: false,
            touchstart: function (coors) {
                hasHandwriting = true;

                ctx.beginPath();
                ctx.arc(coors.x, coors.y, ctx.lineWidth / 2, 0, Math.PI * 2, !0);

                ctx.fill();
                this.isDrawing = true;
            },
            touchmove: function (coors) {
                if (this.isDrawing) {
                    ctx.lineTo(coors.x, coors.y);
                    ctx.stroke();
                }
            },
            touchend: function (coors) {
                if (this.isDrawing) {
                    this.touchmove(coors);
                    this.isDrawing = false;
                }
            }
        };

        // create a function to pass touch events and coordinates to drawer
        function draw(event) {

            // get the touch coordinates.  Using the first touch in case of multi-touch
            var coors = {
                x: event.targetTouches[0].pageX,
                y: event.targetTouches[0].pageY
            };

            // Now we need to get the offset of the canvas location
            var obj = canvas;

            if (obj.offsetParent) {
                // Every time we find a new object, we add its offsetLeft and offsetTop to curleft and curtop.
                do {
                    coors.x -= obj.offsetLeft;
                    coors.y -= obj.offsetTop;
                    obj = obj.offsetParent;
                } while (obj);
            }

            // pass the coordinates to the appropriate handler
            drawer[event.type](coors);
        }

        // attach the touchstart, touchmove, touchend event listeners.
        canvas.addEventListener('touchstart', draw, false);
        canvas.addEventListener('touchmove', draw, false);
        canvas.addEventListener('touchend', draw, false);

        // prevent elastic scrolling
        canvas.addEventListener('touchmove', function (event) {
									         	 	event.preventDefault();
							        		 }, false);
    } else {
        var img = new Image();

        // Creating a temp canvas
        var tmp_canvas = document.createElement('canvas');
        var tmp_ctx = tmp_canvas.getContext('2d');

        tmp_canvas.id = 'tmp_canvas_' + pageNumber;
        tmp_canvas.className = 'inlineCanvas';
        tmp_canvas.width = canvas.width;
        tmp_canvas.height = canvas.height;

        boxHandwritingCanvasDiv.appendChild(tmp_canvas);

        var mouse = {x: 0, y: 0};
        var last_mouse = {x: 0, y: 0};

        // Pencil Points
        var ppts = [];

        /* Mouse Capturing Work */
        tmp_canvas.addEventListener('mousemove', function (e) {
            mouse.x = typeof e.offsetX !== 'undefined' ? e.offsetX : e.layerX;
            mouse.y = typeof e.offsetY !== 'undefined' ? e.offsetY : e.layerY;
        }, false);

        canvas.addEventListener('mousemove', function (e) {
            mouse.x = typeof e.offsetX !== 'undefined' ? e.offsetX : e.layerX;
            mouse.y = typeof e.offsetY !== 'undefined' ? e.offsetY : e.layerY;
        }, false);

        /* Drawing on Paint App */
        tmp_ctx.lineWidth = lineWidth;
        tmp_ctx.lineJoin = 'round';
        tmp_ctx.lineCap = 'round';
        tmp_ctx.strokeStyle = colorVar;
        tmp_ctx.fillStyle = colorVar;

        tmp_canvas.addEventListener('mousedown', function (e) {
            hasHandwriting = true;

            tmp_canvas.addEventListener('mousemove', onPaint, false);

            mouse.x = typeof e.offsetX !== 'undefined' ? e.offsetX : e.layerX;
            mouse.y = typeof e.offsetY !== 'undefined' ? e.offsetY : e.layerY;

            ppts.push({x: mouse.x, y: mouse.y});

            onPaint();
        }, false);

        tmp_canvas.addEventListener('mouseup', function () {
            tmp_canvas.removeEventListener('mousemove', onPaint, false);

            ctx.globalCompositeOperation = 'source-over';

            // Writing down to real canvas now
            ctx.drawImage(tmp_canvas, 0, 0);
            // Clearing tmp canvas
            tmp_ctx.clearRect(0, 0, tmp_canvas.width, tmp_canvas.height);

            // Emptying up Pencil Points
            ppts = [];
        }, false);

        var onPaint = function () {

            // Saving all the points in an array
            ppts.push({x: mouse.x, y: mouse.y});

            if (ppts.length < 3) {
                var b = ppts[0];
                tmp_ctx.beginPath();
                //ctx.moveTo(b.x, b.y);
                //ctx.lineTo(b.x+50, b.y+50);
                tmp_ctx.arc(b.x, b.y, tmp_ctx.lineWidth / 2, 0, Math.PI * 2, !0);
                tmp_ctx.fill();
                tmp_ctx.closePath();

                return;
            }

            // Tmp canvas is always cleared up before drawing.
            tmp_ctx.clearRect(0, 0, tmp_canvas.width, tmp_canvas.height);

            tmp_ctx.beginPath();
            tmp_ctx.moveTo(ppts[0].x, ppts[0].y);

            for (var i = 1; i < ppts.length - 2; i++) {
                var c = (ppts[i].x + ppts[i + 1].x) / 2;
                var d = (ppts[i].y + ppts[i + 1].y) / 2;

                tmp_ctx.quadraticCurveTo(ppts[i].x, ppts[i].y, c, d);
            }

            // For the last 2 points
            tmp_ctx.quadraticCurveTo(
                    ppts[i].x,
                    ppts[i].y,
                    ppts[i + 1].x,
                    ppts[i + 1].y
            );
            tmp_ctx.stroke();

        };
    }
    checkPreviousBtnState();
}

    function changeHandwritingColor(colorName) {
        colorVar = colorName;
        for(i=1; i<=$(".handwritingCanvas").size(); ++i){
            if ('ontouchstart' in document.documentElement) {
                var canvas = $(".handwritingCanvas[data-pagenumber='"+ i +"']")[0];
                var ctx = canvas.getContext('2d');
                ctx.strokeStyle = colorVar;
                ctx.fillStyle = colorVar;
                // Hide Tmp Canvas
                canvas.style.display = 'block';
            } else {
                var tmp_canvas = $("#tmp_canvas_" + i )[0];
                var tmp_ctx = tmp_canvas.getContext('2d');
                
                tmp_ctx.strokeStyle = colorVar;
                tmp_ctx.fillStyle = colorVar;
                // Hide Tmp Canvas
                tmp_canvas.style.display = 'block';
            }
        }
    }

    function setPenSize(penSize) {
    	lineWidth = penSize;
    	for(i=1; i<=$(".handwritingCanvas").size(); ++i){
            if ('ontouchstart' in document.documentElement){
            	var canvas = $(".handwritingCanvas[data-pagenumber='"+ i +"']")[0];
                var ctx = canvas.getContext('2d');
                ctx.lineWidth = penSize;
            }else{
                var tmp_canvas = $("#tmp_canvas_" + i)[0];
                var tmp_ctx = tmp_canvas.getContext('2d');
                tmp_ctx.lineWidth = penSize;
            }
    	}
    }

    function nextHandwritingPage(){
    	var currentPageNumber = Number($(".handwritingCanvas[data-visiblity='visible']")[0].getAttribute("data-pagenumber"));
    	showHandwritingPage(currentPageNumber + 1);
    }
    
    function previousHandwritingPage(){
    	var currentPageNumber = Number($(".handwritingCanvas[data-visiblity='visible']")[0].getAttribute("data-pagenumber"));
    	showHandwritingPage(currentPageNumber - 1);
    }
    
    function checkPreviousBtnState(){
    	var currentPageNumber = Number($(".handwritingCanvas[data-visiblity='visible']")[0].getAttribute("data-pagenumber"));
    	if(currentPageNumber == 1){
    	    $('#handwriting_previousBtn').prop('disabled', true);
    	} else {
  			$('#handwriting_previousBtn').prop('disabled', false);
    	}
    	$(".currentPageNumberDiv").text(currentPageNumber);
    	$(".pageSizeNumberDiv").text($(".handwritingCanvas").size());
    }
    
    function showHandwritingPage(pageNumber){
    	if(pageNumber > $(".handwritingCanvas").size()){
    		makeHandwritingCanvas(pageNumber, null); // create New
    	}else{
    		$(".handwritingCanvas").hide();
    		$(".handwritingCanvas").attr("data-visiblity","hidden");
    		var activeCanvas = $(".handwritingCanvas[data-pagenumber='"+ pageNumber +"']");
    		activeCanvas.attr("data-visiblity","visible");
    		activeCanvas.show();
    		$(".inlineCanvas").css("z-index", 0);
    		$("#tmp_canvas_"+pageNumber).css("z-index", 999);
    	}
    	checkPreviousBtnState();
    }
    
    $(document).ready(function(){
     	var data = [
	    	<%if(handwritingFiles != null){
		    	for(File image : handwritingFiles){%>
		    		'<%=request.getContextPath() + "/clinic/patient/visitMobileBase/loadHandwritingImage?patientId=" + patientId + "&imgName=" + image.getName()%>',
		    	<%}
			}%>
		];
    	if(data.length > 0){
    		for(i=0; i<data.length; i++){
    			makeHandwritingCanvas(i+1, data[i]);
    		}
    	}else{
    		makeHandwritingCanvas(1, null);// init first empty canvas
    	}
    	
    });
</script>