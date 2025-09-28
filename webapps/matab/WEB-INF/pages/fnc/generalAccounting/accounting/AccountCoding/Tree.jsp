<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<div class="uk-container uk-container-center my-uk-container" style=" height: 100%; ">

    <%--<form class="uk-form" id="mainForm">--%>
        <div class="k-rtl uk-grid uk-grid-preserve" style=" min-height: 100%; min-width: 100%  "   dir="rtl">
            <base:treeViewSearchable  name="aaa"  key="clinic.visit.labTestNames" dataLoaderController="/fnc/generalAccounting/accounting/accountCoding/treeview/loadAccountCoding" />
        </div>
    <%--</form>--%>


</div>

<script type="text/javascript">
    function callback_treeview_select_aaa(e){
        if(e.modelID==-1){
            window.location.href="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/accountCodingGroup/";
        }else if(typeof(e.modelID.indexOf) == "function" && e.modelID.indexOf('group')>-1){
            var id=e.modelID.substr(0,e.modelID.indexOf('group'));
            window.location.href="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/accountCoding/edit/group/"+id;
        }else{
            window.location.href="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/accountCoding/edit/accountCoding/"+ e.modelID;
        }
    }


</script>