<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<div class="uk-container uk-container-center my-uk-container" style=" height: 100%; ">
    <div class="k-rtl uk-grid uk-grid-preserve" style=" overflow-y: auto; overflow-x: auto; min-height: 100%; min-width: 100%  "   dir="rtl">
        <base:treeViewSearchable  name="floatAccountTreeView"  key="clinic.visit.labTestNames" dataLoaderController="/fnc/generalAccounting/accounting/floatAccount/treeview/loadAccountCoding" />
    </div>
</div>

<script type="text/javascript">
    function callback_treeview_select_floatAccountTreeView(e){
        add_floatAccountLevel1_Id_Callback(e);
    }

    function cancel_floatDetailAccount_id_Callback(e) {
        $("#item-modals-floatAccountLevel1_Id").dialog('close');
    }
</script>