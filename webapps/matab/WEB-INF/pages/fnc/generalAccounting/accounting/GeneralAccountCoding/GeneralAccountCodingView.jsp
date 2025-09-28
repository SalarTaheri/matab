<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>
<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="multiple">
    <base:my-grid-column fnc.generalAccounting.accountingounting.generalAccount.name' field="name" width="50px"/>
    <base:my-grid-columnfnc.generalAccounting.accountingcounting.generalAccount.code' field="code" width="50px"/>
    <base:my-grid-columfnc.generalAccounting.accountingccounting.generalAccount.accountGroup' field="accountGroupName" width="50px"/>
    <base:my-grid-colufnc.generalAccounting.accountingaccounting.generalAccount.generalAccountKind' field="generalAccountKindStr" width="50px"/>
    <base:my-grid-colfnc.generalAccounting.accounting.accounting.generalAccount.state' field="stateStr" width="50px"/>

    <base:my-grid-schema-field name="name" type="string"/>
    <base:my-grid-schema-field name="code" type="string"/>
    <base:my-grid-schema-field name="accountGroupName" type="string"/>
    <base:my-grid-schema-field name="generalAccountKindStr" type="string"/>
    <base:my-grid-schema-field name="stateStr" type="string"/>

</base:my-grid>
<base:footer/>