
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
    <base:my-grid-columnfnc.generalAccounting.accountingcounting.subsidiaryAccount.name'  field="name" width="50px"/>
    <base:my-grid-columfnc.generalAccounting.accountingccounting.subsidiaryAccount.code'  field="code" width="50px"/>
    <base:my-grid-colufnc.generalAccounting.accountingaccounting.subsidiaryAccount.generalAccount'  field="generalAccountName" width="50px"/>
    <base:my-grid-colfnc.generalAccounting.accounting.accounting.subsidiaryAccount.subsidiaryAccountKind'  field="subsidiaryAccountKindStr" width="50px"/>
    <base:my-grid-cofnc.generalAccounting.accountingc.accounting.subsidiaryAccount.state'  field="stateStr" width="50px"/>


    <base:my-grid-schema-field name="name" type="string"/>
    <base:my-grid-schema-field name="code" type="string"/>
    <base:my-grid-schema-field name="generalAccountName" type="string"/>
    <base:my-grid-schema-field name="subsidiaryAccountKindStr" type="string"/>
    <base:my-grid-schema-field name="stateStr" type="string"/>
</base:my-grid>
<base:footer/>