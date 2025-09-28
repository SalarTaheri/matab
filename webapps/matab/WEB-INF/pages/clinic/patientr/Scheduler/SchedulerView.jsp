<%--
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

    <link href="<c:url value='/resources/js/fullcalendar-1.6.4/fullcalendar/fullcalendar.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/js/fullcalendar-1.6.4/fullcalendar/fullcalendar.print.css'/>" rel="stylesheet" />


    <script src="<c:url value='/resources/js/fullcalendar-1.6.4/lib/jquery.min.js' />"></script>
    <script src="<c:url value='/resources/js/fullcalendar-1.6.4/lib/jquery-ui.custom.min.js' />"></script>
    <script src="<c:url value='/resources/js/fullcalendar-1.6.4/fullcalendar/fullcalendar.min.js' />"></script>

    <script>

        $(document).ready(function() {

            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();

            var calendar = $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                selectable: true,
                selectHelper: true,
                select: function(start, end, allDay) {
                    var title = prompt('Event Title:');
                    if (title) {
                        calendar.fullCalendar('renderEvent',
                                {
                                    title: title,
                                    start: start,
                                    end: end,
                                    allDay: allDay
                                },
                                true // make the event "stick"
                        );
                    }
                    calendar.fullCalendar('unselect');
                },
                editable: true,
                events: [
                    {
                        title: 'All Day Event',
                        start: new Date(y, m, 1)
                    },
                    {
                        title: 'Long Event',
                        start: new Date(y, m, d-5),
                        end: new Date(y, m, d-2)
                    },
                    {
                        id: 999,
                        title: 'Repeating Event',
                        start: new Date(y, m, d-3, 16, 0),
                        allDay: false
                    },
                    {
                        id: 999,
                        title: 'Repeating Event',
                        start: new Date(y, m, d+4, 16, 0),
                        allDay: false
                    },
                    {
                        title: 'Meeting',
                        start: new Date(y, m, d, 10, 30),
                        allDay: false
                    },
                    {
                        title: 'Lunch',
                        start: new Date(y, m, d, 12, 0),
                        end: new Date(y, m, d, 14, 0),
                        allDay: false
                    },
                    {
                        title: 'Birthday Party',
                        start: new Date(y, m, d+1, 19, 0),
                        end: new Date(y, m, d+1, 22, 30),
                        allDay: false
                    },
                    {
                        title: 'Click for Google',
                        start: new Date(y, m, 28),
                        end: new Date(y, m, 29),
                        url: 'http://google.com/'
                    }
                ]
            });

        });

    </script>
    <style>

        body {
            margin-top: 40px;
            text-align: center;
            font-size: 14px;
            font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
        }

        #calendar {
            width: 900px;
            margin: 0 auto;
        }

    </style>
</head>
<body>
<div id='calendar'></div>
</body>
</html>
--%>

<%--

<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:url value="/clinic/patientr/scheduler/api/read" var="readUrl" />
<c:url value="/clinic/patientr/scheduler/api/create" var="createUrl" />
<c:url value="/clinic/patientr/scheduler/api/update" var="updateUrl" />
<c:url value="/clinic/patientr/scheduler/api/destroy" var="destroyUrl" />

<%
    Date date = new SimpleDateFormat("yyyy/MM/dd").parse("2013/6/13");

    Date startTime = new SimpleDateFormat("yyyy/MM/dd hh:mm").parse("2013/6/13 7:00");

    ArrayList<HashMap<String, Object>> resources = new ArrayList<HashMap<String, Object>>();

    HashMap<String, Object> alex = new HashMap<String, Object>();
    alex.put("text", "Alex");
    alex.put("value", 1);
    alex.put("color", "#f8a398");
    resources.add(alex);
    HashMap<String, Object> bob = new HashMap<String, Object>();
    bob.put("text", "Bob");
    bob.put("value", 2);
    bob.put("color", "#51a0ed");
    resources.add(bob);
    HashMap<String, Object> charlie = new HashMap<String, Object>();
    charlie.put("text", "Charlie");
    charlie.put("value", 3);
    charlie.put("color", "#56ca85");
    resources.add(charlie);

%>
<div id="people">
    <input checked type="checkbox" id="alex" value="1">
    <input checked type="checkbox" id="bob" value="2">
    <input type="checkbox" id="charlie" value="3">
</div>
<kendo:scheduler name="scheduler" timezone="Etc/UTC" height="600" date="<%= date %>" startTime="<%= startTime %>">
    <kendo:scheduler-views>
        <kendo:scheduler-view type="day" />
        <kendo:scheduler-view type="workWeek" selected="true" />
        <kendo:scheduler-view type="week" />
        <kendo:scheduler-view type="month"  />
        <kendo:scheduler-view type="agenda" />
    </kendo:scheduler-views>
    <kendo:scheduler-resources>
        <kendo:scheduler-resource field="ownerId" title="Owner">
            <kendo:dataSource data="<%= resources %>" />
        </kendo:scheduler-resource>
    </kendo:scheduler-resources>
    <kendo:dataSource batch="true">
        <kendo:dataSource-filter>
            <kendo:dataSource-filterItem logic="or">
                <kendo:dataSource-filterItem field="ownerId" operator="eq" value="1" />
                <kendo:dataSource-filterItem field="ownerId" operator="eq" value="2" />
            </kendo:dataSource-filterItem>
        </kendo:dataSource-filter>
        <kendo:dataSource-schema>
            <kendo:dataSource-schema-model id="taskId">
                <kendo:dataSource-schema-model-fields>
                    <kendo:dataSource-schema-model-field name="taskId" type="number" />
                    <kendo:dataSource-schema-model-field name="title" defaultValue="No title" type="string" />
                    <kendo:dataSource-schema-model-field name="description" type="string" />
                    <kendo:dataSource-schema-model-field name="isAllDay" type="boolean" />
                    <kendo:dataSource-schema-model-field name="recurrenceRule" type="string" nullable="true"/>
                    <kendo:dataSource-schema-model-field name="recurrenceId" type="number" nullable="true" />
                    <kendo:dataSource-schema-model-field name="recurrenceException" type="string" nullable="true" />
                    <kendo:dataSource-schema-model-field name="ownerId" type="number" defaultValue="1" />
                    <kendo:dataSource-schema-model-field name="start" type="date" />
                    <kendo:dataSource-schema-model-field name="end" type="date" />
                </kendo:dataSource-schema-model-fields>
            </kendo:dataSource-schema-model>
        </kendo:dataSource-schema>
        <kendo:dataSource-transport>
            <kendo:dataSource-transport-create url="${createUrl}" dataType="json" type="POST" contentType="application/json" />
            <kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json" />
            <kendo:dataSource-transport-update url="${updateUrl}" dataType="json" type="POST" contentType="application/json" />
            <kendo:dataSource-transport-destroy url="${destroyUrl}" dataType="json" type="POST" contentType="application/json" />
            <kendo:dataSource-transport-parameterMap>
                <script>
                    function parameterMap(options, type) {
                        if(type==="read"){
                            return JSON.stringify(options);
                        } else {
                            return JSON.stringify(options.models);
                        }
                    }
                </script>
            </kendo:dataSource-transport-parameterMap>
        </kendo:dataSource-transport>
    </kendo:dataSource>
</kendo:scheduler>

<script>
    $("#people :checkbox").change(function(e) {
        var checked = $.map($("#people :checked"), function(checkbox) {
            return parseInt($(checkbox).val());
        });

        var filter = {
            logic: "or",
            filters: $.map(checked, function(value) {
                return {
                    operator: "eq",
                    field: "ownerId",
                    value: value
                };
            })
        };

        var scheduler = $("#scheduler").data("kendoScheduler");

        scheduler.dataSource.filter(filter);
    });
</script>
<style scoped>
    #people {
       &lt;%&ndash;background: url(<c:url value="/resources/web/scheduler/team-schedule.png" />) transparent no-repeat;&ndash;%&gt;
        height: 115px;
        position: relative;
    }
    #alex {
        position: absolute;
        left: 404px;
        top: 81px;
    }
    #bob {
        position: absolute;
        left: 519px;
        top: 81px;
    }
    #charlie {
        position: absolute;
        left: 634px;
        top: 81px;
    }
</style>

--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
    <<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link href="<c:url value='/resources/js/sch/style/kendo.common.min.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/js/sch/style/kendo.default.min.css'/>" rel="stylesheet" />

    <script src="<c:url value='/resources/js/sch/jquery.min.js' />"></script>
    <script src="<c:url value='/resources/js/sch/kendo.all.min.js' />"></script>
    <script src="<c:url value='/resources/js/sch/kendo.timezones.min.js' />"></script>
    <script src="<c:url value='/resources/js/cultures/kendo.culture.fa-IR.js' />"></script>

    <%--<script src="<c:url value='/resources/js/sch/JalaliDate.js' />"></script>--%>
    <%--<script src="<c:url value='/resources/js/sch/fa-IR.js' />"></script>--%>
    <%--<script src="<c:url value='/resources/js/sch/kendo.core.js' />"></script>--%>
    <%--<script src="<c:url value='/resources/js/sch/kendo.calendar.js' />"></script>--%>
    <%--<script src="<c:url value='/resources/js/sch/kendo.datepicker.js' />"></script>--%>
    <%--<script src="<c:url value='/resources/js/sch/kendo.popup.js' />"></script>--%>


</head>
<body>
<div id="example" class="k-content">
    <div id="scheduler"></div>
</div>
<script>
    $(function() {
//        kendo.culture("fa-IR");
//        kendo.culture().calendar.days.namesShort=["یکشنبه","شنبه"]
        kendo.culture().calendar.firstDay = 6;

        $("#scheduler").kendoScheduler({
//            date: new Date("2013/6/13"),
//            startTime: new Date("2013/6/13 07:00 AM"),
//            minorTickCount: 1,
            height: 600,
            views: [
//                "day",
                { type: "day", selected: true,majorTick: 15 },
                "week",
                "month",
                "agenda"
            ],
//            timezone: "Etc/GMT",
            timezone: "Iran",
            dataSource: {
                batch: true,
                transport: {
                    read: {
                        url: "http://demos.telerik.com/kendo-ui/service/tasks",
                        dataType: "jsonp"
                    },
                    update: {
                        url: "http://demos.telerik.com/kendo-ui/service/tasks/update",
                        dataType: "jsonp"
                    },
                    create: {
                        url: "http://demos.telerik.com/kendo-ui/service/tasks/create",
                        dataType: "jsonp"
                    },
                    destroy: {
                        url: "http://demos.telerik.com/kendo-ui/service/tasks/destroy",
                        dataType: "jsonp"
                    },
                    parameterMap: function(options, operation) {
                        if (operation !== "read" && options.models) {
                            return {models: kendo.stringify(options.models)};
                        }
                    }
                },
                schema: {
                    model: {
                        id: "taskId",
                        fields: {
                            taskId: { from: "TaskID", type: "number" },
                            title: { from: "Title", defaultValue: "No title", validation: { required: true } },
                            start: { type: "date", from: "Start" },
                            end: { type: "date", from: "End" },
                            startTimezone: { from: "StartTimezone" },
                            endTimezone: { from: "EndTimezone" },
                            description: { from: "Description" },
                            recurrenceId: { from: "RecurrenceID" },
                            recurrenceRule: { from: "RecurrenceRule" },
                            recurrenceException: { from: "RecurrenceException" },
                            ownerId: { from: "OwnerID", defaultValue: 1 },
                            isAllDay: { type: "boolean", from: "IsAllDay" }
                        }
                    }
                },
                filter: {
                    logic: "or",
                    filters: [
                        { field: "ownerId", operator: "eq", value: 1 },
                        { field: "ownerId", operator: "eq", value: 2 }
                    ]
                }
            },
            resources: [
                {
                    field: "ownerId",
                    title: "Owner",
                    dataSource: [
                        { text: "Alex", value: 1, color: "#f8a398" },
                        { text: "Bob", value: 2, color: "#51a0ed" },
                        { text: "Charlie", value: 3, color: "#56ca85" }
                    ]
                }
            ]
        });



        $("#people :checkbox").change(function(e) {
            var checked = $.map($("#people :checked"), function(checkbox) {
                return parseInt($(checkbox).val());
            });

            var scheduler = $("#scheduler").data("kendoScheduler");

            scheduler.dataSource.filter({
                operator: function(task) {
                    return $.inArray(task.ownerId, checked) >= 0;
                }
            });
        });
    });
</script>
<style scoped>

    .k-nav-current > .k-link span + span {
        max-width: 200px;
        display: inline-block;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
        vertical-align: top;
    }

    #people {
        background: url('../../content/web/scheduler/team-schedule.png') transparent no-repeat;
        height: 115px;
        position: relative;
    }
    #alex {
        position: absolute;
        left: 404px;
        top: 81px;
    }
    #bob {
        position: absolute;
        left: 519px;
        top: 81px;
    }
    #charlie {
        position: absolute;
        left: 634px;
        top: 81px;
    }
</style>


</body>
</html>