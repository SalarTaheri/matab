<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	String basePath = request.getAttribute("controllerBasePath").toString();
%>

<base:pageHeader/>

<div id="modal-copyItem" style="display: inline;">
</div>

<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:multiSelect serverFilter="true" name="employee_ids" styleClass="small" multiSelectLoaderUrl="combo/loadAllDoctor" key="com.artonis.clinic.basicInfo.employeeContract.doctor_id" />
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
        </div>

		<base:my-grid-search  showMultipleDelete="false"  scrollable="true">
			<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeContract.doctor_id' field="employeeFullName" width="50px" />
			<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeContract.service_id' field="serviceNameList" width="190px" />
			<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeContract.fromDate' field="fromDate" width="30px" />
			<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeContract.toDate' field="toDate" width="30px" />
		
			<base:my-grid-function name="employeeContractCopy" styleClass="uk-button-primary" functionClick="grid_copyItem" text="com.artonis.clinic.basicInfo.employeeContract.copyItem" />
		</base:my-grid-search>
    </form>
</div>
    
<base:footer/>

<script type="text/javascript">
    $("#copyAll").click(function(){
        jQuery.ajax ({
            url: getBaseUrl() + "copyAll",
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function(result){
                if(result.state == "error"){
                    for(var i=0; i<result.errors.length; i++){
                        if($("label[for='"+ result.errors[i].Field + "']").text().length>0){
                            alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                        }else{
                            alertify.error( result.errors[i].Field + ":  " +  result.errors[i].Message);
                        }
                    }
                }
                if(result.state == "success"){
                    alertify.success(result.message);
                }
            },
            error:function(result){
//                        console.log(result);
                if(result.status==401){
                    window.location.href="";
                }
            }
        })
    });

    function grid_copyItem(e){
    	var data = this.dataItem($(e.target).closest("tr"));
    	var ec_id = data.id;
        if (e) {
    		var modal ;
    	    $(function() {
                var popUpUrl = '<%=basePath%>' + "/popup/copyEmploeeContract";
                $.get(popUpUrl , function (data) {
                    $("#modal-copyItem").empty();
                    var id = "modal-copyItem_popup";
                    $("#modal-copyItem").append('<div id="' + id + '" class="uk-modal" data-employeeContractId="' + ec_id + '">');
                    $("#" + id).append(data);
                    modal = new $.UIkit.modal.Modal("#" + id);
                    $("#" + id).on(
                        {
                            'uk.modal.hide':function () {
                                $("#modal-copyItem").empty();
                            }
                        }
                    );
                    modal.show();
                });
    	    });
        }
    }
    
    function getSearchObject(){
        var docVar = {};
        docVar.fromDate = $("#fromDate").val();
        docVar.toDate = $("#toDate").val();
        docVar.employee_ids = $("#employee_ids_multiSelect").val();
        return docVar;
    }
</script>
