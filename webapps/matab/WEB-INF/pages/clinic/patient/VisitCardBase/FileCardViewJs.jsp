<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<jsp:include page="../TotalQuestionJs.jsp"></jsp:include>



<script>

var pages = [ pageDataSource, pagePatientIdentification,
			pageSecondaryContact, pagePatientPersonalInformation,
			pageMediacalHistory, pageRiskFactorBeforeDX, pageFamilialHistory,
			pageHistoryOfOtherAutoimmuneDiseases, pagePostDrugHistoryBeforeDX,
			pageHabitualHistory, pageSymptomsAndSignsAtOnset,
			pageSymptomsAndSignsAtOnsetFollowUp, pageSonography, pageCBC,
			pageAscitis, pageLFT, pageBiochemistry, pageIronAndCopperIndices,
			pageThyroidFunction, pageAutoAntibody, pageTumorMarkers,
			pageElectroPhoresis, pageTashkhis ];



$(function() {  
			

     $( "#p-history-static" ).toggle( "clip" );
     $( "#p-order-static" ).toggle( "clip" );
     $( "#p-result-static" ).toggle( "clip" );

	 $(".uk-grid p-kanban").click(function(){  
		  
		          //get the id of the modal window stored in the name of the activating element  
		          var modal_id = $(this).attr("name");  
		  
		          //use the function to show it  
		          window.alert(modal_id); 
		          
		  
	 });  	
/* 	 $("#patient-inform-id").click(function(){  
	             
		         window.alert("ffffff");
		         $( "#p-descript-static" ).toggle( "clip" );		  
	 });   */
	/////////////////////////////////////////////// 	
	 $("#p-kanban-static-header").toggle(function() {
		
			$(this).children().first().addClass("uk-icon-angle-down");
			$(this).children().first().removeClass("uk-icon-angle-up");
			$("#patient-information-static").fadeOut();
		}, function() {
		
			$(this).children().first().addClass("uk-icon-angle-up");
			$(this).children().first().removeClass("uk-icon-angle-down");
			$("#patient-information-static").fadeIn();
	 });
	 ///////////////////////////////////////////////
	  $("#p-kanban-Complaint-header").toggle(function() {
		
			$(this).children().first().addClass("uk-icon-angle-down");
			$(this).children().first().removeClass("uk-icon-angle-up");
			$("#p-descript-static").fadeOut();
		}, function() {
		
			$(this).children().first().addClass("uk-icon-angle-up");
			$(this).children().first().removeClass("uk-icon-angle-down");
			$("#p-descript-static").fadeIn();
	 });
	 /////////////////////////////////////////////////
	  $("#p-kanban-history-header").toggle(function() {
		    $(this).children().first().addClass("uk-icon-angle-up");
			$(this).children().first().removeClass("uk-icon-angle-down");
			$("#p-history-static").fadeIn();
			
		}, function() {
		    $(this).children().first().addClass("uk-icon-angle-down");
			$(this).children().first().removeClass("uk-icon-angle-up");
			$("#p-history-static").fadeOut();
			
	 });
	  /////////////////////////////////////////////////
	  $("#p-kanban-order-header").toggle(function() {
		    $(this).children().first().addClass("uk-icon-angle-up");
			$(this).children().first().removeClass("uk-icon-angle-down");
			$("#p-order-static").fadeIn();
			
		}, function() {
		   $(this).children().first().addClass("uk-icon-angle-down");
			$(this).children().first().removeClass("uk-icon-angle-up");
			$("#p-order-static").fadeOut();
			
	 });
	  /////////////////////////////////////////////////
	  $("#p-kanban-result-header").toggle(function() {
		    $(this).children().first().addClass("uk-icon-angle-up");
			$(this).children().first().removeClass("uk-icon-angle-down");
			$("#p-result-static").fadeIn();
			
		}, function() {
		    $(this).children().first().addClass("uk-icon-angle-down");
			$(this).children().first().removeClass("uk-icon-angle-up");
			$("#p-result-static").fadeOut();
			
	 });
	 
	 //////////////////////////////////*****************************************************************************
	 
	  $("#patient-inform-id").click(function(e){
	        var viewPageSlide, kanbanPageSlide;
	        bindFunctionalityToCards();
	        var card = $(this).parent().parent().parent();
	       // window.alert(card.attr("id").replace(/^card_/, ""));
	        //renderCardPage(card.attr("id").replace(/^card_/, ""));
	        viewPageSlide = kendo.fx($("#p-kanban-view-page")).slideIn("right");
	        kanbanPageSlide = kendo.fx($("#p-kanban-complain-static")).slideIn("right");
	        $("#p-kanban-view-page").hide();
	        viewPageSlide.reverse();
	        kanbanPageSlide.play(); 
	        
	        
	        renderCardPage(0);
	
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
       //////////////////////////////////////////////////////////////
       function renderCardPage(id){
			    var page = pages.filter(function(page){
			        return page.uid == id;
			    })[0];
			
			   /*  if(page.isRendred){
			        $("#" + id).show();
			        return;
			    } */
			    window.alert("gfgfgfgfg");
			    var pageTmpl = doT.template($("#p_page").html());
			
			    page.content = renderQuestions(page.qs, page.uid);
			    $("#p-card-view-page").append(pageTmpl(page));
			    page.content = "";
			    page.isRendred = true;
			
			    /* if(page.isStatic)
			        Clinic.populatePage(staticPagesData[page.title]); */
			        
			   
			    
			    
        		return;
			
			
			    bindFunctionalityToPage();
		}
		/////////////////////////////////////////////////////////////////
		var viewPageSlide, kanbanPageSlide;

	function bindFunctionalityToCards(){
	    //unusedCardsClickHandller();
	
	    viewPageSlide = kendo.fx($("#p-kanban-static-descript")).slideIn("right");
	    kanbanPageSlide = kendo.fx($("#p-kanban-view-page")).slideIn("right");
	
	    
	
	    $("#p-btn-card-back").click(function(){
	        $("form.p-myform").hide();
	        viewPageSlide.reverse();
	        $("#p-kanban-view-page").hide();
	        kanbanPageSlide.play();
	        detailsClickHandller();
	    });
	
	    $("#p-btn-card-save").click(function(){
	        var uid = $("#p-kanban-view-page form:visible").attr("id");
	        savePage(uid);
	    });
	
	    $("#p-btn-card-prescription").click(function(){
	        var uid = $("#p-card-view-pages form:visible").attr("id");
	        $("#p-kanban-view-page").hide();
	        currentLoadedPageId = "";
	        var page = pages.filter(function(page) {
	            return page.uid == uid;
	        })[0];
	        Clinic.populatePage(page);
     });
   }
 //////////////////////////////////******************************************************************************			
});

</script>