<%@page import="com.artonis.clinic.patient.model.PatientConstValue.PatientFileFilterTypeEnum" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/js/select2-3.4.5/select2.css' />" type="text/css"></link>
<script type="text/javascript" src="<c:url value='/resources/js/select2-3.4.5/select2.js' />"></script>

<div id="p-diagnosis" dir="ltr">
    <br>
    <div id="p-diagnosisContainer" style=" width:100%; height:100%"></div>
</div>

<script type="text/javascript">
    $("#p-diagnosis").dialog({
        height: 500,
        width: 1000,
        autoOpen: false,
        show: {
            effect: "blind",
            duration: 500
        },
        hide: {
            effect: "slide",
            duration: 500
        }
    });

    $("#p-diagnosis-id-txt").click(function () {
        $("#p-diagnosis").dialog("open");
    });

    jQuery('body').bind('click', function (e) {
        if (jQuery('#p-diagnosis').dialog('isOpen') && !jQuery(e.target).is('.ui-dialog, a') && !jQuery(e.target).closest('.ui-dialog').length && event.target.nodeName != "H2") {
            jQuery('#p-diagnosis').dialog('close');
        }
    });

    //loadDiagnosis();

    function loadDiagnosis() {
        var filterTypeDiagnosis = <%=PatientFileFilterTypeEnum.DIAGNOSIS.getValue()%>;
        $.getJSON("<c:url value='/' />" + "clinic/patient/penVisit/loadByPatient/" + ${patientId} +"/" + filterTypeDiagnosis, function (data) {
            $("#diagnosis-for-test-inner").append(data.data);
            $("#diagnosis-for-test-inner-1").append(data.data);
            $("#diagnosis-for-test-inner-1").accordion({
                heightStyle : "content",
                collapsible : true
            });
            $("#diagnosis-for-test-inner-1").accordion("refresh");
            $("#p-diagnosisContainer").append(data.data);
            $("#p-diagnosisContainer").accordion({
                heightStyle : "content",
                collapsible : true
            });
            $("#p-diagnosisContainer").accordion("refresh");

            var headerArray = $('h3[id^="ui-accordion-diagnosis-for-test-inner-header"]');
            for (var i = 0; i < headerArray.length; i++) {
                headerArray.eq(i).css("background", "-webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(255,244,180,1)), color-stop(100%,rgba(251,221,83,1)))");
                headerArray.eq(i).css("border", "1px solid #d3d3d3");
                headerArray.eq(i).css("font-weight", "normal");
                headerArray.eq(i).css("color", "#555555");
            }
            var diagnosisArray = $('#diagnosis-for-test-inner [id^="accordion-patientFile-"]');
            for (var j = 0; j < diagnosisArray.length; j++) {
                $("#" + diagnosisArray[j].id).accordion({
                    heightStyle : "content",
                    collapsible : true
                });
            }
        });
    }

    function emptyDiagnosis() {
        $("#p-diagnosisContainer").empty();
        $("#diagnosis-for-test-inner").empty();
    }

</script>
