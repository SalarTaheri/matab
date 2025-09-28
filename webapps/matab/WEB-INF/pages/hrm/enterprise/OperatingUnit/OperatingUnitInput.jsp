<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageHeader/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container">

    <form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id"/>

        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="name" key="com.artonis.hrm.enterprise.operatingUnit.name"/>
            <base:testBox styleClass="small" name="code" key="com.artonis.hrm.enterprise.operatingUnit.code"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:comboBox styleClass="small" name="company_id" isListConstant="true"
                           key="com.artonis.hrm.enterprise.operatingUnit.company" comboLoaderUrl="combo/loadAllCompany"/>
            <base:cascadeComboBox cascadeCombo="company_id" styleClass="small" name="parent_id" isListConstant="true"
                                  key="com.artonis.hrm.enterprise.operatingUnit.parent" comboLoaderUrl="combo/loadAlloperationUnitByCompanyId"/>
        </div>
    </form>
</div>
<script type="text/javascript">
    function callback_deserialize(data) {
        if (!!data.id) {
            $("#company_id_Comb").data("kendoComboBox").enable(false);
            $("#parent_id_Comb").data("kendoComboBox").enable(false);
        }
    }
</script>