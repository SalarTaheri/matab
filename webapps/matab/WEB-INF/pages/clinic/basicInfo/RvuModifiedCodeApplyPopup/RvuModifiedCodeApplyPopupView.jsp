<%@ page import="java.util.ResourceBundle" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
  String rvuUrl=request.getContextPath()+"/clinic/basicInfo/rvuModifiedCodeApplyPopup/combo/allRvu";
  String modifiedCodeUrl=request.getContextPath()+"/clinic/basicInfo/rvuModifiedCodeApplyPopup/combo/loadModifiedCode";


%>

<div class="body-header">
  <ul class="uk-breadcrumb uk-h3" id="breadcrumb">
    <li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
  </ul>
</div>

<div class="uk-container uk-container-center my-uk-container">
  <form class="uk-form" id="RvuModifiedCodeApply">
    <input type="hidden" id="finnance_registration_id" name="finnance_registration_id">
    <input type="hidden" id="patient_id" name="patient_id">
    <input type="hidden" id="isChange" name="isChange">
    <input type="hidden" id="isApplyOnProfessionalComponent" name="isApplyOnProfessionalComponent">
    <input type="hidden" id="isApplyOnTechnicalComponent" name="isApplyOnTechnicalComponent">
    <input type="hidden" id="isApplyOnAnesthesiaBaseValue" name="isApplyOnAnesthesiaBaseValue">


  <input type="hidden" id="id" name="id">
    <div class="uk-grid uk-grid-preserve">
      <base:comboBox name="rvu_id" isUrlComplete="true"  key="com.artonis.clinic.basicInfo.rvu" comboLoaderUrl="<%=rvuUrl%>" styleClass="small"/>
    </div>
    <div class="uk-grid uk-grid-preserve">
      <base:testBox dataIgnore="true" readOnly="true" name="value"  key="com.artonis.clinic.basicInfo.rvu.value"  styleClass="larg"/>
    </div>
      <div class="uk-grid uk-grid-preserve">
      <base:testBoxNumericEx styleClass="small" name="professionalComponent" disabled="true" key="com.artonis.clinic.basicInfo.rVU.professionalComponent"/>
      <base:testBoxNumericEx styleClass="small" name="technicalComponent" disabled="true"  key="com.artonis.clinic.basicInfo.rVU.technicalComponent"/>
      <base:testBoxNumericEx styleClass="small" name="anesthesiaBaseValue"  key="com.artonis.clinic.basicInfo.rvu.anesthesiaBaseValue"/>
    </div>
    <div class="uk-grid uk-grid-preserve">
      <base:comboBox name="modifiedCode_id" isUrlComplete="true"  key="com.artonis.clinic.basicInfo.modifiedCode" comboLoaderUrl="<%=modifiedCodeUrl%>" styleClass="small"/>
      <base:testBoxNumericEx styleClass="small" disabled="true" name="unit" key="com.artonis.clinic.basicInfo.modifiedCode.unit"/>
      <base:testBoxNumericEx styleClass="small" disabled="true" name="percent" key="com.artonis.clinic.basicInfo.modifiedCode.percent"/>
    </div>
    <div class="uk-grid uk-grid-preserve">
      <base:testBox dataIgnore="true" readOnly="true" name="rvu_components_text"  key="com.artonis.clinic.basicInfo.modifiedCode.rvu_components" />
    </div>
    <div align="center" style="padding-top: 10px; padding-bottom: 10px;">
      <base:SubmitButton/>
    </div>
  </form>
  <base:Pattern3/>
  <div>
    <base:my-grid name="griddd" transportReadUrl="${basePath}/grid-read">
      <base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.code'  field="rvu_code" width="50px"/>
      <base:my-grid-column title='com.artonis.clinic.basicInfo.rVU.name'  field="rvu_value" width="50px"/>
      <base:my-grid-column title='com.artonis.clinic.basicInfo.rVU.professionalComponent'  field="professionalComponent" width="50px"/>
      <base:my-grid-column title='com.artonis.clinic.basicInfo.rVU.technicalComponent'  field="technicalComponent" width="50px"/>
      <base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.anesthesiaBaseValue'  field="anesthesiaBaseValue" width="50px"/>
      <base:my-grid-column title='com.artonis.clinic.basicInfo.modifiedCode.name'  field="modifiedCode_name" width="50px"/>
      <base:my-grid-column title='com.artonis.clinic.basicInfo.modifiedCode'  field="modifiedCode_code" width="50px"/>
      <base:my-grid-column title='com.artonis.clinic.basicInfo.modifiedCode.unit'  field="unit" width="50px"/>
      <base:my-grid-column title='com.artonis.clinic.basicInfo.modifiedCode.percent'  field="percent" width="50px"/>
      <base:my-grid-column title='com.artonis.clinic.basicInfo.modifiedCode.rvu_components'  field="rvu_components_text" width="50px"/>
      <base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.finalProfessionalComponent'  field="finalProfessionalComponent" width="50px"/>
      <base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.finalTechnicalComponent'  field="finalTechnicalComponent" width="50px"/>
      <base:my-grid-column title='com.artonis.clinic.basicInfo.rvu.finalAnesthesiaBaseValue'  field="finalAnesthesiaBaseValue" width="50px"/>

    </base:my-grid>
  </div>
  <base:footer/>
</div>

<script type="text/javascript">

  function callback_change_rvu_id(e){
    var requestUrl = "${pageContext.request.contextPath}"+"/clinic/basicInfo/rvuModifiedCodeApplyPopup/loadRvu/"+e.sender._old;
    $.getJSON(requestUrl, function (data) {

      var professionalComponent=data.professionalComponent;
      var technicalComponent=data.technicalComponent;
      var anesthesiaBaseValue=data.anesthesiaBaseValue;

      if(professionalComponent==null){
        professionalComponent=0;
      }
      $("#RvuModifiedCodeApply #professionalComponent").val(professionalComponent);
      $("#RvuModifiedCodeApply #professionalComponent_txt").val(professionalComponent);

      if(technicalComponent==null){
        technicalComponent=0;
      }

      $("#RvuModifiedCodeApply #technicalComponent").val(technicalComponent);
      $("#RvuModifiedCodeApply #technicalComponent_txt").val(technicalComponent);
      if(anesthesiaBaseValue==null){
        anesthesiaBaseValue=0;
      }

      $("#RvuModifiedCodeApply #anesthesiaBaseValue").val(anesthesiaBaseValue);
      $("#RvuModifiedCodeApply #anesthesiaBaseValue_txt").val(anesthesiaBaseValue);
      $("#RvuModifiedCodeApply #value").val(data.value);

    });
  }

  function callback_change_modifiedCode_id(e){
    var requestUrl = "${pageContext.request.contextPath}"+"/clinic/basicInfo/rvuModifiedCodeApplyPopup/loadModifiedCode/"+e.sender._old;
    $.getJSON(requestUrl, function (data) {

      var unit=data.unit;
      var percent=data.percent;

      $("#RvuModifiedCodeApply #unit_txt").attr("disabled", "disabled")
      $("#RvuModifiedCodeApply #unit").val(unit);
      $("#RvuModifiedCodeApply #unit_txt").val(unit);

      $("#RvuModifiedCodeApply #percent_txt").attr("disabled", "disabled")
      $("#RvuModifiedCodeApply #percent").val(percent);
      $("#RvuModifiedCodeApply #percent_txt").val(percent);


      $("#RvuModifiedCodeApply #isChange").val(data.isChange);
      $("#RvuModifiedCodeApply #isApplyOnProfessionalComponent").val(data.professionalComponent);
      $("#RvuModifiedCodeApply #isApplyOnTechnicalComponent").val(data.technicalComponent);
      $("#RvuModifiedCodeApply #isApplyOnAnesthesiaBaseValue").val(data.anesthesiaBaseValue);

//      var multiSelect = $("#rvu_components_multiSelect").data("kendoMultiSelect");
//      multiSelect.value(data.rvu_components);
      $("#RvuModifiedCodeApply #rvu_components_text").val(data.rvu_components_text);

      if(data.isChange && unit>0){
        $("#RvuModifiedCodeApply #unit_txt").removeAttr("disabled");
      }else if(data.isChange && percent>0){
        $("#RvuModifiedCodeApply #percent_txt").removeAttr("disabled");
      }

    });
  }


  $("#body-heade-save").click(function () {
    saveFormUrl('RvuModifiedCodeApply','<%=request.getContextPath()%>'+'/clinic/basicInfo/rvuModifiedCodeApplyPopup/save'
            ,true,'<%=request.getContextPath()%>'+'/clinic/basicInfo/rvuModifiedCodeApplyPopup/reset');

  });

  function callback_deserialize(data){
    $("#RvuModifiedCodeApply #rvu_components_text").val("");
    $("#RvuModifiedCodeApply #value").val("");
  }

//  function griddd_grid_onEdit(data){
//    $("#RvuModifiedCodeApply").deserialize(data);
//  }


  /*function callback_save_success(){
    var service = {};
    service.id= $("#id").val();
    service.serviceItemCost_ids = $("#serviceItemCost_ids_multiSelect").val();
    service.insurance_id= $("#insurance_id").val();
    service.percent= $("#percent_txt").val();
    $.ajax({
      url: '${pageContext.request.contextPath}'+'/clinic/basicInfo/serviceItemCostInsurance/saveServiceInsurance',
      contentType: "application/json; charset=utf-8",
      data: JSON.stringify(service),
      dataType: 'json',
      type: 'POST',
      success: function (data, success, xhr) {
        if (data.state == "error") {
          for (var i = 0; i < data.errors.length; i++) {
            if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
              alertify.error($("label[for='" + data.errors[i].Field + "']").text() + "  " + data.errors[i].Message);
            } else {
              alertify.error(data.errors[i].Field + "  " + data.errors[i].Message);
            }
          }
        }
        var grid=$("div[data-role='grid']");
        grid.data("kendoGrid").dataSource.read();
        $('#mainForm')[0].reset();
      },
      error: function (e) {
        alert('Error: ' + e.responseText);
      }
    });
  }
  function grid_onEdit(data){
    console.log(data);
    if (data) {
      $("#loadedId").val(data.id);
      $("#insurance_id").val(data.insuranceorganization_id);
      $("#insurance_id_Comb").data("kendoComboBox").value(data.insuranceorganization_id);
      $("#serviceItemCost_ids_multiSelect").data("kendoMultiSelect").value(data.service_item_cost_id);
      $("#percent").val(data.off_precent);
      setNumericTextValue();
    }
  }*/
</script> 
