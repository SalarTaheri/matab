<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%--<base:pageHeader/>--%>
<%--<base:pageInputHeader/>--%>
<div class="uk-container uk-container-center my-uk-container" >


    <form class="uk-form" id="form-popup">
        <input type="hidden" id="id" name="id" >

        <div class="uk-grid uk-grid-preserve">
            <base:testBox name="name" styleClass="small" key="clinic.patient.job.name"/>

        </div>
    </form>
</div>
