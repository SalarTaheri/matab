<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="labTestReport-table">

</div>

<script type="text/javascript">
    var labTestReportWasSeen=false;
    var categoryLabTestShowColumn={};
    var categoryLabTestForSaving={};
	$(function() {
		var wWidth = $(window).width();
		var dWidth = wWidth * 0.8;
		$("#labTestReport-table").dialog({
			title: "Lab Test Report",
			autoOpen : false,
			width : dWidth,
			show : {
				effect : "blind",
				duration : 500
			},
			hide : {
				effect : "slide",
				duration : 500
			},close: function( event, ui ) {
                $.ajax({
                    url: '${pageContext.request.contextPath}' + '/clinic/patient/configurablePatientRecord/saveLabTestReportShowingState/',
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(categoryLabTestForSaving),
                    dataType: 'json',
                    type: 'POST',
                    success: function (result, success, xhr) {
                        // if (result.state == "error") {
                        //
                        // }else{
                        //
                        // }
                    },
                    error: function (e) {

                    }
                });
			}
		});

		$("#labTestReport-table-id").click(function() {
			$("#labTestReport-table").dialog("open");
		});
		
		$("#labTestReport-table-id-txt").click(function() {
			$("#labTestReport-table").dialog("open");
		});

		$('div').on('pageshow', function() {
			window.parent.parent.window.scrollTo();
			$(".my-back-button").sticky({
				topSpacing : 0
			});
			$(".my-back-button").css("min-width", $(".my-back-button").width());
			$(".my-back-button").css("z-index", 99999);
		});
        checkNewLabTestReport();
	});
	
	jQuery('body').bind('click',function(e) {
				if (jQuery('#labTestReport-table').dialog('isOpen') && !jQuery(e.target).is('.ui-dialog, a') && !jQuery(e.target).closest('.ui-dialog').length
						&& event.target.nodeName != "H2") {
					jQuery('#labTestReport-table').dialog('close');
				}
	});

	loadLabTestReport();

	function loadLabTestReport() {
		var currentLabTestWithValueArray = $('#table').parent().find('textarea');
		var currentLabTestWithValueMap = [];
		if (currentLabTestWithValueArray.length > 0) {
			for (var w = 0; w < currentLabTestWithValueArray.length; w++) {
				var obj = {};
				obj.id = currentLabTestWithValueArray[w].id;
				obj.text = $('#' + currentLabTestWithValueArray[w].id).parent().parent()[0].firstChild.textContent;
				obj.value = currentLabTestWithValueArray[w].value;
				obj.date = $('#table').parent().find('input:text')[w].value;
				currentLabTestWithValueMap.push(obj);
			}
		}
		var currentLabTestWithValueMapJson = JSON.stringify(currentLabTestWithValueMap);
		//
		$.ajax({
			url: "<c:url value='/' />" + "clinic/patient/visitMobileBase/loadLabTestReport",
			data:{'patientId' : ${patientId} , 'labTest' : currentLabTestWithValueMapJson},
			type: 'POST',
			success: function (data, success, xhr) {
				var tbl = document.getElementById('labTestReport-table');
				var d5 = document.createElement("div");
				d5.style.overflow="auto";
				var tbdy = document.createElement('tbody');
				tbdy.id = "tbody-id";
				tbdy.style.textAlign = "center";
                var hasCheckBox=false;
				//
				//init categoryLabTestShowColumn
                categoryLabTestShowColumn={};
				for(var j=3;j<data[0].length;j++){
                    categoryLabTestShowColumn[data[0][j]]=data[data.length-1][j];
                }
				for (var i = 0; i < data.length-1; i++) {
					var tr = document.createElement('tr');
					if (i == 0) {
						tr.id = "tr-header";
					} else if (i % 2 == 0) {
						tr.id = "tr-even";
					} else {
						tr.id = "tr-odd";
					}
					if(i<=data.length-3) {
                        for (var j = 1; j < data[i].length; j++) {
                            var td = document.createElement('td');
                            td.id='td-'+i+'-'+j;
                            td.className='col-'+j;
                            td.style.width = "5%";
                            td.appendChild(document.createTextNode(data[i][j]));
                            tr.appendChild(td);
                        }
                    }else{
                        for (var j = 1; j<=2; j++) {
                            var td = document.createElement('td');
                            td.style.width = "5%";
                            td.className='col-'+j;
                            td.appendChild(document.createTextNode(' '));
                            tr.appendChild(td);
                        }

                        for (var j = 3; j < data[i].length; j++) {
                            var td = document.createElement('td');
                            td.className='col-'+j;
                            var x = document.createElement("INPUT");
                            x.setAttribute("type", "checkbox");
                        	x.onclick = function (e) {
                        	  if($('#'+this.id).prop('checked')){
                                  $(".col-"+this.id.split('-')[2]).show();
                                  userLabtestItemId=categoryLabTestShowColumn[$("#td-0-"+this.id.split('-')[2]).text()];
                                  categoryLabTestForSaving[userLabtestItemId]=false;
                              }else{
                                  $(".col-"+this.id.split('-')[2]).hide();
                                  userLabtestItemId=categoryLabTestShowColumn[$("#td-0-"+this.id.split('-')[2]).text()];
                                  categoryLabTestForSaving[userLabtestItemId]=true;
                              }
                            }
                            if(data[i][j]=='true'){
                                x.checked=false;
                                x.id='checkbox-'+i+'-'+j;
                                td.appendChild(x);
                                hasCheckBox=true;
                            }else if(data[i][j]=='false'){
                                x.checked=true;
                                x.id='checkbox-'+i+'-'+j;
                                td.appendChild(x);
                                hasCheckBox=true;
                            }else{
                                td.appendChild(document.createTextNode(' '));
                            }
                            td.style.width = "5%";

                            tr.appendChild(td);
                        }
                    }
					tbdy.appendChild(tr);
				}
                var input = document.createElement("INPUT");
                input.value="Show All";
                input.className="uk-button uk-button-mini uk-button-success";
                input.style.width='20%';
                input.style.height='50px';
                input.setAttribute("type", "button");
                input.onclick=function(e){
                    for(var i=0;i<data[data.length-2].length;i++){
                        $(".col-"+i).show();
                    }

                };
                if(hasCheckBox){
                    tbl.appendChild(input);
                }
                d5.appendChild(tbdy)
				tbl.appendChild(d5);
                for(var i=0;i<data[data.length-2].length;i++){
                    if(data[data.length-2][i]=='true'){
                        $(".col-"+i).hide();
                    }else if(data[data.length-2][i]=='false'){
                        $(".col-"+i).show();
                    }

                }


				var tabs = $("li[role=tab]");
				for (var i = 0; i < tabs.length; i++) {
					if (tabs[i].className.indexOf('ui-tabs-active ui-state-active') > -1) {
						tabs[i].className = tabs[i].className.replace(/\bui-state-default\b/, '');
					}
				}
			}
		});
	}
	
	function emptyLabTestReport() {
		$("#labTestReport-table").empty();
	}

	function resetLabTestReportTable(){
		emptyLabTestReport();
		loadLabTestReport();
	}


    function checkNewLabTestReport(){

        $.getJSON("<c:url value='/' />" + "clinic/patient/configurablePatientRecord/loadByPatientHasLabTestNewReport/" + ${patientId} , function(data) {
            var visitId = "${visitId}";
            var hasPatientNewLabTestReport = data.hasPatientNewLabTestReport;
            var hasPatientLabTestReport = data.hasPatientLabTestReport;
            if(hasPatientLabTestReport){
                activeGreenShinyLabtestReport();
            }
            checkForBlinkLabTestReport(visitId, hasPatientNewLabTestReport);
        });
    }


    function checkForBlinkLabTestReport(visitId, hasPatientNewLabTestReport){
        if((visitId == null || visitId == "0") && (hasPatientNewLabTestReport == true)){//page in new mode
            if($("#labTestReport-table").children().size() > 0){
                blinkLabTestReport(true);
            }
        }
    }

    function blinkLabTestReport(flag){
        disableGreenShinyLabtestReport();
        setTimeout(function() {
            if(flag){
                $("li[aria-controls='labTestReport']").removeClass("rightTabLiColor");
                $("li[aria-controls='labTestReport']").children().css("color", "black");
            }else{
                $("li[aria-controls='labTestReport']").addClass("rightTabLiColor");
                $("li[aria-controls='labTestReport']").children().css("color", "white");
            }
            if (!labTestReportWasSeen) {
                blinkLabTestReport(!flag);
            }else{
                activeGreenShinyLabtestReport();
            }
        }, 700);
    }

    function activeGreenShinyLabtestReport() {
        $("li[aria-controls='labTestReport']").addClass("greenShine");
    }
    function disableGreenShinyLabtestReport() {
        $("li[aria-controls='labTestReport']").removeClass("greenShine");
    }

    $("a[href='#labTestReport']").click(function() {
        labTestReportWasSeen = true;
    });

</script>

<style>
.phone-compare .ui-shadow .table-stroke {
	background-color: lightgray;
	background-color: gainsboro;
	border: 1px solid black;
	height: 100%;
	width: 100%;
	font-weight: bold;
	text-align: center;
	padding: 30px;
}

#labTestReport-table {
	direction: ltr;
}

#labTestReport-table  tr:first-child td {
	color: rgb(0, 31, 255);;
	font-weight: bold;
}

#labTestReport-table  tr  td {
	border: 1px solid black;
	font-size: 28px !important;
	padding: 5px;
}

#labTestReport-table  td:first-child {
	color: #000000;
	font-weight: bold;
}

#tr-header {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #b8e1fc), color-stop(10%, #a9d2f3), color-stop(25%, #90bae4), color-stop(37%, #90bcea), 
			color-stop(50%, #90bff0), color-stop(51%, #6ba8e5), color-stop(83%, #a2daf5), color-stop(100%, #bdf3fd));
}

#tr-even {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #deefff), color-stop(100%, #98bede));
}
</style>
