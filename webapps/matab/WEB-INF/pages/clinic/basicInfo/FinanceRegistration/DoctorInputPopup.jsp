<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form" id="form-popup">
	<input type="hidden" id="id" name="id" />
	<div class="uk-grid uk-grid-preserve">
		<base:testBox styleClass="small" name="firstName" key="com.artonis.clinic.basicInfo.financeRegistration.agentDoctorFirstName" />
		<base:testBox styleClass="small" name="lastName" key="com.artonis.clinic.basicInfo.financeRegistration.agentDoctorLastName" />
		<base:testBox styleClass="small" name="medicalCouncilCode" key="com.artonis.clinic.basicInfo.financeRegistration.agentDoctorMedicalCouncilCode" />
	</div>
	<%--<div class="uk-grid uk-grid-preserve">--%>
		<%--<base:testBox styleClass="small" name="nationalCode" key="clinic.patient.nationalCode" />--%>
		<%--<base:testBox styleClass="small" name="identityNumber" key="clinic.patient.identityNumber" />--%>
		<%--<base:mDatePicker styleClass="small" name="birthDate" key="clinic.patient.birthDate" direction="ltr" />--%>
	<%--</div>--%>
	<%--<div class="uk-grid uk-grid-preserve">--%>
		<%--<base:comboBox styleClass="small" name="sex" isListConstant="true" key="clinic.patient.sex" comboLoaderUrl="combo/loadAllSex" />--%>
	<%--</div>--%>
</form>

<script type="text/javascript">
	$(".ui-dialog-title").text("تعریف پزشک معرف");
	$(document).ready(function(){
	    $("#insert-button").click(function(){
	        var form = $("#form-popup");
	        var tmp = {};
	        $("input[role='combobox']").attr("disabled", "disabled");
	        $("input[data-ignore='true']").attr("disabled", "disabled");
	        checkBoxUncheck=jQuery('#form-popup input[type=checkbox]:not(:checked)').map(
	                function() {
	                    return {"name": this.name, "value": false}
	                }).get();
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
	        /*jQuery.ajax ({
	            url: "${pageContext.request.contextPath}/clinic/patient/radiologyExplaination/popupDoctor/save",
	            type: "POST",
	            data: JSON.stringify(tmp),
	            dataType: "json",
	            contentType: "application/json; charset=utf-8",
	            success: function(result){
	                if(result.state == "error"){
	                    for(var i=0; i<result.errors.length; i++){
	                        alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
	                    }
	                }
	                if(result.state == "success"){
	                    alertify.success(result.message);
	                    success_save_${name}_Callback();

	                    $("#doctorId").val('');
	                    var kendoComboBox=$("#doctorId_Comb").data("kendoComboBox");
	                    kendoComboBox.dataSource.read({
	                	    filter: {
	                	        		logic: "or",
	                	        		filters:  [ { field: "id", operator: "eq", value: result.agentDoctorId } ]
	                	    		}
	                    });
	                    $("#doctorId_Comb").data("kendoComboBox").value(result.agentDoctorId);
	                    $("#doctorId").val(result.agentDoctorId);
	                }
	            }
	        });*/
	    });
	});
</script>