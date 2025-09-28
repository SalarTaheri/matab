<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<div class="uk-container uk-container-center my-uk-container" style=" height: 100%; ">


    <%--<div class="k-rtl uk-grid uk-grid-preserve" style=" overflow-y: auto; overflow-x: auto; min-height: 100%; min-width: 100%  "   dir="rtl">--%>
        <%--<base:treeViewSearchable  name="aaa"  key="clinic.visit.labTestNames" dataLoaderController="/fnc/generalAccounting/accounting/account/treeview/loadAccount" />--%>
    <%--</div>--%>
        <base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="AccountOwnersItem"/>


        <base:my-grid-item name="AccountOwnersItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}"
                           masterIdStr="accountowners_id" isPopup="true" noDeleteButton="true">
            <base:my-gfnc.generalAccounting.accountingle='fnc.accounting.name'  field="account_name" width="50px"/>
            <base:my-fnc.generalAccounting.accountingtle='fnc.accounting.code' field="account_code"  width="50px"/>


            <base:my-grid-schema-field name="account_name" type="string" />
            <base:my-grid-schema-field name="account_code" type="string" />

        </base:my-grid-item>



</div>

<script type="text/javascript">
    function callback_treeview_select_aaa(e){
        add_account_id_Callback(e)
        <%--if(e.modelID==-1){--%>
            <%--window.location.href="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/accountGroup/";--%>
        <%--}else if(typeof(e.modelID.indexOf) == "function" && e.modelID.indexOf('group')>-1){--%>
            <%--var id=e.modelID.substr(0,e.modelID.indexOf('group'));--%>
            <%--window.location.href="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/account/edit/group/"+id;--%>
        <%--}else{--%>
            <%--window.location.href="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/account/edit/account/"+ e.modelID;--%>
        <%--}--%>

    }


</script>