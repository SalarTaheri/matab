<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-uk-form2-ConsumptionSlipItem">

    <input type="hidden" id="id" name="id"/>
    <input type="hidden" id="factorDoctorClinicPortionBasedEquipmentViewIds" name="factorDoctorClinicPortionBasedEquipmentViewIds"/>
    <input type="hidden" id="requestGoodsId" name="requestGoodsId"/>
    <input type="hidden" id="state" name="state"/>
    <input type="hidden" id="issuer" name="issuer"/>
    <input type="hidden" id="referenceToDocument" name="referenceToDocument"/>

    <div class="uk-grid uk-grid-preserve">
        <base:testBox styleClass="small" value="com.artonis.inv.slip.consumptionSlip" name="documentType" disabled="true" dataIgnore="true"
                      key="com.artonis.inv.slip.consumptionSlip.documentType"/>
        <base:testBox styleClass="small" name="reference" key="com.artonis.inv.slip.consumptionSlip.reference" readOnly="true"/>
        <base:testBox styleClass="small" name="serial" key="com.artonis.inv.slip.consumptionSlip.serial"/>
    </div>

    <div class="uk-grid uk-grid-preserve">
        <base:comboBox name="inventoryId" styleClass="small" key="com.artonis.inv.slip.consumptionSlip.inventory" comboLoaderUrl="combo/loadAllInventory" />
        <base:mDatePicker styleClass="small" name="date" key="com.artonis.inv.slip.consumptionSlip.date"/>
    </div>

</form>
