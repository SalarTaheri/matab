<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>
<%
    String basePath = new UrlPathHelper().getOriginatingRequestUri(request);

    String fromdate = request.getParameterMap().get("fromdate")[0].toString();
    String todate = request.getParameterMap().get("todate")[0].toString();
    String sessionNameId="";
    if(request.getParameterMap().get("sessionName")!=null){

        sessionNameId = request.getParameterMap().get("sessionName")[0].toString();
    }

//    basePath=basePath.substring(basePath.indexOf("/sys"));
    int pos = basePath.indexOf("/create");
    if (pos > 0) {
        basePath = basePath.substring(0, pos);
        basePath += "/";

    }
%>


<c:url value='<%=basePath%>' var="transportReadUrl"/>
<c:url value='<%=fromdate%>' var="fromdate"/>
<c:url value='<%=todate%>' var="todate"/>
<c:url value='<%=sessionNameId%>' var="sessionNameId"/>

<%--<base:pageHeader/>--%>
<%--<base:pageInputHeader/>--%>
<div class="k-content absConf">
    <%--<iframe id="resultmyIframe"  width="600" height="430">--%>

        <div class="chart-wrapper" style="margin: auto;">
        <%--<div class="chart-wrapper" style="width: 200; height: 230; overflow: scroll;">--%>

            <kendo:chart name="chart"  autoBind="true">
                <kendo:chart-title text=""/>
                <kendo:chart-legend position="top" >
                </kendo:chart-legend>

                <kendo:dataSource requestStart="requestStart" requestEnd="requestEnd">
                    <kendo:dataSource-transport>
                        <kendo:dataSource-transport-read
                                url="${pageContext.request.contextPath}/thinkRoom/sessionManagement/thinkRoomSession/read-chart"  type="POST"
                                contentType="application/json"/>
                    </kendo:dataSource-transport>
                </kendo:dataSource>
                <kendo:chart-series>
                    <kendo:chart-seriesItem type="column" stack="sex" field="man_cont" name="تعداد آقایان"
                                            color="#EF4C00"/>
                    <%--<kendo:chart-seriesItem type="column" stack="sex" field="man_cont" name="man" color="#EF4C00" />--%>
                    <kendo:chart-seriesItem type="column" stack="sex" field="woman_cont" name="تعداد بانوان"
                                            color="#007BC3"/>
                    <%--<kendo:chart-seriesItem type="column" stack="sex" field="woman_cont" name="woman" color="#007BC3"/>--%>
                    <kendo:chart-seriesItem type="column" stack="card" field="man_has_card_cont"
                                            name="تعداد آقایان دارای کارت" color="#76B800"/>
                    <%--<kendo:chart-seriesItem type="column" stack="card" field="man_has_card_cont" name="mancard" color="#76B800"/>--%>
                    <kendo:chart-seriesItem type="column" stack="card" field="woman_has_card_cont"
                                            name="تعداد بانوان دارای کارت" color="#FFAE00"/>
                    <%--<kendo:chart-seriesItem type="column" stack="card" field="woman_has_card_cont" name="womanCard" color="#FFAE00"/>--%>
                </kendo:chart-series>
                <kendo:chart-categoryAxis>
                    <kendo:chart-categoryAxisItem field="date">
                        <kendo:chart-categoryAxisItem-labels rotation="90" margin="100"/>
                        <kendo:chart-categoryAxisItem-majorGridLines visible="true"/>
                    </kendo:chart-categoryAxisItem>
                </kendo:chart-categoryAxis>
                <kendo:chart-valueAxis>
                    <kendo:chart-valueAxisItem majorUnit="10">
                        <kendo:chart-valueAxisItem-labels format="{0:N0}" padding="50"/>
                        <kendo:chart-valueAxisItem-line visible="false"/>
                    </kendo:chart-valueAxisItem>
                </kendo:chart-valueAxis>
                <kendo:chart-tooltip visible="true" format="NO" template="#= series.name #: #= value #"/>
            </kendo:chart>
        </div>

    <%--</iframe>--%>
</div>

<script type="text/javascript">
    var forOneSessionName;
    $(function () {
        $(document).click(function() {
            $("g")[$("g").length-1].style.direction="initial";
        });
    });
    function requestStart() {
         var sessionNameId= '<%=sessionNameId%>';

        var url = $("#chart").data("kendoChart").dataSource.transport.options.read.url;
        if(sessionNameId.length>0){
            forOneSessionName=true;
            $("#chart").data("kendoChart").dataSource.transport.options.read.url = url + "?fromdate=" + "${fromdate}" + "&todate=" + "${todate}"+ "&sessionName=" + "${sessionNameId}";
        }else{
            forOneSessionName=false;
            $("#chart").data("kendoChart").dataSource.transport.options.read.url = url + "?fromdate=" + "${fromdate}" + "&todate=" + "${todate}";
        }

    }

    function requestEnd(e) {

        if(forOneSessionName){
            var chart = $("#chart").data("kendoChart");
            chart.setOptions({
                title: {
                text: e.response[0].session_name

                }
            });
        }else{
            var chart = $("#chart").data("kendoChart");
            chart.setOptions({
                title: {
                    text: 'جلسات'
                }
            });
        }
        chart.redraw();

        $("#chart svg").width(Number($(window).height())*80/100);
        $("#chart svg").height(Number($(window).height()) - 100);
        $("#chart").data("kendoChart").refresh();
    }


</script>