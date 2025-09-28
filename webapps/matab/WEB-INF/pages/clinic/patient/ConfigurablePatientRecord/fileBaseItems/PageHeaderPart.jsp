<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>

<div class="body-header" style="display: flex;">
    <div id="header-toolbar" style="width: 25%;">
        <% if(GlobalVariable.getButtonContainer("005007008", "saveAndExitBtn")){ %>
                <button class="uk-button uk-button-success" id="fileMobileView-save_close_btn" type="button">Save & exit</button>
        <% } %>

        <button class="uk-button uk-button-success" id="PatientCardVisitView" type="button">Exit</button>

        <% if(GlobalVariable.getButtonContainer("005007008", "configurablePatientRecordExportToWordBtn")){ %>
            <button class="uk-button uk-button-primary" id="exportToWordBtn" type="button" onclick="exportToWordBtnOnClick()">Export to MS. Word</button>
        <% } %>
    </div>
    <div style="width: 85%;">
        <div id="patientDescription" align="right" style="direction: rtl; height: 100%; top: 20%; position: relative;
        font-family: b nazanin !important;font-size: 24px !important;" >
            <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.firstName") %>&nbsp;
            <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.lastName") %>:
            ${patientrName} ${patientrFam} &nbsp;
            - &nbsp; <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.age") %>: ${patientrOBJ.age} &nbsp;
            - &nbsp; <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.birthplace.city") %>: ${patientrOBJ.birthplaceCityName}
            - &nbsp; <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.livesIn.city") %>: ${patientrOBJ.cityName} &nbsp;
            - &nbsp; <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.fileNumber") %>: ${patientrFileNumber} &nbsp;
            - &nbsp; <%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.visitCount") %>: ${visitCount}
        </div>
    </div>
</div>

<script type="application/javascript">
    function exportToWordBtnOnClick() {
        <%--window.location.href = '${pageContext.request.contextPath}' + '/clinic/patient/configurablePatientRecord/downloadWord/${patientId}';--%>
        $.ajax({
            url: "${pageContext.request.contextPath}" + '/clinic/patient/configurablePatientRecord/downloadWordValidation/${patientId}',
            type: "GET",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                if(data.state == 'success'){
                    window.location.href = '${pageContext.request.contextPath}' + '/clinic/patient/configurablePatientRecord/downloadWord/${patientId}';
                }else{
                    alertify.error("Can not export to MS.Word");
                }
            },beforeSend: function(){
                <%--$("#body-table").block({ message: '<div><img  style="padding: 5px;" src="<c:url value='/resources/images/loader.gif'/>" /></div>'});--%>
                $("#body").block({ message: '<div><img  style="padding: 5px;" src="${pageContext.request.contextPath}/resources/images/loader.gif" /></div>'});
            },
            complete: function(){
                $("#body").unblock();
            }, error: function (result) {
                alertify.error("Can not export MS.Word");
            }
        });
    }
</script>