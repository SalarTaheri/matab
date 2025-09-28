<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageHeader/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container">
    <form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id">
        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="diagnosis" key="clinic.basicInfo.diagnosis.diagnosis"/>
            <base:testBox styleClass="small" name="code" key="com.artonis.clinic.basicInfo.diagnosis.code"/>
            <base:comboBox styleClass="small" name="status" isListConstant="true" key="com.artonis.clinic.basicInfo.diagnosis.status"
                           comboLoaderUrl="combo/loadAllDiagnosisStatus"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:comboBox styleClass="small" name="parent" key="clinic.basicInfo.diagnosis.parent" comboLoaderUrl="combo/loadAllDiagnosis" minLength="0"/>
            <base:testBoxNumericEx name="priority" key="clinic.basicInfo.diagnosis.priority" styleClass="small"/>
        </div>
    </form>
</div>
