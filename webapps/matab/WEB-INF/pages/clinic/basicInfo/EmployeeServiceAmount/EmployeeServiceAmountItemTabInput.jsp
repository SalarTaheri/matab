<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-EmployeeServiceAmountItem" >
	<input  type="hidden" id="id" name="id">
	<div class="uk-grid uk-grid-preserve"> 			
		<base:multiSelectPOSTtype name="service_id_array" multiSelectLoaderUrl="combo/loadAllServiceItem"	key="com.artonis.clinic.basicInfo.employeeServiceAmountItem.service_id" 
				 stylediv=" text-align: right"  styleClass="normal" /> 
		<base:comboBox styleClass="small" name="surgeryRole" key="com.artonis.clinic.basicInfo.employeeServiceAmountItem.surgeryRole" comboLoaderUrl="combo/loadAllSurgeryRole"/>
	</div>
	<div class="uk-grid uk-grid-preserve"> 	
		<base:testBoxNumericEx styleClass="small" name="price" key="com.artonis.clinic.basicInfo.employeeServiceAmountItem.price"/>
	</div>
</form>

<script type="text/javascript">
$(document).ready(function(){
	$(".k-multiselect-wrap").addClass("rightAlign");
});
function customSave_EmployeeServiceAmountItem(tmp){
    ////---- This part is for get value from multiSelects -----------
    var getOptionArray = function(options){
    	var arr = [];
    	for(var i=0;i<options.length;i++){
        	arr[i]=options[i].value;
        }
    	return arr;
    };
    $("*[data-role='multiselect']").each(function(){
         tmp[this.id.replace("_multiSelect","")] = getOptionArray(this.selectedOptions);
    })
	////---------- END -------------
	var itemName = "EmployeeServiceAmountItem";
	jQuery.ajax ({
	    url: basePathItemForm + "save/" + itemName,
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
        		var gridName = itemName;
        		var moreThanAGridInPage = document.getElementsByName("moreThanAGridInPage")[0];
        		if(moreThanAGridInPage!=undefined && moreThanAGridInPage.value=="yes"){
        			var gridNameTmp = getActiveGridName();//this method must be implement when use 'my-grid-item4moreThanAGridInPage' tag.
        			if(gridNameTmp.length>0){
        				gridName = gridNameTmp;
        			}
        		}
        		var urlGrid=$("#" + gridName).data("kendoGrid").dataSource.transport.options.read.url;
                var indexnumber=urlGrid.valueOf().lastIndexOf("/");
                var subUrlGrid=urlGrid.valueOf().substring(0,indexnumber);
                urlGrid=subUrlGrid.valueOf()+"/"+loadedId.value;
                $("#" + gridName).data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
        		$("#" + gridName).data("kendoGrid").dataSource.read();
				$(".uk-form2-" + itemName)[0].reset();
                form.find(":input").val('');
                $("#"+itemName+"_id").val('');
                var inputElementArray=form.find(":input");
                for(var index=0;index<inputElementArray.length;index++){
                    var id=inputElementArray[index].id;
                    if($("#"+id).data("kendoComboBox")!=undefined){
                        $("#"+id).data("kendoComboBox").dataSource.filter([]);
                    }
                }
                if(typeof(window["doAfterSave_"+itemName])=== "function"){
                    window["doAfterSave_"+itemName]();
                }

	        }
	    }
	});
}
function callback_deserialize_EmployeeServiceAmountItem(data){
	$("#surgeryRole_Comb").data("kendoComboBox").value(data.surgeryRole);
	var multiSelect = $("#service_id_array_multiSelect").data("kendoMultiSelect");
	multiSelect.value(data.service_id);
}
</script>
<style>
.rightAlign{
	text-align: right;
}
</style>