<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-EmployeeContractItem" >
	<input  type="hidden" id="id" name="id">
	<div class="uk-grid uk-grid-preserve"> 			
		<base:multiSelectPOSTtype name="service_id" multiSelectLoaderUrl="combo/loadAllServiceItem"	key="com.artonis.clinic.basicInfo.employeeContract.service_id" 
				 stylediv=" text-align: right"  styleClass="normal" />
		<base:comboBox name="type"  key="com.artonis.clinic.basicInfo.employeeContractItem.type"
					   comboLoaderUrl="combo/allEmployeeContractItemType" styleClass="small"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
		<base:testBoxNumericEx styleClass="small" name="percent" key="com.artonis.clinic.basicInfo.employeeContract.percent"/>
		<base:testBoxNumericEx  name="price"  key="com.artonis.clinic.basicInfo.employeeContractItem.employeePrice" styleClass="small"/>
		<base:checkbox name="isVariablePercent" key="com.artonis.clinic.basicInfo.employeeContractItem.isVariablePercent" styleClass="verysmall"/>
	</div>

</form>
<div align="center" style="padding-top: 10px;">
<button class="uk-button uk-button-success" data-action="Create" data-save="mySaveItem" id="mySaveItem" data-tab="EmployeeContractItemTabInput" type="button" >
	<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.save")%>
</button>
<button class="uk-button uk-button-success"  id="myResetItem"  type="button" data-reset="resetItem" data-tab="EmployeeContractItemTabInput">
	<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.new")%>
</button>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$(".k-multiselect-wrap").addClass("rightAlign");
	$("#resetItem").hide();
	$("#saveItem").hide();
});

function callback_change_employee_id(e){
	var id = e.sender._old;
	var ms = $("#service_id_multiSelect").data("kendoMultiSelect");
	ms.dataSource.filter({ logic: 'and', filters: [{ field: "combo_employee_id", operator: "eq", value: id }]});
	ms.dataSource.read();
}

function callback_change_type(e){
	var id = e.sender._old;
	if(id==3){
		$('#price_txt').prop("disabled", false);
		$('#percent_txt').prop("disabled", true);
		$('#percent_txt').val('')
		$('#percent').val('')
	}else{
		$('#price_txt').prop("disabled", true);
		$('#price_txt').val('')
		$('#price').val('')
		$('#percent_txt').prop("disabled", false);
	}
}

function callback_deserialize(data){
	var employeeId = data.employee_id;
	if($.isNumeric(employeeId) && employeeId > 0){
		var ms = $("#service_id_multiSelect").data("kendoMultiSelect");
		ms.dataSource.filter({ logic: 'and', filters: [{ field: "combo_employee_id", operator: "eq", value: employeeId }]});
		ms.dataSource.read();
	}
}
////////////////////////////////// save
			$("button[data-save='mySaveItem']").click(function(){
	                if(document.getElementById("id").value!=''){
	                    document.getElementById("loadedId").value=document.getElementById("id").value;
	                }
					var tab = $(this).attr("data-tab");
					var action = $(this).attr("data-action");
					var id = tab + action;
					var	tmp = {};
					var itemName = tab.replace("TabInput", "");
					var form = $("form.uk-form2-" + itemName);
                    var dataIgnoreDisabled=[];
                    var i=0;
                    $("input[data-ignore='true']").each(function(){
                        if(this.disabled==true){
                            dataIgnoreDisabled[i]=this;
                            i++;
                        }
                    });

					$("input[role='combobox']").attr("disabled", "disabled");
                    $("input[data-ignore='true']").attr("disabled", "disabled");
                    checkBoxUncheck=jQuery('.uk-form2-'+itemName+' input[type=checkbox]:not(:checked)').map(
                        function() {
                            if(this.name!=""){
                                return {"name": this.name, "value": false}
                            }
                        }).get();
					$(form.serializeArray()).each(function(){
                        if($("input[name='"+this.name+"']").attr('type')=='checkbox'){
                            if($("input[name='"+this.name+"']")[0].checked){
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
					$("input[role='combobox']").removeAttr("disabled");
                    $("input[data-ignore='true']").removeAttr("disabled");
                    for(var j=0;j<dataIgnoreDisabled.length;j++){
                        dataIgnoreDisabled[j].disabled=true;
                    }

					tmp[masterIdStr]=document.getElementById("loadedId").value;
					tmp['id']=document.getElementById(itemName + '_id').value;

                    if(typeof(callback_after_serialize) == "function"){
                        tmp=callback_after_serialize(tmp);
                    }
                    if(typeof(window["callback_validation_before_save_"+itemName])=== "function"){
                        validationState=window["callback_validation_before_save_"+itemName](tmp);
                        if(validationState==false){
                          return;
                        }
                    }

					tmp.service_item_values = $("#service_id_multiSelect").val();
					
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
				});
//////////////////////////////// end save	
function callback_deserialize_EmployeeContractItem(data){
	var multiSelect = $("#service_id_multiSelect").data("kendoMultiSelect");
	multiSelect.value([data.service_id]);
	if(data.type==3){
		$('#price_txt').prop("disabled", false);
		$('#percent_txt').prop("disabled", true);
		$('#percent_txt').val('')
		$('#percent').val('')
	}else{
		$('#price_txt').prop("disabled", true);
		$('#price_txt').val('')
		$('#price').val('')
		$('#percent_txt').prop("disabled", false);
	}
}	
</script>
<style>
.rightAlign{
	text-align: right;
}
</style>