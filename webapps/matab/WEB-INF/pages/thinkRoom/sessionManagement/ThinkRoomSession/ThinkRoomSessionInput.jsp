<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="java.util.ResourceBundle"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader></base:pageHeader>
<base:pageInputHeader/>
<%--<script type='text/javascript' src='http://code.jquery.com/jquery-1.8.3.js'></script>--%>

<%--<script type='text/javascript' src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>--%>
<%--<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css">--%>


<div class="uk-container uk-container-center my-uk-container"  style="overflow-y: auto ;overflow-x:auto ;  height: 100%;">

    <%--private String name;
    private Time start_time;
    private Time end_time;
    private Date date;
    private String desc;--%>

    <form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id" >
        <div class="uk-grid uk-grid-preserve">
            <%--<base:comboBox name="session_name_id" value="name" key="thinkroom.sessionmanagent.session.name"  comboLoaderUrl="/combo/loadAllSessionNameCombo"/>--%>
            <base:comboBox-buttonNew name="session_name_id" value="name" key="thinkroom.sessionmanagent.session.name"
                                     comboLoaderUrl="/combo/loadAllSessionNameCombo" popupUrl="/popup/sessionname" saveUrl="${pageContext.request.contextPath}/thinkRoom/sessionManagement/thinkRoomSessionName/save"/>
                <%--comboLoaderUrl="/combo/loadAllSessionNameCombo" />--%>

            <%--<base:timePicker name="start_time_Str" key="thinkroom.sessionmanagent.session.startTime"/>--%>
            <base:timePicker name="start_time" key="thinkroom.sessionmanagent.session.startTime"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <%--<base:timePicker name="end_time_Str" key="thinkroom.sessionmanagent.session.endTime"/>--%>
            <base:timePicker name="end_time" key="thinkroom.sessionmanagent.session.endTime"/>
            <base:mDatePicker name="date" key="thinkroom.sessionmanagent.session.date"/>
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:testBox name="description" key="thinkroom.sessionmanagent.session.desc"/>

        </div>


    </form>

    <base:itemForm-combo titleKeys="thinkroom.membermanagent.member" formItemTabViewJspFiles="MemberSessionTabView.jsp" formItemTabInputs="MemberSessionTabInput" isPopup="true" popupUrl="${pageContext.request.contextPath}/thinkRoom/sessionManagement/thinkRoomSession/popup" masterIdStr="session_id"/>

</div>
