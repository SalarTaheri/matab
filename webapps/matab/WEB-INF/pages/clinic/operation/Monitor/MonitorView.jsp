
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
    <%--<script src="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/development-bundle/jquery-1.10.2.js' />"></script>--%>
    <%--<script src="<c:url value='/resources/jquery-ui.js'/>"></script>--%>
    <%--<link href="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/development-bundle/themes/base/jquery-ui.css'/>" rel="stylesheet" />--%>
    <%--<script src="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.js' />"></script>--%>
    <%--<link href="<c:url value='/resources/persianDatepicker-master/css/persianDatepicker-default.css'/>" rel="stylesheet" />--%>
	<%--<script src="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/js/jquery-ui-1.10.4.custom.min.js'/>"></script>--%>
    <%--<script src="<c:url value='/resources/persianDatepicker-master/js/persianDatepicker.js'/>"></script>--%>
    <%--<script src="<c:url value='/resources/jsUtil/mehrSysDateUtil.js'/>"></script>--%>
  <style>
  #button { padding: .5em 1em; text-decoration: none; }
  #effect h3 { margin: 0; padding: 0.4em; text-align: center;background: cornsilk;height: 50px; }
  </style>
  <script>
  $(document).ready(function(){
      $("#effectTypes").hide();
  });
  	var counter=1;
  	var pageNumber=1;
    var doctorId=-1;
  	var showFlg=true;
  	runEffect();
  	var intervalID = setInterval(function(){runEffect();}, 8000);
    // run the currently selected effect
    function runEffect() {
	$( "#effect:visible" ).removeAttr( "style" ).fadeOut()
//		drawQueueTable();
		drawQueueTablePerPage();
      // get effect type from
      var selectedEffect = $( "#effectTypes" ).val();
 
      // most effect types need no options passed by default
      var options = {};
      // some effects have required parameters
      if ( selectedEffect === "scale" ) {
        options = { percent: 100 };
      } else if ( selectedEffect === "size" ) {
        options = { to: { width: 280, height: 185 } };
      }
 
      // run the effect
      $( "#effect" ).show( selectedEffect, options, 500, callback );
    };
 
    //callback function to bring a hidden box back
    function callback() {
      //setTimeout(function() {
      //  $( "#effect:visible" ).removeAttr( "style" ).fadeOut();
      //}, 6000 );
    };
    
    //$( "#effect" ).hide();
    
    
function drawQueueTable(){

	counter+=1;
     $.getJSON("<c:url value='/' />" + "clinic/operation/monitor/loadQueue/"+counter , function(data) {
		try{
	    	deleteRow('queue-table');
		}catch(e){

		}
		     		
		if(data.length>0){
			makeTable(data);
		}	        
	  });
}
function drawQueueTablePerPage(){


    $.getJSON("<c:url value='/' />" + "clinic/operation/monitor/loadQueuePaging/"+doctorId+"/"+pageNumber , function(data) {

        try{
            deleteRow('queue-table');
        }catch(e){

        }

        if(data.length>0){
            pageNumber=data[0].pageNumber;
            doctorId=data[0].drId;
            makeTable(data);
        }
        pageNumber+=1;
    });
}


function makeTable(data){
    queueRowCount=data.length;
    if(data[0].drId==5030){
        $("#dr-h3").text(" پروفسور " + data[0].drFam.substring(4));
    }else{
        $("#dr-h3").text(data[0].drFam);
    }

    /////////////////////////////////////////

    var tbl=document.getElementById('queue-table');
    tbl.setAttribute('style', 'width: 100%');
    var tbdyPos=document.createElement('tbody');

    var tr = document.createElement("tr");
    tr.style.background= 'linear-gradient(to bottom, rgba(212,225,241,1) 29%,rgba(201,218,238,1) 33%,rgba(228,240,253,1) 100%)';
    tr.style.height='60px';
<%-- var th1 = document.createElement("th");
            th1.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("global.row") %>'));
            th1.setAttribute('style', 'width: 5%');
            th1.setAttribute('style', 'font-size: 30px !important;'); --%>
<%-- var th2 = document.createElement("th");
            th2.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.monitor.fileNumber") %>'));
            th2.setAttribute('style', 'width: 10%');
            th2.setAttribute('style', 'font-size: 20px !important;'); --%>
    var th2 = document.createElement("th");
    <%--th2.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.monitor.nameAndFam") %>'));--%>
    th2.setAttribute('style', 'width: 5%');
    th2.setAttribute('style', 'font-weight: bold;font-size: 56px !important;font-family:b nazanin !important');

    var th3 = document.createElement("th");
    th3.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.monitor.nameAndFam") %>'));
    th3.setAttribute('style', 'width: 30%');
    th3.setAttribute('style', 'font-weight: bold;font-size: 56px !important;font-family:b nazanin !important');

    var th3_1 = document.createElement("th");
    th3_1.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.monitor.service") %>'));
    th3_1.setAttribute('style', 'width: 30%');
    th3_1.setAttribute('style', 'font-weight: bold;font-size: 56px !important;font-family:b nazanin !important');

    var th4 = document.createElement("th");
    th4.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.monitor.time") %>'));
    th4.setAttribute('style', 'width: 10%');
    th4.setAttribute('style', 'font-weight: bold;font-size: 56px !important;font-family:b nazanin !important');

    var th5 = document.createElement("th");
    th5.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.monitor.number") %>'));
    th5.setAttribute('style', 'width: 10%');
    th5.setAttribute('style', 'font-weight: bold;font-size: 56px !important;font-family:b nazanin !important');

    var th6 = document.createElement("th");
    th6.appendChild(document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.operation.monitor.state") %>'));
    th6.setAttribute('style', 'width: 10%');
    th6.setAttribute('style', 'font-weight: bold;font-size: 56px !important;font-family:b nazanin !important');
    //tr.appendChild(th1);
     //tr.appendChild(th2);
    tr.appendChild(th3);
    tr.appendChild(th3_1);
    tr.appendChild(th4);
    tr.appendChild(th5);
//    tr.appendChild(th6);
    tbdyPos.appendChild(tr);


    if(queueRowCount>0){
        for(i=0;i<data.length;i++){
            var tr = document.createElement("tr");
            tr.style.height = '110px';
            //tr.style.font-weight = '900';
            if (i%2 !=0){
                tr.style.backgroundColor = 'rgb(221, 220, 220)';
                tr.style.height = '110px';
                //tr.style.font-weight = '900';
            }
            /* var td1 = document.createElement("td");
             td1.align='center';
             td1.appendChild(document.createTextNode(i+1));
             td1.setAttribute('style', 'width: 5%');
             td1.setAttribute('style', 'font-size: 40px !important;'); */
            /* var td2 = document.createElement("td");
             td2.align='center';
             td2.style.paddingRight='5px';
             td2.appendChild(document.createTextNode(data[i].fileNumber));
             td2.setAttribute('style', 'width: 10%');
             td2.setAttribute('style', 'font-size: 40px !important;'); */
            var td2 = document.createElement("td");
            td2.align='left';
            td2.style.paddingRight='5px';
            td2.appendChild(document.createTextNode(addCommaSeparator(data[i].row)));
//            if(addCommaSeparator(data[i].nameAndFam).length>17){
//                td2.setAttribute('style', 'font-weight: bold;font-size: 30px !important;font-family:b nazanin !important');

//            }else{
                td2.setAttribute('style', 'font-weight: bold;font-size: 58px !important;font-family:b nazanin !important');
//
//            }
            var td3 = document.createElement("td");
            td3.style.paddingRight='5px';
            td3.appendChild(document.createTextNode(addCommaSeparator(data[i].nameAndFam)));
            if(addCommaSeparator(data[i].nameAndFam).length>20){
                td3.setAttribute('style', 'font-weight: bold;font-size: 30px !important;font-family:b nazanin !important');

            }else{
                td3.setAttribute('style', 'font-weight: bold;font-size: 58px !important;font-family:b nazanin !important');

            }

            var td3_1 = document.createElement("td");
            td3_1.align='center';
            td3_1.style.paddingRight='5px';
            td3_1.appendChild(document.createTextNode(addCommaSeparator(data[i].serviceName)));
            if(addCommaSeparator(data[i].serviceName).length>20){
                td3_1.setAttribute('style', 'font-weight: bold;font-size: 20px !important;font-family:b nazanin !important');

            }else{
                td3_1.setAttribute('style', 'font-weight: bold;font-size: 58px !important;font-family:b nazanin !important');

            }
//							td3.setAttribute('style', 'width: 30%');
//							td3.setAttribute('style', 'font-size: 58px !important;');
            td3.align='center';
            var td4 = document.createElement("td");
            td4.align='center';
            td4.style.paddingRight='5px';
            td4.appendChild(document.createTextNode(addCommaSeparator(data[i].time)));
            td4.setAttribute('style', 'width: 10%');
//            td4.setAttribute('style', 'font-weight: bold;font-size: 52px !important;font-family:b nazanin !important');
            if(addCommaSeparator(data[i].time).length>5){
                td4.setAttribute('style', 'font-weight: bold;font-size: 30px !important;font-family:b nazanin !important');

            }else{
                td4.setAttribute('style', 'font-weight: bold;font-size: 52px !important;font-family:b nazanin !important');

            }

            var td5 = document.createElement("td");
            td5.align='center';
            td5.style.paddingRight='5px';
            /*if(data[i].answerLabtest!=undefined){
                var span1=document.createElement("span");
                span1.appendChild(document.createTextNode(data[i].turn));
                span1.setAttribute('style', 'font-size: 58px !important;');

                var span2=document.createElement("span");
                span2.appendChild(document.createTextNode(data[i].answerLabtest));
                span2.setAttribute('style', 'font-weight: bold;font-size: 35px !important;');
//                td5.appendChild(document.createTextNode(data[i].turn+ data[i].answerLabtest));
                td5.appendChild(span1);
                td5.appendChild(span2);

            }else if(data[i].questionDrug!=undefined){
//                td5.appendChild(document.createTextNode(data[i].turn+ data[i].questionDrug));
//                td5.setAttribute('style', 'font-size: 40px !important;');
                var span1=document.createElement("span");
                span1.appendChild(document.createTextNode(data[i].turn));
                span1.setAttribute('style', 'font-size: 58px !important;');

                var span2=document.createElement("span");
                span2.appendChild(document.createTextNode(data[i].questionDrug));
                span2.setAttribute('style', 'font-weight: bold;font-size: 35px !important;');
//                td5.appendChild(document.createTextNode(data[i].turn+ data[i].answerLabtest));
                td5.appendChild(span1);
                td5.appendChild(span2);
            }else{*/
                td5.appendChild(document.createTextNode(data[i].turn));
                td5.setAttribute('style', 'width: 10%');
                td5.setAttribute('style', 'font-weight: bold;font-size: 58px !important;font-family:b nazanin !important');
//            }

            var td6 = document.createElement("td");
            td6.align='center';
            td6.style.paddingRight='5px';
            td6.appendChild(document.createTextNode(data[i].state));
            td6.setAttribute('style', 'width: 10%');
            td6.setAttribute('style', 'font-weight: bold;font-size: 52px !important;font-family:b nazanin !important');

            //tr.appendChild(td1);
            //tr.appendChild(td2);
            tr.appendChild(td3);
            tr.appendChild(td3_1);
            tr.appendChild(td4);
            tr.appendChild(td5);
//            tr.appendChild(td6);
            tbdyPos.appendChild(tr);
        };
        ///////////////////////////////////////////
    }
    var tr = document.createElement("tr");
    tr.style.background= '-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(126,133,144,1)), color-stop(49%,rgba(40,49,67,1)), color-stop(50%,rgba(19,30,50,1)), color-stop(100%,rgba(3,14,35,1)))';
    tr.style.color= '#ffffff';

    // var td1 = document.createElement("td");
     var td2 = document.createElement("td");
    var td3 = document.createElement("td");
    var td4 = document.createElement("td");
    var td5 = document.createElement("td");
    var td6 = document.createElement("td");
    //td1.setAttribute('style', 'width: 5%');
    td2.setAttribute('style', 'width: 4%');
    td3.setAttribute('style', 'width: 30%');
    td4.setAttribute('style', 'width: 15%');
    td5.setAttribute('style', 'width: 10%');
    td6.setAttribute('style', 'width: 10%');
    //tr.appendChild(td1);
    //tr.appendChild(td2);
    tr.appendChild(td3);
    tr.appendChild(td4);
    tr.appendChild(td5);
    tr.appendChild(td6);
    tbdyPos.appendChild(tr);
    tbl.appendChild(tbdyPos);
}
    
function deleteRow(tableID) {
    try {
        var table = document.getElementById(tableID);
        var rowCount = table.rows.length;
        for (var i = 0; i < rowCount; i++) {
            var row = table.rows[i];
            /*var chkbox = row.cells[0].childNodes[0];*/
            /*if (null != chkbox && true == chkbox.checked)*/
                table.deleteRow(i);
                rowCount--;
                i--;
            };
    } catch (e) {
        alert(e);
    };
    //getValues();
}
function showHide(){
	var pp=parent.document.getElementById("header") ;
	console.log(pp);
	
	  if(showFlg){
  			pp.style.display='none';
  			showFlg=false;
  		}else{
  			pp.style.display='block';
  			showFlg=true;
  		}
}

  </script>
</head>
<body>
 
<div class="toggler">
  <div id="effect" class="ui-widget-content ui-corner-all" align="center" style="width: 100%" id="div_for_handle_click">
    <h3 class="ui-widget-header ui-corner-all" id="dr-h3" onclick="javascript:showHide()" style="font-size: 58px !important;padding-top:40px;font-family:b nazanin !important">
    </h3>
    
		<table id="queue-table" align="center" width="100%" border="1" style="font-size: 30px !important; padding-top:40px;">
		</table>      
    
  </div>
</div>
 
<select name="effects" id="effectTypes">
  <option value="blind">Blind</option>
  <option value="bounce">Bounce</option>
  <option value="clip">Clip</option>
  <option value="drop">Drop</option>
  <option value="explode">Explode</option>
  <option value="fold">Fold</option>
  <option value="highlight">Highlight</option>
  <option value="puff">Puff</option>
  <option value="pulsate">Pulsate</option>
  <option value="scale">Scale</option>
  <option value="shake">Shake</option>
  <option value="size">Size</option>
  <option value="slide">Slide</option>
</select>
 
 
 
</body>
</html>