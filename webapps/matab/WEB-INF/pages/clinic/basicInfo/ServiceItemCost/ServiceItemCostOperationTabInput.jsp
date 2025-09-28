<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%

%>
<form class="uk-form2-ServiceItemCostOperation">
	<input type="hidden" id="id" name="id" >
    <div class="uk-grid uk-grid-preserve" id="operationDiv">
        <base:comboBox name="operation_serviceitem_id"  key="com.artonis.clinic.basicInfo.serviceItemCostOperation.serviceitem_id"
                       comboLoaderUrl="combo/loadOperationServiceItem"  styledivLabel="width:15%" />
        <base:checkbox styleClass="verysmall" name="isPrimaryOperation" key="com.artonis.clinic.basicInfo.serviceItemCostOperation.isPrimaryOperation"/>

    </div>

    <div class="uk-grid uk-grid-preserve" >
        <%--as clinic bill--%>
        <base:comboBox name="service_item_cost_group_bill_operation_id"  key="com.artonis.clinic.basicInfo.serviceItemCostOperation.showBillPrint"
                       comboLoaderUrl="combo/loadAllServiceItemGroup"  styledivLabel="width:15%"/>
    </div>
    <div class="uk-grid uk-grid-preserve" >
        <%--as patient bill--%>
        <base:checkbox styleClass="small" name="isNotShowInPatientBill" key="com.artonis.clinic.basicInfo.serviceItemCostOperation.isNotShowInPatientBill" divLableStyle="width:15%" divCheckBoxStyle="width:20%"/>

        <base:comboBox name="service_item_cost_group_patient_bill_operation_id"  key="com.artonis.clinic.basicInfo.serviceItemCostOperation.showPatientBillPrint"
                       comboLoaderUrl="combo/loadAllServiceItemGroup"  styledivLabel="width:15%"/>
    </div>

    <div class="uk-grid uk-grid-preserve" >
        <%--as detail  bill--%>
        <base:checkbox styleClass="small" name="isNotShowInDetailBill" key="com.artonis.clinic.basicInfo.serviceItemCostOperation.isNotShowInDetailBill" divLableStyle="width:15%" divCheckBoxStyle="width:20%"/>

        <base:comboBox name="service_item_cost_group_detail_bill_operation_id"  key="com.artonis.clinic.basicInfo.serviceItemCostOperation.showDetailBillPrint"
                       comboLoaderUrl="combo/loadAllServiceItemGroup"  styledivLabel="width:15%"/>
        <base:checkbox styleClass="small" name="isShowAsTree" key="com.artonis.clinic.basicInfo.serviceItemCostOperation.isShowAsTree" divLableStyle="width:15%" divCheckBoxStyle="width:20%"/>

    </div>
    <div class="uk-grid uk-grid-preserve" >
        <%--as fish print--%>
        <base:checkbox styleClass="small" name="isNotShowInFishPrint" key="com.artonis.clinic.basicInfo.serviceItemCostOperation.isNotShowInFishPrint" divLableStyle="width:15%" divCheckBoxStyle="width:20%"/>
        <base:comboBox name="service_item_cost_group_operation_id"  key="com.artonis.clinic.basicInfo.serviceItemCostOperation.showFishPrint"
                       comboLoaderUrl="combo/loadAllServiceItemGroup"  styledivLabel="width:15%" />
    </div>

    <div class="uk-grid uk-grid-preserve" id="operationDiv">

        <base:testBoxNumericEx onChangeFunction="onChangeOperationQuantity()" styleClass="verysmall" name="operation_quantity" key="com.artonis.clinic.basicInfo.serviceItemCostOperation.quantity"/>
        <base:testBoxNumericEx disabled="true"  styleClass="verysmall" name="operation_professional_ka_cost" key="com.artonis.clinic.basicInfo.serviceItemCostOperation.professional_ka_cost"/>
        <base:testBoxNumericEx disabled="true"  styleClass="verysmall" name="operation_technical_ka_cost" key="com.artonis.clinic.basicInfo.serviceItemCostOperation.technical_ka_cost"/>


	</div>
    <div class="uk-grid uk-grid-preserve" id="operationDiv2">
        <base:testBoxNumericEx onChangeFunction="onChangeOperationQuantity()" styleClass="verysmall"  name="operation_cost" key="com.artonis.clinic.basicInfo.serviceItemCostOperation.cost"/>
        <base:testBoxNumericEx disabled="true" styleClass="verysmall" name="operation_totalCost" key="com.artonis.clinic.basicInfo.serviceItemCostOperation.total"/>
    </div>

</form>
<script type="text/javascript">

    $('#operationDiv2 #operation_cost_txt').prop("disabled", true);
function callback_change_operation_serviceitem_id(e){
	fillServiceItemCostOperationByServiceItemId(e.sender._old);
}

var professionalPercent;
var technicalPercent;
function fillServiceItemCostOperationByServiceItemId(serviceItemId){
	var requestUrl = "${pageContext.request.contextPath}"+"/clinic/basicInfo/serviceItemCost/loadServiceItem/"+serviceItemId;
	$.getJSON(requestUrl, function (data) {
        professionalPercent=undefined;
        technicalPercent=undefined;
		$('#operationDiv #serviceitemCode').val(data.code);
        $('#operationDiv #operation_professional_ka_cost').val("");
        $('#operationDiv #operation_professional_ka_cost_txt').val("");
        $('#operationDiv #operation_technical_ka_cost').val("");
        $('#operationDiv #operation_technical_ka_cost_txt').val("");
        $('#operationDiv #operation_quantity').val(0);
        $('#operationDiv #operation_quantity_txt').val(0);
		if(data.cost!=undefined){
            $('#operationDiv2 #operation_cost').val(data.cost);
            $('#operationDiv2 #operation_cost_txt').val(addCommaSeparator(data.cost));
        }else{
            $('#operationDiv2 #operation_cost').val("");
            $('#operationDiv2 #operation_cost_txt').val("");
        }

        $('#operationDiv #operation_quantity_txt').prop("disabled", true);

        if(data.hasK){
            if(data.rvu_id!=undefined){
                $('#operationDiv #operation_quantity').val(Number(parseFloat(data.technicalPercent+data.professionalPercent).toFixed(3)));
                $('#operationDiv #operation_quantity_txt').val(Number(parseFloat(data.technicalPercent+data.professionalPercent).toFixed(3)));
                professionalPercent=data.professionalPercent;
                technicalPercent=data.technicalPercent;
                $('#operationDiv #operation_professional_ka_cost').val(data.professionalKaCost);
                $('#operationDiv #operation_professional_ka_cost_txt').val(addCommaSeparator(data.professionalKaCost));
                if(data.technicalKaCost!=undefined){
                    $('#operationDiv #operation_technical_ka_cost').val(data.technicalKaCost);
                    $('#operationDiv #operation_technical_ka_cost_txt').val(addCommaSeparator(data.technicalKaCost));
                }else{
                    $('#operationDiv #operation_technical_ka_cost').val('0');
                    $('#operationDiv #operation_technical_ka_cost_txt').val('0');
                }
            }else{
                $('#operationDiv #operation_quantity').val('0');
                $('#operationDiv #operation_quantity_txt').val('0');
            }
            $('#operationDiv #operation_quantity_txt').prop("disabled", true);

            onChangeOperationQuantity(data.rvu_id);
        }else{
            if(data.itemType==4 && data.professionalKaCost){
                $('#operationDiv #operation_quantity_txt').prop("disabled", false);
                $('#operationDiv #operation_professional_ka_cost').val(data.professionalKaCost);
                $('#operationDiv #operation_professional_ka_cost_txt').val(data.professionalKaCost);
                $('#operationDiv2 #operation_cost').val(data.professionalKaCost);
                $('#operationDiv2 #operation_cost_txt').val(addCommaSeparator(data.professionalKaCost));
                professionalPercent=data.professionalPercent;
                technicalPercent=0;
            }else{
                $('#operationDiv #operation_quantity_txt').prop("disabled", false);
                $('#operationDiv #operation_quantity').val('0');
                $('#operationDiv #operation_quantity_txt').val('0');
            }
            onChangeOperationQuantity();
        }
        $('#operationDiv2 #operation_cost_txt').prop("disabled", true);

	});
}

function  onChangeOperationQuantity(rvu_id){
    var totalCost;
    if($('#operationDiv2 #operation_cost').val()!=""){
        var quantity=$('#operationDiv #operation_quantity').val();
        var cost=$('#operationDiv2 #operation_cost').val();
        if(rvu_id!=undefined){
            totalCost=cost;
        }else{
            totalCost=quantity*cost;
        }
    }else{
        var professional_ka_cost= $('#operationDiv #operation_professional_ka_cost').val();
        var technical_ka_cost= $('#operationDiv #operation_technical_ka_cost').val();
        if(professional_ka_cost==""){
            professional_ka_cost=0;
        }
        if(technical_ka_cost==""){
            technical_ka_cost=0;
        }
        if(professionalPercent!=0){
            totalCost=Number(parseFloat(professionalPercent*professional_ka_cost+technicalPercent*technical_ka_cost).toFixed(3));
        }else{
            totalCost=$('#operationDiv #operation_quantity').val()*professional_ka_cost+technicalPercent*technical_ka_cost;
        }
    }
    $('#operationDiv2 #operation_totalCost').val(totalCost);
    $('#operationDiv2 #operation_totalCost_txt').val(addCommaSeparator(totalCost));
}

function _rvu_id_change(e){
    console.log(e.sender._old);
    if(e.sender._old!=""){
        var requestUrl = "${pageContext.request.contextPath}"+"/clinic/basicInfo/rvuModifiedCode/loadRvuDetail/"+e.sender._old;
        $.getJSON(requestUrl, function (data) {
//        $('#serviceitemCode').val(data.code);
//        $('#operation_cost').val(data.cost);
//        $('#operation_cost_txt').val(addCommaSeparator(data.cost));
//        $('#operationDiv #operation_quantity_txt').val('0');
//        $('#operationDiv #operation_quantity').val(0);
            $('#operationDiv2 #technicalPercent').val(data.technicalComponent);
            $('#operationDiv2 #technicalPercent_txt').val(data.technicalComponent);
            $('#operationDiv2 #professionalPercent').val(data.professionalComponent);
            $('#operationDiv2 #professionalPercent_txt').val(data.professionalComponent);

            $('#operation_quantity').val(Number(parseFloat(data.technicalComponent+data.professionalComponent).toFixed(3)));
            $('#operation_quantity_txt').val(Number(parseFloat(data.technicalComponent+data.professionalComponent).toFixed(3)));
            onChangeOperationQuantity();
//        if(data.hasK){
            $('#operationDiv #operation_quantity_txt').prop("disabled", true);
//            $('#operationDiv #operation_quantity').val('');
//            $('#operationDiv #operation_quantity_txt').val('');
//        }else{
//            $('#operationDiv #operation_quantity_txt').prop("disabled", false);
//        }

        });
    }else{
        $('#operationDiv #operation_quantity_txt').prop("disabled", false);
        $('#operationDiv #operation_quantity').val('');
        $('#operationDiv #operation_quantity_txt').val('');

        $('#operationDiv2 #technicalPercent').val('');
        $('#operationDiv2 #technicalPercent_txt').val('');
        $('#operationDiv2 #professionalPercent').val('');
        $('#operationDiv2 #professionalPercent_txt').val('');
    }

}

function callback_change_ka_id(e){

    console.log($("#ka_id").val());
    if($("#ka_id").val()!=""){
        $('#operationDiv2 #operation_cost_txt').prop("disabled", true);
        $('#operationDiv2 #operation_cost').val('');
        $('#operationDiv2 #operation_cost_txt').val('');
    }else{
        $('#operationDiv2 #operation_cost_txt').prop("disabled", false);
        $('#operationDiv2 #operation_cost').val('');
        $('#operationDiv2 #operation_cost_txt').val('');
    }

    var k_id=$("#ka_id_Comb").data("kendoComboBox").text();
    $('#operationDiv2 #operation_cost').val(k_id);
    $('#operationDiv2 #operation_cost_txt').val(addCommaSeparator(k_id));
    onChangeOperationQuantity();
}

function callback_parameter_map_rvu_id(options){
    var object={};
    object['field']='service_item_cost_id';
    object['operator']='equal';
    object['ignoreCase']=true;
    object['value']=$('#id').val();
    if(options.filter!=undefined &&options.filter.field!='id'){
        options.filter.filters.push(object);
    }
    return options;

}

function afterItemLoad_ServiceItemCostOperation(data){

    if(data.new_rvu_id==null){
        $('#operationDiv #operation_quantity_txt').prop("disabled", false);
    }else{
        $('#operationDiv #operation_quantity_txt').prop("disabled", true);
    }
}
//    function callback_deserialize_ServiceItemCostOperation(data){

//    }



</script>