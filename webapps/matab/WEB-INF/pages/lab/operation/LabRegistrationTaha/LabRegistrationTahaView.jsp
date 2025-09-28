<%@ page import="com.artonis.core.base.core.Date" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    Date curDate=new Date(System.currentTimeMillis());
    String curStringDate=curDate.toString();
%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
    <div align="right">
        <base:button key="fnc.btn.new"  id="body-heade-createParsipol" align="right" />
    </div>
</div>
<div class="uk-container uk-container-center my-uk-container">
    <form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id" >
        <input type="hidden" id="patientId" name="patientId" >
        <div class="uk-grid uk-grid-preserve">
            <base:comboBoxAutoComplete name="nameAndFam"  key="clinic.simpleFactor.searchPatient" styleClass="uk-width-9-10 nameAndFamCombo"
                                       comboLoaderUrl="/combo/loadPatinent" styledivLabel="padding-right: 0px !important;"
                                       dataTextField="searchField" dataValueField="id" minLength="0" hasTemplate="true" iscomboLoaderUrlRelative="true"
                                       templateComaSep="fullName,nationalCode,fathername,cellphon,filenumber"
                                       headerTemplateComaSep="com.appointment.nameAndFamily,clinic.patient.nationalCode,clinic.patient.fatherName,clinic.patient.cellPhone,clinic.patient.fileNumber" />

        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="midsmall" name="subscriptionNumber" key="lab.operation.labRegistration.subscriptionNumber"/>
            <base:testBox styleClass="midsmall" name="fileNumber" key="lab.operation.labRegistration.fileNumber"/>
            <base:comboBox styleClass="midsmall" name="insuranceContractNumber" key="lab.operation.labRegistration.insuranceContractNumber" comboLoaderUrl="combo/loadAllInsurance" isListConstant="true"  isMandatory="true"/>
            <base:comboBox styleClass="midsmall" name="suppInsuranceContractNumber" key="lab.operation.labRegistration.suppInsuranceContractNumber" comboLoaderUrl="combo/loadAllSuppInsurance" isListConstant="true"  isMandatory="true"/>
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="midsmall" name="nationalCode" key="lab.operation.labRegistration.nationalCode"/>
            <base:testBox styleClass="midsmall" name="firstName" key="lab.operation.labRegistration.firstName"/>
            <base:testBox styleClass="midsmall" name="lastName" key="lab.operation.labRegistration.lastName"/>
            <base:comboBox styleClass="midsmall" name="sex" key="lab.operation.labRegistration.sex" comboLoaderUrl="combo/loadAllSex" isListConstant="true"  isMandatory="true"/>
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="midsmall" name="fatherName" key="lab.operation.labRegistration.fatherName"/>
            <base:mDatePicker styleClass="midsmall" name="birthDate" key="lab.operation.labRegistration.birthDate"/>
            <base:testBoxNumeric styleClass="midsmall" name="age" key="lab.operation.labRegistration.age"/>
            <base:testBox styleClass="midsmall" name="cellphone" key="lab.operation.labRegistration.cellphone"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="midsmall" name="bookNumber" key="lab.operation.labRegistration.bookNumber"/>
            <base:testBox styleClass="midsmall" name="bookPage" key="lab.operation.labRegistration.bookPage"/>

            <base:comboBox styleClass="midsmall" name="application" key="lab.operation.labRegistration.application" comboLoaderUrl="combo/loadApplications" isListConstant="true"  isMandatory="true"/>

            <base:comboBox styleClass="midsmall" name="doctorId" key="lab.operation.labRegistration.doctorId" comboLoaderUrl="combo/loadAllDoctor" isListConstant="true"  isMandatory="true"/>
        </div>
        <div class="uk-container uk-container-center my-uk-container" style="margin-right: 0px;margin-left: 0px;">
            <div class="uk-grid uk-grid-preserve">
                <base:comboBox styleClass="midsmall" name="prefix" key="lab.operation.labRegistration.sex" comboLoaderUrl="combo/loadAllSex" isListConstant="true"  isMandatory="true"/>
                <base:testBox styleClass="midsmall" name="doctorName" key="lab.operation.labRegistration.doctorName"/>
                <base:testBox styleClass="midsmall" name="doctorFam" key="lab.operation.labRegistration.doctorFam"/>
                <base:testBox styleClass="midsmall" name="doctorCode" key="lab.operation.labRegistration.doctorCode"/>
            </div>

            <div class="uk-grid uk-grid-preserve">
                <base:comboBox styleClass="midsmall" name="specialtyName" key="lab.operation.labRegistration.specialtyName" comboLoaderUrl="combo/loadSpecialization" isListConstant="true"  isMandatory="true"/>
            </div>
        </div>
    </form>

                </div>
                <div class="uk-grid uk-grid-preserve">
                </div>
                 <div class="uk-grid uk-grid-preserve">
                </div>
               <div align="center">
                <base:SubmitButton/>
               </div> 
         
<base:Pattern3/>
<div id="formAccordion" style="border: 1">
    <h3 id="searchTab" style="	margin-bottom: 5px;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(29%,rgba(212,225,241,1)), color-stop(33%,rgba(201,218,238,1)), color-stop(100%,rgba(228,240,253,1)));
	/* color: #ffffff; */
	/* text-shadow: none; */
	border-width: thin;
	border-color: cornflowerblue;
	text-align: -webkit-center;
	font-weight: bold;">جستجوی پیشرفته</h3>
    <div id="search_back">
        <div class="uk-container uk-container-center my-uk-container" style="margin-top: 5px;margin-bottom: 5px;padding-top: 5px;padding-bottom: 5px;">
            <form class="uk-form" id="mainForm">
                <div class="uk-grid uk-grid-preserve">
                    <base:testBox name="searchPatientFullName" key="clinic.patient.name" styleClass="small"/>
                    <base:testBox name="patientFileNumber" key="clinic.patient.fileNumber" styleClass="small"/>
                    <base:testBox name="patientNationalCode" key="clinic.patient.nationalCode" styleClass="small"/>
                </div>
                <%--<div class="uk-grid uk-grid-preserve">--%>

                <%--<base:testBox name="patientOldFileNumber" key="com.artonis.clinic.operation.factor.oldFileNumber" styleClass="small"/>--%>
                <%--<base:comboBox name="sendToCash"  key="com.artonis.clinic.operation.factor.sendToCash" comboLoaderUrl="combo/allSendToCashState" styleClass="small"/>--%>
                <%--</div>--%>
                <div class="uk-grid uk-grid-preserve">
                    <base:testBox name="factor_id" key="lab.operation.labRegistration.factor_id" styleClass="small"/>
                    <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
                    <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>

                </div>

            </form>
        </div>


        <%--<base:my-grid name="grid" transportReadUrl="<%=gridUrl%>" selectable="single" sortable="false" filterable="false" groupable="true">--%>
        <base:searchButton defaultReadUrl="${basePath}/grid-read" defaultReadUrlIsRelative="false"/>
    </div>
</div>
<div class="uk-container uk-container-center my-uk-container" style="padding-bottom: 30px">
<base:my-grid-search  defaultReadUrl="${basePath}/grid-read" selectable="single" isAccordionable="true" refreshButton="true" >
	<base:my-grid-column title='lab.operation.labRegistration.date'  field="registerDate" width="30px"/>
	<base:my-grid-column title='lab.operation.labRegistration.preAdmitId'  field="preAdmitId" width="30px"/>
	<base:my-grid-column title='lab.operation.labRegistration.subscriptionNumber'  field="subscriptionNumber" width="30px"/>
    <base:my-grid-column title='lab.operation.labRegistration.nationalCode'  field="nationalCode" width="50px"/>
	<base:my-grid-column title='lab.operation.labRegistration.firstName'  field="firstName" width="50px"/>
	<base:my-grid-column title='lab.operation.labRegistration.lastName'  field="lastName" width="50px"/>
	<base:my-grid-column title='lab.operation.labRegistration.factor_id'  field="factor_id" width="30px"/>

    <base:my-grid-schema-field name="preAdmitId" type="string"/>
    <base:my-grid-schema-field name="nationalCode" type="string"/>
    <base:my-grid-schema-field name="subscriptionNumber" type="string"/>
    <base:my-grid-schema-field name="firstName" type="string"/>
    <base:my-grid-schema-field name="lastName" type="string"/>
    <base:my-grid-schema-field name="factor_id" type="string"/>

    <base:my-grid-function name="receiveFinanceRegistration"  functionClick="receiveFinanceRegistrationFunction" text="lab.operation.labRegistration.receiveFinanceRegistration" />
    <base:my-grid-function name="financeRegistrationIdSetNull"  functionClick="financeRegistrationIdSetNullFunction" text="lab.operation.labRegistration.financeRegistrationIdSetNull" />
</base:my-grid-search>
</div>
<base:footer/>
<script>

    $("#fromDate").val("<%=curStringDate%>");
    $("#toDate").val("<%=curStringDate%>");

    var icons = {
        header: "ui-icon-circle-arrow-e",
        activeHeader: "ui-icon-circle-arrow-s"
    };

    $( "#formAccordion" ).accordion({
        icon:icons,
        heightStyle: "content",
        collapsible: true,
        active:false
    });

    $( "#body-heade-createParsipol" ).click(function() {
        $.getJSON(basePath + '/reset/', function (data) {
            $('#mainForm').deserialize(data);
        });
    });

    function getSearchObject(){
        var docVar = {};
        docVar.fromDate=$("#fromDate").val();
        docVar.toDate=$("#toDate").val();
        docVar.searchPatientFullName=$("#searchPatientFullName").val();
        docVar.nationalCode=$("#patientNationalCode").val();
        docVar.fileNumber=$("#patientFileNumber").val();
        docVar.factor_id=$("#factor_id").val();

        return docVar;
    }

    $( "#age" ).change(function() {
        if($("#age").val()){
            $.ajax({
                url: '${pageContext.request.contextPath}/lab/operation/labRegistrationTaha/getCurrentYear',
                type: 'GET',
                data: {},
                dataType: 'json',
                success: function (data) {


                    var y=data.currentYear*1;

                    y=y-$( "#age" ).val();
                    $( "#birthDate" ).val(y+'/01/01');

                },
                error: function (result) {
                    if (result.status == 401) {
                        alert('Error');
                        //top.location.href = top.location.href;
                    }
                }
            });

        }
    });

    $( "#age" ).focus(function() {
        if($( "#birthDate" ).val()){

            $.ajax({
                url: '${pageContext.request.contextPath}/lab/operation/labRegistrationTaha/getCurrentYear',
                type: 'GET',
                data: {},
                dataType: 'json',
                success: function (data) {
                    var x=$( "#birthDate" ).val().split('/')[0];
                    x=x*1;
                    var y=data.currentYear*1;
                    var z=y-x
                    $( "#age" ).val(z);
                    $('#age').data("kendoNumericTextBox").value(z);
                },
                error: function (result) {
                    if (result.status == 401) {
                        alert('Error');
                        //top.location.href = top.location.href;
                    }
                }
            });

        }

    });

    $('#subscriptionNumber').keypress(function( event ) {
        if (event.which == 13) {
            event.preventDefault();
            $.ajax({
                url: '${pageContext.request.contextPath}/lab/operation/labRegistrationTaha/loadPatientByCommonCode',
                type: 'GET',
                data: {commonCode: $('#subscriptionNumber').val()},
                dataType: 'json',
                success: function (data) {
                    //response(data);

                    $('#patientId').val(data.patientId);
                    $('#subscriptionNumber').val(data.subscriptionNumber);
                    $('#firstName').val(data.firstName);
                    $('#lastName').val(data.lastName);
                    $('#fileNumber').val(data.fileNumber);
                    $('#cellphone').val(data.cellphon);
                    $('#fatherName').val(data.fatherName);
                    $('#nationalCode').val(data.nationalCode);
                    $('#birthDate').val(data.birthDate);
                    $('#age').val(data.age);
                    $('#age').data("kendoNumericTextBox").value(data.age);
                    $('#sex_Comb').data("kendoComboBox").value(data.sex);
                    $('#sex').val(data.sex);
                },
                error: function (result) {
                    if (result.status == 401) {
                        alert('Error');
                        //top.location.href = top.location.href;
                    }
                }
            });
        }
    });

    $('#fileNumber').keypress(function( event ) {
        if (event.which == 13) {
            event.preventDefault();
            $.ajax({
                url: '${pageContext.request.contextPath}/lab/operation/labRegistrationTaha/loadPatientByCommonCode',
                type: 'GET',
                data: {fileNumber: $('#fileNumber').val()},
                dataType: 'json',
                success: function (data) {
                    //response(data);

                    $('#patientId').val(data.patientId);
                    $('#subscriptionNumber').val(data.subscriptionNumber);
                    $('#firstName').val(data.firstName);
                    $('#lastName').val(data.lastName);
                    $('#fileNumber').val(data.fileNumber);
                    $('#cellphone').val(data.cellphon);
                    $('#fatherName').val(data.fatherName);
                    $('#nationalCode').val(data.nationalCode);
                    $('#birthDate').val(data.birthDate);
                    $('#age').val(data.age);
                    $('#age').data("kendoNumericTextBox").value(data.age);
                    $('#sex_Comb').data("kendoComboBox").value(data.sex);
                    $('#sex').val(data.sex);
                },
                error: function (result) {
                    if (result.status == 401) {
                        alert('Error');
                        //top.location.href = top.location.href;
                    }
                }
            });
        }
    });

    $('#nationalCode').keypress(function( event ) {
        if (event.which == 13) {
            event.preventDefault();

            $.ajax({
                url: '${pageContext.request.contextPath}/lab/operation/labRegistrationTaha/loadPatientByCommonCode',
                type: 'GET',
                data: {nationalCode: $('#nationalCode').val()},
                dataType: 'json',
                success: function (data) {
                    //response(data);

                    $('#patientId').val(data.patientId);
                    $('#subscriptionNumber').val(data.subscriptionNumber);
                    $('#firstName').val(data.firstName);
                    $('#lastName').val(data.lastName);
                    $('#fileNumber').val(data.fileNumber);
                    $('#cellphone').val(data.cellphon);
                    $('#fatherName').val(data.fatherName);
                    $('#nationalCode').val(data.nationalCode);
                    $('#birthDate').val(data.birthDate);
                    $('#age').val(data.age);
                    $('#age').data("kendoNumericTextBox").value(data.age);
                    $('#sex_Comb').data("kendoComboBox").value(data.sex);
                    $('#sex').val(data.sex);
                },
                error: function (result) {
                    if (result.status == 401) {
                        alert('Error');
                        //top.location.href = top.location.href;
                    }
                }
            });
        }
    });

    function callback_change_nameAndFam(e){
        var id = e.sender._old;
        if (isNaN(id)){
            return;
        }
        if(id==""){
            resetPatientInputFields();
        }else{
            loadPatient(id);
        }
    }

    function loadPatient(id){
        var requestUrl = '<c:url value='/' />' + '/clinic/operation/simpleFactor/' + "loadPatient/" + id;
        $.getJSON(requestUrl, function (data) {
            console.log(data);
            //resetPatientInputFields();
            $('#patientId').val(data.id);
            $('#firstName').val(data.firstname);
            $('#lastName').val(data.lastname);
            $('#fatherName').val(data.fathername);
            $('#fileNumber').val(data.filenumber);
            $('#cellphone').val(data.cellphon);
            $('#age').val(data.age);
            $('#birthDate').val(data.birthDate);
            $('#nationalCode').val(data.nationalCode);
            $('#subscriptionNumber').val(data.commonCode);
            $('#sex').val(data.sex);
            $('#sex_Comb').data('kendoComboBox').value(data.sex);
            if($( "#birthDate" ).val()){
                $.ajax({
                    url: '${pageContext.request.contextPath}/lab/operation/labRegistrationTaha/getCurrentYear',
                    type: 'GET',
                    data: {},
                    dataType: 'json',
                    success: function (data) {



                        var x=$( "#birthDate" ).val().split('/')[0];

                        x=x*1;
                        var y=data.currentYear*1;
                        var z=y-x
                        $( "#age" ).val(z);
                        $('#age').data("kendoNumericTextBox").value(z);
                    },
                    error: function (result) {
                        if (result.status == 401) {
                            alert('Error');
                            //top.location.href = top.location.href;
                        }
                    }
                });

            }

            //fillBirthDateFromAge();

        });
    }
    function callback_age() {
        if($( "#age" ).val()){
            $.ajax({
                url: '${pageContext.request.contextPath}/lab/operation/labRegistrationTaha/getCurrentYear',
                type: 'GET',
                data: {},
                dataType: 'json',
                success: function (data) {


                    var y=data.currentYear*1;

                    y=y-$( "#age" ).val();
                    $( "#birthDate" ).val(y+'/01/01');
                },
                error: function (result) {
                    if (result.status == 401) {
                        alert('Error');
                        //top.location.href = top.location.href;
                    }
                }
            });
        }
    }

    function receiveFinanceRegistrationFunction(e){
        var data = this.dataItem($(e.target).closest("tr"));

        jQuery.ajax ({
            url: basePath + "receiveFinanceRegistration",
            type: "POST",
            data: JSON.stringify({labQueueParsipolId: data.id}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function(result){
                if(result.state == "success"){
                    // var pageNumber=$("#searchGrid").data("kendoGrid").dataSource.page();
                    // $("#searchGrid").data("kendoGrid").dataSource.read();
                    // $("#searchGrid").data("kendoGrid").dataSource.page(pageNumber);
                    alertify.success(result.message);
                }
                else {
                    for(var i=0; i<result.errors.length; i++){
                        alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                    }
                }
            },
            error:function(result){
                if(result.status==401){
                    window.location.href="";
                }
            }
        });
    }

    function financeRegistrationIdSetNullFunction(e){
        var data = this.dataItem($(e.target).closest("tr"));

        jQuery.ajax ({
            url: basePath + "financeRegistrationIdSetNull",
            type: "POST",
            data: JSON.stringify({labQueueParsipolId: data.id}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function(result){
                if(result.state == "success"){
                    // var pageNumber=$("#searchGrid").data("kendoGrid").dataSource.page();
                    // $("#searchGrid").data("kendoGrid").dataSource.read();
                    // $("#searchGrid").data("kendoGrid").dataSource.page(pageNumber);
                    alertify.success(result.message);
                }
                else {
                    for(var i=0; i<result.errors.length; i++){
                        alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                    }
                }
            },
            error:function(result){
                if(result.status==401){
                    window.location.href="";
                }
            }
        });
    }
</script>