<%@page import="com.artonis.clinic.patient.model.PatientConstValue.PatientFileFilterTypeEnum"%>
<%@page import="com.artonis.clinic.patient.model.PatientConstValue.PatientFileFilterTypeEnum"%>
<%@page import="com.artonis.clinic.patient.model.PatientConstValue.PatientFileFilterTypeEnum"%>
<%@page import="com.artonis.hrm.core.service.util.HrmCoreServiceUtil"%>
<%@page import="com.artonis.core.system.authentication.service.util.AuthenticationServiceUtil" %>
<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="com.artonis.core.system.authentication.service.util.AuthenticationServiceUtil" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>
<%
    String jsFileName = pageContext.getPage().getClass().getName();
    jsFileName = jsFileName.substring(jsFileName.lastIndexOf(".") + 1).replace("_jsp", ".js");
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String notAllowDelete = resource.getString("clinic.patientfile.error.delete.patient");
%>
<base:pageHeader></base:pageHeader>

<%
    if (AuthenticationServiceUtil.isAdmin()) {
%>
<%--<base:button id="endless" text="endlessIntegration" />--%>
<base:mehrSys-grid-text name="grid" transportReadUrl="${basePath}/grid-read" modelFieldFilter="searchField">
	<base:my-grid-column title='clinic.patient.date' field="date" width="30px" />
	<base:my-grid-column title='clinic.patient.fileNumber' field="filenumber" width="30px" />
	<base:my-grid-column title='clinic.patient.firstName' field="firstname" width="30px" />
	<base:my-grid-column title='clinic.patient.lastName' field="lastname" width="40px" />
	<base:my-grid-column title='clinic.patient.fatherName' field="fathername" width="30px" />
	<base:my-grid-column title='clinic.patient.nationalCode' field="nationalCode" width="30px" />
	<base:my-grid-column title='clinic.patient.age' field="age" width="15px" />
	<base:my-grid-column title='clinic.patient.birthDate' field="birthYear" width="20px" />
	<base:my-grid-column title='clinic.patient.tel1' field="tel1" width="30px" />
	<base:my-grid-column title='clinic.patient.cellPone' field="cellphon" width="30px" />
	<base:my-grid-column title='his.patient.doctorName' field="doctorFam" width="30px" />
	<base:my-grid-column title='clinic.patient.isHide' field="isHide" width="30px" />
	<base:my-grid-column title='clinic.patient.externalId' field="externalId" width="30px" />

	<base:my-grid-schema-field name="filenumber" type="string" />
	<base:my-grid-schema-field name="firstName" type="string" />
	<base:my-grid-schema-field name="lastName" type="string" />
	<base:my-grid-schema-field name="fatherName" type="string" />
	<base:my-grid-schema-field name="nationalCode" type="string" />
	<base:my-grid-schema-field name="age" type="number" />
	<base:my-grid-schema-field name="birthYear" type="int" />
	<base:my-grid-schema-field name="tel1" type="string" />
	<base:my-grid-schema-field name="cellPone" type="string" />
	<base:my-grid-schema-field name="doctorFam" type="string" />
    <base:my-grid-schema-field name="isHide" type="string" />
	<%--<base:my-grid-function text="clinic.patient.FinanceRegistration" functionClick="grid_onFNCRegistrationClick"  name="FNCRegistrationClick"/>--%>
	<base:my-grid-function text="clinic.patientfile" functionClick="grid_onPatientFile" name="patientFile" />
	<base:my-grid-function text="clinic.patient.visit" functionClick="grid_onVisit_admin" name="visit" />
	<base:my-grid-function text="clinic.patient.sendForVisit" functionClick="grid_onSendVisit_admin" name="sendVisit" />
</base:mehrSys-grid-text>
<%
} else if (HrmCoreServiceUtil.isEmployeeWorkingGroupOfficial(GlobalVariable.getEmployee().getWorkingGroup())) {
%>
<base:mehrSys-grid-text name="grid" transportReadUrl="${basePath}/grid-read" modelFieldFilter="searchField">
    <base:my-grid-column title='clinic.patient.date' field="date" width="30px" />
	<base:my-grid-column title='clinic.patient.fileNumber' field="filenumber" width="30px" />
	<base:my-grid-column title='clinic.patient.firstName' field="firstname" width="30px" />
	<base:my-grid-column title='clinic.patient.lastName' field="lastname" width="40px" />
	<base:my-grid-column title='clinic.patient.fatherName' field="fathername" width="30px" />
	<base:my-grid-column title='clinic.patient.nationalCode' field="nationalCode" width="30px" />
	<base:my-grid-column title='clinic.patient.age' field="age" width="15px" />
	<base:my-grid-column title='clinic.patient.birthDate' field="birthYear" width="20px" />
	<base:my-grid-column title='clinic.patient.tel1' field="tel1" width="30px" />
	<base:my-grid-column title='clinic.patient.cellPone' field="cellphon" width="30px" />
	<base:my-grid-column title='his.patient.doctorName' field="doctorFam" width="30px" />
    <base:my-grid-column title='clinic.patient.isHide' field="isHide" width="30px" />
    <base:my-grid-column title='clinic.patient.externalId' field="externalId" width="30px" />

	<base:my-grid-schema-field name="filenumber" type="string" />
	<base:my-grid-schema-field name="firstName" type="string" />
	<base:my-grid-schema-field name="lastName" type="string" />
	<base:my-grid-schema-field name="fatherName" type="string" />
	<base:my-grid-schema-field name="nationalCode" type="string" />
	<base:my-grid-schema-field name="age" type="number" />
	<base:my-grid-schema-field name="birthYear" type="int" />
	<base:my-grid-schema-field name="tel1" type="string" />
	<base:my-grid-schema-field name="cellPone" type="string" />
	<base:my-grid-schema-field name="doctorFam" type="string" />
    <base:my-grid-schema-field name="isHide" type="string" />
	<%--<base:my-grid-function text="clinic.patient.FinanceRegistration" functionClick="grid_onFNCRegistrationClick"  name="FNCRegistrationClick"/>--%>
	<%--<base:my-grid-function text="clinic.patient.paraClinic" functionClick="grid_onParaClinic"  name="paraClinic"/>--%>
	<base:my-grid-function text="clinic.patient.sendForVisit" functionClick="grid_onVisit" name="sendVisit" />
	<base:my-grid-function text="clinic.patientfile" functionClick="grid_onPatientFile" name="patientFile" />
</base:mehrSys-grid-text>
<%
} else if (HrmCoreServiceUtil.isEmployeeWorkingGroupDoctor(GlobalVariable.getEmployee().getWorkingGroup())) {
%>
<base:mehrSys-grid-text name="grid" transportReadUrl="${basePath}/grid-read" modelFieldFilter="searchField">
    <base:my-grid-column title='clinic.patient.date' field="date" width="30px" />
	<base:my-grid-column title='clinic.patient.fileNumber' field="filenumber" width="30px" />
	<base:my-grid-column title='clinic.patient.firstName' field="firstname" width="30px" />
	<base:my-grid-column title='clinic.patient.lastName' field="lastname" width="40px" />
	<base:my-grid-column title='clinic.patient.fatherName' field="fathername" width="30px" />
	<base:my-grid-column title='clinic.patient.nationalCode' field="nationalCode" width="30px" />
	<base:my-grid-column title='clinic.patient.age' field="age" width="15px" />
	<base:my-grid-column title='clinic.patient.birthDate' field="birthYear" width="20px" />
	<base:my-grid-column title='clinic.patient.tel1' field="tel1" width="30px" />
	<base:my-grid-column title='clinic.patient.cellPone' field="cellphon" width="30px" />

	<base:my-grid-schema-field name="filenumber" type="string" />
	<base:my-grid-schema-field name="firstName" type="string" />
	<base:my-grid-schema-field name="lastName" type="string" />
	<base:my-grid-schema-field name="fatherName" type="string" />
	<base:my-grid-schema-field name="nationalCode" type="string" />
	<base:my-grid-schema-field name="age" type="number" />
	<base:my-grid-schema-field name="birthYear" type="int" />
	<base:my-grid-schema-field name="tel1" type="string" />
	<base:my-grid-schema-field name="cellPone" type="string" />
	<%--<base:my-grid-function text="clinic.patient.FinanceRegistration" functionClick="grid_onFNCRegistrationClick"  name="FNCRegistrationClick"/>--%>
	<base:my-grid-function text="clinic.patientfile" functionClick="grid_onPatientFile" name="patientFile" />
	<base:my-grid-function text="clinic.patient.visit" functionClick="grid_onVisit" name="visit" />
</base:mehrSys-grid-text>
<%
    }
%>
<div id="p-patientFile" dir="ltr">
    <br>
    <%--<div id="p-patientFileContainer"  style="overflow-y: auto; max-width:100%; max-height:400px">--%>
    <div id="p-patientFileContainer"
         style="overflow-y: auto; max-width: 100%; max-height: 400px">
        <%--<ul id="p-patientFileContainer">--%>
        <%--</ul>--%>
    </div>
</div>

<%--<input type="button"--%>
<%--onclick="tableToExcel('testTable', 'W3C Example Table')"--%>
<%--value="Export to Excel">--%>

<table id="testTable"
       summary="Code page support in different versions of MS Windows."
       rules="groups" frame="hsides" border="2">
</table>

<base:footer/>

<script>
    <%--var tableToExcel = (function () {--%>


        <%--return function (table, name) {--%>
            <%--if (!table.nodeType)--%>
                <%--table = document.getElementById(table);--%>

            <%--$.ajax({--%>
                <%--url: "${pageContext.request.contextPath}" + "/clinic/patientr/patientr/export",--%>
                <%--type: "GET",--%>
                <%--dataType: "json",--%>
                <%--contentType: "application/json; charset=utf-8",--%>
                <%--success: function (data) {--%>
                    <%--var uri = 'data:application/vnd.ms-excel;base64,'--%>
                            <%--, template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>' + data.exportMessage + '</table></body></html>'--%>
                            <%--, base64 = function (s) {--%>
                                <%--return window.btoa(unescape(encodeURIComponent(s)))--%>
                            <%--}--%>
                            <%--, format = function (s, c) {--%>
                                <%--return s.replace(/{(\w+)}/g, function (m, p) {--%>
                                    <%--return c[p];--%>
                                <%--})--%>
                            <%--}--%>
                    <%--var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}--%>
                    <%--window.location.href = uri + base64(format(template, ctx))--%>
                <%--}, error: function (result) {--%>
                    <%--if (result.status == 401) {--%>
                        <%--top.location.href = top.location.href;--%>
                    <%--}--%>
                <%--}--%>
            <%--});--%>

        <%--}--%>

    <%--})()--%>

    $('#endless').on("click", function (e) {
        $.getJSON(basePath + 'endlessendlessPatientConvert', function (result) {
            if (result.state == "success") {
                grid = $("#grid").data("kendoGrid");
                grid.dataSource.page(grid.dataSource.page());
                evaluteSum();
            }
        });
    });


    $("#p-patientFile").dialog({
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
        }, close: function (event, ui) {
            emptyPatientFile();
        }
    });

    jQuery('body')
            .bind(
            'click',
            function (e) {
                if (
                        jQuery('#p-patientFile').dialog('isOpen')
                        && !jQuery(e.target).is('.ui-dialog, a')
                        && !jQuery(e.target).closest('.ui-dialog').length
                        && event.target.nodeName != "H2"
                ) {
                    jQuery('#p-patientFile').dialog('close');
                }
            }
    );


    function grid_onVisit(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        window.location = "${pageContext.request.contextPath}" + "/clinic/patient/visitQueue/editWP/patientId=" + data.id;
    }

    function grid_onSendVisit_admin(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        window.location = "${pageContext.request.contextPath}" + "/clinic/patient/visitQueue/editWP/patientId=" + data.id + ",sendvisit";
    }

    function grid_onVisit_admin(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        window.location = "${pageContext.request.contextPath}" + "/clinic/patient/visitQueue/editWP/patientId=" + data.id + ",visit";
    }

    function grid_onFNCRegistrationClick(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        window.location = "${pageContext.request.contextPath}" + "/clinic/cash/cashVisit/editWP/patientId=" + data.id;
    }

    function grid_onParaClinic(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        window.location = "${pageContext.request.contextPath}" + "/clinic/patient/paraClinic/editWP/patientId=" + data.id;
    }
    function grid_onPatientFile(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        loadPatientFile(data.id);

    }

    function loadPatientFile(id) {
    	var filterType = <%=PatientFileFilterTypeEnum.SHOW_All.getValue()%>;
        $.getJSON("<c:url value='/' />" + "clinic/patient/visitMobileBase/loadByPatient/" + id + "/" + filterType, function (data) {

            $("#p-patientFileContainer").append(data.data);
//            $("#p-patientFileContainer").accordion({
//                heightStyle: "content",
//                collapsible: true
//            });
//            $("#p-patientFileContainer").accordion("refresh");


            $("#p-patientFile").dialog("open");
            var patientFileArray = $('div[id^="accordion-patientFile-"]');
            for (var j = 0; j < patientFileArray.length; j++) {
                $("#" + patientFileArray[j].id).accordion({
                    heightStyle: "content",
                    collapsible: true
//            header: "h3"
                });
            }
        });
    }
    function emptyPatientFile() {
        $("#p-patientFileContainer").empty();
    }

    function callback_grid_before_delete(data) {
        var patientId = data.id;
        <%--$.getJSON("<c:url value='/' />" + "clinic/patient/visitMobileBase/countVisit/" + patientId , function(data) {--%>
        <%----%>
        <%--});--%>

        var returnValue;
        $.ajax({
            url: "<c:url value='/' />" + "clinic/patient/visitMobileBase/countVisit/" + patientId,
            dataType: 'json',
            async: false,
            success: function (data) {
                console.log(data);
                if (data == 0) {
                    returnValue = "true";
                } else {
//                    notAllowDelete
                    alertify.alert("<%=notAllowDelete%>");
                    returnValue = "false";
                }
            }
        });
        return returnValue;

    }
</script>

