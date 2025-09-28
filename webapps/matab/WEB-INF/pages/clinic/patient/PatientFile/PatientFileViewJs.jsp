<%@page import="org.springframework.web.util.UrlPathHelper" %>
<%@page contentType="text/html;charset=UTF-8" %>
<jsp:include page="../TotalQuestionJs.jsp"></jsp:include>
<script type="text/javascript">

    pageDataSource.isStatic=true;
    pagePatientIdentification.isStatic=true;
    pageSecondaryContact.isStatic=true;
    pagePatientPersonalInformation.isStatic=true;
    pageMediacalHistory.isStatic=true;
    pageRiskFactorBeforeDX.isStatic=true;
    pageFamilialHistory.isStatic=true;
    pageHistoryOfOtherAutoimmuneDiseases.isStatic=true;
    pagePostDrugHistoryBeforeDX.isStatic=true;
    pageHabitualHistory.isStatic=true;

    var pages =
            [
                pageDataSource,
                pagePatientIdentification,
                pageSecondaryContact,
                pagePatientPersonalInformation,
                pageMediacalHistory,
                pageRiskFactorBeforeDX,
                pageFamilialHistory,
                pageHistoryOfOtherAutoimmuneDiseases,
                pagePostDrugHistoryBeforeDX,
                pageHabitualHistory,
                pageSymptomsAndSignsAtOnset,
                pageSymptomsAndSignsAtOnsetFollowUp,
                pageSonography,
                pageCBC,
                pageAscitis,
                pageLFT,
                pageBiochemistry,
                pageIronAndCopperIndices,
                pageThyroidFunction ,
                pageAutoAntibody,
                pageTumorMarkers,
                pageElectroPhoresis,
                pageTashkhis
            ];

$(function () {
	//renderPages(pages);
	
	$("#p-kanban-static-header").toggle(
		function () {
			$(this).children().first().addClass("uk-icon-angle-down");
			$(this).children().first().removeClass("uk-icon-angle-up");
			$("#p-kanban-static").fadeOut();
		},
		function () {
			$(this).children().first().addClass("uk-icon-angle-up");
			$(this).children().first().removeClass("uk-icon-angle-down");
			$("#p-kanban-static").fadeIn();
		}
	);		
});

		


</script>