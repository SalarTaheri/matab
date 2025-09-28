<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@ page import="com.artonis.clinic.core.model.ConstValue" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<form class="uk-form2-InsuranceLimit">
    <input type="hidden" id="id" name="id"/>
    <div class="uk-grid uk-grid-preserve">
        <base:comboBox name="basedOn" value="name" key="com.artonis.clinic.basicInfo.insuranceOrganization.insuranceLimit.basedOn"
                       comboLoaderUrl="combo/loadAllBasedOn" styleClass="small" minLength="0"/>
        <base:comboBox name="group_id" comboLoaderUrl="combo/loadAllGroup" key="com.artonis.clinic.basicInfo.insuranceOrganization.insuranceLimit.group_id" styleClass="small" minLength="0" />
        <base:testBoxNumericEx name="price"  key="com.artonis.clinic.basicInfo.insuranceOrganization.insuranceLimit.price" styleClass="small" />
    </div>
    <div class="uk-grid uk-grid-preserve">
        <base:checkbox name="isApplyOnTotalFactor"  key="com.artonis.clinic.basicInfo.insuranceOrganization.insuranceLimit.isApplyOnTotalFactor" styleClass="small" />

    </div>

</form>

