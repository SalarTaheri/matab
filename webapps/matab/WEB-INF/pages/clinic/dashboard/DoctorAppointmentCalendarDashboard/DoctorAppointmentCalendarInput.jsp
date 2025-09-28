<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<script src="<c:url value='/resources/js/blockUI/blockUI.js' />"></script>

<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox  name="weekTemplateId" comboLoaderUrl="combo/loadAllWeekTemplateByDoctor" key="com.artonis.clinic.appointment.doctroAppointmentCalendar.weekTemplateName" styleClass="small"/>
			<base:comboBox name="departmentId" key="com.artonis.clinic.appointment.doctroAppointmentCalendar.departmentId" comboLoaderUrl="combo/loadAllDepartment" styleClass="small" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:mDatePicker name="startDate" key="com.artonis.clinic.appointment.doctroAppointmentCalendar.startDate" styleClass="small"/>
			<base:testBoxNumeric name="iteration" key="com.artonis.clinic.appointment.doctroAppointmentCalendar.iteration" styleClass="small"/>
		</div>
	</form>
</div>
<script type="text/javascript">
		$("#body-heade-save").hide();
		//
        function customFormSave(){
            var form = $("#mainForm");
            var tmp = {};
            $("input[role='combobox']").attr("disabled", "disabled");
            $("input[data-ignore='true']").attr("disabled", "disabled");
            checkBoxUncheck=jQuery('#mainForm input[type=checkbox]:not(:checked)').map(
                    function() {
                        if(this.name!=""){
                            return {"name": this.name, "value": false}
                        }
                    }).get();
            $("input[data-role='timepicker']").removeAttr("disabled");
            $(form.serializeArray()).each(function(){
                if($("input[name='"+this.name+"']").attr('type')=='checkbox'){
                    if($("input[name='"+this.name+"']").val()=='on'){
                        tmp[this.name]='true';
                    }else{
                        tmp[this.name]='false';
                    }
                }else{
                    tmp[this.name] = this.value;
                }
            });
            for(var i=0;i<checkBoxUncheck.length;i++){
                tmp[checkBoxUncheck[i].name]=checkBoxUncheck[i].value;
            }
            $("input[data-ignore='true']").removeAttr("disabled");
            $("input[role='combobox']").removeAttr("disabled");
            if(typeof(callback_afterSerialize) == "function"){
                tmp=callback_afterSerialize(tmp);
            }
            if(typeof(callback_validation_before_save) == "function"){
                    validationState=callback_validation_before_save(tmp);
                    if(validationState==false){
                       return;
                    }
                }
            jQuery.ajax({
                url:getBaseUrl() + "save",
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
                    if (result.state == "customError") {
                    	alertify.error(result.message);
                    }
                    if (result.state == "success") {
                        alertify.success(result.message);
                        if (document.getElementById("loadedId") != null) {
                            document.getElementById("loadedId").value = result.baseObjectId;
                        }
                        document.getElementById("id").value = result.baseObjectId;
                        if(typeof(callResetAfterSaveMaster) === "function"){
                        }else{
	                        $.getJSON(basePath + '/reset/', function (data) {
	                            if(typeof(callback_deserialize) == "function"){
	                                callback_deserialize(data);
	                            }
	                            $('#mainForm').deserialize(data);
								setNumericTextValue();
	                            var comboOnFormArray=$( "input[id$='_Comb']" );
	                            if(comboOnFormArray.length>0){
	                                for(var i=0;i<comboOnFormArray.length;i++){
	                                    var combo=$( "input[id$='_Comb']" )[i].id;
	                                    var comboKendo=$("#"+combo).data("kendoComboBox");
	                                    if(comboKendo!=undefined){
	                                        comboKendo.dataSource._filter=undefined;
	                                    }
	                                }
	                            }
	                        });
                        }
			            if(typeof(checkShowHideTabs) === "function"){
			                checkShowHideTabs();
			            }
                        if(typeof(callback_save_success) == "function"){
                            callback_save_success();
                        }
                    }
                },
				beforeSend: function(){
					$("#body-table").block({ message: '<div><img  style="padding: 5px;" src="<c:url value='/resources/images/loader.gif'/>" /> لطفا  تا تکمیل فرآیند ثبت صبر کنید ...</div>'});
				},
				complete: function(){
				   	$("#body-table").unblock();
				},
                error:function(result){
                    if(result.status==401){
                        window.location.href="";
                    }
                }
            });
        }

</script>