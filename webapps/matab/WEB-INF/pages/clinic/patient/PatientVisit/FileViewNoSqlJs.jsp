<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<script type="text/template" id="p_diag_page">
    <form class="p-myform uk-panel uk-panel-box uk-form uk-form-horizontal" id="diag_page_{{=it.uid}}" dir="ltr">
        <h3 class="cf-title uk-panel-title">{{=it.title}}</h3>
    		<div class="" style="margin-top: 20px;">
        		<ul class="uk-tab p-tab" data-uk-tab="{connect:'#diag-pages-tabs'}">
					{{=it.tabs}} 
				</ul>
        		
				<ul id="diag-pages-tabs" class="uk-switcher uk-margin"  style="margin-top: 20px;" >
					{{=it.pages}} 
				</ul>
    		</div>
    		<div style="display:none;" id="pages"></div>
    </form>
</script>
<script type="text/template" id="p_kanban_tmpl_static">
    <div class="uk-width-1-5 p-kanban-card" id="card_{{=it.uid}}">
        <div class="uk-panel uk-panel-box">
            <div class="p-kanban-pin uk-badge uk-panel-badge">
                <img alt="" src="<c:url value='/resources/clinic/pin-blue.png'/>">
            </div>
            <h3 class="uk-panel-title">{{=it.title }}</h3>
            <div class="p-card-links">
                <a class="p-card-details" data-isStatic="{{=it.isStatic}}" href="#">Details</a>
            </div>
        </div>
    </div>
</script>
<script type="text/template" id="p_kanban_tmpl">
    <div class="uk-width-1-5 p-kanban-card" id="card_{{=it.uid}}">
        <div class="uk-panel uk-panel-box">
            <h3 class="uk-panel-title">{{=it.title }}</h3>
            <div class="p-card-links">
                <a class="p-card-details" data-isStatic="{{=it.isStatic}}" href="#">Details</a>
            </div>
        </div>
    </div>
</script>
<script type="text/template" id="p_kanban_card_tmpl">
    <div class="uk-width-1-5 p-kanban-card" id="card_{{=it.uid}}">
        <div class="uk-panel uk-panel-box">            
            <h3 class="uk-panel-title">{{=it.title }}</h3>
            <div class="p-card-links">
                <a class="p-card-diagnosis-details" data-id="{{=it.id}}" href="#">Details</a>
            </div>
        </div>
    </div>
</script>

<script type="text/javascript">
	var diagnosisRelation = {};
	//سرطان
	diagnosisRelation["1"] = [pageSonography,pageRiskFactorBeforeDX,pageSymptomsAndSignsAtOnset,pageSymptomsAndSignsAtOnsetFollowUp, pageCBC, pageAscitis, pageLFT];
	
</script>

<script>
var staticPagesData = "";
$.getJSON(basePath.replace("/file/", "/load/") , function(data) {
    staticPagesData = data;
});

$("#p-PhysicalExam").chosen({
	width : "100%"
});

$("#simple_sketch").chosen({
	width : "100%"
});





var kanbanTmpl;
var kanbanCardTmpl;
var kanbanStaticTmpl;

		
$(function(){
    var i = 0;
    /* for(i=0; i<pages.length; i++){

    } */

    var i=0, page;

    kanbanTmpl = doT.template($("#p_kanban_tmpl").html());
    kanbanStaticTmpl = doT.template($("#p_kanban_tmpl_static").html());
    kanbanCardTmpl = doT.template($("#p_kanban_card_tmpl").html());

    for(i=0; i<pages.length; i++){
        page = pages[i];
        extend(page, PageMixin);
        page.index = i + 1;
        page.uid = "q_page_" + page.id();

        if(page.isStatic){
            //$("#p-kanban-static").append(kanbanStaticTmpl(page));
        }else{
            appendKanbanPage(page, kanbanTmpl);
        }

    }

    $("#p-card-navigator-right").click(function(e){
        cardNavigator(e, 1);
    });
    $("#p-card-navigator-left").click(function(e){
        cardNavigator(e, -1);
    });

    bindFunctionalityToCards();
    
    initDescriptAutocomplate();
    initPhysicalExamAutocomplate();
    
    $("#saveTokens").click(saveTokens);
    $("#p-btn-save").click(saveForm);
    //$("#p-btn-visit").click(newVisit);
    
    
    $.getJSON("<c:url value='/' />" + "clinic/medicaltest/medicalTest/loadMedicalTest" , function(data) {
		for ( var i = 0; i < data.length; i++) {
			$("#p-medical-test").append(
					"<option value='" + data[i].ComboID + "' >" + data[i].ComboCaption + "</option>")
		}

		$("#p-medical-test").chosen({
			width : "100%"
		});
	});
	
	
    $.getJSON("<c:url value='/' />" + "clinic/drug/drug/combo/loadDrugGet" , function(data) {
		for ( var i = 0; i < data.length; i++) {
			$("#p-drug").append(
					"<option value='" + data[i].ComboID + "' >" + data[i].ComboCaption + "</option>")
		}

		$("#p-drug").chosen({
			width : "100%"
		});
		
	});

    $.getJSON("<c:url value='/' />" + "clinic/basicInfo/diagnosis/combo/loadAllDiagnosisGet" , function(data) {
		for ( var i = 0; i < data.length; i++) {
			$("#p-diagnosis").append("<option value='" + data[i].ComboID + "' >" + data[i].ComboCaption + "</option>")
		}

		$("#p-diagnosis").chosen({
			width : "100%"
		});
		
		$("#p-diagnosis").change(diagnosisOnChange);
		
	});
	
	 $.getJSON("<c:url value='/' />" + "clinic/basicInfo/diagnosis/combo/loadAllDiagnosisGet" , function(data) {
		for ( var i = 0; i < data.length; i++) {
			$("#p-MedicalHistory").append("<option value='" + data[i].ComboID + "' >" + data[i].ComboCaption + "</option>")
		}

		$("#p-MedicalHistory").chosen({
			width : "100%"
		});
		
		//$("#p-MedicalHistory").change(diagnosisOnChange);
		
	});

    $.getJSON("<c:url value='/' />" + "clinic/medicaltest/medicalTest/loadMedicalTestForPatient/" + 1  , function(data) {
		for ( var i = 0; i < data.length; i++) {
			$("#p-last-medical-test").append(
					"<option value='" + data[i].ComboID + "' >" + data[i].ComboCaption + "</option>")
		}

		$("#p-last-medical-test").chosen({
			width : "100%"
		});
		
		
	});
	
	
    updateVisitCount(true);
    
    $("#p-visit-right").click(function(e){
    	visitNavigator(e, 1);
    });
    $("#p-visit-left").click(function(e){
    	visitNavigator(e, -1);
    });
    
   
    
});

function diagnosisOnChange(){
	var ids = $(this).val();
   	var rel;
   	for(var i=0; i<ids.length; i++){
   		rel = diagnosisRelation[ids[i].toString()];
   		if(rel != undefined){
   			var page = {};
   			page.id = ids[i];
   			page.index = i + 1;
        	page.uid = "q_page_" +  ids[i];
        	page.title =  $("#p-diagnosis option[value=" + ids[i] + "]").text();
   			$("#p-diagnosis-cards").append(kanbanCardTmpl(page));
   		}
   	}
   	detailsClickHandller();
}

function cardNavigator(e, step){
    var count = parseInt($("#p-card-navigator-count").text());
    var curr = parseInt($("#p-card-navigator-current").text());
    curr += step;
    if(curr > count)
        curr = 1;
    if(curr < 1)
        curr = count;
    $("#p-card-navigator-current").text(curr);
    var uid = $("#p-card-view-pages form:visible").attr("id");
    loadPage(uid, curr);

    e.preventDefault();
}

var currentLoadedPageId;
function loadPage(uid, index){
    var page = pages.filter(function(page) {
        return page.uid == uid;
    })[0];
    $.getJSON(basePath.replace(/file\/\w*/, "file/load/" + page.id() + "/" + masterId + "/" + index) , function(data) {
        Clinic.populatePage(data);
        currentLoadedPageId = data._id.$oid;
    });
}

function appendKanbanPage(page, kanbanTmpl){
    /* 
    $.getJSON(basePath.replace("/file/", "/file/count/") + "/" + page.id() , function(data) {
        page.count = data.count;
        if(data.count > 0)
            $("#p-kanban-main").append(kanbanTmpl(page));
        else
            $("#p-kanban-unused").append(kanbanTmpl(page));

    }).fail(function(){
    	page.count = "?";
    	$("#p-kanban-unused").append(kanbanTmpl(page));
    }).always(function(){
    	detailsClickHandller();
        prescriptionClickHandller();
        unusedCardsClickHandller();
    });
     */
     
	page.count = "?";
	//$("#p-kanban-unused").append(kanbanTmpl(page));
	detailsClickHandller();
	prescriptionClickHandller();
	unusedCardsClickHandller();
}

var viewPageSlide, kanbanPageSlide;

function bindFunctionalityToCards(){
    unusedCardsClickHandller();

    viewPageSlide = kendo.fx($("#p-card-view-page")).slideIn("right");
    kanbanPageSlide = kendo.fx($("#p-kanban-view-page")).slideIn("right");

    detailsClickHandller();
    prescriptionClickHandller();

    $("#p-btn-card-back").click(function(){
        $("form.p-myform").hide();
        viewPageSlide.reverse();
        $("#p-card-view-page").hide();
        kanbanPageSlide.play();
        detailsClickHandller();
    });

    $("#p-btn-card-save").click(function(){
        var uid = $("#p-card-view-pages form:visible").attr("id");
        savePage(uid);
    });

    $("#p-btn-card-prescription").click(function(){
        var uid = $("#p-card-view-pages form:visible").attr("id");
        $("#p-card-navigator").hide();
        currentLoadedPageId = "";
        var page = pages.filter(function(page) {
            return page.uid == uid;
        })[0];
        Clinic.populatePage(page);
    });
    
    
    
}

function savePage(uid){
    var page = pages.filter(function(page) {
        return page.uid == uid;
    })[0];
    var data = Clinic.collectDataFromPage(page);

//    data["patientId"] = patientId;
    data[masterIdStr] = masterId;
    data["id"] = currentLoadedPageId;

    
    Common.postJSON(basePath.replace(/file\/\w*/, "save") , JSON.stringify(data), function(){
        $("form.p-myform").hide();
        viewPageSlide.reverse();
        $("#p-card-view-page").hide();
        kanbanPageSlide.play();

        $.getJSON(basePath.replace("/file/", "/file/count/") + "/" + page.id() , function(data) {
            page.count = data.count;
            $("#card_" + uid + " .p-count").text(data.count);
            $("#card_" + uid).removeClass (function (index, css) {
                return (css.match (/\bp-cards-\S+/g) || []).join(' ');
            });
            $("#card_" + uid).addClass("p-cards-" + data.count);
        });

        detailsClickHandller();
        prescriptionClickHandller();
    });
}

function unusedCardsClickHandller(){
    $(".p-kanban-unused > div.p-kanban-card").unbind("click").click(function(){
        //var t = $(this).remove();
        //$("#p-kanban-main").append(t);

        //prescriptionClickHandller();
    });
}

function detailsClickHandller(){
    $(".p-card-diagnosis-details").unbind("click").click(function(e){
        var id = $(this).attr("data-id");
        var pages = diagnosisRelation[id];
        renderDagnosisCards(id, pages);

        $("#p-btn-card-save").show();

		
        kanbanPageSlide.reverse();
        $("#p-kanban-view-page").hide();
        viewPageSlide.play();
        $("#p-card-view-page").show();
        $("#diag-pages-tabs li").first().addClass("uk-active");
        e.preventDefault();
        return false;
    });
    
    $(".p-card-details").unbind("click").click(function(e){
        var card = $(this).parent().parent().parent();
        renderCardPage(card.attr("id").replace(/^card_/, ""));

        $("#p-btn-card-save").show();
        if($(this).attr("data-isStatic")){
            $("#p-btn-card-save").hide();
        }

        var count = $(".p-count", card).text();
        $("#p-card-navigator").hide();
        $("#p-btn-card-prescription").show();

        kanbanPageSlide.reverse();
        $("#p-kanban-view-page").hide();
        viewPageSlide.play();
        e.preventDefault();

        if(count > 0){
            $("#p-card-navigator").show();
            $("#p-card-navigator-count").text(count);
            $("#p-card-navigator-current").text(1);

            var uid = $("#p-card-view-pages form:visible").attr("id");
            loadPage(uid, 1);
        }else{
            $("#p-card-navigator").hide();
            $("#p-btn-card-prescription").hide();
        }
        return false;
    });
}

function prescriptionClickHandller(){
    $(".p-card-prescription").unbind("click").click(function(e){
        renderCardPage($(this).parent().parent().parent().attr("id").replace(/^card_/, ""));
        if($(this).attr("data-isStatic")){
            alert("Kasafat chera?!");
            return;
        }
        $("#p-btn-card-prescription").hide();
        $("#p-card-navigator").hide();
        $("#p-btn-card-save").show();
        kanbanPageSlide.reverse();
        $("#p-kanban-view-page").hide();
        viewPageSlide.play();
        e.preventDefault();
        return false;
    });
}

function renderDagnosisCards(id, pages){
    if($("#diag_page_" + id).length == 1){
        $("#diag_page_" + id).show();
        return;
    }

    var pageDiagTmpl = doT.template($("#p_diag_page").html());
    var pageTmpl = doT.template($("#p_page").html());

	var p = {pages : "", tabs : "", title: $("#p-diagnosis option[value=" + id + "]").text() };
	for(var i=0; i<pages.length; i++){
		p.pages += "<li class='p-tab-content'>" + renderQuestions(pages[i].qs, pages[i].uid) + "</li>";
		p.tabs  += "<li class='p-tab-caption'><a href='#'>" + pages[i].title + "</a></li>";
	    //$("#p-card-view-pages").append(pageTmpl(page));
	    //pages[i].content = "";
	}
	
	$("#p-card-view-pages").append(pageDiagTmpl(p)); ;
	
//     if(page.isStatic)
//         Clinic.populatePage(staticPagesData[page.title]);

    bindFunctionalityToPage();
    
    $(".p-tab li").unbind("click").click(function(){
    	var parent = $(this).parent();
    	var next = $(this).parent().next();
    	var idx = $("li", parent).index($(this)) + 1;
    	$("li", parent).removeClass("uk-active");
    	 $(this).addClass("uk-active");
    	$("li ", next).removeClass("uk-active");
    	$("li:nth-child(" + idx + ")", next).addClass("uk-active");
    });
}

function renderCardPage(id){
    var page = pages.filter(function(page){
        return page.uid == id;
    })[0];

    if(page.isRendred){
        $("#" + id).show();
        return;
    }

    var pageTmpl = doT.template($("#p_page").html());

    page.content = renderQuestions(page.qs, page.uid);
    $("#p-card-view-pages").append(pageTmpl(page));
    page.content = "";
    page.isRendred = true;

    if(page.isStatic)
        Clinic.populatePage(staticPagesData[page.title]);

    bindFunctionalityToPage();
}

function initDescriptAutocomplate(){
	$("#p-descript").textcomplete([{
			match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
			search: function (term, callback) {
				Common.postJSON(basePath.replace(/visit\/\w*/, "visit/autocomplete/") , JSON.stringify({token: term}), function(data){
					var tokens = [];
				    for(var i = 0; i< data.length; i++)
				    	tokens.push(data[i].token);
				    callback(tokens);
			    });
			},
			replace: function (word) {
				return '$1' + word + ' ';
			}			
	}]);
}

function initPhysicalExamAutocomplate(){
	$("#p-PhysicalExam").textcomplete([{
			match: /(\s|\n)(\w{1,}|[\u0600-\u06FF]{1,})$/,
			search: function (term, callback) {
				Common.postJSON(basePath.replace(/visit\/\w*/, "visit/autocomplete/") , JSON.stringify({token: term}), function(data){
					var tokens = [];
				    for(var i = 0; i< data.length; i++)
				    	tokens.push(data[i].token);
				    callback(tokens);
			    });
			},
			replace: function (word) {
				return '$1' + word + ' ';
			}			
	}]);
}

	
function saveTokens(){
	
	Common.postJSON(basePath.replace(/visit\/\w*/, "visit/saveTokens/") , JSON.stringify({text: $("#p-descript").val()}), function(){
		//
    });
}

function saveForm(){
    //openpopup();
    openDialogForm();
    
   // runEffect();
	isTemporary = false;
	saveFormActual();
	
	
}
function saveFormActual(){
	var data = {};
	data.descript = $("#p-descript").val();
	data.diagnosis = $("#p-diagnosis").val();
	data.drugs = $("#p-drug").val(); 
	data.physicalExam = $("#p-PhysicalExam").val(); 	
	data.medicalHistory = $("#p-MedicalHistory").val();
	data.patientId = getPatientId(); 	
	data.visitId = visitId; 	
	data.isTemporary = isTemporary;
	data.lebTestForSave=lebTestForSave.value;
	
	Common.postJSON(basePath.replace(/visit\/\w*/, "visit/save/") , JSON.stringify(data), function(){
		updateVisitCount();
		loadVisit(parseInt($("#p-visit-current").text())); 
    });
}


function getPatientId(){
	 return /\/visit\/(\d*)/.exec(basePath)[1];
}
function updateVisitCount(first){
	first = first || false;
	$.getJSON("<c:url value='/' />" + "clinic/patient/visit/count/" + getPatientId(), function(data) {
		if(first){
			data.count++;
		}
		$("#p-visit-count").text(data.count);
	});
}

var visitId = 0, isTemporary = true; 
function loadVisit(index){
	$.getJSON("<c:url value='/' />" + "clinic/patient/visit/load/" + getPatientId() + "/" + index , function(data) {

		$("#p-descript").val(data.descript);
		$("#p-diagnosis").val(data.diagnosis);
		$("#p-diagnosis").trigger("chosen:updated");
		$("#p-drug").val(data.drugs); 
		$("#p-drug").trigger("chosen:updated");
		$("#p-medical-test").val(data.medical_tests); 	
		$("#p-medical-test").trigger("chosen:updated");
		visitId = data._id;
		//data.patientId = getPatientId();
		
	});
}

function visitNavigator(e, step){
	e.preventDefault();
    var count = parseInt($("#p-visit-count").text());
    var curr = parseInt($("#p-visit-current").text());
    
	if(visitId == 0){
		saveFormActual();
	}else if(curr == 1){
		saveForm();
	}else{
		//saveForm();
	}
	
    curr += step;
    if(curr > count)
        curr = 1;
    if(curr < 1)
        curr = count;
    $("#p-visit-current").text(curr);   
    loadVisit(curr);       
}

 $("uk-Complaint").click(function () {
  runEffect();
}); 

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 function runEffect() {
      // get effect type from
      var selectedEffect = "blind";
 
      // most effect types need no options passed by default
      var options = {};
      // some effects have required parameters
     // if ( selectedEffect === "scale" ) {
     ///   options = { percent: 0 };
     // } else if ( selectedEffect === "size" ) {
      //  options = { to: { width: 2000, height: 600 } };
     // }
  
      // run the effect
     // $( "#p-descript" ).fadeOut( 160, "linear" );
     // $( "#p-descript" ).toggle( "blind" );
       $( "#p-descript" ).toggle( "clip" );
    }
   
    // callback function to bring a hidden box back
    function callback() {
      setTimeout(function() {
        $( "#p-descript" ).removeAttr( "style" ).hide().fadeIn();
      }, 100 );
    };
    
    
  
   $("#createuser").click(openDialogForm);
  // $("#p-btn-labResult").click(openLabResult);
   
   
   function openLabResult() {
     // $("#myForm").dialog({modal : true ,  position: "center"});
     //window.location = "LabTestResult.jsp";
     window.location = "${pageContext.request.contextPath}"+"/clinic/patient/labTestResult/" ;
      
    };
         
  function openDialogForm() {
      $("#myForm").dialog({modal : true ,  position: "center"});
      
    };
    
 //uk-panel uk-panel-box
   		
        
		    
		$(document).ready(function() {  
		
		//$("#div.p-kanban-visit").scrollpanel();
		$( "#p-kanban-view-page" ).scrollTop();
		
		  $("#p-lab_test").click(function(){  
		   		var window1;
  				childWindow=open("popupTree",null,"resizable=no,width=370,height=610,modal=yes");
    	        		if (childWindow.opener == null) childWindow.opener = self;
		   
		       /*
				   $("#dialog").dialog({
				    autoOpen: false,
				    modal: true,
				    height: 400,
				    width:400,
				    position: 'top',
				    open: function(ev, ui){
				             $('#myIframe').attr('src','popupTree');
				          },
				    
				   close: function() {
				     
				   		var data;
				   		data=$("#lebTestForSave").val();
				   		window.alert(data);
        				for ( var i = 0; i < data.length; i++) {
						$("#p-medical-test").append(
								"<option value='" + data[i] + "'>" + "</option>");
						}
        				//$("#lebTestForSave").val(livesin.value );
        				//$( this ).dialog( "close" );
     				 } */
				   /*  buttons: {
						"closeform": function() {
						    allFields.removeClass('ui-state-error');
						    window.alert("oook");
							$('#lebTestForSave').val($('#livesin').val() );
							$( this ).dialog( "close" );
						}
						
					}  *//*
                   
					});
					$("#dialog").dialog("open");*/
				    //$("#lebTestForSave").val($("#livesin").val() );
					 //$("#lebTestForSave").val( $("#dialog").dialog("open"));
					// $("#lebTestForSave").val($("#livesin").val() );
					 
				/* 	 var data;
					data.val($("#lebTestForSave").val);
					for ( var i = 0; i < data.length; i++) {
						$("#p-lab_test").append(
								"<option value='" + data[i].ComboID + "' >" + data[i].ComboCaption + "</option>");
					};
					  */
					  
					 // $(".ui-dialog-titlebar").hide();
					
 
		    });  
		    
		  $("#p-lab_test_result").click(function(){  
		   		   var window1;
		   		   console.log(visitId);
		   		   console.log(visitId!=0);
  						childWindow=open("popup?popupPatientId="+getPatientId(),null,"resizable=no,width=370,height=610,modal=yes");
			        	document.getElementById("popupPatientId").value=getPatientId();
    	        		if (childWindow.opener == null) childWindow.opener = self;
    				 
		  	
   		 
   		         //  window.location = "${pageContext.request.contextPath}"+"/clinic/patient/labTestResult/" ;
   		         
   		         /*	$("#resultdialog").dialog({
				    autoOpen: false,
				    modal: true,
				    height: 430,
				    width:600,
				    position: 'center',
				    open: function(ev, ui){
				             $('#resultmyIframe').attr('src','popup');
				          },
				    
				   close: function() {*/
				     
				   		/* var data;
				   		data=$("#lebTestForSave").val();
        				for ( var i = 0; i < data.length; i++) {
						$("#p-medical-test").append(
								"<option value='" + data[i] + "'>" + "</option>");
						} */
        				/*
     				 } 
                   
					});
					$("#resultdialog").dialog("open");*/
				  
			    
			
			    });
 
		   
		  
		//get the height and width of the page  
		var window_width = $(window).width();  
		var window_height = $(window).height();  
		  
		//vertical and horizontal centering of modal window(s)  
		/*we will use each function so if we have more then 1 
		modal window we center them all*/  
		$(".modal_window").each(function(){  
		  
		    //get the height and width of the modal  
		    var modal_height = $(this).outerHeight();  
		    var modal_width = $(this).outerWidth();  
		  
		    //calculate top and left offset needed for centering  
		    var top = (window_height-modal_height)/2;  
		    var left = (window_width-modal_width)/2;  
		  
		    //apply new top and left css values  
		    $(this).css({'top' : top , 'left' : left});  
		  
		});  
		
		  
		  
		    $(".activate_modal").click(function(){  
		  
		          //get the id of the modal window stored in the name of the activating element  
		          var modal_id = $(this).attr("name");  
		  
		          //use the function to show it  
		          show_modal(modal_id);  
		  
		    });  
		  
		    $(".close_modal").click(function(){  
		  
		        //use the function to close it  
		        close_modal();  
		  
		    });  
		  
		});  
		  
		//THE FUNCTIONS  
		  
		function close_modal(){  
		  
		    //hide the mask  
		    $("#mask").fadeOut(500);  
		  
		    //hide modal window(s)  
		    $(".modal_window").fadeOut(500);  
		  
		}  
		function show_modal(modal_id){  
		  
		    //set display to block and opacity to 0 so we can use fadeTo  
		    $("#mask").css({ "display" : "block", opacity : 0});  
		  
		    //fade in the mask to opacity 0.8  
		    //$("#mask").fadeTo(500,0.8);  
		  
		     //show the modal window  
		     //$("#"+modal_id).fadeIn(500);
		     $("#" + modal_id).dialog({modal : true ,  position: "center" ,
		      show: {
				        effect: "blind",
				        duration: 300
				    },
			  hide: {
				        effect: "slide",
				        duration: 300
				  	}
		      });
		    
		  
			}
			
			
		
		  $(".uk-width-5-5 p-kanban-card").click(function(){  
		  
		          //get the id of the modal window stored in the name of the activating element  
		          var modal_id = $(this).attr("name");  
		  
		          //use the function to show it  
		          window.alert(modal_id); 
		    });  	
</script>