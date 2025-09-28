
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>
<div id="item-modals" style="width:0;height: 0; "></div>
<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single" noDeleteButton="true" isPopup="true">
	<base:my-grid-column title='fnc.generalAccounting.accounting.accountOwner.name'  field="nameTxt" width="50px"/>
	<base:my-grid-column title='fnc.generalAccounting.accounting.accountOwner.group'  field="groupTxt" width="50px"/>
	<base:my-grid-column title='fnc.generalAccounting.accounting.accountOwner.floatDetail.group'  field="floatAccountGroupName" width="50px"/>
	<base:my-grid-column title='fnc.generalAccounting.accounting.accountOwner.floatDetail.group.nature'  field="floatAccountGroupNatureName" width="50px"/>

        <base:my-grid-schema-field name="nameTxt" type="string"/>
        <base:my-grid-schema-field name="groupTxt" type="string"/>
        <base:my-grid-schema-field name="floatAccountGroupName" type="string"/>
        <base:my-grid-schema-field name="floatAccountGroupNatureName" type="string"/>
        
</base:my-grid>
<base:footer/>

<script type="text/javascript">
    function grid_requestEnd_callback(e){
//        $('#body-heade-create').remove();
    }

    function grid_onGoSubAccount(e){
//        var data = this.dataItem($(e.target).closest("tr"));
        <%--window.location.href="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/account/edit/account/"+ data.id;--%>
        <%--var isRelative = "<%=popupUrlIsRelative%>";--%>
        <%--var url;--%>
        <%--if(isRelative=='true'){--%>
            <%--url=getBaseUrl()+"${popupUrl}";--%>
        <%--}else{--%>
            <%--url="${popupUrl}";--%>
        <%--}--%>
        var add = $.get("${basePath}"+"/popup/gridAccountInOwner",
                function (data) {
                    $("#item-modals").empty();
                    $("#item-modals").append('<div id="modals"/>');
                    $("#modals").append(data);
                    $("#item-modals").dialog('open');
//                        afterBind();
                }).fail(function (result) {
                    if (result.status == 401) {
                        window.location.href = "";
                    }
                });

        $("#item-modals").dialog({
            modal : true,
            autoOpen: false,
//        closeOnEscape: true ,
//        dialogClass: 'captcha',
//        show: 'explode',
//        hide: 'explode',
            maxHeight: true,
            maxWidth: true,
            position: 'top',
            width: 800,
            zIndex:10000,
            close: function( event, ui ) {
//                $("#grid").data("kendoGrid").dataSource.read();
                $("#item-modals").empty();

            }

        });
    }
</script>