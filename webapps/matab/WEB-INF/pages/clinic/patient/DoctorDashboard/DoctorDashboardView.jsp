<%@page import="org.springframework.web.util.UrlPathHelper" %>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@page import="com.artonis.core.system.authentication.model.Role" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<%
    String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
    String menuSysCode = String.valueOf(request.getAttribute("menuSystemCode"));
    request.setAttribute("basePath", basePath);
    //
    boolean showFinanceReport = GlobalVariable.getButtonContainer(menuSysCode, "showFinanceReport");
%>

<input name="loadedId" type="hidden" id="loadedId"/>

<div class="body-header">
    <ul class="uk-breadcrumb uk-h3" id="breadcrumb">
        <li id="breadcrumb-main-section"><span>${pageTitle}</span>
        </li>
    </ul>
    <div id="header-toolbar">
        <base:buttonPermission key="clinic.patient.doctorDashboard.refresh" classNames="uk-button uk-button-success"
                               id="doctorDashboardView-refresh-btn" onClick="javascript:refreshClick()"/>
        <base:buttonPermission key="clinic.patient.doctorDashboard.updateCurrentDateVisitQueueTurn" classNames="uk-button uk-button-success"
                               id="doctorDashboardView-updateCurrentDateVisitQueueTurn-btn" onClick="javascript:updateCurrentDateVisitQueueTurnClick()"/>
        <base:buttonPermission key="clinic.patient.doctorDashboard.convertMongoDataType" classNames="uk-button uk-button-danger"
                               id="doctorDashboardView-convertMongoDataType-btn" onClick="javascript:convertMongoDataTypeClick()"/>
    </div>
</div>

<div>
    <% if (GlobalVariable.getButtonContainer(menuSysCode, "clerkDoctorComboSection")) { %>
        <div class="uk-grid uk-grid-preserve clerkDoctorComboSectionDiv">
            <base:comboBox name="doctorId" key="clinic.patient.doctor" comboLoaderUrl="combo/loadAllDoctor" styleClass="normal" />
        </div>
    <%}%>
</div>

<base:mehrSys-grid-comboAndDateWithoutButton isPopup="true" name="grid" transportReadUrl="${basePath}/grid-read" pageSize="100"
                                             categoriesReadUrl="${basePath}/allState" comboCaption="comboCaption"
                                             comboId="comboId" modelFieldFilterCombo="state" modelFieldFilterText="searchField" selectable="single"
                                             comboLabelCaptionKey="his.patient.visitInfo.stateFilter" hasSearchDate="true" followFunction="evaluteSum"
                                             dateFieldName="visitDate" selectedIndexDropDown="1" keyConfirmCheck="his.patient.visitQueue.alert.confirmVisitCheck">

    <base:my-grid-column title='clinic.patient.fileNumber' field="fileNumber" width="40px"  showWithPermission="true"/>
    <base:my-grid-column title='clinic.patient.visitQueueTurn' field="visitQueueTurn" width="25px" showWithPermission="true"/>
    <base:my-grid-column title='clinic.patient.firstName' field="patientName" width="60px"/>
    <base:my-grid-column title='clinic.patient.lastName' field="patientFam" width="60px"/>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.service.name' field="serviceName" width="80px"/>
    <base:my-grid-column title='clinic.patient.age' field="age" width="30px"/>
    <base:my-grid-column title='clinic.basicInfo.diagnosis.diagnosis' field="patientLastDiagnosis" width="75px"/>
    <base:my-grid-column title='clinic.patient.visitQueue.insurance' field="insuranceName" width="40px"/>
    <base:my-grid-column title='his.patient.visitQueue.state' isFlag="true"
                         flagIconUrl="/resources/images/black/button-check.png" flagDestinationUrl="DoVisitUnvisit" field="visitUnvisit" width="30px"/>
    <base:my-grid-column title='clinic.patient.livesIn' field="cityName" width="45px"/>

    <base:my-grid-function text="clinic.patient.visit" functionClick="grid_onVisit" name="visit"/>
    <base:my-grid-function text="clinic.patient.visitQueue.forceTurn" functionClick="grid_onForceTurnClick" name="forceTurn"/>
    <base:my-grid-function text="clinic.patient.visitQueue.postponeTurn" functionClick="grid_onPostponeTurnClick" name="postponeTurn"/>
    <base:my-grid-function text="clinic.patient.radiology" functionClick="grid_onRadiology" name="radiology"/>
    <base:my-grid-function text="clinic.patient.surgery" functionClick="grid_onSurgery" name="surgery"/>
</base:mehrSys-grid-comboAndDateWithoutButton>

<%if (showFinanceReport) {%>
    <div id="totalAccordion" style="border: 1">
        <h3 id="totalAccordionTab" style="	margin-bottom: 5px;
            background: linear-gradient(to bottom, rgba(160, 188, 197, 1) 0%,rgba(190, 201, 206, 1) 37%,rgba(121, 139, 142, 1) 100%);
            border-width: thin;
            border-color: cornflowerblue;
            text-align: -webkit-center;
            font-weight: bold;">گزارش عملکرد به تفکیک زمان</h3>
        <div class="uk-grid uk-grid-preserve">
            <base:my-grid name="totalGrid" transportReadUrl="${basePath}/grid-read-totalgrid" showOperation="false" groupable="false" showToolbar="false">
                <base:my-grid-column title='his.patient.visitQueue.patientCount' field="patientCount" width="20px"/>
                <base:my-grid-column title='his.patient.visitQueue.date' field="visitDate" width="20px"/>
                <base:my-grid-column title='his.patient.visitQueue.serviceItemName' field="serviceName" width="30px"/>
                <base:my-grid-column title='his.patient.visitQueue.countDoOperation' field="doneCount" width="30px"/>
                <base:my-grid-column title='his.patient.visitQueue.countWait' field="waitingCount" width="30px"/>
            </base:my-grid>
        </div>
    </div>
    <div id="aggregateAccordion" style="border: 1">
        <h3 id="aggregateAccordionTab" style="	margin-bottom: 5px;
             background: linear-gradient(to bottom, rgba(160, 188, 197, 1) 0%,rgba(190, 201, 206, 1) 37%,rgba(121, 139, 142, 1) 100%);
            border-width: thin;
            border-color: cornflowerblue;
            text-align: -webkit-center;
            font-weight: bold;">گزارش تجمیعی عملکرد</h3>
        <div class="uk-grid uk-grid-preserve">
            <base:my-grid name="totalGridAggregate" transportReadUrl="${basePath}/grid-read-totalgrid-aggregate" showOperation="false" groupable="false" showToolbar="false">
                <base:my-grid-column title='his.patient.visitQueue.patientCount' field="patientCount" width="20px"/>
                <base:my-grid-column title='his.patient.visitQueue.serviceItemName' field="serviceName" width="120px"/>
            </base:my-grid>
        </div>
    </div>
<%}%>

<script>
    var isForFirstTimeReload = true;
    function grid_onVisit(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        window.location = "${pageContext.request.contextPath}" + "/clinic/patient/configurablePatientRecord/" + data.patient_id + "/" + data.id + "/" + data.mongoVisit_id;
    }
    function evaluteSum() {
        var showFinanceReport = <%=showFinanceReport%>;
        if (!showFinanceReport) {
            return;
        }
        //
        var tmp1 = {};
        var valueC = $(categories).val(), grid = $("#${name}").data("kendoGrid");
        var valueT = $(categoriesId).val(), grid = $("#${name}").data("kendoGrid");
        var valueFD = $(fromDate).val(), grid = $("#${name}").data("kendoGrid");
        var valueTD = $(toDate).val(), grid = $("#${name}").data("kendoGrid");
        if (isForFirstTimeReload == false) {
            var mapSearch = {};

            mapSearch.fromDate = $("#fromDate").val();
            mapSearch.toDate = $("#toDate").val();
            var searchJsonString = JSON.stringify(mapSearch);
            searchJsonString = searchJsonString.replace(/\//g, ':@:');

            var urlGrid = window.location.href + "grid-read-totalgrid/" + searchJsonString

            $("#totalGrid").data("kendoGrid").dataSource.transport.options.read.url = urlGrid;
            $("#totalGrid").data("kendoGrid").dataSource.page($("#totalGrid").data("kendoGrid").dataSource.page());

            var urlGridAggregagte = window.location.href + "grid-read-totalgrid-aggregate/" + searchJsonString

            $("#totalGridAggregate").data("kendoGrid").dataSource.transport.options.read.url = urlGridAggregagte;
            $("#totalGridAggregate").data("kendoGrid").dataSource.page($("#totalGridAggregate").data("kendoGrid").dataSource.page());
        }
        var searchFilters = [];
        if (isForFirstTimeReload == true) {
            tmp1['state'] = parseInt(2);
            isForFirstTimeReload = false;
        } else if (valueC) {
            tmp1['state'] = parseInt(valueC);
        }

        if (valueT) {
            searchFilters.push({field: "${modelFieldFilterText}", operator: "contains", value: (valueT)});
            tmp1['searchField'] = (valueT);
        }
        if (valueFD) {
            tmp1['fromDate'] = (valueFD);
        }
        if (valueTD) {
            tmp1['toDate'] = (valueTD);
        }
    }

    function _grid_confirmYes_callback(e) {
        evaluteSum();
    }

    function refreshClickFromSecondDb() {
        $.getJSON(basePath + 'runUpdateFromSecondDbScheduler', function (result) {
            if (result.state == "success") {
                grid = $("#grid").data("kendoGrid");
                grid.dataSource.page(grid.dataSource.page());
                evaluteSum();
            }
        });
    }

    function refreshClick() {
        grid = $("#grid").data("kendoGrid");
        grid.dataSource.page(grid.dataSource.page());
        evaluteSum();
    }

    function grid_onMyEdit(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        window.location = basePath + "edit/" + data.id;
        window.location = "${pageContext.request.contextPath}" + "/clinic/cash/visitedPatients/edit/" + data.id;
    }

    function grid_onVisitPatientEdit(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        var tmp = {};
        tmp['id'] = data.id;
        jQuery.ajax({
            url: "${pageContext.request.contextPath}" + "/clinic/cash/visitedPatients/visit",
            type: "POST",
            data: JSON.stringify(tmp),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.state == "error") {
                    for (var i = 0; i < result.errors.length; i++) {
                        if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                            alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                        } else {
                            alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
                        }
                    }
                }
                if (result.state == "success") {
                    alertify.success(result.message);
                    if (document.getElementById("loadedId") != null) {
                        document.getElementById("loadedId").value = result.baseObjectId;
                    }
                    grid = $("#grid").data("kendoGrid");
                    grid.dataSource.query();
                    $.getJSON(basePath + 'reset/', function (data) {
                        $('#mainForm').deserialize(data);
                    });
                }
            },
            error: function (result) {
                if (result.status == 401) {
                    window.location.href = "";
                }
            }
        });
    }

    function _grid_onDataBound_callback(e) {
        var grid = $("#grid").data("kendoGrid");
        var data = grid.dataSource.data();
        console.log(data);
        $.each(data, function (i, row) {
            if (row.state == 1) {
                $('tr[data-uid="' + row.uid + '"] ').css("background-color", "green");
            }
            else if (row.state == 3) {
                $('tr[data-uid="' + row.uid + '"] ').css("background-color", "gold");
            }
        });
    }

    $(document).ready(function () {
        setInterval(function(){
            refreshClick();
        }, 40000);
        //
        evaluteSum();
        $(".k-toolbar")[0].style.height = "";
        var icons = {
            header: "ui-icon-circle-arrow-e",
            activeHeader: "ui-icon-circle-arrow-s"
        };
        $("#aggregateAccordion").accordion({
            icon: icons,
            heightStyle: "content",
            collapsible: true,
            active: false
        });
        $("#totalAccordion").accordion({
            icon: icons,
            heightStyle: "content",
            collapsible: true,
            active: false
        });
    });

    function grid_finalizeSearchFilter(searchFilters) {
        <%if (GlobalVariable.getEmployee().getWorkingGroup() != com.artonis.hrm.core.model.ConstValue.EmployeeWorkingGroupEnum.DOCTOR.getValue()) {%>
            var valueTD = $("#doctorId").val(), grid = $("#grid").data("kendoGrid");
            if (valueTD) {
                searchFilters.push({ field: "clerkSelectedDoctorId", operator: "eq", value: (valueTD) });
            }
        <%}%>
    }

    function grid_onForceTurnClick(e){
        if ($("#doctorId").val() == null || $("#doctorId").val() == undefined || $("#doctorId").val() < 1) {
            alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.visitQueue.error.selectDoctor")%>");
            return;
        }
        var data = this.dataItem($(e.target).closest("tr"));
        $.getJSON(basePath + 'doForceTurn/' + data.id, function (result) {
            if (result.state == "success") {
                grid = $("#grid").data("kendoGrid");
                grid.dataSource.page(grid.dataSource.page());
                //
                alertify.success(result.message);
            }
        });
    }

    function grid_onPostponeTurnClick(e){
        if ($("#doctorId").val() == null || $("#doctorId").val() == undefined || $("#doctorId").val() < 1) {
            alertify.error("<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.visitQueue.error.selectDoctor")%>");
            return;
        }
        var data = this.dataItem($(e.target).closest("tr"));
        $.getJSON(basePath + 'doPostponeTurn/' + data.id, function (result) {
            if (result.state == "success") {
                grid = $("#grid").data("kendoGrid");
                grid.dataSource.page(grid.dataSource.page());
                //
                alertify.success(result.message);
            }
        });
    }

    function callback_change_doctorId (e){
        doSearchLikeOnGrid();
    }
    
    function updateCurrentDateVisitQueueTurnClick() {
        $.getJSON(basePath + 'updateCurrentDateVisitQueueTurn', function (result) {
            if (result.state == "success") {
                grid = $("#grid").data("kendoGrid");
                grid.dataSource.page(grid.dataSource.page());
                evaluteSum();
            }
        });
    }

    function convertMongoDataTypeClick() {
        $.getJSON(basePath + 'convertMongoDataType', function (result) {
            if (result.state == "success") {
                alertify.success(result.message);
            }
        });
    }

    function grid_onRadiology(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        window.location = "${pageContext.request.contextPath}" + "/clinic/patient/radiologyExplaination/" + data.patient_id + "/" + data.id + "/" + data.mongoVisit_id;
    }

    function grid_onSurgery(e) {
        var data = this.dataItem($(e.target).closest("tr"));
        window.location = "${pageContext.request.contextPath}" + "/clinic/patient/doctorSurgery/" + data.patient_id + "/" + data.id + "/" + data.mongoVisit_id;
    }
</script>

<style>
    #body-table1 * {
        font-family: B Nazanin !important;
        font-size: 24px !important;
    }

    .clerkDoctorComboSectionDiv {
        background: -webkit-gradient(linear, left top, left bottom, color-stop(29%,rgba(212,225,241,1)), color-stop(33%,rgba(201,218,238,1)), color-stop(100%,rgba(228,240,253,1)));
        padding-top: 10px;
        padding-bottom: 10px;
        margin-top: 2px;
        margin-bottom: 3px;
        border-width: thin;
        border-style: outset;
    }

    .clerkDoctorComboSectionDiv .uk-width-1-10 {
        position: relative;
        top: 15px;
        width: 7%;
    }
</style>