<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${setting.prc_Handwriting}">
        <div id="handwriting">
            <h3>Handwriting</h3>
            <div>
                <jsp:include page="Handwriting.jsp"/>
            </div>
        </div>
    </c:when>
</c:choose>
<c:choose>
    <c:when test="${setting.prc_ChiefCompliant}">
        <div id="chiefComplaint">
            <h3>Chief Complaint & Present illness</h3>
            <div>
                <jsp:include page="ChiefComplaint.jsp"/>
            </div>
        </div>
    </c:when>
</c:choose>
<c:choose>
    <c:when test="${setting.prc_PhysicalExamination}">
        <div id="physicalExam">
            <h3>Physical examination</h3>
            <div>
                <jsp:include page="PhysicalExamination.jsp"/>
            </div>
        </div>
    </c:when>
</c:choose>
<c:choose>
    <c:when test="${setting.prc_Diagnosis}">
        <div id="diagnosis">
            <h3>Diagnosis</h3>
            <div>
                <c:choose>
                    <c:when test="${setting.diagnosisViewMode == 1}">
                        <jsp:include page="DiagnosisTreeMode.jsp"/>
                    </c:when>
                    <c:when test="${setting.diagnosisViewMode == 2}">
                        <jsp:include page="Diagnosis.jsp"/>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </c:when>
</c:choose>
<c:choose>
    <c:when test="${setting.prc_LabTestAndResult}">
        <div id="currentLab">
            <h3>LabTest & Result</h3>
            <div>
                <jsp:include page="CurrentLabTestAndResult.jsp"/>
            </div>
        </div>
    </c:when>
</c:choose>
<c:choose>
    <c:when test="${setting.prc_ProcedureResult}">
        <div id="currentProc">
            <h3>Procedure & Result</h3>
            <div>
                <jsp:include page="CurrentOperationAndResult.jsp"/>
            </div>
        </div>
    </c:when>
</c:choose>
<c:choose>
    <c:when test="${setting.prc_ResearchDepartment}">
        <div id="sendToResearch">
            <h3>Send to the research department</h3>
            <div>
                <jsp:include page="SendToResearch.jsp"/>
            </div>
        </div>
    </c:when>
</c:choose>

<script>
    $("#handwriting").accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true,
        active: false
    });
    $("#chiefComplaint").accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true,
        active: false
    });
    $("#physicalExam").accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true,
        active: false
    });
    $("#diagnosis").accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true,
        active: false
    });
    $("#currentLab").accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true,
        active: false
    });
    $("#currentProc").accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true,
        active: false
    });
    $("#sendToResearch").accordion({
        icons: icons,
        heightStyle: "content",
        collapsible: true,
        active: false
    });
</script>