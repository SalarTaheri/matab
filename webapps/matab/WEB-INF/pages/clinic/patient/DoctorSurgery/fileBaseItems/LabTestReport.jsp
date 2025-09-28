<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		

	<div id="labTestReport-table">
		<br>
		<div style="overflow-x: auto;overflow-y: auto; width:100%; height:100%; direction: ltr;">
			<table data-role="table"   id="labTestReport-table" 
				   style="width: 100%"
				   data-mode="reflow"
				   class="ui-body-d ui-shadow table-stripe ui-responsive ui-table-reflow" >
					<thead id="labTestReport-table-head" >
						<th colspan="100" >Lab Test Report</th>
					</thead>
				   
			</table>
		</div>				
	</div> 
		<script type="text/javascript">
		
		$(function(){
            var wWidth = $(window).width();
            var dWidth = wWidth * 0.8;
			$( "#labTestReport-table" ).dialog({
      			  autoOpen: false,
                  width:dWidth,
			      show: {
			        effect: "blind",
			        duration: 500
			      },
			      hide: {
			        effect: "slide",
			        duration: 500
			      },
                  position: { my: "right bottom", at: "center", of: window }
			  });
 
		    $( "#labTestReport-table-id" ).click(function() {
		      $( "#labTestReport-table" ).dialog( "open" );
		    });
            $( "#labTestReport-table-id-txt" ).click(function() {
		      $( "#labTestReport-table" ).dialog( "open" );
		    });
		
		
			$('div').on('pageshow',function(){
				window.parent.parent.window.scrollTo(); 
				$(".my-back-button").sticky({topSpacing: 0});
			    $(".my-back-button").css("min-width", $(".my-back-button").width());
			    $(".my-back-button").css("z-index", 99999);            
			});

		});
        jQuery('body')
                .bind(
                'click',
                function (e) {
                    if (
                            jQuery('#labTestReport-table').dialog('isOpen')
                                    && !jQuery(e.target).is('.ui-dialog, a')
                                    && !jQuery(e.target).closest('.ui-dialog').length
                                    && event.target.nodeName!="H2"
                            ) {
                        jQuery('#labTestReport-table').dialog('close');
                    }
                }
        );
		
		
		
		
		/*$(document).ready(function() {
				var tbl=document.getElementById('labTestReport-table');
				var thd=document.getElementById('labTestReport-table-head');
				var trh=document.createElement('tr');
				var th=document.createElement('th');
				th.setAttribute('class','label');
				th.appendChild(document.createTextNode('abba11111s'));
				trh.appendChild(th);

				var th2=document.createElement('th');
				var h_element1 = document.createElement('h4');
				h_element1.appendChild(document.createTextNode('abba2222s'));
				th2.appendChild(h_element1);
				trh.appendChild(th2);
				
				var th3=document.createElement('th');
				var h_element2 = document.createElement('h4');
				h_element2.appendChild(document.createTextNode('abbaqweqweqws'));
				th3.appendChild(h_element2);
				trh.appendChild(th3);
				
				thd.appendChild(trh);
				//for(var k=0;k<2;k++){
				//	var th=document.createElement('th');
				 //   th.appendChild(document.createTextNode(i));
				//    tr.appendChild(th)
				//}
				//thd.appendChild(tr);
				var tbdy=document.createElement('tbody');
				for(var i=0;i<4;i++){
				    var tr=document.createElement('tr');
				    var th1=document.createElement('th');
				    th1.appendChild(document.createTextNode('abbas'+i));
				    th1.setAttribute('class','label');
				    tr.appendChild(th1);
				    for(var j=0;j<2;j++){
				        var td=document.createElement('td');
				        td.appendChild(document.createTextNode('['+i+','+j+']'));
				        tr.appendChild(td)
				    }
				    tbdy.appendChild(tr);
				}
				
				tbl.appendChild(thd);
				tbl.appendChild(tbdy);
				//body.appendChild(tbl)
				})*/
        loadLabTestReport();
	function loadLabTestReport(){
        $.getJSON("<c:url value='/' />" + "clinic/patient/visitMobileBase/loadLabTestReport/" + ${patientId} , function(data) {
            var tbl=document.getElementById('labTestReport-table');
            var d5 = document.createElement("div");
            var tbdy=document.createElement('tbody');
            tbdy.id="tbody-id";
            tbdy.style.textAlign="center";

            for ( var i =0; i<data.length;i++) {
                var tr=document.createElement('tr');
                if(i==0){
                    tr.id="tr-header";

                }
                else if(i%2==0){
//                tr.bgColor="#5D7B9D";
                    tr.id="tr-even";
                }else{
                    tr.id="tr-odd";
                }
                //tr.style.backgroundImage ="red";
                for ( var j =1; j<data[i].length;j++) {
                    var td=document.createElement('td');
                    td.style.width="10%";
                    td.appendChild(document.createTextNode(data[i][j]));
                    tr.appendChild(td);
                }
                tbdy.appendChild(tr);
            }
            tbl.appendChild(tbdy);
            var tabs=$("li[role=tab]");
            for(var i=0;i<tabs.length;i++){
                if(tabs[i].className.indexOf('ui-tabs-active ui-state-active')>-1){
                    tabs[i].className=tabs[i].className.replace(/\bui-state-default\b/,'');
                }
            }
        });
    }
    function emptyLabTestReport(){
        $("#labTestReport-table").empty();
    }

				
		</script>
<style>
			.phone-compare .ui-shadow .table-stroke
			{
			background-color: lightgray;
			background-color: gainsboro;
			border: 1px solid black;
			height: 100%;
			width: 100%;
			font-weight: bold;
			text-align: center;
			padding: 30px;
			}
			
			#labTestReport-table{
				direction: ltr;
			}
			
			#labTestReport-table  tr:first-child td{
			    color: rgb(0, 31, 255);;
				font-weight: bold;

			}

            #labTestReport-table  tr  td{
                border: 1px solid black;
                /*width: 25%*/
                /*border-collapse: separate;*/
                /*border-spacing: 4px;*/

			}
			
			#labTestReport-table  td:first-child{
				color: #000000;
				font-weight: bold;				
			}

            #tr-header{
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#b8e1fc), color-stop(10%,#a9d2f3), color-stop(25%,#90bae4), color-stop(37%,#90bcea), color-stop(50%,#90bff0), color-stop(51%,#6ba8e5), color-stop(83%,#a2daf5), color-stop(100%,#bdf3fd));
            }

            #tr-even{
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#deefff), color-stop(100%,#98bede));
            }


            /*#tbody-id{*/
                /*display:block;*/
                /*border: 2px solid black;*/
                /*border-collapse: separate;*/
                /*border-spacing: 4px;*/
            /*}*/

            /*#labTestReport-table tr {*/
                /*border: 10px;*/
            /*}*/


</style>
