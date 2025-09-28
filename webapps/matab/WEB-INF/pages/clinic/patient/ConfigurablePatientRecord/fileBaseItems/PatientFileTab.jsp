<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>

<div dir="ltr" style="width: 100%; margin-bottom: 10px; display: inline-flex;">
    <div style="color: white; width: 50%;" dir="ltr">
        Filter:
        <div class="uk-button-group patientFileFilterBtnGroup" dir="rtl" style="margin-left: 40%">
            <button id="patientFileFilterBtn_Diagnosis" onclick="resetPatientFile(this);" class="uk-button uk-button-mini uk-button-success"
                    style="width: 100%;">Diagnosis
            </button>
            <button id="patientFileFilterBtn_All" onclick="resetPatientFile(this);" class="uk-button uk-button-mini uk-button-success uk-active"
                    style="width: 100%;">All
            </button>
        </div>
    </div>
    <div style="width: 50%;" dir="rtl">
        <table height="100%" style="text-align: center;color: white; direction: rtl">
            <tr height="10%">
                <td>
                    <%=ResourceBoundleHolder.resourceBundle.getString("clinic.visit.clinicalInformation.weight") %>:
                </td>
                <td>
                    <input type="text" id="weight" value="${weight}" style="width: 50px; border-radius: 5px;" autocomplete="off"/>
                </td>
                <td>
                    &nbsp; &nbsp;
                </td>
                <td>
                    <%=ResourceBoundleHolder.resourceBundle.getString("clinic.visit.clinicalInformation.bloodPressure") %>:
                </td>
                <td>
                    <input type="text" id="bloodPressure" value="${bloodPressure}" style="width: 50px; border-radius: 5px;" autocomplete="off"/>
                </td>
            </tr>
        </table>
    </div>
</div>
<div id="patientFile-for-test" dir="ltr">
    <div id="patientFile-for-test-inner" style="overflow: auto;"></div>
</div>

<jsp:include page="PatientFile.jsp"/>

<script>
    function resetPatientFile(btn) {
        $(".patientFileFilterBtnGroup > button").removeClass("uk-active");
        btn.classList.add("uk-active");
        emptyPatientFile();
        loadPatientFile();
    }
</script>