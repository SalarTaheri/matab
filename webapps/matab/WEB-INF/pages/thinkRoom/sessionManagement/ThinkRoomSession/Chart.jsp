<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<div id="example" class="k-content absConf">
    <%--<div class="chart-wrapper" style="margin: auto;">--%>
    <div class="chart-wrapper">
        <div id="chart"></div>
    </div>
    <script>
        function createChart() {
            $("#chart").kendoChart({
                /*  dataSource: {
                 transport: {
                 read: {
                 url: "../../content/dataviz/js/spain-electricity.json",
                 dataType: "json"
                 }
                 },
                 sort: {
                 field: "year",
                 dir: "asc"
                 }
                 }, */
                title:{
                    text:" اتاق فکر "
                },
                legend:{
                    position:"top",
                    offsetX: 5,
                    offsetY: 15,
                      labels: {
                          font: "12px Arial,Helvetica,sans-serif",
                           align : "left"
                        },
                    
                },
                seriesDefaults:{
                    type:"column",
                    stack:true

                    /*    type:"bar",
                     stack: true */
                },
                series:[
                    {
// field: "nuclear",
                        name:"تعداد کل آقایان",
                        stack:"Male",
                        data:[4, 7.943, 7.848, 9.284, 9.263, 9.801, 3.890, 8.238, 9.552, 6.855, 3.907, 7.943, 7.848, 9.284, 9.263, 9.801]

                    },
                    {
// field: "hydro",
                        name:"تعداد کل بانوان",
                        stack:"Male",
                        data:[6, 7.295, 7.175, 6.376, 8.153, 8.535, 5.247, 7.832, 4.3, 4.3, 3.907, 7.943, 7.848, 9.284, 9.263, 9.801]
                    },
                    {
// field: "wind",
                        name:"آقایان دارای کارت بازرگانی",
                        stack:"Female",
                        data:[2, 0.375, 1.161, 0.684, 3.7, 3.269, 1.083, 5.127, 3.690, 2.995, 0.010, 0.375, 1.161, 0.684, 3.7, 3.269]
                    },
                    {
// field: "wind",
                        name:"بانوان دارای کارت بازرگانی",
                        stack:"Female",
                        data:[2, 0.375, 1.161, 0.684, 3.7, 3.269, 1.083, 5.127, 3.690, 2.995, 0.010, 0.375, 1.161, 0.684, 3.7, 3.269]
                    }
                ],

                seriesColors:["#EF4C00", "#007BC3", "#76B800", "#FFAE00"],

                valueAxis:{
                    labels:{
                        format:"N0"
                    },
// majorUnit: 10000,
                    line:{
                        visible:false
                    }
                },
                categoryAxis:{
                    categories:[2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016],
                    labels:{
                        rotation:-90
                    },
                    majorGridLines:{
                        visible:false
                    }
                },

                tooltip:{
                    visible:true,
                    format:"N0",
                    template:"#= series.name #: #= value #"
                }
            });
        }

        $(document).ready(createChart);
        $(document).bind("kendokinChange", createChart);
    </script>
</div>