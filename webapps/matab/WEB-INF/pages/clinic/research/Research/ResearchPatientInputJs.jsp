<%@page import="org.springframework.web.util.UrlPathHelper" %>
<%@page contentType="text/html;charset=UTF-8" %>
<jsp:include page="../TotalQuestionJs.jsp"></jsp:include>

<script type="text/javascript">

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
        ];

</script>