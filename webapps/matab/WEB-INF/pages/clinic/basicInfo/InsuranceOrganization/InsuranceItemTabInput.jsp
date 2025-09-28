<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@ page import="com.artonis.clinic.core.model.ConstValue" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-InsuranceItem">
    <input type="hidden" id="id" name="id"/>
    <div class="uk-grid uk-grid-preserve">
        <base:comboBox name="serviceitem_id"  key="com.artonis.clinic.basicInfo.insuranceItem.serviceitem_id"
                       comboLoaderUrl="combo/loadAllServiceItem" styleClass="small" minLength="0"/>
        <base:comboBox name="itemType" key="com.artonis.clinic.basicInfo.insuranceItem.type" comboLoaderUrl="combo/loadAllItemType" styleClass="small"/>
    </div>
    <div class="uk-grid uk-grid-preserve">
        <base:comboBoxAutoComplete name="rvu_id" key="com.artonis.clinic.basicInfo.rvu" comboLoaderUrl="/combo/loadRvu/"
                                   dataTextField="code" dataValueField="id" minLength="0" filteringType="startswith"
                                   hasTemplate="true" templateComaSep="terminologyId,code,value" iscomboLoaderUrlRelative="true" styleClass="larg"
                                   headerTemplateComaSep="com.artonis.clinic.basicInfo.rvu.terminologyId,com.artonis.clinic.basicInfo.rvu.code,com.artonis.clinic.basicInfo.rvu.value" isFiltering="true"/>

    </div>
    <div class="uk-grid uk-grid-preserve">

        <base:testBoxNumericEx styleClass="small" name="professionalPercent" dataIgnore="true" disabled="true"
                               key="com.artonis.clinic.basicInfo.insuranceItem.professionalPercent"/>
        <base:testBoxNumericEx styleClass="small" dataIgnore="true" disabled="true" name="technicalPercent" key="com.artonis.clinic.basicInfo.insuranceItem.technicalPercent"/>
    </div>
    <div class="uk-grid uk-grid-preserve">
        <base:comboBox name="professional_ka_id" key="com.artonis.clinic.basicInfo.insuranceItem.professional_ka_id" comboLoaderUrl="/combo/loadAllKa" styleClass="small"/>
        <base:comboBox name="technical_ka_id" key="com.artonis.clinic.basicInfo.insuranceItem.technical_ka_id" comboLoaderUrl="/combo/loadAllKa" styleClass="small"/>
        <base:testBox styleClass="small" name="generic_code" key="com.artonis.clinic.basicInfo.insuranceContractVisit.generic_code"/>

    </div>
    <div class="uk-grid uk-grid-preserve">
        <base:testBox styleClass="small" name="dosage" key="com.artonis.clinic.basicInfo.insuranceContractVisit.dosage"/>
        <base:testBoxNumericEx onChangeFunction="onChanging_franshiz_percent()" styleClass="small" name="franshiz_percent"
                               key="com.artonis.clinic.basicInfo.insuranceContractVisit.franshiz_percent"/>
        <base:testBoxNumericEx onChangeFunction="onChanging_franshiz_cost()" styleClass="small" name="franshiz_cost"
                               key="com.artonis.clinic.basicInfo.insuranceContractVisit.franshiz_cost"/>

    </div>
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx onChangeFunction="onChanging_cost()" styleClass="small" name="cost" key="com.artonis.clinic.basicInfo.insuranceContractVisit.cost"/>
        <base:testBox styleClass="small" name="groups" key="com.artonis.clinic.basicInfo.insuranceContractVisit.groups"/>
        <base:testBox styleClass="small" name="limit" key="com.artonis.clinic.basicInfo.insuranceContractVisit.limit"/>
    </div>
</form>

<div style="display:inline;" id="modal-editRelatedServiceItemCost">
</div>

<script type="text/javascript">
    $(document).ready(function () {
        /*if('${isAzadInsurance}' == 'true') {
            var tabBtnDiv = $("#InsuranceItem_saveAndResetBtnDiv");
            //
            var btn = document.createElement('button');
            btn.id = 'editRelatedServiceItemCostBtn';
            btn.className = 'uk-button uk-button-primary';
            btn.type = 'button';
            btn.onclick = editRelatedServiceItemCostBtnOnClick;
            var btnText = document.createTextNode('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.insuranceItem.editRelatedServiceItemCost")%>');
            btn.appendChild(btnText);
            //
            tabBtnDiv.append(btn);
        }*/
    });

    function onChanging_franshiz_percent() {
        if ($("#franshiz_percent").val() > 100) {
            var value = $("#franshiz_percent").val().substring(0, $("#franshiz_percent").val().length - 1);
            $("#franshiz_percent").val(value);
            $("#franshiz_percent_txt").val(value);
        }
    }

    function onChanging_franshiz_cost() {
        if ($('#cost').val() != "") {
            if ($('#franshiz_cost').val() / $('#cost').val() * 100 <= 100) {
                $('#franshiz_percent').val($('#franshiz_cost').val() / $('#cost').val() * 100);
                $('#franshiz_percent_txt').val($('#franshiz_cost').val() / $('#cost').val() * 100);
            }
        }
    }

    function onChanging_cost() {
        if ($('#franshiz_cost').val() != "" && $('#franshiz_cost').val() / $('#cost').val() * 100 != Infinity
            && $('#franshiz_cost').val() / $('#cost').val() * 100 <= 100) {
            $('#franshiz_percent').val($('#franshiz_cost').val() / $('#cost').val() * 100);
            $('#franshiz_percent_txt').val($('#franshiz_cost').val() / $('#cost').val() * 100);
        } else if ($('#franshiz_cost').val() / $('#cost').val() * 100 == Infinity) {
            $('#franshiz_percent').val(0);
            $('#franshiz_percent_txt').val(0);
        }
    }

    function InsuranceItem_onNew_callback() {
        $('#cost_txt').prop("disabled", false);
        $('#generic_code').prop("disabled", false);
        if ($("#id").val() == 1) {
            doAfterSave_InsuranceItem();
        }
    }

    function _InsuranceItem_beforeEdit(e, data) {
        $('#cost_txt').prop("disabled", false);
    }

    function callback_deserialize(data) {
        if (data.id == 1) {
            doAfterSave_InsuranceItem();
        }
    }

    function _rvu_id_change(e) {
        rvu_after_change(e.sender._old);
    }

    function rvu_after_change(id) {
        console.log();
        if (id != "") {
            var requestUrl = "${pageContext.request.contextPath}" + "/clinic/basicInfo/rvuModifiedCode/loadRvuDetail/" + id;
            $.getJSON(requestUrl, function (data) {
                $('#generic_code').val(data.code);
                $('#generic_code').prop("disabled", true);
                $('#technicalPercent').val(data.technicalComponent);
                $('#technicalPercent_txt').val(data.technicalComponent);
                $('#professionalPercent').val(data.professionalComponent);
                $('#professionalPercent_txt').val(data.professionalComponent);
                if ($("#professional_ka_id_Comb").data("kendoComboBox").text() != "" ||
                        $("#technical_ka_id_Comb").data("kendoComboBox").text() != "") {
                    calcCostFromRvu($("#professional_ka_id_Comb").data("kendoComboBox").text(),$("#technical_ka_id_Comb").data("kendoComboBox").text(),
                        $('#technicalPercent').val(), $('#professionalPercent').val());
                } else {
                    emptyCost;
                }
            });
        } else {
            $('#technicalPercent').val('');
            $('#technicalPercent_txt').val('');
            $('#professionalPercent').val('');
            $('#professionalPercent_txt').val('');
            $('#generic_code').prop("disabled", false);
            $('#generic_code').val('');
            $('#rvu_id').val('');
            $('#cost_txt').prop("disabled", false);
        }
    }

    function callback_change_professional_ka_id(e) {
        if (e.sender._prev != "" && $('#technicalPercent').val() != "" && $('#professionalPercent').val()) {
            calcCostFromRvu(e.sender._prev,$("#technical_ka_id_Comb").data("kendoComboBox").text() ,$('#technicalPercent').val(), $('#professionalPercent').val());
        } else if (e.sender._prev != "" && $("#itemType").val() == 4) {
            calcCostFromRvu(e.sender._prev,$("#technical_ka_id_Comb").data("kendoComboBox").text() ,1, 0);
        } else {
            emptyCost();
        }
    }

    function callback_change_technical_ka_id(e) {
        // if (e.sender._prev != "" && $('#technicalPercent').val() != "" && $('#professionalPercent').val()) {
        if ($("#itemType").val() == 3 && $('#professionalPercent').val()!=null) {
            calcCostFromRvu($("#professional_ka_id_Comb").data("kendoComboBox").text(),e.sender._prev, $('#technicalPercent').val(), $('#professionalPercent').val());
        } else if (e.sender._prev != "" && $("#itemType").val() == 4) {
            calcCostFromRvu($("#professional_ka_id_Comb").data("kendoComboBox").text(),e.sender._prev, 1, 0);
        } else {
            emptyCost();
        }
    }

    function calcCostFromRvu(professionalKa,technicalKa, technicalPercent, professionalPercent) {
        if(professionalKa==""){
            professionalKa=0;
        }
        if(technicalKa==""){
            technicalKa=0
        }
        $('#cost').val((professionalKa  * Number(professionalPercent)) + (technicalKa*Number(technicalPercent)));
        $('#cost_txt').val(addCommaSeparator((professionalKa  * Number(professionalPercent)) + (technicalKa*Number(technicalPercent))));
        $('#cost_txt').prop("disabled", true);
    }

    function emptyCost() {
        $('#cost_txt').prop("disabled", false);
        $('#cost').val('');
        $('#cost_txt').val('');
    }

    function doAfterSave_InsuranceItem() {
        if ($('#id').val() == "1") {
            $('#franshiz_percent').val(100);
            $('#franshiz_percent_txt').val(100);
            $('#franshiz_percent_txt').prop("disabled", true);
            $('#franshiz_cost_txt').prop("disabled", true);
        } else {
            InsuranceItem_onNew_callback()
        }
    }

    function callback_deserialize_InsuranceItem(e) {
//        $("#serviceitem_id_Comb").data("kendoComboBox").dataSource.filter({value: e.nameOrGoodsName});
//        $("#serviceitem_id_Comb").data("kendoComboBox").select($("#serviceitem_id_Comb").data("kendoComboBox").ul.children().eq(0));
        if (e.itemType == 4 && e.professional_ka_id == null) {
            $('#cost_txt').prop("disabled", false);
        } else if (e.itemType == 4 && e.professional_ka_id != null) {
            $('#cost_txt').prop("disabled", true);
        }
    }

    function callback_afterBind_rvu_id() {
        rvu_after_change($("#rvu_id").val());
    }

    function callback_change_itemType(e) {
        console.log(e);
    }

    var modal;

    function editRelatedServiceItemCostBtnOnClick(e) {
        var selectGrid = $("#InsuranceItem").data("kendoGrid");
        var row = selectGrid.dataItem($(e.target).closest("tr"));
//        var serviceItemId = $("#serviceitem_id").val();
        var serviceItemId = row.serviceitem_id;
        <%--if (serviceItemId == undefined || serviceItemId == null || serviceItemId == '' || serviceItemId < 1) {--%>
            <%--alertify.error('<%=ResourceBoundleHolder.resourceBundle.getString("com.artonis.clinic.basicInfo.insuranceItem.error.serviceItemNotSelected")%>');--%>
            <%--return;--%>
        <%--}--%>
        var relativeValue = "null";
        var popUpUrl ="";
        if (row.itemType == <%=ConstValue.InsuranceItemTypeEnum.RELATIVE_VALUE.getValue()%>) {
            relativeValue = eval(row.technicalPercent) + eval(row.professionalPercent);
            var professionalPercent=row.professionalPercent;
            var technicalPercent=row.technicalPercent;
            var professional_ka_price=row.professional_ka_price;
            if(professional_ka_price==undefined){
                professional_ka_price=0
            }
            var technical_ka_price=row.technical_ka_price;
            if(technical_ka_price==undefined){
                technical_ka_price=0;
            }

            popUpUrl = "${pageContext.request.contextPath}" + "/clinic/basicInfo/insuranceOrganization/popup/editRelatedServiceItemCostPopupNewForRelativeValue/"
                    + serviceItemId + "/" + relativeValue+"/"+professionalPercent+"/"+technicalPercent+"/"+professional_ka_price+"/"+technical_ka_price;
        }else{
            popUpUrl = "${pageContext.request.contextPath}" + "/clinic/basicInfo/insuranceOrganization/popup/editRelatedServiceItemCostPopupNew/"
                    + serviceItemId + "/" + relativeValue+"/"+row.cost;

        }
        //
        $.get(popUpUrl , function (data) {
            $("#modal-editRelatedServiceItemCost").empty();
            //
            $("#modal-editRelatedServiceItemCost").append('<div id="editRelatedServiceItemCost_popup" class="uk-modal">');
            //
            $("#editRelatedServiceItemCost_popup").append(data);
            //
            modal = new $.UIkit.modal.Modal("#editRelatedServiceItemCost_popup", {center: true});
            //
            $("#editRelatedServiceItemCost_popup").on({
                'uk.modal.hide':function () {
                    $("#modal-editRelatedServiceItemCost").empty();
                }
            });
            //
            modal.show();
        });
    };

</script>