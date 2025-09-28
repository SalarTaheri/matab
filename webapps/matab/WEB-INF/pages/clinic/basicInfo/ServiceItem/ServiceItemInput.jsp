<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<%
    String menuSysCode = String.valueOf(request.getAttribute("menuSystemCode"));
%>

<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container">
    <form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id">

        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="name" key="com.artonis.clinic.basicInfo.serviceItem.name"/>

            <base:comboBoxAutoComplete-buttonNew name="goods_id" key="com.artonis.inv.basicInfo.inventoryGoods.goods_id" templateComaSep="name,code"
                                                 iscomboLoaderUrlRelative="true" comboLoaderUrl="combo/loadAllGoods" dataTextField="nameAndCode" dataValueField="id" minLength="0" styleClass="small"
                                                 hasTemplate="true" headerTemplateComaSep="com.artonis.inv.basicInfo.goods.name,com.artonis.inv.basicInfo.goods.code"
                                                 popupUrl="popup/goodsInput" relativeSaveUrl="/popupGoods/save"/>
            <base:comboBox name="type" value="name" key="com.artonis.clinic.basicInfo.serviceItem.type"
                           comboLoaderUrl="combo/loadAllType" styleClass="small"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="code" key="com.artonis.clinic.basicInfo.serviceItem.code"/>
        </div>

        <div class="uk-grid uk-grid-preserve" >

                <%--as clinic bill--%>
                <base:comboBox name="service_item_group_bill_id" value="name" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.showBillPrint"
                               comboLoaderUrl="combo/loadAllServiceItemGroup"  styleClass="small"/>
        </div>
        <div class="uk-grid uk-grid-preserve" >
            <%--as patient bill--%>
            <base:checkbox  name="isNotShowInPatientBill" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.isNotShowInPatientBill"  divLableStyle="width:15%" divCheckBoxStyle="width:15%"/>

            <base:comboBox name="service_item_group_patient_bill_id" value="name" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.showPatientBillPrint"
                           comboLoaderUrl="combo/loadAllServiceItemGroup" styleClass="small" />
        </div>
        <div class="uk-grid uk-grid-preserve" >
            <%--as detail  bill--%>
            <base:checkbox styleClass="small" name="isNotShowInDetailBill" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.isNotShowInDetailBill"  divLableStyle="width:15%" divCheckBoxStyle="width:15%"/>

            <base:comboBox name="service_item_group_detail_bill_id" value="name" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.showDetailBillPrint"
                           comboLoaderUrl="combo/loadAllServiceItemGroup" styleClass="small"  />
            <%--<base:checkbox styleClass="small" name="isShowAsTree" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.isShowAsTree"/>--%>

        </div>
        <div class="uk-grid uk-grid-preserve" >
            <%--as fish print--%>
            <base:checkbox  name="isNotShowInFishPrint" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.isNotShowInFishPrint" divLableStyle="width:15%" divCheckBoxStyle="width:15%"/>
            <base:comboBox name="service_item_group_fish_id" value="name" key="com.artonis.clinic.basicInfo.serviceItemCostEquipment.showFishPrint"
                           comboLoaderUrl="combo/loadAllServiceItemGroup" styleClass="small" />
        </div>
        <div id="anesthesia" class="uk-grid uk-grid-preserve" >

            <base:checkbox  name="isAnesthesiaService" key="com.artonis.clinic.basicInfo.serviceItem.isAnesthesiaService" divLableStyle="width:15%" divCheckBoxStyle="width:15%"/>
        </div>
        <div id="priority" class="uk-grid uk-grid-preserve" >
            <base:testBoxNumericEx  name="priorityOnPatientBill"  styleClass="small" key="com.artonis.clinic.basicInfo.serviceItem.priorityOnPatientBill" />

        </div>
        <div id="allowChangeQuantity" class="uk-grid uk-grid-preserve" >
            <base:hasPermission id="allowHasAllowChangeQuantity"/>
            <base:checkbox  name="hasAllowChangeQuantity" key="com.artonis.clinic.basicInfo.serviceItem.hasAllowChangeQuantity" divLableStyle="width:15%" divCheckBoxStyle="width:15%"/>
        </div>

    </form>
</div>
<%--907814234181--%>
<%--907814252449--%>
<script type="text/javascript">
    $(document).ready(function () {
        $(".uk-width-6-10").css("width", "49%");
        if($("#allowHasAllowChangeQuantity").val()==0){
            $("#allowChangeQuantity").hide();
        }else{
            $("#allowChangeQuantity").show();
        }
    });
    function callback_change_type(e) {
        console.log(e.sender._old);
        if(e.sender._old=="2"){
            $("#anesthesia").show();
        }else{
            $("#anesthesia").hide();
        }

        if(e.sender._old=="2"|| e.sender._old=="3"){
            $("#hasAllowChangeQuantity").prop('checked',false);
        }else{
            $("#hasAllowChangeQuantity").prop('checked',true);
        }
    }
    function callback_deserialize(data) {
//        checkClinicCostField();
//        checkKableShowHide();
        checkIsAnesthesiaService(data);
    }
    function checkIsAnesthesiaService(data){
        if(data.type!=2){
            $("#anesthesia").hide();
        }else{
            $("#anesthesia").show();
        }
    }
    /*function checkClinicCostField() {
        if ($("#type").val() == "1") {
            $("#clinicCost_txt").show();
            $("label[for=clinicCost]").show();
        } else {
            $("#clinicCost_txt").hide();
            $("label[for=clinicCost]").hide();
            $("#clinicCost_txt").val('');
            $("#clinicCost").val('');
        }
    }
    function callback_change_hasK(e) {
        checkKableShowHide();
        $("#cost").val(0);
        setNumericTextValue();
    }
    function checkKableShowHide() {
        if ($("#hasK").val() == "1") {
            $('.kAble').show();
            $("#cost_txt").attr("disabled", "disabled");
        } else {
            $('.kAble').hide();
            $("#cost_txt").removeAttr("disabled");
        }
    }
    function callback_change_k_id(e) {
        var k_id = e.sender._old;
        checkCostField(k_id);
    }
    function checkCostField(k_id) {
        var requestUrl = getBaseUrl() + "loadKa/" + k_id;
        $.getJSON(requestUrl, function (data) {
            $("#cost").val(data.ka_price);
            setNumericTextValue();
        });
    }*/
</script>
