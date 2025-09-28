<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>
<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
    <base:my-grid-column title='fnc.generalAccounting.accounting.accountCoding.name' field="name" width="50px"/>
    <base:my-grid-column title='fnc.generalAccounting.accounting.accountCoding.code' field="code" width="25px"/>
    <base:my-grid-column title='fnc.generalAccounting.accounting.type' field="accountCodingTypeStr" width="30px"/>
    <base:my-grid-column title='fnc.generalAccounting.accounting.nature' field="natureStr" width="30px"/>
    <base:my-grid-column isCombo="true" title='fnc.generalAccounting.accounting.function.subGroup' field="isLeaf" width="20px"/>


    <base:my-grid-schema-field name="name" type="string"/>
    <base:my-grid-schema-field name="code" type="string"/>
    <base:my-grid-schema-field name="accountCodingTypeStr" type="string"/>
    <base:my-grid-schema-field name="natureStr" type="string"/>
    <base:my-grid-schema-field name="isLeaf" type="boolean"/>

    <base:my-grid-function text="fnc.generalAccounting.accounting.function.subGroup" functionClick="grid_onGoSubGroup"
                           name="GoSubGroup"/>
</base:my-grid>
<base:footer/>

<script type="text/javascript">
    function grid_onGoSubGroup(e){
        var data = this.dataItem($(e.target).closest("tr"));
        window.location.href="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/accountCoding/edit/group/"+ data.id;
    }

</script>