<%@ page import="com.artonis.core.base.core.Date" %>
<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
    Date curDate=new Date(System.currentTimeMillis());
    String curStringDate=curDate.toString();
%>
<base:pageHeaderTitle/>
<div style="display:inline;" id="modal-detail"></div>
<div id="dialog" title='<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.PatientRegistered.changeState") %>' style="display: none">
    <div class="uk-grid uk-grid-preserve">
      <base:comboBox name="stateCombo" key="com.artonis.clinic.basicInfo.operation.status" comboLoaderUrl="combo/loadStateByServiceId/-1"/>
    </div>
</div>
<div id="showLogDialog" class="background" style="display:none;padding-top: 20px; padding-bottom: 20px; " >
	<base:my-grid name="logGrid" transportReadUrl="${basePath}/grid-read-log/-1" showOperation="false" showToolbar="false" groupable="false">
		<base:my-grid-column title="com.artonis.clinic.basicInfo.PatientRegistered.log.user" field="username"  width="10px"/>
		<base:my-grid-column title="com.artonis.clinic.basicInfo.PatientRegistered.log.state" field="newStateName"  width="10px"/>
		<base:my-grid-column title="com.artonis.clinic.basicInfo.PatientRegistered.log.time" field="timeMillisStr"  width="10px"/>
	</base:my-grid>
</div>


<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:testBox name="patientFullName" key="clinic.patient.name" styleClass="small"/>
            <base:testBox name="fileNumber" key="clinic.patient.fileNumber" styleClass="small"/>
            <base:multiSelect serverFilter="true" name="doctor_id"  key="his.patient.doctorName" multiSelectLoaderUrl="combo/loadAllDoctor" styleClass="small"/>

        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:comboBox styleClass="small" name="department_id" comboLoaderUrl="combo/loadDepartment" key="com.artonis.clinic.operation.department"/>
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:cascadeComboBox  name="state"  key="com.artonis.clinic.basicInfo.operation.status" comboLoaderUrl="combo/loadDoOperationState" styleClass="small" cascadeCombo="department_id"/>
            <base:comboBox  name="type"  key="com.artonis.clinic.basicInfo.PatientRegistered.isQuestionDrugOrIsAnswerLabtest" comboLoaderUrl="combo/loadType" styleClass="small"/>
            <base:comboBox  name="foundPatientFile"  key="com.artonis.clinic.basicInfo.PatientRegistered.isFoundPatientFile" comboLoaderUrl="combo/loadFoundPatientFileState" styleClass="small"/>
            <%--<base:comboBox selectIndex="0" name="doOperation"  key="com.artonis.clinic.basicInfo.operation.status" comboLoaderUrl="combo/loadDoOperationState" styleClass="small"/>--%>

        </div>


    </form>
</div>
<div class="uk-container uk-container-center my-uk-container" >

    <%
        String menuSysCode =String.valueOf(request.getAttribute("menuSystemCode"));
        if(GlobalVariable.getButtonContainer(menuSysCode, "visit-unvisit-btn")){
    %>
    <base:my-grid-search  showMultipleDelete="false" showOperation="true">
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.date' field="visitDate"  width="30px"/>
        <base:my-grid-column title='clinic.patient.firstName' field="patientName"  width="30px"/>
        <base:my-grid-column title='clinic.patient.lastName' field="patientFam"  width="30px"/>
        <base:my-grid-column title='clinic.patient.fileNumber' field="fileNumber"  width="30px"/>
        <base:my-grid-column title='his.patient.doctorName' field="doctorFam"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.service_id' field="serviceName"  width="30px"/>
        <base:my-grid-column title='clinic.basicInfo.financeRegistration.print.visitTime' field="appointmentVisitTime"  width="30px"/>
        <base:my-grid-column title='clinic.basicInfo.financeRegistration.print.turn' field="turn"  width="20px"/>
        <base:my-grid-column title='com.artonis.clinic.basicInfo.operation.status' field="stateName"  width="30px"/>
        <base:my-grid-function text="com.artonis.clinic.basicInfo.PatientRegistered.changeState" functionClick="grid_state" name="stateFunc" />
        <base:my-grid-function text="com.artonis.clinic.basicInfo.PatientRegistered.showUserLog" functionClick="grid_showLog" name="grid_showLog" />

        <base:my-grid-column title='com.artonis.clinic.basicInfo.PatientRegistered.isAnswerLabtest' dialogConfirmName="changeIsAnswerLabtest" dialogConfirmKey="com.artonis.clinic.basicInfo.PatientRegistered.alert.confirmAnswerLabtest"
                             isFlag="true" flagIconUrl="/resources/images/black/button-check.png" flagDestinationUrl="changeIsAnswerLabtest"  field="changeIsAnswerLabtest"  width="25px"/>
        <base:my-grid-column title='com.artonis.clinic.basicInfo.PatientRegistered.isAnswerLabtest'  field="isAnswerLabtestStr"  width="25px"/>

        <base:my-grid-column title='com.artonis.clinic.basicInfo.PatientRegistered.isQuestionDrug' dialogConfirmName="changeIsQuestionDrug" dialogConfirmKey="com.artonis.clinic.basicInfo.PatientRegistered.alert.confirmQuestionDrug"
                             isFlag="true" flagIconUrl="/resources/images/black/button-check.png" flagDestinationUrl="changeIsQuestionDrug"  field="changeIsQuestionDrug"  width="25px"/>
        <base:my-grid-column title='com.artonis.clinic.basicInfo.PatientRegistered.isQuestionDrug'  field="isQuestionDrugStr"  width="25px"/>

        <base:my-grid-column title='com.artonis.clinic.basicInfo.PatientRegistered.isFoundPatientFile' dialogConfirmName="changeIsFoundPatientFile" dialogConfirmKey="com.artonis.clinic.basicInfo.PatientRegistered.alert.confirmFoundPatientFile"
                             isFlag="true" flagIconUrl="/resources/images/black/button-check.png" flagDestinationUrl="changeIsFoundPatientFile"  field="changeIsFoundPatientFile"  width="25px"/>
        <base:my-grid-column title='com.artonis.clinic.basicInfo.PatientRegistered.isFoundPatientFile'  field="isFoundPatientFileStr"  width="25px"/>


        <base:my-grid-schema-field name="visitDate" type="string" />
        <base:my-grid-schema-field name="patientName" type="string" />
        <base:my-grid-schema-field name="patientFam" type="string" />
        <base:my-grid-schema-field name="fileNumber" type="string" />
        <base:my-grid-schema-field name="serviceName" type="string" />
        <base:my-grid-schema-field name="appointmentVisitTime" type="string" />
        <base:my-grid-schema-field name="turn" type="string" />
    </base:my-grid-search>
    <%
        }else{%>
    <base:my-grid-search  showMultipleDelete="false" showOperation="false">
        <base:my-grid-column title='com.artonis.clinic.operation.factorView.date' field="visitDate"  width="30px"/>
        <base:my-grid-column title='clinic.patient.firstName' field="patientName"  width="30px"/>
        <base:my-grid-column title='clinic.patient.lastName' field="patientFam"  width="30px"/>
        <base:my-grid-column title='clinic.patient.fileNumber' field="fileNumber"  width="30px"/>
        <base:my-grid-column title='his.patient.doctorName' field="doctorFam"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.service_id' field="serviceName"  width="30px"/>
        <base:my-grid-column title='clinic.basicInfo.financeRegistration.print.visitTime' field="appointmentVisitTime"  width="30px"/>
        <base:my-grid-column title='clinic.basicInfo.financeRegistration.print.turn' field="turn"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.basicInfo.operation.status' field="stateName"  width="30px"/>
        <base:my-grid-column title='com.artonis.clinic.basicInfo.PatientRegistered.isAnswerLabtest' dialogConfirmName="changeIsAnswerLabtest" dialogConfirmKey="com.artonis.clinic.basicInfo.PatientRegistered.alert.confirmAnswerLabtest"
                             isFlag="true" flagIconUrl="/resources/images/black/button-check.png" flagDestinationUrl="changeIsAnswerLabtest"  field="changeIsAnswerLabtest"  width="25px"/>
        <base:my-grid-column title='com.artonis.clinic.basicInfo.PatientRegistered.isAnswerLabtest'  field="isAnswerLabtestStr"  width="25px"/>
        <base:my-grid-column title='com.artonis.clinic.basicInfo.PatientRegistered.isQuestionDrug' dialogConfirmName="changeIsQuestionDrug" dialogConfirmKey="com.artonis.clinic.basicInfo.PatientRegistered.alert.confirmQuestionDrug"
                             isFlag="true" flagIconUrl="/resources/images/black/button-check.png" flagDestinationUrl="changeIsQuestionDrug"  field="changeIsQuestionDrug"  width="25px"/>
        <base:my-grid-column title='com.artonis.clinic.basicInfo.PatientRegistered.isQuestionDrug'  field="isQuestionDrugStr"  width="25px"/>

        <base:my-grid-column title='com.artonis.clinic.basicInfo.PatientRegistered.isFoundPatientFile' dialogConfirmName="changeIsFoundPatientFile" dialogConfirmKey="com.artonis.clinic.basicInfo.PatientRegistered.alert.confirmFoundPatientFile"
                             isFlag="true" flagIconUrl="/resources/images/black/button-check.png" flagDestinationUrl="changeIsFoundPatientFile"  field="changeIsFoundPatientFile"  width="25px"/>
        <base:my-grid-column title='com.artonis.clinic.basicInfo.PatientRegistered.isFoundPatientFile'  field="isFoundPatientFileStr"  width="25px"/>


        <base:my-grid-schema-field name="visitDate" type="string" />
        <base:my-grid-schema-field name="patientName" type="string" />
        <base:my-grid-schema-field name="patientFam" type="string" />
        <base:my-grid-schema-field name="fileNumber" type="string" />
        <base:my-grid-schema-field name="serviceName" type="string" />
        <base:my-grid-schema-field name="appointmentVisitTime" type="string" />
        <base:my-grid-schema-field name="turn" type="string" />
    </base:my-grid-search>

    <%}%>
    
    <%--<base:my-grid name="statisticGrid" transportReadUrl="${basePath}/grid-read-statistic" showOperation="false" showToolbar="false">--%>
    	<%--<base:my-grid-column title='com.artonis.clinic.operation.factorView.date' field="visitDate"  width="10px"/>--%>
    	<%--<base:my-grid-column title='com.artonis.clinic.operation.department' field="department_name"  width="20px"/>--%>
    	<%--<base:my-grid-column title='his.patient.doctorName' field="doctorFullName"  width="20px"/>--%>
    	<%--<base:my-grid-column title='com.artonis.clinic.basicInfo.financeRegistration.service_id' field="serviceName"  width="20px"/>--%>
    	<%--<base:my-grid-column title='com.artonis.clinic.basicInfo.operation.status' field="state_name"  width="15px"/>--%>
        <%--<base:my-grid-column title='com.artonis.clinic.basicInfo.PatientRegistered.count' field="count"  width="10px"/>--%>
    <%--</base:my-grid>--%>

</div>

<base:footer/>

<script type="text/javascript">
    var rowData;
    $(document).ready(function() {
    	
    	$('#statisticGrid .k-grouping-header').remove();

        //Increment the idle time counter every minute.
        var idleInterval = setInterval(timerIncrement, 60000); // 1 minute

        //Zero the idle timer on mouse movement.
        $(this).mousedown(function (e) {
            idleTime = 0;
        });
        $(this).keypress(function (e) {
            idleTime = 0;
        });


        resetForm();

        $( "#dialog" ).dialog({
            autoOpen: false,
            show: {
                effect: "blind",
                duration: 500
            },
            hide: {
                effect: "blind",
                duration: 500
            },
//            height:300,
            width:400,
            modal:true
        });
        
        $("#showLogDialog").dialog({
            autoOpen:false,
            show:{
                effect:"slide",
                duration:300
            },
            hide:{
                effect:"slide",
                duration:300
            },
            height:300,
            width:800,
            title:'<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.PatientRegistered.showUserLog") %>',
            modal:true,
            buttons:{
                "<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.close") %>":function () {
                    $(this).dialog("close");
                }
            }
        });
        
    });

    function grid_state(e){
        rowData = this.dataItem($(e.target).closest("tr"));
        var urlGrid = getBaseUrl() + "combo/loadStateByServiceId/" +rowData.service_id ;

        $("#stateCombo_Comb").data("kendoComboBox").dataSource.transport.options.read.url=urlGrid;
        $("#stateCombo_Comb").data("kendoComboBox").dataSource.page(1);


        $("#dialog" ).dialog( "open" );

    }
    
    function grid_showLog(e){
        rowData = this.dataItem($(e.target).closest("tr"));
        
    	var urlGrid=$("#logGrid").data("kendoGrid").dataSource.transport.options.read.url;
    	var indexnumber=urlGrid.valueOf().lastIndexOf("/");
        var subUrlGrid=urlGrid.valueOf().substring(0,indexnumber);
        urlGrid=subUrlGrid.valueOf()+"/"+rowData.id;
        $("#logGrid").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
        $("#logGrid").data("kendoGrid").dataSource.read();
        
        $("#showLogDialog" ).dialog( "open" );
    }

    function callback_DataBound_stateCombo(e){
        if(rowData!=undefined){
            $("#stateCombo_Comb").data("kendoComboBox").value(rowData.state);
        }
    }

    function callback_change_stateCombo(e){
        var tmp = {};
        tmp['id']= rowData.id;
        tmp['state']= $("#stateCombo_Comb").data("kendoComboBox").value();
        jQuery.ajax ({
            url: basePath + "changeState",
            type: "POST",
            data: JSON.stringify(tmp),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function(result){
                if(result.state == "success"){
                    var pageNumber=$("#searchGrid").data("kendoGrid").dataSource.page();
                    $("#searchGrid").data("kendoGrid").dataSource.read();
                    $("#searchGrid").data("kendoGrid").dataSource.page(pageNumber);
                    
                    pageNumber=$("#statisticGrid").data("kendoGrid").dataSource.page();
                    $("#statisticGrid").data("kendoGrid").dataSource.read();
                    $("#statisticGrid").data("kendoGrid").dataSource.page(pageNumber);
                    
                    $("#dialog" ).dialog( "close" );
                    
                    alertify.success(result.message);

                }else if(result.state == "error"){
                    $("#dialog" ).dialog( "close" );
                    for(var i=0; i<result.errors.length; i++){
                        alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                    }
                }else{
                    alertify.error("Something is not good! O_o");
                }
            },
            error:function(result){
                if(result.status==401){
                    window.location.href="";
                }
            }
        });
    }
    
    function timerIncrement() {
        console.log('timerIncrement');
        idleTime = idleTime + 1;
        if (idleTime > 1) { // 20 minutes
            console.log('location.reload');
            search();
        }
    }

    function resetForm(){
        $("#fromDate").val("<%=curStringDate%>");
        $("#toDate").val("<%=curStringDate%>");
    }
    
    function getSearchObject(){
        var view = {};
        view.fromDate=$("#fromDate").val();
        view.toDate=$("#toDate").val();
        view.doctor_id_values=$("#doctor_id_multiSelect").val();
        view.patientFullName=$("#patientFullName").val();
        view.fileNumber=$("#fileNumber").val();
        view.department_id=$("#department_id").val();
        view.state=$("#state").val();
        view.type=$("#type").val();
        view.foundPatientFile=$("#foundPatientFile").val();
        return view;
    }

    function searchGrid_onDataBound_callback(e){
        var grid = $("#searchGrid").data("kendoGrid");
        var data = grid.dataSource.data();
        $.each(data, function (i, row) {
            if (row.state==3){
                $('tr[data-uid="' + row.uid + '"] ').css("background-color", "gold");
            }
//            else if (row.state == 3){
//                $('tr[data-uid="' + row.uid + '"] ').css("background-color", "gold");
//            }
        });
    }

function doAfterSearch(str){
    var urlGrid = getBaseUrl() + "grid-read-statistic/" + str;
    $("#statisticGrid").data("kendoGrid").dataSource.transport.options.read.url = urlGrid;
    $("#statisticGrid").data("kendoGrid").dataSource.page(1);
}
</script>
<style type="text/css">
    .uk-modal-dialog{
        right:0px;
        margin-right: 0px;
        width: 100%;
        padding:0px;
        top: 5%;
    }
</style>

