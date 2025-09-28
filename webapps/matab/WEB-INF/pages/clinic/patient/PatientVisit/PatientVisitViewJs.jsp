<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page contentType="text/html;charset=UTF-8"%>
<jsp:include page="../TotalQuestionJs.jsp"></jsp:include>
<script type="text/javascript">
	pageDataSource.isStatic = true;
	pageDataSource.title = "اطللاعات بیمار";
	pagePatientIdentification.isStatic = true;
	pagePatientIdentification.title=" پرونده بیمار "
	pageSecondaryContact.isStatic = true;
	pagePatientPersonalInformation.isStatic = true;
	pageMediacalHistory.isStatic = true;

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
		//renderPages(pages);
	
		
//        for ( var i = 0; i < pages.length; i++) {
//			if (!pages[i].isStatic)
//				$("#p-last-medical-test").append(
//						"<option>" + pages[i].title + "</option>")
//		}
		
	
		$("#p-medical-test").change(
				function(e) {
					$(".p-kanban-unused .p-kanban-card").removeClass(
							"p-kanban-card-prescripted");
					$("#p-medical-test option:selected").each(
							function() {

							/*	for (i = 0; i < pages.length; i++) {
									if (pages[i].title == $(this).val()) {
										$("#card_" + pages[i].uid).addClass(
												"p-kanban-card-prescripted");
									}
								} */
							});
				});
				
				
	/*	$("#p-last-medical-test").change(
				function(e) {
					$(".p-kanban-unused .p-kanban-card").removeClass(
							"p-kanban-card-prescripted");
					$("#p-last-medical-test option:selected").each(
							function() {

								for (i = 0; i < pages.length; i++) {
									if (pages[i].title == $(this).val()) {
										$("#card_" + pages[i].uid).addClass(
												"p-kanban-card-prescripted");
									}
								}
							});
				});*/
				
				
		  $(".uk-grid p-kanban").click(function(){  
		  
		          //get the id of the modal window stored in the name of the activating element  
		          var modal_id = $(this).attr("name");  
		  
		          //use the function to show it  
		          window.alert(modal_id); 
		  
		    });  		
				
	
		$("#p-kanban-static-header").toggle(function() {
		
			$(this).children().first().addClass("uk-icon-angle-down");
			$(this).children().first().removeClass("uk-icon-angle-up");
			$("#p-kanban-static").fadeOut();
		}, function() {
		
			$(this).children().first().addClass("uk-icon-angle-up");
			$(this).children().first().removeClass("uk-icon-angle-down");
			$("#p-kanban-static").fadeIn();
		});
		
		$("#p-kanban-Complaint-header").toggle(function() {
		
			$(this).children().first().addClass("uk-icon-angle-down");
			$(this).children().first().removeClass("uk-icon-angle-up");
			$("#p-kanban-static-descript").fadeOut();
		}, function() {
		
			$(this).children().first().addClass("uk-icon-angle-up");
			$(this).children().first().removeClass("uk-icon-angle-down");
			$("#p-kanban-static-descript").fadeIn();
		});
        	
		$("#p-kanban-physical-header").toggle(function() {
		    
			$(this).children().first().addClass("uk-icon-angle-down");
			$(this).children().first().removeClass("uk-icon-angle-up");
			$("#p-PhysicalExam").fadeOut();
		}, function() {
		
			$(this).children().first().addClass("uk-icon-angle-up");
			$(this).children().first().removeClass("uk-icon-angle-down");
			$("#p-PhysicalExam").fadeIn();
		});
		
		/* $("#p-kanban-diagnosis-header").toggle(function() {
		    
			$(this).children().first().addClass("uk-icon-angle-down");
			$(this).children().first().removeClass("uk-icon-angle-up");
			$("#p-diagnosis").fadeOut();
			$("#p-diagnosis-cards").fadeOut();
		}, function() {
		    
			$(this).children().first().addClass("uk-icon-angle-up");
			$(this).children().first().removeClass("uk-icon-angle-down");
			$("#p-diagnosis").fadeIn();
			$("#p-diagnosis-cards").fadeIn();
		}); */
		
	 /* 	$("#p-kanban-PastMedical-header").toggle(function() {
		     
			$(this).children().first().addClass("uk-icon-angle-down");
			$(this).children().first().removeClass("uk-icon-angle-up");
			$("#p-MedicalHistory").fadeOut();
		}, function() {
		    
			$(this).children().first().addClass("uk-icon-angle-up");
			$(this).children().first().removeClass("uk-icon-angle-down");
			$("p-MedicalHistory").fadeIn();
		});  */
		
		
		
     
		
		
	});
	
	
	
	
</script>