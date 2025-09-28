
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@page import="com.artonis.core.system.authentication.model.Role"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<%
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	request.setAttribute("basePath", basePath);
	String createUrl = basePath + "create";
 %>
 
 <input name="loadedId" type="hidden" id="loadedId" />
 
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="clinic.patient.visitQueue.refresh" classNames="uk-button uk-button-success" id="visitDoctorQueueView-refresh-btn" onClick="javascript:refreshClick()"/>

		<div id="body-heade-save-div" style="display:none;">
			<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="body-heade-save" />
			<base:aPermission key="global.crud.cancel" classNames="uk-button uk-button-danger" id="breadcrumb-main-section-cancel"></base:aPermission>
		</div>
	</div>
</div>

	<base:mehrSys-grid-comboAndDateWithoutButton isPopup="true" name="grid" transportReadUrl="${basePath}/grid-read"
				categoriesReadUrl="${basePath}/allState" comboCaption="comboCaption" comboId="comboId" 
				modelFieldFilterCombo="state" modelFieldFilterText="searchField" selectable="single" 
				comboLabelCaptionKey="his.patient.visitInfo.stateFilter" hasSearchDate="true" 
				followFunction="evaluteSum" dateFieldName="visitDate" selectedIndexDropDown="1" keyConfirmCheck="his.patient.visitQueue.alert.confirmVisitCheck">
		<base:my-grid-column title='clinic.patient.fileNumber' field="fileNumber"  width="40px"/>
		<base:my-grid-column title='clinic.patient.firstName'  field="patientName" width="30px"/>
		<base:my-grid-column title='clinic.patient.lastName'  field="patientFam" width="40px"/>
        <%--<base:my-grid-column title='his.patient.cashType' field="cashTypeStr"  width="30px"/>--%>
        <base:my-grid-column title='com.artonis.clinic.basicInfo.service.name' field="serviceName"  width="40px"/>
        <base:my-grid-column title='clinic.cash.registerDate' field="visitDate"  width="40px"/>
        <base:my-grid-column title='his.patient.visitQueue.serviceItemAmount' field="serviceItemAmountStr"  width="40px"/>
        <base:my-grid-column title='his.patient.visitQueue.totalReceiveCostStr' field="totalReceiveCostStr"  width="40px"/>
        <base:my-grid-column title='his.patient.visitQueue.discountAmountStr' field="discountAmountStr"  width="50px"/>
        <base:my-grid-column title='his.patient.visitQueue.doctorPortionDiscountAmountStr' field="doctorPortionDiscountAmountStr"  width="50px"/>
        <base:my-grid-column title='his.patient.visitQueue.doctorPortionReceiveCostStr' field="doctorPortionReceiveCostStr"  width="50px"/>
        <base:my-grid-column title='his.patient.visitQueue.state' isFlag="true" flagIconUrl="/resources/images/black/button-check.png" flagDestinationUrl="DoVisitUnvisit"  field="visitUnvisit"  width="40px"/>

		<base:my-grid-schema-field name="fileNumber" type="string" />
		<base:my-grid-schema-field name="patientName" type="string" />
		<base:my-grid-schema-field name="patientFam" type="string" />
        <%--<base:my-grid-schema-field name="cashTypeStr" type="string" />--%>
        <base:my-grid-schema-field name="serviceName" type="string" />
        <base:my-grid-schema-field name="totalReceiveCostStr" type="string" />
        <base:my-grid-schema-field name="discountAmountStr" type="string" />
        <base:my-grid-schema-field name="doctorPortionReceiveCostStr" type="string" />
        <base:my-grid-schema-field name="doctorPortionDiscountAmountStr" type="string" />
		<base:my-grid-schema-field name="mongoVisit_id" type="string" />
		<base:my-grid-function text="clinic.patient.visit" functionClick="grid_onVisit"  name="visit"/>
		<base:my-grid-function text="clinic.patient.visit" functionClick="grid_onPenVisit" name="penVisit"/>
	</base:mehrSys-grid-comboAndDateWithoutButton>



    <%--<div class="uk-grid uk-grid-preserve">--%>


<div id="totalAccordion" style="border: 1">
    <h3 id="totalAccordionTab" style="	margin-bottom: 5px;
		background: linear-gradient(to bottom, rgba(160, 188, 197, 1) 0%,rgba(190, 201, 206, 1) 37%,rgba(121, 139, 142, 1) 100%);
		/* color: #ffffff; */
		/* text-shadow: none; */
		border-width: thin;
		border-color: cornflowerblue;
		text-align: -webkit-center;
		font-weight: bold;">گزارش عملکرد به تفکیک زمان</h3>
    <%--<div id="search_back">--%>
    <div class="uk-grid uk-grid-preserve">

            <base:my-grid name="totalGrid" transportReadUrl="${basePath}/grid-read-totalgrid" showOperation="false">

                <base:my-grid-column title='his.patient.visitQueue.patientCount' field="patientCount"  width="20px"/>
                <base:my-grid-column title='his.patient.visitQueue.date' field="date"  width="20px"/>
                <base:my-grid-column title='his.patient.visitQueue.serviceItemName' field="service_item_name"  width="30px"/>
                <base:my-grid-column title='his.patient.visitQueue.serviceItemAmountSum' field="serviceItemAmountSumStr"  width="30px"/>
                <base:my-grid-column title='his.patient.visitQueue.totalReceiveCostSum' field="totalReceiveCostSumStr"  width="30px"/>
                <base:my-grid-column title='his.patient.visitQueue.doctorPortionReceiveCostSum' field="doctorPortionReceiveCostSumStr"  width="30px"/>
                <base:my-grid-column title='his.patient.visitQueue.doctorPortionInsuranceSumStr' field="doctorPortionInsuranceSumStr"  width="30px"/>
                <base:my-grid-column title='his.patient.visitQueue.doctorPortionDiscountAmountSum' field="doctorPortionDiscountAmountSumStr"  width="30px"/>
                <base:my-grid-column title='his.patient.visitQueue.countDoOperation' field="countDoOperation"  width="30px"/>
                <base:my-grid-column title='his.patient.visitQueue.countWait' field="countWait"  width="30px"/>


                <base:my-grid-schema-field name="patientCount" type="string" />
                <base:my-grid-schema-field name="date" type="string" />
                <base:my-grid-schema-field name="service_item_name" type="string" />
                <base:my-grid-schema-field name="totalReceiveCostSumStr" type="string" />
                <base:my-grid-schema-field name="doctorPortionReceiveCostSumStr" type="string" />
                <base:my-grid-schema-field name="doctorPortionInsuranceSumStr" type="string" />
                <base:my-grid-schema-field name="doctorPortionDiscountAmountSumStr" type="string" />
                <base:my-grid-schema-field name="countDoOperation" type="string" />
                <base:my-grid-schema-field name="countWait" type="string" />
                <%--<base:my-grid-schema-field name="countCancel" type="string" />--%>
            </base:my-grid>


    </div>

    <%--</div>--%>
</div>

<div id="aggregateAccordion" style="border: 1">
    <h3 id="aggregateAccordionTab" style="	margin-bottom: 5px;
		 background: linear-gradient(to bottom, rgba(160, 188, 197, 1) 0%,rgba(190, 201, 206, 1) 37%,rgba(121, 139, 142, 1) 100%);
		/* color: #ffffff; */
		/* text-shadow: none; */
		border-width: thin;
		border-color: cornflowerblue;
		text-align: -webkit-center;
		font-weight: bold;">گزارش تجمیعی عملکرد</h3>
    <%--<div id="search_back">--%>
    <div class="uk-grid uk-grid-preserve">
        <base:my-grid name="totalGridAggregate" transportReadUrl="${basePath}/grid-read-totalgrid-aggregate" showOperation="false">

            <base:my-grid-column title='his.patient.visitQueue.patientCount' field="patientCount"  width="20px"/>
            <base:my-grid-column title='his.patient.visitQueue.serviceItemName' field="service_item_name"  width="30px"/>
            <base:my-grid-column title='his.patient.visitQueue.serviceItemAmountSum' field="serviceItemAmountSumStr"  width="30px"/>
            <base:my-grid-column title='his.patient.visitQueue.totalReceiveCostSum' field="totalReceiveCostSumStr"  width="30px"/>
            <base:my-grid-column title='his.patient.visitQueue.doctorPortionReceiveCostSum' field="doctorPortionReceiveCostSumStr"  width="30px"/>
            <base:my-grid-column title='his.patient.visitQueue.doctorPortionInsuranceSumStr' field="doctorPortionInsuranceSumStr"  width="30px"/>
            <base:my-grid-column title='his.patient.visitQueue.doctorPortionDiscountAmountSum' field="doctorPortionDiscountAmountSumStr"  width="30px"/>

            <base:my-grid-schema-field name="patientCount" type="string" />
            <base:my-grid-schema-field name="service_item_name" type="string" />
            <base:my-grid-schema-field name="totalReceiveCostSumStr" type="string" />
            <base:my-grid-schema-field name="doctorPortionReceiveCostSumStr" type="string" />
            <base:my-grid-schema-field name="doctorPortionInsuranceSumStr" type="string" />
            <base:my-grid-schema-field name="doctorPortionDiscountAmountSumStr" type="string" />

        </base:my-grid>

    </div>

    <%--</div>--%>
</div>

<div class="uk-container uk-container-center my-uk-container">
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="serviceItemAmountSum" styleClass="verysmall" key="his.patient.visitQueue.serviceItemAmountSum"/>
        <base:testBoxNumericEx disabled="true" name="totalReceiveCostSum" styleClass="verysmall" key="his.patient.visitQueue.totalReceiveCostSum"/>
        <base:testBoxNumericEx disabled="true" name="doctorPortionReceiveCostSum" styleClass="verysmall" key="his.patient.visitQueue.doctorPortionReceiveCostSum"/>
        <base:testBoxNumericEx disabled="true" name="doctorPortionInsuranceSum" styleClass="verysmall" key="his.patient.visitQueue.doctorPortionInsuranceSumStr"/>
        <base:testBoxNumericEx disabled="true" name="doctorPortionDiscountAmountSum" styleClass="verysmall" key="his.patient.visitQueue.doctorPortionDiscountAmountSum"/>
    </div>
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="patientCountSum" styleClass="verysmall" key="his.patient.visitQueue.patientCountSum"/>
    </div>
</div>
    <%--</div>--%>
<%--<base:footer></base:footer>--%>
<script>
    var isForFirstTimeReload=true;
    function grid_onVisit(e){
        var data = this.dataItem($(e.target).closest("tr"));
//        console.log('mongoVisit_id:'+data.mongoVisit_id);
 		window.location = "${pageContext.request.contextPath}"+"/clinic/patient/visitMobileBase/" + data.patient_id+"/"+data.id+"/"+data.mongoVisit_id;//magar state ra pas bedim aga state visit shode bod bere akhari ro load kone;in emkan faghat baraye roze jari vashad vala gheyr
    }
	function evaluteSum(){
			var tmp1 = {};
        	var valueC = $(categories).val(),grid = $("#${name}").data("kendoGrid");
		 	var valueT = $(categoriesId).val(),grid = $("#${name}").data("kendoGrid");
		 	var valueFD = $(fromDate).val(),grid = $("#${name}").data("kendoGrid");
		 	var valueTD = $(toDate).val(),grid = $("#${name}").data("kendoGrid");
            if(isForFirstTimeReload==false){
                var mapSearch = {};

                mapSearch.fromDate=$("#fromDate").val();
                mapSearch.toDate=$("#toDate").val();
                var    searchJsonString = JSON.stringify(mapSearch);
                searchJsonString = searchJsonString.replace(/\//g, ':@:');

                var urlGrid=window.location.href + "grid-read-totalgrid/" + searchJsonString

                $("#totalGrid").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
                $("#totalGrid").data("kendoGrid").dataSource.page($("#totalGrid").data("kendoGrid").dataSource.page());

                var urlGridAggregagte=window.location.href + "grid-read-totalgrid-aggregate/" + searchJsonString

                $("#totalGridAggregate").data("kendoGrid").dataSource.transport.options.read.url=urlGridAggregagte;
                $("#totalGridAggregate").data("kendoGrid").dataSource.page($("#totalGridAggregate").data("kendoGrid").dataSource.page());
            }
		 	var searchFilters=[];
            if(isForFirstTimeReload==true) {
                <%--tmp1['state']=parseInt(2);--%>
                isForFirstTimeReload = false;
            }
            <%--}else if (valueC) {--%>
				<%--tmp1['state']=parseInt(valueC);--%>
         	<%--}--%>

         	<%--if (valueT) {--%>
		    	<%--searchFilters.push({ field: "${modelFieldFilterText}", operator: "contains", value: (valueT) });--%>
		    	<%--tmp1['searchField']=(valueT);--%>
	     	<%--}--%>
	     	if (valueFD) {
		    	tmp1['fromDate']=(valueFD);
	     	}
	     	if (valueTD) {
		    	tmp1['toDate']=(valueTD);
	     	}
        
        jQuery.ajax({
                    url:"<c:url value='/' />" +"clinic/patient/visitDoctorQueue/sum",
                    type:"POST",
                    data:JSON.stringify(tmp1),
                    dataType:"json",
                    contentType:"application/json; charset=utf-8",
                    success:function (result) {
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
                            $("#serviceItemAmountSum").val(result.serviceItemAmountSum);
                            $("#totalReceiveCostSum").val(result.totalReceiveCostSum);
                            $("#doctorPortionReceiveCostSum").val(result.doctorPortionReceiveCostSum);
                            $("#doctorPortionInsuranceSum").val(result.doctorPortionInsuranceSum);
                            $("#doctorPortionDiscountAmountSum").val(result.doctorPortionDiscountAmountSum);
                            $("#patientCountSum").val(result.patientCountSum);
                            setNumericTextValue();

                        }
                    },
                    error:function(result){
                        if(result.status==401){
                            window.location.href=getBaseUrl();
                        }
                    }
        });


     }

    function _grid_confirmYes_callback(e){
        evaluteSum();
    }

	function refreshClick(){
		grid = $("#grid").data("kendoGrid");
		grid.dataSource.page(grid.dataSource.page());
        evaluteSum();
	}

    function grid_onMyEdit(e){
        var data = this.dataItem($(e.target).closest("tr"));
        window.location = basePath + "edit/" + data.id;
 		window.location = "${pageContext.request.contextPath}"+"/clinic/cash/visitedPatients/edit/" + data.id;
    }
    
    function grid_onVisitPatientEdit(e){
        var data = this.dataItem($(e.target).closest("tr"));
 		var tmp = {};
 		tmp['id']=data.id;
 		jQuery.ajax({
                    url:"${pageContext.request.contextPath}"+"/clinic/cash/visitedPatients/visit",
                    type:"POST",
                    data:JSON.stringify(tmp),
                    dataType:"json",
                    contentType:"application/json; charset=utf-8",
                    success:function (result) {
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
                    error:function(result){
                        if(result.status==401){
                            window.location.href="";
                        }
                    }
                });
    }

    function _grid_onDataBound_callback(e){
        var grid = $("#grid").data("kendoGrid");
        var data = grid.dataSource.data();
//        console.log(data);
        $.each(data, function (i, row) {
            if (row.state == 1) {
                $('tr[data-uid="' + row.uid + '"] ').css("background-color", "green");
            }
            else if (row.state == 3) {
                $('tr[data-uid="' + row.uid + '"] ').css("background-color", "gold");
            }
        });
    }
    
$(document).ready(function() {
	setInterval(function(){
		refreshClick();    
	}, 60000);
	//
	evaluteSum();
    $(".k-toolbar")[0].style.height="";

    var icons = {
        header: "ui-icon-circle-arrow-e",
        activeHeader: "ui-icon-circle-arrow-s"
    };
    $( "#aggregateAccordion" ).accordion({
        icon:icons,
        heightStyle: "content",
        collapsible: true,
        active:false
    });

    $( "#totalAccordion" ).accordion({
        icon:icons,
        heightStyle: "content",
        collapsible: true,
        active:false
    });

});

function grid_onPenVisit(e){
	var data = this.dataItem($(e.target).closest("tr"));
  	window.location = "${pageContext.request.contextPath}" + "/clinic/patient/penVisit/" + data.patient_id + "/" + data.id + "/" + data.mongoVisit_id;    	
}
</script>
