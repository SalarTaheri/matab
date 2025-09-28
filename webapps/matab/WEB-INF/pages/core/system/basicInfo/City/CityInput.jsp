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
            <base:comboBox name="province_id"  key="system.basicInfo.city.province" comboLoaderUrl="combo/loadProvince" styleClass="small"/>
            <base:testBox styleClass="small" name="name" key="system.basicInfo.city.name"/>
            <base:testBox styleClass="small" name="code" key="system.basicInfo.city.code"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="phoneCode" key="system.basicInfo.city.telephoneCode"/>
        </div>

    </form>
</div>

<script type="text/javascript">
    $(document).ready(function () {

    });
</script>
