<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 4px; ">
  <form class="uk-form" id="agentDoctorPopup">
    <div class="uk-grid uk-grid-preserve" style="width: 50%; padding: 5px;">
      <base:comboBoxAutoComplete-buttonNew name="doctorId" key="clinic.patient.radiology.doctor" dataTextField="fullName"  styleClass="larg"
                                           iscomboLoaderUrlRelative="true" comboLoaderUrl="combo/loadAllAgentDoctor" dataValueField="id" minLength="0" styledivLabel="width: 25%;"
                                           hasTemplate="false" popupUrl="popup/doctorInput" relativeSaveUrl="/popupDoctor/save" stylediv="padding-right: 0px;"/>
    </div>
  </form>
</div>


<base:footer/>

<script type="text/javascript">

//  function callback_deserialize(data){
//    var multiSelect = $("#operatingType_ids_multiSelect").data("kendoMultiSelect");
//    multiSelect.value(data.operatingType_ids);
//  }
</script>

