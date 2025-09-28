<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="labTestReport-table">
	<br>
	<div style="overflow-x: auto;overflow-y: auto; width:100%; height:100%; direction: ltr;">
		<table data-role="table" id="labTestReport-table" style="width: 100%" data-mode="reflow" class="ui-body-d ui-shadow table-stripe ui-responsive ui-table-reflow">
		</table>
	</div>
</div>

<script type="text/javascript">
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
				var tbdy = document.createElement('tbody');
				tbdy.id = "tbody-id";
				tbdy.style.textAlign = "center";
				//
				for (var i = 0; i < data.length; i++) {
					var tr = document.createElement('tr');
					if (i == 0) {
						tr.id = "tr-header";
					} else if (i % 2 == 0) {
						tr.id = "tr-even";
					} else {
						tr.id = "tr-odd";
					}
					for (var j = 1; j < data[i].length; j++) {
						var td = document.createElement('td');
						td.style.width = "5%";
						td.appendChild(document.createTextNode(data[i][j]));
						tr.appendChild(td);
					}
					tbdy.appendChild(tr);
				}
				tbl.appendChild(tbdy);
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
	font-size: 18px !important;
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
