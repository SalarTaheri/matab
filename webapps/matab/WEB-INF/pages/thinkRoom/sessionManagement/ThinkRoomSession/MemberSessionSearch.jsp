<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<%
    java.util.ResourceBundle resource = java.util.ResourceBundle.getBundle("application_fa");
%>
<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container">


    <form class="uk-form" id="mainForm">

        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker name="fromDate" key="thinkroom.sessionmanagent.session.fromDate" styleClass="small" style="width: 100%;" stylediv="width: 10%;" styledivLabel="width: 5%;" styleLabel="width: 100%;"/>
            <base:mDatePicker name="toDate" key="thinkroom.sessionmanagent.session.toDate" styleClass="small" style="width: 100%;" stylediv="width: 10%;" styledivLabel="width: 5%;" styleLabel="width: 100%;"/>
            <base:comboBox name="session_name_id" value="name" key="thinkroom.sessionmanagent.session.name"  comboLoaderUrl="/combo/loadAllSessionNameCombo" styleClass="small" style="width: 100%;" stylediv="width: 20%;" styledivLabel="width: 7%;" styleLabel="width: 100%;"/>

            <base:button id="button-search" key="global.crud.search" style="width: 100%;" stylediv="width: 20%;"/>
            <base:button id="go-chart" key="global.crud.chart" style="width: 100%;" stylediv="width: 20%;"/>
        </div>

    </form>
</div>
<div>
    <base:thinking-grid name="grid" transportReadUrl="${basePath}/grid-read-search" isForSearch="true">
        <base:my-grid-column title='thinkroom.sessionmanagent.session.date' field="date" width="50px"/>
        <base:my-grid-column title='thinkroom.sessionmanagent.session.name' field="session_name" width="100px"/>
        <base:my-grid-column title='thinkroom.sessionmanagent.session.manCount' field="man_cont" width="40px"/>
        <base:my-grid-column title='thinkroom.sessionmanagent.session.womanCount' field="woman_cont" width="40px"/>
        <base:my-grid-column title='thinkroom.sessionmanagent.session.mansHaveCard' field="man_has_card_cont" width="100px"/>
        <base:my-grid-column title='thinkroom.sessionmanagent.session.womansHaveCard' field="woman_has_card_cont" width="100px"/>

        <base:my-grid-schema-field name="man_cont" type="string"/>
        <base:my-grid-schema-field name="woman_cont" type="string"/>
        <base:my-grid-schema-field name="man_has_card_cont" type="string"/>
        <base:my-grid-schema-field name="woman_has_card_cont" type="string"/>
        <base:my-grid-schema-field name="date" type="string"/>
        <base:my-grid-schema-field name="session_name" type="string"/>
    </base:thinking-grid>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        bindToEntityById_after__session_name_id_Comb();

        $("#body-heade-create").hide();

        $("#button-search").click(function () {
            /*if ($("#fromDate").val().length == 0 || $("#toDate").val().length == 0) {
                alertify.error("تاریخ ها نباید خالی باشند");
                return;
            }*/

            $filter = new Array();
            $xfromDate = $("#fromDate").val();
            $xtoDate = $("#toDate").val();
            $session_name_id = $("#session_name_id").val();
            if ($xfromDate) {
                $filter.push({ field:"date", operator:"gte", value:$xfromDate});
            }
            if ($xtoDate) {
                $filter.push({ field:"date", operator:"lte", value:$xtoDate});
            }
            if ($session_name_id) {
                $filter.push({ field:"session_name_id", operator:"eq", value:$session_name_id});
            }
            $("#grid").data("kendoGrid").dataSource.filter($filter);
//        $("#grid").data("kendoGrid").dataSource.read();
        });

        $("#go-chart").click(function () {
            //todo read from basePath
//        var chartPath=basePath+"/ chart/?fromdate="+$("#fromDate").val()+"&todate="+$("#toDate").val();
            /*if ($("#fromDate").val().length == 0 || $("#toDate").val().length == 0) {
                alertify.error("تاریخ ها نباید خالی باشند");
            } else {*/
                if($("#session_name_id").val().length == 0){
                    var chartPath = "${pageContext.request.contextPath}/thinkRoom/sessionManagement/thinkRoomSession/chart/?fromdate=" + $("#fromDate").val() + "&todate=" + $("#toDate").val();
                    window.location.href = chartPath;

                }else{

                    var chartPath = "${pageContext.request.contextPath}/thinkRoom/sessionManagement/thinkRoomSession/chart/?fromdate=" + $("#fromDate").val() + "&todate=" + $("#toDate").val()+ "&sessionName=" + $("#session_name_id").val();
                    window.location.href = chartPath;
                }
//            }

        });
    });

</script>
